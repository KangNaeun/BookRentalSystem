<%@ page import="db2.dao.RentalDAO"%>
<%@ page import="db2.dto.RentalDTO"%>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Loan System</title>
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <div class="header">
        <h1>도서 대여 시스템</h1>
    </div>
    
    <div class="section-title">대여 현황 조회</div>
    <div class="search-box">
        <div class="search-group">
            <input type="text" id="bookSearch1" placeholder="대여번호">
            <button type="submit">검색</button>
        </div>
        <div class="search-group">
            <input type="text" id="bookSearch2" placeholder="회원명">
            <button type="submit">검색</button>
        </div>
        <div class="search-group">
            <input type="text" id="bookSearch1" placeholder="도서제목">
            <button type="submit">검색</button>
        </div>  
        <form>
            <div class="form-group" style="display: inline-block;">
                <label for="start-date" style="font-size: 1rem;">시작날짜</label>
                <input type="date" id="start-date" name="start-date" style="padding: 7px;">
            </div>&nbsp;
            <div class="form-group" style="display: inline-block;">
                <label for="end-date">종료날짜</label>
                <input type="date" id="end-date" name="end-date" style="padding: 7px;">
            </div>
            <button onclick="searchTable('start-date', 'historyTable')">검색</button>
        </form> 
        <div class="search-group">
        	&nbsp;&nbsp;&nbsp;
            <input type="text" id="bookSearch2" placeholder="대여상태">
            <button type="submit">검색</button>
        </div>
    </div>
    <table id="bookTable">
        <thead>
            <tr>
                <th>대여번호</th>
                <th>회원명</th>
                <th>도서제목</th>
                <th>대여날짜</th> 
                <th>반납기한</th>    
                <th>연체날짜</th> 
                <th>정지날짜</th>  
                <th>반납날짜</th>           
                <th>대여상태</th>
            </tr>
        </thead>
        <tbody>
           <%
           	RentalDAO rentalDAO = new RentalDAO();
           	List<RentalDTO>  rentalList = rentalDAO.selectAllRental();
           %>
            
           <%
           for (RentalDTO rental : rentalList) { %>
           	<tr>
				<td><%=rental.getRentno()%></td>
           		<td><%=rental.getMname()%></td>
           		<td><%=rental.getBname()%></td>
           		<td><%=rental.getRental_date()%></td>
           		<td><%=rental.getReturn_date()%></td>
           		<td><%=rental.getOd_date()%></td>
           		<td><%=rental.getStop_date()%></td>
           		<td><%=rental.getComp_date()%></td>
           		<td><%=rental.getRstatus()%></td>
           	</tr>
        	<% 
        	} %>
        </tbody>
    </table>

    <script src="js/script.js"></script>

</body>
</html>