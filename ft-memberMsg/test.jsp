<%@ page import="db.dto.MemberInfoDTO"%>
<%@ page import="db.dao.MemberInfoDAO"%>
<%@ page import="db.dto.MsgDTO"%>
<%@ page import="db.dao.MsgDAO"%>
<%@ page import="java.util.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Rental System</title>
<link href="css/style.css" rel="stylesheet">

</head>
<body>
	<div class="header">
		<h1>도서 대여 시스템</h1>
	</div>
	
	<h2>000관리자님</h2>
	
	<button onclick="logout()">로그아웃</button>
	
	    <div class="select_page">
      <div class="select_page_body">
	      <h2> 회원 알림 조회 페이지 </h2>
	  	  <button type="button" id="btn_close_select_page" onclick="closeSelect()"> X </button>
  			<div class="section-title"> 메세지 전송 내역</div>
		 	 <table id="msgTable">
				<thead>
					<tr>	
						<th>회원번호</th>
						<th>회원명</th>
						<th>전달한 메세지</th>
						<th>메세지 전달날짜</th>
					</tr>
				</thead>
				<tbody>
				<% System.out.println("====="); %>
					<%
					request.setCharacterEncoding("UTF-8"); //문자 인코딩 설정 한글깨짐 방지
		
					MsgDAO msgDAO = new MsgDAO();
					List<MsgDTO> msgList = null;
					
					msgList = msgDAO.selectMsgAll();
					//System.out.println(msgList.size());	
			  		if (msgList != null) {
			           for (MsgDTO msg : msgList) { %>
			           	<tr>
							<td><%=msg.getMembno()%></td>
			           		<td><%=msg.getMname()%></td>
			           		<td><%=msg.getMessage()%></td>
			           		<td><%=msg.getSend_date()%></td>
			           		
			           	</tr>
					<% } 
			} else {
				System.out.println("NULL");
			}
          	%>
				</tbody>
			 </table>
	  		<button type = 'button' id="btn_msg" onclick="msg()"> 알림메세지전송 </button>
	  	  
	
      </div>
         
   </div>
   
   <div class="msg_page">
		<div class="msg_page_body">
	      <h2> 알림 메세지 전송 페이지 </h2>
	      <p> 회원번호와 전송할 메세지를 입력하세요.</p>
	  	  <button type="button" id="btn_close_msg_page" onclick="closeMsg()"> X </button>
	  	  <form action='msg_action.jsp' method="post" id="frm_msg">
	  	  		
	  	  		<p> 회원 번호 </p>
		  	  	<p> <input type="text" id="insert_membno" name="insert_membno" placeholder="회원번호입력"> </p>
		  	  	<p> 회원에게 전달할 메세지 </p>
		  	  	<p> <input type="text" id="insert_msg" name="insert_msg" placeholder="회원에게 전달할 입력"> </p>
		 	  <button type = 'submit' id="btn_send" onclick="sendMsg()"> 전송 </button>
	  	  </form>
	
      </div> 
   </div>

   <div class="section-title">
    <span>회원 정보</span>
    <button type = 'button' id="btn_add_page" onclick="openAdd()">회원추가</button>
    <button type = 'button' id="btn_select_page" onclick="openSelect()">회원알림</button>
   </div>
   
   <div class="add_page">
		
      <div class="add_page_body">
	      <h2> 회원 추가 페이지 </h2>
	      <p>추가할 회원을 입력하세요.</p>
	  	  <button type="button" id="btn_close_add_page" onclick="closeAdd()"> X </button>
	  	  
	  	  <form action='add_action.jsp' method="post" id="frm_add">
	  	  		<p> 회원 이름 </p>
		  	  	<p> <input type="text" id="insert_mname" name="insert_mname" placeholder="회원이름 입력"> </p>
		  	  	<p> 회원 주소 </p>
		  	  	<p> <input type="text" id="insert_maddress" name="insert_maddress" placeholder="회원 주소 입력"> </p>
		  	  	<p> 회원 전화번호 </p>
		  	  	<p> <input type="text" id="insert_mphone" name="insert_mphone" placeholder="회원 전화번호 입력"> </p>
		 	  <button type = 'submit' id="btn_add" onclick="add()"> 추가 </button>
	  	  </form>
	
      </div>
         
   </div>
 
	<div class="search-box">
		<div class="search-group">
			<form action='test.jsp' method="post" id="frm_membno">
				<input type="text" id="input_membno" name="membno"
					placeholder="회원번호">
				<button type="submit">검색</button>
			</form>
		</div>
		<div class="search-group">
			<form action='test.jsp' method='post' id="frm_mname">
				<input type="text" id="input_mname" name="mname" placeholder="회원명">
				<button type="submit">검색</button>
			</form>
		</div>
		<div class="search-group">
			<form action='test.jsp' method='post' id="frm_mphone">
				<input type="text" id="input_mphone" name="mphone"
					placeholder="휴대폰번호">
				<button type="submit">검색</button>
			</form>
		</div>
		<div class="search-group">
			<form action='test.jsp' method='post' id="frm_mstatus">
				<input type="text" id="input_mstatus" name="mstatus"
					placeholder="대여상태">
				<button type="submit">검색</button>
			</form>
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
			<%
			request.setCharacterEncoding("UTF-8"); //문자 인코딩 설정 한글깨짐 방지

			MemberInfoDAO memberDAO = new MemberInfoDAO();
			List<MemberInfoDTO> memberList = null;
			
			String mname = request.getParameter("mname");
			String mphone = request.getParameter("mphone");
			String mstatus = request.getParameter("mstatus");

		//
			if (request.getParameter("membno") != null && request.getParameter("membno") != "") {
				int membno = Integer.parseInt(request.getParameter("membno"));
				//memberList = select(membno); 함수추가
				memberList = memberDAO.selectMemberInfo(membno);
			} else if (request.getParameter("mname") != null && request.getParameter("mname") != "") {
				//memberList = select(mname);함수추가
				memberList = memberDAO.selectMnameInfo(mname);
			} else if (request.getParameter("mphone") != null && request.getParameter("mphone") != "") {
				//memberList = select(phone);함수추가
				memberList = memberDAO.selectMphoneInfo(mphone);
			} else if (request.getParameter("mstatus") != null && request.getParameter("mstatus") != "") {
				//memberList = select(mstatus);함수추가
				memberList = memberDAO.selectMstatusInfo(mstatus);
				
			} else if ((request.getParameter("membno") == null || request.getParameter("membno") == "") && request.getMethod().equals("POST")) {
				memberList = memberDAO.selectMemberInfoAll();
			} else if ((request.getParameter("mname") == null || request.getParameter("mname") == "") && request.getMethod().equals("POST")) {
				memberList = memberDAO.selectMemberInfoAll();
			} else if ((request.getParameter("mphone") == null || request.getParameter("mphone") == "") && request.getMethod().equals("POST")) {
				memberList = memberDAO.selectMemberInfoAll();
			} else if ((request.getParameter("mstatus") == null || request.getParameter("mstatus") == "") && request.getMethod().equals("POST")) {
				memberList = memberDAO.selectMemberInfoAll();
			}
			%>

			<%
			if (memberList != null) {
			%>
			<%
				for (MemberInfoDTO member : memberList) {
				%>
				<tr>
					<td><%=member.getMembno()%></td>
					<td><%=member.getMname()%></td>
					<td><%=member.getMphone()%></td>
					<td><%=member.getMaddress()%></td>
					<td><%=member.getMstatus()%></td>
				</tr>
				<%
				}
			}
			%>



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

