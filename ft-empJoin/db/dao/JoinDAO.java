package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.util.DBConnectionManager;

public class JoinDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	public int joinEmployee(String emp_id, String ename, String password, String ebirth) {

		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();

			String query = "INSERT INTO employee "
					+ "VALUES ( ? , ? , ? , ? , '사원', '영업부', SYSDATE) ";
			
			psmt = conn.prepareStatement(query);
			
			psmt.setString(1, emp_id);
			psmt.setString(2, ename);
			psmt.setString(3, password);
			psmt.setString(4, ebirth);

			result = psmt.executeUpdate();// 쿼리 DB전달 실행
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null); // conn psmt rs
		}

		return result;

	}

}
