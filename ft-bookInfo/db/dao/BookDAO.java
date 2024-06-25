package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.dto.BookDTO;
import db.dto.TestDTO;
import db.util.DBConnectionManager;

public class BookDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public BookDTO bookInfo(int bookno) {
		
		BookDTO book = null;
		
		try {
			conn = DBConnectionManager.connectDB();

			String query = " select * from book where bookno = ? ";

			psmt = conn.prepareStatement(query);
			
			psmt.setInt(1, bookno);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			if (rs.next()) { // 더이상 가져올 데이터가 없을때까지~
				book = new BookDTO();
				
				book.setBookno(rs.getInt("bookno"));
				book.setBname(rs.getString("bname"));
				book.setBauthor(rs.getString("bauthor"));
				book.setBpublish(rs.getString("bpublish"));
				book.setBprice(rs.getInt("bprice"));
				book.setGenrno(rs.getInt("genrno"));

				System.out.println("검색 성공");				
				
			} else {
				//로그인 실패
				System.out.println("검색 실패");
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return book;
	}
	
	
	
	

}
