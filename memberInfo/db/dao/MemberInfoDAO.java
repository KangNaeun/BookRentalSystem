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
	
	public List<MemberInfoDTO> selectMemberInfoAll() {

		List<MemberInfoDTO> memberList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = "select m.membno, m.mname, m.mphone, m.maddress, ms.mstatus "
					+ "from memberInfo m, member_status ms "
					+ "where m.mstatus_id = ms.mstatus_id";

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
				member.setMstatus(rs.getString("mstatus"));

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
	
	public List<MemberInfoDTO> selectMemberInfo(int membno) {

		List<MemberInfoDTO> memberList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select m.membno, m.mname, m.mphone, m.maddress, ms.mstatus "
					+ "from memberInfo m, member_status ms "
					+ "where m.mstatus_id = ms.mstatus_id "
					+ "and m.membno = ? ";

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, membno);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행
			
			memberList = new ArrayList<MemberInfoDTO>();
			
			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

				MemberInfoDTO member = new MemberInfoDTO();
				
				member.setMembno(rs.getInt("membno"));
				member.setMname(rs.getString("mname"));
				member.setMaddress(rs.getString("maddress"));
				member.setMphone(rs.getString("mphone"));
				member.setMstatus(rs.getString("mstatus"));

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
	
	public List<MemberInfoDTO> selectMnameInfo(String mname) {

		List<MemberInfoDTO> memberList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select m.membno, m.mname, m.mphone, m.maddress, ms.mstatus "
					+ "from memberInfo m, member_status ms "
					+ "where m.mstatus_id = ms.mstatus_id "
					+ "and m.mname = ? ";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, mname);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행
			
			memberList = new ArrayList<MemberInfoDTO>();
			
			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

				MemberInfoDTO member = new MemberInfoDTO();
				
				member.setMembno(rs.getInt("membno"));
				member.setMname(rs.getString("mname"));
				member.setMaddress(rs.getString("maddress"));
				member.setMphone(rs.getString("mphone"));
				member.setMstatus(rs.getString("mstatus"));

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
	
	public List<MemberInfoDTO> selectMphoneInfo(String mphone) {

		List<MemberInfoDTO> memberList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select m.membno, m.mname, m.mphone, m.maddress, ms.mstatus "
					+ "from memberInfo m, member_status ms "
					+ "where m.mstatus_id = ms.mstatus_id "
					+ "and m.mphone = ? ";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, mphone);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행
			
			memberList = new ArrayList<MemberInfoDTO>();
			
			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

				MemberInfoDTO member = new MemberInfoDTO();
				
				member.setMembno(rs.getInt("membno"));
				member.setMname(rs.getString("mname"));
				member.setMaddress(rs.getString("maddress"));
				member.setMphone(rs.getString("mphone"));
				member.setMstatus(rs.getString("mstatus"));

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
	
	public List<MemberInfoDTO> selectMstatusInfo(String mstatus) {

		List<MemberInfoDTO> memberList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select m.membno, m.mname, m.mphone, m.maddress, ms.mstatus "
					+ "from memberInfo m, member_status ms "
					+ "where m.mstatus_id = ms.mstatus_id "
					+ "and ms.mstatus = ? ";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, mstatus);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행
			
			memberList = new ArrayList<MemberInfoDTO>();
			
			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

				MemberInfoDTO member = new MemberInfoDTO();
				
				member.setMembno(rs.getInt("membno"));
				member.setMname(rs.getString("mname"));
				member.setMaddress(rs.getString("maddress"));
				member.setMphone(rs.getString("mphone"));
				member.setMstatus(rs.getString("mstatus"));

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
	
}