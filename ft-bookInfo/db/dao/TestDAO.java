package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.BookDTO;
import db.dto.MemberinfoDTO;
import db.dto.TestDTO;
import db.util.DBConnectionManager;

public class TestDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public TestDTO testLogin(String mid , String mpw) {
		
		TestDTO test = null;
		
		try {
			conn = DBConnectionManager.connectDB();

			String query = " select * from memberInfo "
					+ " where mid = ? and mpw = ? ";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, mid);
			psmt.setString(2, mpw);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			if (rs.next()) { // 더이상 가져올 데이터가 없을때까지~
				test = new TestDTO();
				
				test.setMid(rs.getString("mid"));
				test.setMpw(rs.getString("mpw"));
				test.setMname(rs.getString("mname"));

				System.out.println("로그인성공");				
				
			} else {
				//로그인 실패
				System.out.println("로그인실패");
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return test;
	}
	
	
	public int bookaddition(String bname, String bauthor, String bpublish, int bprice, int genrno, String bdate) {

		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " INSERT INTO book VALUES ((SELECT MAX(bookno) FROM book)+1, "
					 		+ " ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD')) ";					 		
			
			psmt = conn.prepareStatement(query);

			psmt.setString(1, bname); 
			psmt.setString(2, bauthor); 
			psmt.setString(3, bpublish); 
			psmt.setInt(4, bprice); 
			psmt.setInt(5, genrno);
			psmt.setString(6, bdate);


			result = psmt.executeUpdate(); // 쿼리 DB전달 실행


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		} 

		return result;
	}
	
	public int bookquantity(int bookquantity) {

		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " INSERT INTO book_quantity "
						 + " VALUES ((SELECT MAX(bookno) FROM book_quantity)+1, ?) ";					 		
			
			psmt = conn.prepareStatement(query);

			psmt.setInt(1, bookquantity); 

			result = psmt.executeUpdate(); // 쿼리 DB전달 실행


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		} 

		return result;
	}
	
	
	
	
	
	public int bookaddition(BookDTO book) {

		int result = 0;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " INSERT INTO book VALUES ((SELECT MAX(bookno) FROM book)+1, "
			 		+ " ?, ?, ?, ?, ?, TO_DATE(SYSDATE, 'YYYY-MM-DD')) ";

			psmt = conn.prepareStatement(query);

			// int deptno, String dname, String loc

			psmt.setString(1, book.getBname()); 
			psmt.setString(2, book.getBauthor()); 
			psmt.setString(3, book.getBpublish()); 
			psmt.setInt(4, book.getBprice()); 
			psmt.setInt(5, book.getGenrno());

			// psmt.executeQuery -> return Resultset
			result = psmt.executeUpdate(); // 쿼리 DB전달 실행		

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		} 

		return result;
	}
	
	public List<MemberinfoDTO> getMemberinfoList() {
		
		List<MemberinfoDTO> memberinfoList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " select * from memberinfo ";
			
			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행		

			// rs 쿼리 결과

			// rs.next() : 다음 가져올 데이터가 존재하는가? 존재:true 없으면:false
			// rs.getInt : 각 타입에 맞는 데이터 읽어오기
			// rs.getString
			// rs.getDate

			// 4. 쿼리 결과 값 처리
			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~
				
				if(memberinfoList == null)
					memberinfoList = new ArrayList<MemberinfoDTO>();
				
				MemberinfoDTO memberinfo = new MemberinfoDTO(
							rs.getInt("membno"), 
							rs.getString("mname"), 
							rs.getString("maddress"),
							rs.getString("mphone"),
							rs.getString("mstatus_id"));

				memberinfoList.add(memberinfo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return memberinfoList;

	}
	
	public List<MemberinfoDTO> selectAllMemberInfo() {
	      
	      List<MemberinfoDTO> memberList = null;
	      
	      try {
	         conn = DBConnectionManager.connectDB();
	         
	         String query = " SELECT m.membno, m.mname, m.maddress, "
	               + " REGEXP_REPLACE(m.mphone, '(\\d{3})(\\d{4})(\\d{4})', '\\1-\\2-\\3') AS mphone, " 
	               + " ms.mstatus "
	               + " FROM memberInfo m, member_status ms "
	               + " WHERE m.mstatus_id = ms.mstatus_id "
	               + " ORDER BY m.membno ";
	         
	         psmt = conn.prepareStatement(query);
	         
	         rs = psmt.executeQuery();
	         
	         memberList = new ArrayList<>(); // Initialize the list here to avoid null checks later
	         
	         while (rs.next()) {      
	        	 MemberinfoDTO member = new MemberinfoDTO();
	            member.setMembno(rs.getInt("membno"));
	            member.setMname(rs.getString("mname"));
	            member.setMaddress(rs.getString("maddress"));
	            member.setMphone(rs.getString("mphone"));
	            member.setMstatus_id(rs.getString("mstatus_id"));

	            memberList.add(member);            
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBConnectionManager.disconnectDB(conn, psmt, rs); // Close resources properly
	      }

	      return memberList;
	   }


	
}
