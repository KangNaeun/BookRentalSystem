<%@ page import="db2.dao.RentalDAO"%>
<%@ page import="db2.dto.RentalDTO"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
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
	        <form action="rentalStatus.jsp" method="POST" id="frm_rentno">
	            <input type="text" id="input_rentno" name="rentno" placeholder="대여번호">
	            <button type="submit">검색</button>
	        </form>
        </div>
        <div class="search-group">
	        <form action="rentalStatus.jsp" method="POST" id="frm_mname">
	            <input type="text" id="input_mname" name="mname" placeholder="회원명">
	            <button type="submit">검색</button>
	        </form>
        </div>
        <div class="search-group">
	        <form action="rentalStatus.jsp" method="POST" id="frm_bname">
	            <input type="text" id="input_bname" name="bname" placeholder="도서제목">
	            <button type="submit">검색</button>
	        </form>
        </div>  
        <form action="rentalStatus.jsp" method="POST" id="frm_date">
            <div class="form-group" style="display: inline-block;">
                <label for="start-date" style="font-size: 1rem;">대여날짜</label>
                <input type="date" id="input_startDate" name="startDate" style="padding: 7px;">
            </div>&nbsp;
            <div class="form-group" style="display: inline-block;">
                <label for="end-date">종료범위지정</label>
                <input type="date" id="input_endDate" name="endDate" style="padding: 7px;">
            </div>
            <button type="submit">검색</button>
        </form> 
        <div class="search-group">
        	&nbsp;&nbsp;&nbsp;
        	<form action="rentalStatus.jsp" method="POST" id="frm_rstatus">
	            <input type="text" id="input_rstatus" name="rstatus" placeholder="대여상태">
	            <button type="submit">검색</button>
            </form>
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
           	request.setCharacterEncoding("UTF-8");
                      
           	RentalDAO rentalDAO = new RentalDAO();
           	List<RentalDTO> rentalList = null;
           	boolean isEmptyStr = false;
           	List<String> db_params = new ArrayList<>();
           	String targetStr = null;
           	int targetNo = 0;
           	
           	String str_rentno = request.getParameter("rentno");
           	String mname = request.getParameter("mname"); 
           	String bname = request.getParameter("bname"); 
           	String startDate = request.getParameter("startDate"); 
           	String endDate = request.getParameter("endDate"); 
           	String rstatus = request.getParameter("rstatus");           	
           	
           	String[] params = new String[] {str_rentno, mname, bname, startDate, endDate, rstatus};
           								
           	for (String param : params) {           		
       			if (param != null) {
       				db_params.add(param);
       			}
           	}
           	
           	if (db_params.size() != params.length) {
           		for (String param : db_params) {
           			if (param.equals("")) {
           				isEmptyStr = true;
           				break;
           			}
           		}
           	}
           	
           	if (!isEmptyStr) {
           		for (int i = 0; i < params.length; i++) {
           			if (params[i] != null) {
           				targetStr = params[i];
           				targetNo = i;
           				break;
           			}
           		}
           		
           		if (targetStr != null) {
           			
           			switch (targetNo) {
           				case 0:
           					int rentno = Integer.parseInt(str_rentno);
           	           		rentalList = rentalDAO.selectRentalByRentno(rentno);
           	           		break;
           				case 1:
           	           		rentalList = rentalDAO.selectRentalByMname(mname);
           	           		break;
           				case 2:
           	           		rentalList = rentalDAO.selectRentalByBname(bname);
           	           		break;
           				case 3:
        	           		rentalList = rentalDAO.selectRentalByStartDateEndDate(startDate, endDate);               				 	
           	           		break;
           				case 4:
           	           		break;
           				case 5:
           					switch (rstatus) {
           						case "대여중":
           							rstatus = "rt";
           							break;
           						case "연체중":
           							rstatus = "od";
           							break;
           						case "반납완료":
           							rstatus = "cp";
           							break;
           						case "예약":
           							rstatus = "rs";
           							break;
           						case "예약취소":
           							rstatus = "cc";  
           							break;
           					}
           	           		rentalList = rentalDAO.selectRentalByRstatus(rstatus);
           	           		break;
           			}           			
           		}
           	}
           	
           	if (isEmptyStr) {
           		if (startDate == null && endDate == null) 
           			rentalList = rentalDAO.selectAllRental();
           		else {
					if (startDate.equals("") && !endDate.equals("")) { %>
						<script>
						alert("대여날짜를 입력해주세요!");
						</script>
				 <% } else if (endDate.equals("") && !startDate.equals("")) { %>
				 		<script>
						alert("종료범위를 지정해주세요!");
						</script>
				 <% } else {
				 		rentalList = rentalDAO.selectAllRental(); %>
				 	}
           	  <%  } 
           	   } 
            }
			
          	if (rentalList != null) {
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
			<% } 
			} else {
				System.out.println("NULL");
			}
          	%>
        </tbody>
    </table>

    <script src="js/script.js"></script>

</body>
</html>