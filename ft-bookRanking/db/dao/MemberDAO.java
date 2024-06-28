package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.util.DBConnectionManager;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public int saveMember(String mname, String mid, String mpw, String mphone) {

		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " INSERT INTO memberinfo VALUES ( (SELECT COUNT(*)+1 FROM memberInfo) , ?, ?, ?, ? )";

			psmt = conn.prepareStatement(query);

			psmt.setString(1, mname);
			psmt.setString(2, mid);
			psmt.setString(3, mpw);
			psmt.setString(4, mphone);
			

			result = psmt.executeUpdate(); // 쿼리 DB전달 실행

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}

		return result;
	}
	
	

}
