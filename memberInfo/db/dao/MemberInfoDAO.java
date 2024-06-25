package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.MemberInfoDTO;
import db.util.DBConnectionManager;

public class MemberInfoDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public List<MemberInfoDTO> selectMemberinfoAll() {

		List<MemberInfoDTO> memberList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select membno, mname, maddress, mphone, mstatus_id from memberinfo ";

			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행
			
			memberList = new ArrayList<MemberInfoDTO>();
			
			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

				MemberInfoDTO member = new MemberInfoDTO();
				// member.setMembno(rs.getInt("membno"));
				
				member.setMembno(rs.getInt("membno"));
				member.setMname(rs.getString("mname"));
				member.setMaddress(rs.getString("maddress"));
				member.setMphone(rs.getString("mphone"));
				member.setMstatus_id("mstatus_id");

				memberList.add(member);
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs); // conn psmt rs
		}

		return memberList;

	}
	
	public List<MemberInfoDTO> selectMemberinfo(int membno) {

		List<MemberInfoDTO> memberList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select membno, mname, maddress, mphone, mstatus_id from memberinfo ";

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, membno);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행
			
			memberList = new ArrayList<MemberInfoDTO>();
			
			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

				MemberInfoDTO member = new MemberInfoDTO();
				// member.setMembno(rs.getInt("membno"));
				
				member.setMembno(rs.getInt("membno"));
				member.setMname(rs.getString("mname"));
				member.setMaddress(rs.getString("maddress"));
				member.setMphone(rs.getString("mphone"));
				member.setMstatus_id("mstatus_id");

				memberList.add(member);
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs); // conn psmt rs
		}

		return memberList;

	}
	
//	public List<MemberInfoDTO> selectAllMemberInfo() {
//	      
//	      List<MemberInfoDTO> memberList = null;
//	      
//	      try {
//	         conn = DBConnectionManager.connectDB();
//	         
//	         String query = " SELECT m.membno, m.mname, m.maddress, "
//	               + " REGEXP_REPLACE(m.mphone, '(\\d{3})(\\d{4})(\\d{4})', '\\1-\\2-\\3') AS mphone, " 
//	               + " ms.mstatus "
//	               + " FROM memberInfo m, member_status ms "
//	               + " WHERE m.mstatus_id = ms.mstatus_id "
//	               + " ORDER BY m.membno ";
//	         
//	         psmt = conn.prepareStatement(query);
//	         
//	         rs = psmt.executeQuery();
//	         
//	         memberList = new ArrayList<>(); // Initialize the list here to avoid null checks later
//	         
//	         while (rs.next()) {      
//	            MemberInfoDTO member = new MemberInfoDTO();
//	            member.setMembno(rs.getInt("membno"));
//	            member.setMname(rs.getString("mname"));
//	            member.setMaddress(rs.getString("maddress"));
//	            member.setMphone(rs.getString("mphone"));
//	            member.setMstatus(rs.getString("mstatus"));
//
//	            memberList.add(member);            
//	         }
//	         
//	      } catch (SQLException e) {
//	         e.printStackTrace();
//	      } finally {
//	         DBConnectionManager.disconnectDB(conn, psmt, rs); // Close resources properly
//	      }
//
//	      return memberList;
//	   }
}
