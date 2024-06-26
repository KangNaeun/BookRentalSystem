package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.dto.Book2DTO;
import db.dto.BookDTO;
import db.dto.TestDTO;
import db.util.DBConnectionManager;

public class BookDAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public List<BookDTO> bookInfo() { // 전체리스트 조회

		List<BookDTO> bookList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " select * from book ";

			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

				if (bookList == null)
					bookList = new ArrayList<BookDTO>();

				BookDTO book = new BookDTO(
						rs.getInt("bookno"),
						rs.getString("bname"),
						rs.getString("bauthor"),
						rs.getString("bpublish"),
						rs.getInt("bprice"),
						rs.getInt("genrno"));

				bookList.add(book);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return bookList;
	}

	public BookDTO bookInfoNo(int bookno) { // 책 번호로 객체 조회

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
				// 로그인 실패
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

	public List<Book2DTO> getBookList() {

		List<Book2DTO> bookList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT b.bookno, b.bname, b.bauthor, b.bpublish, b.bprice, g.gname, "
					+ " 	TO_CHAR(b.bdate, 'YYYY-MM-DD') bdate "
					+ " 	, bq.bcount "
					+ " FROM book b, genre g, book_quantity bq "
					+ " WHERE b.genrno = g.genrno and b.bookno = bq.bookno ";

			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) {

				if (bookList == null)
					bookList = new ArrayList<Book2DTO>();

				Book2DTO book = new Book2DTO();
				book.setBookno(rs.getInt("bookno"));
				book.setBname(rs.getString("bname"));
				book.setBauthor(rs.getString("bauthor"));
				book.setBpublish(rs.getString("bpublish"));
				book.setBprice(rs.getInt("bprice"));
				book.setGname(rs.getString("gname"));
				book.setBdate(rs.getString("bdate"));
				book.setBcount(rs.getInt("bcount"));

				bookList.add(book);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return bookList;
	}

	public List<Book2DTO> getBookNoList(int bookno) {

		List<Book2DTO> bookList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT b.bookno, b.bname, b.bauthor, b.bpublish, b.bprice, g.gname "
					+ " 	, TO_CHAR(b.bdate, 'YYYY-MM-DD') bdate "
					+ " 	, bq.bcount "
					+ " FROM book b, genre g, book_quantity bq "
					+ " WHERE b.genrno = g.genrno and b.bookno = bq.bookno "
					+ " 	 and b.bookno = ? ";

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, bookno);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) {
				if (bookList == null)
					bookList = new ArrayList<Book2DTO>();

				Book2DTO book = new Book2DTO();

				book.setBookno(rs.getInt("bookno"));
				book.setBname(rs.getString("bname"));
				book.setBauthor(rs.getString("bauthor"));
				book.setBpublish(rs.getString("bpublish"));
				book.setBprice(rs.getInt("bprice"));
				book.setGname(rs.getString("gname"));
				book.setBdate(rs.getString("bdate"));
				book.setBcount(rs.getInt("bcount"));

				bookList.add(book);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return bookList;
	}

	public List<Book2DTO> getBookNameList(String bname) {

		List<Book2DTO> bookList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT b.bookno, b.bname, b.bauthor, b.bpublish, b.bprice, g.gname, "
					+ " 	TO_CHAR(b.bdate, 'YYYY-MM-DD') bdate "
					+ " 	, bq.bcount "
					+ " FROM book b, genre g, book_quantity bq "
					+ " WHERE b.genrno = g.genrno and b.bookno = bq.bookno "
					+ " and b.bname = ? ";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, bname);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) {
				if (bookList == null)
					bookList = new ArrayList<Book2DTO>();

				Book2DTO book = new Book2DTO();

				book.setBookno(rs.getInt("bookno"));
				book.setBname(rs.getString("bname"));
				book.setBauthor(rs.getString("bauthor"));
				book.setBpublish(rs.getString("bpublish"));
				book.setBprice(rs.getInt("bprice"));
				book.setGname(rs.getString("gname"));
				book.setBdate(rs.getString("bdate"));
				book.setBcount(rs.getInt("bcount"));

				bookList.add(book);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return bookList;
	}

	public List<Book2DTO> getBookAuthorList(String bauthor) {

		List<Book2DTO> bookList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT b.bookno, b.bname, b.bauthor, b.bpublish, b.bprice, g.gname, "
					+ " 	TO_CHAR(b.bdate, 'YYYY-MM-DD') bdate "
					+ " 	, bq.bcount "
					+ " FROM book b, genre g, book_quantity bq "
					+ " WHERE b.genrno = g.genrno and b.bookno = bq.bookno "
					+ " 	 and b.bauthor = ?";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, bauthor);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) {
				if (bookList == null)
					bookList = new ArrayList<Book2DTO>();

				Book2DTO book = new Book2DTO();

				book.setBookno(rs.getInt("bookno"));
				book.setBname(rs.getString("bname"));
				book.setBauthor(rs.getString("bauthor"));
				book.setBpublish(rs.getString("bpublish"));
				book.setBprice(rs.getInt("bprice"));
				book.setGname(rs.getString("gname"));
				book.setBdate(rs.getString("bdate"));
				book.setBcount(rs.getInt("bcount"));

				bookList.add(book);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return bookList;
	}

	public List<Book2DTO> getBookPublishList(String bpublish) {

		List<Book2DTO> bookList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT b.bookno, b.bname, b.bauthor, b.bpublish, b.bprice, g.gname, "
					+ " 	TO_CHAR(b.bdate, 'YYYY-MM-DD') bdate "
					+ " 	, bq.bcount "
					+ " FROM book b, genre g, book_quantity bq "
					+ " WHERE b.genrno = g.genrno and b.bookno = bq.bookno "
					+ " 	 and b.bpublish = ?";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, bpublish);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) {
				if (bookList == null)
					bookList = new ArrayList<Book2DTO>();

				Book2DTO book = new Book2DTO();

				book.setBookno(rs.getInt("bookno"));
				book.setBname(rs.getString("bname"));
				book.setBauthor(rs.getString("bauthor"));
				book.setBpublish(rs.getString("bpublish"));
				book.setBprice(rs.getInt("bprice"));
				book.setGname(rs.getString("gname"));
				book.setBdate(rs.getString("bdate"));
				book.setBcount(rs.getInt("bcount"));

				bookList.add(book);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return bookList;
	}

	public List<Book2DTO> getBookGnameList(String gname) {

		List<Book2DTO> bookList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT b.bookno, b.bname, b.bauthor, b.bpublish, b.bprice, g.gname, "
					+ " 	TO_CHAR(b.bdate, 'YYYY-MM-DD') bdate "
					+ " 	, bq.bcount "
					+ " FROM book b, genre g, book_quantity bq "
					+ " WHERE b.genrno = g.genrno and b.bookno = bq.bookno "
					+ " 	 and g.gname = ?";

			psmt = conn.prepareStatement(query);
			psmt.setString(1, gname);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) {
				if (bookList == null)
					bookList = new ArrayList<Book2DTO>();

				Book2DTO book = new Book2DTO();

				book.setBookno(rs.getInt("bookno"));
				book.setBname(rs.getString("bname"));
				book.setBauthor(rs.getString("bauthor"));
				book.setBpublish(rs.getString("bpublish"));
				book.setBprice(rs.getInt("bprice"));
				book.setGname(rs.getString("gname"));
				book.setBdate(rs.getString("bdate"));
				book.setBcount(rs.getInt("bcount"));

				bookList.add(book);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return bookList;
	}

	public List<Book2DTO> getBookCountList(int bcount) {

		List<Book2DTO> bookList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT b.bookno, b.bname, b.bauthor, b.bpublish, b.bprice, g.gname, "
					+ " 	TO_CHAR(b.bdate, 'YYYY-MM-DD') bdate "
					+ " 	, bq.bcount "
					+ " FROM book b, genre g, book_quantity bq "
					+ " WHERE b.genrno = g.genrno and b.bookno = bq.bookno "
					+ " 	 and bq.bcount = ?";

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, bcount);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) {
				if (bookList == null)
					bookList = new ArrayList<Book2DTO>();

				Book2DTO book = new Book2DTO();

				book.setBookno(rs.getInt("bookno"));
				book.setBname(rs.getString("bname"));
				book.setBauthor(rs.getString("bauthor"));
				book.setBpublish(rs.getString("bpublish"));
				book.setBprice(rs.getInt("bprice"));
				book.setGname(rs.getString("gname"));
				book.setBdate(rs.getString("bdate"));
				book.setBcount(rs.getInt("bcount"));

				bookList.add(book);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);
		}

		return bookList;
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

	public int setbookquantity(int bookquantity, int bookno) {

		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();

			String query = "  UPDATE book_quantity "
					+ " SET bcount = ? "
					+ " WHERE bookno = ? ";

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, bookquantity);
			psmt.setInt(2, bookno);

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
