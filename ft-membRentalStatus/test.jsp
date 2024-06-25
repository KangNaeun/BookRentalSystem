<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="db.dao.MemberDAO"%>
<%@ page import="db.dto.MemberDTO"%>
<%@ page import="db.util.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Library Loan System</title>
<link href="css/style.css" rel="stylesheet">
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

	MemberDAO memberDAO = null;
	List<MemberDTO> memberList = null;

	if (request.getParameter("memberNo") != null && request.getParameter("memberNo") != "") {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));

		memberDAO = new MemberDAO();
		memberList = memberDAO.selectRentalMember(memberNo);

	} else if (request.getParameter("memberName") != null && request.getParameter("memberName") != "") {
		String memberName = request.getParameter("memberName");

		memberDAO = new MemberDAO();
		memberList = memberDAO.selectRentalMemberByName(memberName);
	} else if (request.getParameter("memberPhone") != null && request.getParameter("memberPhone") != "") {
		String memberPhone = request.getParameter("memberPhone");

		memberDAO = new MemberDAO();
		memberList = memberDAO.selectRentalMemberByPhone(memberPhone);
	} 
	%>

	<div class="header">
		<h1>도서 대여 시스템</h1>
	</div>

	<div class="section-title">회원 정보</div>
	<div class="search-box">
		<div class="search-group">
			<input type="text" id="customerSearch1" placeholder="회원번호">
			<button id="member-number-name-button">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="customerSearch1" placeholder="회원명">
			<button id="member-number-name-button">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="customerSearch2" placeholder="휴대폰번호">
			<button onclick="searchTable('customerSearch2', 'customerTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="customerSearch2" placeholder="대여상태">
			<button onclick="searchTable('customerSearch2', 'customerTable')">검색</button>
		</div>
	</div>
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
				<td>100</td>
				<td>강지은</td>
				<td>010-1234-5678</td>
				<td>충청남도 천안시 서북구 성성2길 52-1</td>
				<td>연체</td>
			</tr>


		</tbody>
	</table>

	<div class="section-title">회원 대여 내역 조회</div>
	<!-- ******************************************************************* -->

	<div class="search-box">
		<div class="search-group" style="display: flex;">
			<form action='test4.jsp' method='post'>
				<input type="text" id="memberNoInput" name='memberNo'
					placeholder="회원번호">
				<button type="submit">검색</button>
			</form>
		</div>
		<div class="search-group" style="display: flex;">
			<form action='test4.jsp' method='post'>
				<input type="text" id="memberNameInput" name='memberName'
					placeholder="회원명">
				<button type="submit">검색</button>
			</form>
		</div>
		<div class="search-group">
			<form action='test4.jsp' method='post'>
				<input type="text" id="memberPhoneInput" name='memberPhone'
					placeholder="휴대폰번호">
				<button type="submit">검색</button>
			</form>
		</div>
	</div>





	<table id="historyTable">
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
			if (memberList != null) {
			%>
			<%
			for (MemberDTO member : memberList) {
			%>
			<tr>
				<td><%=member.getRentalno()%></td>
				<td><%=member.getMname()%></td>
				<td><%=member.getBookName()%></td>

				<td><%=member.getrDate()%></td>
				<td><%=member.getRtDate()%></td>

				<td><%=member.getOdDate() == null ? "" : member.getOdDate()%></td>
				<td><%=member.getStDate() == null ? "" : member.getStDate()%></td>
				<td><%=member.getCoDate() == null ? "" : member.getCoDate()%></td>

				<td><%=member.getrStatus()%></td>

				<%-- 				<td><%=ConvertDateUtil.convertLocalDateTimeToString(ConvertDateUtil.convertStringToLocalDateTime4(member.getrDate()))%></td> --%>
				<%-- 				<td><%=ConvertDateUtil.convertLocalDateTimeToString(ConvertDateUtil.convertStringToLocalDateTime4(member.getRtDate())) %></td> --%>

				<%-- 				<td><%=member.getOdDate()== null? "" : ConvertDateUtil.convertLocalDateTimeToString(ConvertDateUtil.convertStringToLocalDateTime4(member.getOdDate()))%></td> --%>
				<%-- 				<td><%=member.getStDate()== null? "" : ConvertDateUtil.convertLocalDateTimeToString(ConvertDateUtil.convertStringToLocalDateTime4(member.getStDate()))%></td> --%>
				<%-- 				<td><%=member.getCoDate()== null? "" : ConvertDateUtil.convertLocalDateTimeToString(ConvertDateUtil.convertStringToLocalDateTime4(member.getCoDate()))%></td> --%>

			</tr>
			<%
			}
			%>
			<%
			}
			%>

			<%-- 회원명 조회 --%>





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
			<input type="text" id="bookSearch1" placeholder="도서번호">
			<button onclick="searchTable('bookSearch1', 'bookTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="bookSearch2" placeholder="도서제목">
			<button onclick="searchTable('bookSearch2', 'bookTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="bookSearch2" placeholder="대여상태">
			<button onclick="searchTable('bookSearch2', 'bookTable')">검색</button>
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
			<tr>
				<td>10000</td>
				<td>강지은</td>
				<td>아이가 없는 집</td>
				<td>2024.06.22</td>
				<td>2024.06.29</td>
				<td></td>
				<td></td>
				<td></td>
				<td>대여중</td>
			</tr>
		</tbody>
	</table>

	<div class="section-title">도서 정보</div>
	<div class="search-box">
		<div class="search-group">
			<input type="text" id="loanSearch1" placeholder="도서번호">
			<button onclick="searchTable('loanSearch1', 'loanTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="loanSearch1" placeholder="도서제목">
			<button onclick="searchTable('loanSearch1', 'loanTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="loanSearch2" placeholder="장르명">
			<button onclick="searchTable('loanSearch2', 'loanTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="loanSearch2" placeholder="저자">
			<button onclick="searchTable('loanSearch2', 'loanTable')">검색</button>
		</div>
		<div class="search-group">
			<input type="text" id="loanSearch2" placeholder="출판사">
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

	<script src="js/script.js"></script>

</body>
</html>