<%@ page import="db.dto.MemberInfoDTO"%>
<%@ page import="db.dao.MemberInfoDAO"%>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Rental System</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 20px;
}

.header {
	text-align: center;
	padding: 10px;
	background-color: #333;
	color: #fff;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 10px;
	text-align: left;
	border: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

.section-title {
	background-color: #e9ecef;
	padding: 10px;
	font-weight: bold;
	border: 1px solid #ddd;
	margin-bottom: -1px;
	/* Remove the space between section title and table */
}

.search-box {
	margin: 10px 0;
	display: flex;
	flex-wrap: wrap;
}

.search-group {
	display: flex;
	margin-right: 20px;
	margin-bottom: 10px;
}

.search-group input[type="text"] {
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	width: 200px;
}

.search-group button {
	padding: 10px;
	border: none;
	background-color: #dcdcdc;
	color: #333;
	cursor: pointer;
	border-radius: 4px;
	margin-left: 10px;
}

form button {
	padding: 10px;
	border: none;
	background-color: #dcdcdc;
	color: #333;
	cursor: pointer;
	border-radius: 4px;
	margin-left: 10px;
}

.search-group button:hover {
	background-color: #bbb;
}
</style>
</head>
<body>
	<div class="header">
		<h1>도서 대여 시스템</h1>
	</div>

	<div class="section-title">회원 정보</div>
	
	<%
		int membNo = Integer.parseInt(request.getParameter("membNo"));
	
		MemberInfoDAO memberDAO = new MemberInfoDAO();
		List<MemberInfoDTO> memberList = memberDAO.selectMemberinfoAll();
		
	%>
	<form action="test.jsp" method="post">
		<div class="search-box">
			<div class="search-group">
				<input type="text" id="customerSearch1" placeholder="회원번호">
				<button onclick="searchTable('customerSearch1', 'customerTable')">검색</button>
			</div>
			<div class="search-group">
				<input type="text" id="customerSearch2" placeholder="회원명">
				<button onclick="searchTable('customerSearch2', 'customerTable')">검색</button>
			</div>
			<div class="search-group">
				<input type="text" id="customerSearch3" placeholder="휴대폰번호">
				<button onclick="searchTable('customerSearch3', 'customerTable')">검색</button>
			</div>
			<div class="search-group">
				<input type="text" id="customerSearch4" placeholder="대여상태">
				<button onclick="searchTable('customerSearch4', 'customerTable')">검색</button>
			</div>
		</div>
	</form>
	
	<table id="customerTable">
		<thead>
			<tr>
				<th>회원번호</th>
				<th>회원명</th>
				<th>휴대폰번호</th>
				<th>주소</th>
				<th>대여상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<%if(customerSearch1 ==null || customerSearch1 == ''){
				for (MemberInfoDTO member : memberList) { %>
			}
				<td><%=member.getMembno()%></td>
				<td><%=member.getMname()%></td>
				<td><%=member.getMphone()%></td>
				<td><%=member.getMaddress()%></td>
				<td><%=member.getMstatus_id()%></td>
			<% 	} %>
			</tr>
		</tbody>
	</table>

	<div class="section-title">회원 대여 내역 조회</div>
	<div class="search-box">
		<div class="search-group" style="display: flex;">
			<input type="text" id="historySearch1" placeholder="회원번호/회원명">
			<button onclick="searchTable('historySearch1', 'historyTable')">검색</button>
		</div>
		<form>
			<div class="form-group" style="display: inline-block;">
				<label for="start-date" style="font-size: 1rem;">시작날짜</label> <input
					type="date" id="start-date" name="start-date" style="padding: 7px;">
			</div>
			&nbsp;
			<div class="form-group" style="display: inline-block;">
				<label for="end-date">종료날짜</label> <input type="date" id="end-date"
					name="end-date" style="padding: 7px;">
			</div>
			<button onclick="searchTable('start-date', 'historyTable')">검색</button>
		</form>
	</div>
	<table id="historyTable">
		<thead>
			<tr>
				<th>대여번호</th>
				<th>회원번호</th>
				<th>회원명</th>
				<th>도서제목</th>
				<th>대여날짜</th>
				<th>반납날짜</th>
				<th>대여상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>10000</td>
				<td>100</td>
				<td>강지은</td>
				<td>아이가 없는 집</td>
				<td>2024.06.22</td>
				<td></td>
				<td>대여중</td>
			</tr>
			<tr>
				<td>10001</td>
				<td>100</td>
				<td>강지은</td>
				<td>모순</td>
				<td>2024.02.26</td>
				<td></td>
				<td>연체</td>
			</tr>
		</tbody>
	</table>
	<!-- 10001	100	1001	24/06/21	od -->
	<div class="section-title">대여 현황 조회</div>
	<div class="search-box">
		<div class="search-group">
			<input type="text" id="bookSearch1" placeholder="대여번호">
			<button onclick="searchTable('bookSearch1', 'bookTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="bookSearch1" placeholder="도서번호/도서제목">
			<button onclick="searchTable('bookSearch1', 'bookTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="bookSearch2" placeholder="회원명">
			<button onclick="searchTable('bookSearch2', 'bookTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="bookSearch2" placeholder="대여상태">
			<button onclick="searchTable('bookSearch2', 'bookTable')">검색</button>
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
				<th>대여상태</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>10000</td>
				<td>강지은</td>
				<td>아이가 없는 집</td>
				<td>2024.06.22</td>
				<td>2024.06.29</td>
				<td>대여중</td>
			</tr>
		</tbody>
	</table>

	<div class="section-title">도서 정보</div>
	<div class="search-box">
		<div class="search-group">
			<input type="text" id="loanSearch1" placeholder="도서번호/도서제목">
			<button onclick="searchTable('loanSearch1', 'loanTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="loanSearch2" placeholder="장르명">
			<button onclick="searchTable('loanSearch2', 'loanTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="loanSearch2" placeholder="저자/출판사">
			<button onclick="searchTable('loanSearch2', 'loanTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="loanSearch2" placeholder="가격">
			<button onclick="searchTable('loanSearch2', 'loanTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="loanSearch2" placeholder="재고">
			<button onclick="searchTable('loanSearch2', 'loanTable')">검색</button>
		</div>
	</div>
	<table id="loanTable">
		<thead>
			<tr>
				<th>도서번호</th>
				<th>도서제목</th>
				<th>저자</th>
				<th>출판사</th>
				<th>가격</th>
				<th>장르</th>
				<th>발행일</th>
				<th>재고</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1000</td>
				<td>아이가 없는 집</td>
				<td>알렉스 안도릴</td>
				<td>필름</td>
				<td>16,200원</td>
				<td>소설</td>
				<td>2024.06.12</td>
				<td>3</td>
			</tr>
		</tbody>
	</table>

	<script>
		function searchTable(inputId, tableId) {
			var input, filter, table, tr, td, i, j, txtValue;
			input = document.getElementById(inputId);
			filter = input.value.toLowerCase();
			table = document.getElementById(tableId);
			tr = table.getElementsByTagName("tr");

			for (i = 1; i < tr.length; i++) {
				tr[i].style.display = "none";
				td = tr[i].getElementsByTagName("td");
				for (j = 0; j < td.length; j++) {
					if (td[j]) {
						txtValue = td[j].textContent || td[j].innerText;
						if (txtValue.toLowerCase().indexOf(filter) > -1) {
							tr[i].style.display = "";
							break;
						}
					}
				}
			}
		}
	</script>
</body>
</html>

