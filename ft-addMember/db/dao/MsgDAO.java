package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.MsgDTO;
import db.util.DBConnectionManager;

//알림메세지
public class MsgDAO {
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
// 알림메세지 추가
	public int insertMessage(int membno, String message) {

		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " INSERT INTO member_message "
					+ " VALUES ( ? , ? , SYSDATE) ";

			psmt = conn.prepareStatement(query);
			
			psmt.setInt(1, membno);
			psmt.setString(2, message);

			result = psmt.executeUpdate();// 쿼리 DB전달 실행
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null); // conn psmt rs
		}

		return result;

	}

// 알림메세지 모든 내역 조회
	public List<MsgDTO> selectMemberInfoAll() {

		List<MsgDTO> msgList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = "select mms.membno, m.mname, mms.message, mms.send_date "
					+ "from member_message mms, memberInfo "
					+ "where m.membno = mms.membno ";

			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행
			
			msgList = new ArrayList<MsgDTO>();
			
			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

				MsgDTO msg = new MsgDTO();
				// member.setMembno(rs.getInt("membno"));
				
				msg.setMembno(rs.getInt("membno"));
				msg.setMessage(rs.getString("message"));
				

				msgList.add(msg);
			}

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs); // conn psmt rs
		}

		return msgList;

	}

}