<!-- 도서 추가페이지 -->	
	<div class="modal">
		
      <div class="modal_body">
      <h2> 도서 추가 </h2>
         <p>추가할 도서 정보를 입력하세요.</p>
      	<button id="btn-member-X" onclick="(()=>{
               document.querySelector('.modal').style.display = 'none';
               })()"> X </button>

      <div class="modal_content">
         <p>도서번호 <input placeholder="도서번호"></p>
         <p>책 제목 <input placeholder="책 제목"></p>
         <p>저자 <input placeholder="저자"></p>
         <p>출판사 <input placeholder="출판사"></p>
         <p>가격 <input placeholder="가격"></p>
         <p>장르 <input placeholder="장르"></p>
         <p>발행일 <input placeholder="발행일"></p>
         <p>재고 <input placeholder="재고"></p>
         <button id="btn-book-add">추가</button>
       </div>
       </div>
         
   </div>

	<div class="section-title">도서 정보
		<button type='button' id="btn-book-add"
         onclick="(() => {
            document.querySelector('.modal').style.display = 'flex';
    })()">도서추가</button>
	</div>
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
				<th>수량</th>
				<th>대여</th>
				
			</tr>
		</thead>
		<tbody>
			<tr>
				<td id="b-id">1000</td>
				<td id="b-name">아이가 없는 집</td>
				<td>알렉스 안도릴</td>
				<td>필름</td>
				<td>16,200원</td>
				<td>소설</td>
				<td>2024.06.12</td>
				<td>3</td>
				<td> <button type = 'button' id="btn_rt_page" onclick="openRt()">대여</button> </td>
			</tr>
		</tbody>
   </table>
 
<!--  도서대여 추가페이지   -->
   	<div class="rt_page">
      <div class="rt_page_body">
	      <h2> RTpage </h2>
	      <p>대여할 도서를 입력하세요.</p>
	  	  <button type="button" id="btn_close_rt_page" onclick="closeRt()"> X </button>
	  	  
	  	  <form action='rt_action.jsp' method="post" id="frm_rt">
	  	  	  <p> 도서번호 </p>
		  	  <p id="book-id"></p>
		  	  <p> 도서이름 </p>
		  	  <p id="book-name"></p>
		  	  
		  	  <!-- 도서번호를 폼으로 날리기위한 hidden타입의 input창 -->
		  	  <input type="hidden" id="book-hiddenId" name="bookHiddenId"> 
		  	  <p> 회원번호 </p>
		  	  <p> <input type="text" id="search_membno" name="memberId" placeholder="회원번호 입력"> </p>
		 	  <button type = 'submit' id="btn_rt" onclick="rt()"> 대여 </button>
	  	  </form>
      </div>  
   </div>
  
<script src="js/script.js"></script>
</body>
</html>

