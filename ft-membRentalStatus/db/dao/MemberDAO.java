package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.MemberDTO;
import db.util.DBConnectionManager;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
public List<MemberDTO> selectRentalMemberByPhone(String memberPhone){
		
		MemberDTO member = null;
		List<MemberDTO> memberList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select r.rentno 대여번호, m.mname 회원명, b.bname 도서제목, "
					+ " TO_CHAR(r.rental_date) 대여날짜, TO_CHAR(r.return_date) 반납기한, TO_CHAR(r.od_date) 연체날짜, TO_CHAR(r.stop_date) 정지날짜, TO_CHAR(r.comp_date) 반납날짜, rs.rstatus 대여상태 "
					+ " from rental r, memberinfo m, book b, rental_status rs "
					+ " where m.mphone= ? and m.membno = r.membno and b.bookno = r.bookno and r.rstatus_id = rs.rstatus_id ";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, memberPhone);

			rs = psmt.executeQuery();
			
			
			
			while (rs.next()) {
				if(memberList == null) {
					memberList = new ArrayList<MemberDTO>();
				}
				
				int rsRno = rs.getInt("대여번호");
				String rsMname = rs.getString("회원명");
				String rsBname = rs.getString("도서제목");
				
				String rsRdate = rs.getString("대여날짜");
				String rsRedate = rs.getString("반납기한");
				String rsOdate = rs.getString("연체날짜");
				
				String rsSdate = rs.getString("정지날짜");
				String rsCdate = rs.getString("반납날짜");
				String rsRstatus = rs.getString("대여상태");

				member = new MemberDTO(rsRno, rsMname, rsBname, rsRdate, rsRedate, rsOdate, rsSdate, rsCdate, rsRstatus);
				memberList.add(member);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return memberList;
	}
public List<MemberDTO> selectRentalMemberByName(String memberName){
		
		MemberDTO member = null;
		List<MemberDTO> memberList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select r.rentno 대여번호, m.mname 회원명, b.bname 도서제목, "
					+ " TO_CHAR(r.rental_date) 대여날짜, TO_CHAR(r.return_date) 반납기한, TO_CHAR(r.od_date) 연체날짜, TO_CHAR(r.stop_date) 정지날짜, TO_CHAR(r.comp_date) 반납날짜, rs.rstatus 대여상태 "
					+ " from rental r, memberinfo m, book b, rental_status rs "
					+ " where m.mname= ? and m.membno = r.membno and b.bookno = r.bookno and r.rstatus_id = rs.rstatus_id ";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, memberName);

			rs = psmt.executeQuery();
			
			
			
			while (rs.next()) {
				if(memberList == null) {
					memberList = new ArrayList<MemberDTO>();
				}
				
				int rsRno = rs.getInt("대여번호");
				String rsMname = rs.getString("회원명");
				String rsBname = rs.getString("도서제목");
				
				String rsRdate = rs.getString("대여날짜");
				String rsRedate = rs.getString("반납기한");
				String rsOdate = rs.getString("연체날짜");
				
				String rsSdate = rs.getString("정지날짜");
				String rsCdate = rs.getString("반납날짜");
				String rsRstatus = rs.getString("대여상태");

				member = new MemberDTO(rsRno, rsMname, rsBname, rsRdate, rsRedate, rsOdate, rsSdate, rsCdate, rsRstatus);
				memberList.add(member);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return memberList;
	}
	
	
	public List<MemberDTO> selectRentalMember(int memberNo){
		
		MemberDTO member = null;
		List<MemberDTO> memberList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select r.rentno 대여번호, m.mname 회원명, b.bname 도서제목, "
					+ " TO_CHAR(r.rental_date) 대여날짜, TO_CHAR(r.return_date) 반납기한, TO_CHAR(r.od_date) 연체날짜, TO_CHAR(r.stop_date) 정지날짜, TO_CHAR(r.comp_date) 반납날짜, rs.rstatus 대여상태 "
					+ " from rental r, memberinfo m, book b, rental_status rs "
					+ " where m.membno= ? and m.membno = r.membno and b.bookno = r.bookno and r.rstatus_id = rs.rstatus_id ";

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, memberNo);

			rs = psmt.executeQuery();
			
			
			
			while (rs.next()) {
				if(memberList == null) {
					memberList = new ArrayList<MemberDTO>();
				}
				
				int rsRno = rs.getInt("대여번호");
				String rsMname = rs.getString("회원명");
				String rsBname = rs.getString("도서제목");
				
				String rsRdate = rs.getString("대여날짜");
				String rsRedate = rs.getString("반납기한");
				String rsOdate = rs.getString("연체날짜");
				
				String rsSdate = rs.getString("정지날짜");
				String rsCdate = rs.getString("반납날짜");
				String rsRstatus = rs.getString("대여상태");

				member = new MemberDTO(rsRno, rsMname, rsBname, rsRdate, rsRedate, rsOdate, rsSdate, rsCdate, rsRstatus);
				memberList.add(member);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return memberList;
	}
	
	
	
	
	
	
	
	// tr추가를 위한 회원 명수 조회
	public int selectMemberCount() {

		int rsMcount = 0;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select count(*) from memberinfo ";

			psmt = conn.prepareStatement(query);
			

			rs = psmt.executeQuery();

			
			if (rs.next()) {
				rsMcount = rs.getInt("count(*)");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return rsMcount;

	}
	
	
	//전체회원 조회
	public List<MemberDTO> findAllMember() {

		MemberDTO member = null;
		List<MemberDTO> memberList = new ArrayList<MemberDTO>();

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select m.membno 회원번호, m.mname 회원이름, m.maddress 회원주소, m.mphone 회원휴대폰번호,  ms.mstatus 회원대여상태 "
					+ " from memberinfo m, member_status ms " + " where m.mstatus_id = ms.mstatus_id ";

			psmt = conn.prepareStatement(query);
			

			rs = psmt.executeQuery();
			
			
			
			while (rs.next()) {
				
				int rsMno = rs.getInt("회원번호");
				String rsMname = rs.getString("회원이름");
				String rsMaddress = rs.getString("회원주소");
				String rsMphone = rs.getString("회원휴대폰번호");
				String rsMstatus = rs.getString("회원대여상태");

				member = new MemberDTO(rsMno, rsMname, rsMaddress, rsMphone, rsMstatus);
				memberList.add(member);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return memberList;

	}
	// 이름으로 특정 회원 조회
	public MemberDTO findMemberByName(String mname) {

		MemberDTO member = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select m.membno 회원번호, m.mname 회원이름, m.maddress 회원주소, m.mphone 회원휴대폰번호,  ms.mstatus 회원대여상태 "
					+ " from memberinfo m, member_status ms " + " where m.mname = ? and ( m.mstatus_id = ms.mstatus_id ) ";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, mname);
			
			rs = psmt.executeQuery();

			// 동명이인 가능성으로 if 아니고 while 선택
			while (rs.next()) {
				int rsMno = rs.getInt("회원번호");
				String rsMname = rs.getString("회원이름");
				String rsMaddress = rs.getString("회원주소");
				String rsMphone = rs.getString("회원휴대폰번호");
				String rsMstatus = rs.getString("회원대여상태");
				
				member = new MemberDTO(rsMno, rsMname, rsMaddress, rsMphone, rsMstatus);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return member;

	}
}
