package db2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db2.dto.RentalDTO;

import db2.util.DBConnectionManager;

public class RentalDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	// 리스트로 전체 회원 정보 가져오기
	public List<RentalDTO> selectAllRental() {
		
		List<RentalDTO> rentalList = null;
		
		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " SELECT r.rentno, m.mname, b.bname, "
							+ "		TO_CHAR(r.rental_date, 'YYYY-MM-DD') rental_date, "
							+ "		TO_CHAR(r.return_date, 'YYYY-MM-DD') return_date, "
							+ "		TO_CHAR(r.od_date, 'YYYY-MM-DD') od_date, "
							+ "		TO_CHAR(r.stop_date, 'YYYY-MM-DD') stop_date, "
							+ "		TO_CHAR(r.comp_date, 'YYYY-MM-DD') comp_date, "
							+ "		rs.rstatus "
						    + " FROM rental r, memberInfo m, book b, rental_status rs "
							+ " WHERE r.membno = m.membno AND r.bookno = b.bookno "
							+ " 	AND r.rstatus_id = rs.rstatus_id "
							+ " ORDER BY r.rentno ";
					
			psmt = conn.prepareStatement(query);
			
			rs = psmt.executeQuery();
			
			rentalList = new ArrayList<RentalDTO>();
		
			while (rs.next()) {
				RentalDTO rental = new RentalDTO();
				rental.setRentno(rs.getInt("rentno"));
				rental.setMname(rs.getString("mname"));
				rental.setBname(rs.getString("bname"));
				rental.setRental_date(rs.getString("rental_date"));
				rental.setReturn_date(rs.getString("return_date"));
				rental.setOd_date(rs.getString("od_date") == null ? "" : rs.getString("od_date"));
				rental.setStop_date(rs.getString("stop_date") == null ? "" : rs.getString("stop_date"));
				rental.setComp_date(rs.getString("comp_date") == null ? "" : rs.getString("comp_date"));
				rental.setRstatus(rs.getString("rstatus"));
				
				rentalList.add(rental);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs); // Close resources properly
		}
		
		return rentalList;
	}
		
}
