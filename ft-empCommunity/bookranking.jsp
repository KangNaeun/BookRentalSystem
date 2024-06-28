<%@ page import="db.dao.BookDAO" %>
<%@ page import="db.dto.Book3DTO" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		BookDAO bookDAO = new BookDAO();
		List<Book3DTO> bookList = bookDAO.getBookRanking();

		for(Book3DTO book : bookList) {	
	%>
 		<div class="bookItem">
			<h3><%=book.getBname()%> </h3>
			<p><%=book.getBauthor()%></p>
			<p><%=book.getBookno()%></p>
		</div>
	<%
		}
	%>
</body>
</html>