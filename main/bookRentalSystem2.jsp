<%@ page import="db.dto.MemberInfoDTO"%>
<%@ page import="db.dao.MemberInfoDAO"%>

<%@ page import="db.dto.MsgDTO"%>
<%@ page import="db.dao.MsgDAO"%>

<%@ page import="db.dto.BookDTO"%>
<%@ page import="db.dto.Book2DTO"%>
<%@ page import="db.dto.Book3DTO"%>
<%@ page import="db.dao.BookDAO"%>

<%@ page import="db.dto.EmployeeDTO"%>
<%@ page import="db.dao.EmployeeDAO"%>

<%@ page import="db.dto.RentalDTO"%>
<%@ page import="db.dao.RentalDAO"%>

<%@ page import="db.dto.ReturnDTO"%>
<%@ page import="db.dao.ReturnDAO"%>

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
	<%
	//로그인 입력한 값을 기준으로 누구인지 확인
	request.setCharacterEncoding("UTF-8");
   	String ename = (String) session.getAttribute("ename"); /* 로그인액션에서 정보를 받아 이름 확인 */  	
   	if (ename != null) {
   	String empno = session.getAttribute("empno").toString(); /* 사번 확인 위로 올리면 로그인 정보 없이 접속시 오류! */	
	
	
   	RentalDAO rentalDAO = null;
	List<RentalDTO> rentalList = null;

	//form의 회원번호 파라미터에 값이 있으면
	if (request.getParameter("memberNo") != null && request.getParameter("memberNo") != "") {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));

		rentalDAO = new RentalDAO();
		rentalList = rentalDAO.selectRentalMemberByNo(memberNo); //회원번호로 대여내역 조회

	} else if (request.getParameter("memberName") != null && request.getParameter("memberName") != "") {
		//form의 회원이름 파라미터에 값이 있으면
		String memberName = request.getParameter("memberName");

		rentalDAO = new RentalDAO();
		rentalList = rentalDAO.selectRentalMemberByName(memberName); //회원이름으로 대여내역 조회
	} else if (request.getParameter("memberPhone") != null && request.getParameter("memberPhone") != "") {
		//form의 회원휴대폰번호 파라미터에 값이 있으면
		String memberPhone = request.getParameter("memberPhone");

		rentalDAO = new RentalDAO();
		rentalList = rentalDAO.selectRentalMemberByPhone(memberPhone); //회원휴대폰번호로 대여내역 조회
	}
	
	
	
	
	
	%>
    <div class="header"><h1>도서 대여 시스템</h1></div>
	<div class="section-title">"<%=ename %>"님 환영합니다.<button class="right" onclick="employeeClick()">관리자 공지사항</button></div><br/>
	<div class="employee" id="employee"><!-- 모달창 -->
	    <h1> 관리자 공지사항 </h1><br/>
        <button class="right" id="btn" onclick="communityClick()"> 공지 추가 </button><br/><br/>
        	<div class="community" id="community">
        		<h3> 공지사항 추가 </h3><br/>
		        <form action="community_action.jsp" method="post" id="frm_community">
	            <label> 직원 번호 : <input type ="text" id="input_empno" name= "empno" value="<%=empno%>"> </label><br/><br/>
	            <label> 메시지 : &nbsp;&nbsp;&nbsp;<input type ="text" id="input-message" name= "message"> </label><br/><br/><br/>
	            <button type = "submit" id="btn"> 공지 추가 </button>
        		</form>	        
        	</div>
        <table id="rankingTable">
    	<thead>
       		<tr>
	            <th>직원 번호</th>
	            <th>메시지</th>
	            <th>공지 날짜</th>
	        </tr>
	     </thead>
	     <tbody>
	     	<%
	     		BookDAO bookDAO = new BookDAO();
				List<EmployeeDTO> employeeList = bookDAO.getCommunityList();
				
				for(EmployeeDTO employee : employeeList) {	
			%>
	     	<tr>
                <td><%=employee.getEmpno()%></td>
                <td><%=employee.getMessage()%></td>
                <td><%=employee.getSend_date()%></td>
            </tr>
            <%
				}
			%> 
	    </tbody>
	    </table>          
    </div>
    <div class="section-title">회원 정보<button class="right" onclick="logOut()">log out</button></div>
    <script>
	function logOut(){
	location.href="logout_action.jsp";
	}
	</script>


	
	<button type = 'button' id="btn_msg" onclick="msg()"> 알림메세지 </button>
	
	<div class="msg-page">
		
      <div class="msg-page-body">
	      <h2> 알림 메세지 전송 페이지 </h2>
	      <p> 회원번호와 전송할 메세지를 입력하세요.</p>
	  	  <button type="button" id="btn-close-msg-page" onclick="closeMsg()"> X </button>
	  	  
	  	  <form action='msg_action.jsp' method="post" id="frm_msg">
	  	  		
	  	  		<p> 회원 번호 </p>
		  	  	<p> <input type="text" id="" name="insert_msg_membno" placeholder="회원번호입력"> </p>
		  	  	<p> 회원에게 전달할 메세지 </p>
		  	  	<p> <input type="text" id="insert_msg" name="insert_msg_msg" placeholder="회원에게 전달할 입력"> </p>
		 	  <button type = 'submit' id="btn-send" onclick="sendMsg()"> 전송 </button>
		 	  
	  	  </form>
	
      </div>
         
   </div>

   <div class="section-title">
    <span>회원 정보</span>
    <button type = 'button' id="btn-add-page" onclick="openAdd()">회원추가</button>
   </div>
   
   <div class="add-page">
		
      <div class="add-page-body">
	      <h2> 회원 추가 페이지 </h2>
	      <p>추가할 회원을 입력하세요.</p>
	  	  <button type="button" id="btn-close-add-page" onclick="closeAdd()"> X </button>
	  	  
	  	  <form action='add_action.jsp' method="post" id="frm_add">
	  	  
	  	  		
	  	  		<p> 회원 이름 </p>
		  	  	<p> <input type="text" name="insert_add_mname" placeholder="회원이름 입력"> </p>
		  	  	<p> 회원 주소 </p>
		  	  	<p> <input type="text" name="insert_add_maddress" placeholder="회원 주소 입력"> </p>
		  	  	<p> 회원 전화번호 </p>
		  	  	<p> <input type="text" name="insert_add_mphone" placeholder="회원 전화번호 입력"> </p>
		 	  <button type = 'submit' id="btn-add" onclick="add()"> 추가 </button>
	  	  </form>
	
      </div>
         
   </div>
   
   

	<div class="search-box">
		<div class="search-group">
			<form action='bookRentalSystem.jsp' method="post" id="frm_membno">
				<input type="text" id="input-m-membno" name="m_membno"
					placeholder="회원번호">
				<button type="submit">검색</button>
			</form>
		</div>
		<div class="search-group">
			<form action='bookRentalSystem.jsp' method='post' id="frm_mname">
				<input type="text" id="input-m-mname" name="m_mname" placeholder="회원명">
				<button type="submit">검색</button>
			</form>
		</div>
		<div class="search-group">
			<form action='bookRentalSystem.jsp' method='post' id="frm_mphone">
				<input type="text" id="input-m-mphone" name="m_mphone"
					placeholder="휴대폰번호">
				<button type="submit">검색</button>
			</form>
		</div>
		<div class="search-group">
			<form action='bookRentalSystem.jsp' method='post' id="frm_mstatus">
				<input type="text" id="input-m-mstatus" name="m_mstatus"
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
			
			boolean isEmptyStr = false;
           	List<String> db_params = new ArrayList<>();
           	String targetStr = null;
           	int targetNo = 0;
           	
           	//관리자 입력 변수
           	String membno = request.getParameter("m_membno");
			String mname = request.getParameter("m_mname");
			String mphone = request.getParameter("m_mphone");
			String mstatus = request.getParameter("m_mstatus");
			
			String[] params = new String[] {membno, mname, mphone, mstatus};
			
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
           			//List<String> targetList = Arrays.asList(params);
           			
           			switch (targetNo) {
           				case 0:
           					int membnoInt = Integer.parseInt(request.getParameter("m_membno"));
       						memberList = memberDAO.selectMemberInfo(membnoInt);
       	           			break;
           				case 1:
           					//int rentno = Integer.parseInt(str_rentno);
           					memberList = memberDAO.selectMnameInfo(mname);
           	           		break;
           				case 2:
           					memberList = memberDAO.selectMphoneInfo(mphone);
           	           		break;
           				case 3:
           					memberList = memberDAO.selectMstatusInfo(mstatus);
           	           		break;
           			}           			
           		}
           	}
           	
           	if (isEmptyStr) {
           		memberList = memberDAO.selectMemberInfoAll();
           	}
           	////////////////////////////
		
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


<!-- ******************* 나은 파트 ******************* -->
	<div class="section-title">회원 대여 내역 조회</div>
	
	<div class="search-box">
		<div class="search-group" style="display: flex;">
			<form action='bookRentalSystem.jsp' method='post'>
				<input type="text" id="memberNoInput" name='memberNo'
					placeholder="회원번호">
				<button type="submit">검색</button>
			</form>
		</div>
		<div class="search-group" style="display: flex;">
			<form action='bookRentalSystem.jsp' method='post'>
				<input type="text" id="memberNameInput" name='memberName'
					placeholder="회원명">
				<button type="submit">검색</button>
			</form>
		</div>
		<div class="search-group">
			<form action='bookRentalSystem.jsp' method='post'>
				<input type="text" id="memberPhoneInput" name='memberPhone'
					placeholder="휴대폰번호">
				<button type="submit">검색</button>
			</form>
		</div>
	</div>
	
		
	<!-- 회원 대여내역이 뜨는 부분 -->
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
		<%
			if (rentalList != null) { //조회한 회원 대여 내역이 존재하면
		%>
			<%
				for (int i = 0; i<rentalList.size(); i++) { //조회된 갯수만큼 출력
			%>
			<tr>
				<!-- 회원 대여 번호, 이름 id값 동적 할당 -->
				<td id="membRentalNO<%=i%>" ><%=rentalList.get(i).getRentalno()%></td>
				<td id="membName<%=i%>" ><%=rentalList.get(i).getMname()%></td>
				<td><%=rentalList.get(i).getBookName()%></td>

				<td><%=rentalList.get(i).getrDate()%></td>
				<td><%=rentalList.get(i).getRtDate()%></td>
				
				<!-- 날짜가 null인경우 어떻게 출력할건지 결정 -->
				<td><%=rentalList.get(i).getOdDate() == null ? "" : rentalList.get(i).getOdDate()%></td>
				<td><%=rentalList.get(i).getStDate() == null ? "" : rentalList.get(i).getStDate()%></td>
				<td><%=rentalList.get(i).getCoDate() == null ? "" : rentalList.get(i).getCoDate()%></td>

				<td><%=rentalList.get(i).getrStatus()%></td>

				<td><button type = 'button' id="btn_return_page<%=i%>" onclick="openConfirmReturn(<%=i%>)">반납</button></td>
				
				<!-- 대여현황조회 form을 위해 hidden 타입의 input창 생성 -->
				<form action="return_action.jsp" method="POST" id="frm-return">
					<input type="hidden" id="returnNoInput" name="returnNo">
				</form>
				
			</tr>
				<%
				} //for문 끝
				%>
			<%
			} //if문 끝
			%>
			
		</tbody>
			
	</table>
	
	
	
	<div class="section-title">
		<span>대여 현황 조회</span>
		<button onclick="openOverdueList()">연체 현황 조회</button>
		<button onclick="">대여 현황 조회</button>
	</div>
	
	<div class="overdue-modal">
	
		<div class="overdue-modal-body">
			<h2>연체 현황 조회</h2>
			<button onclick="closeOverdueList()">닫기</button>
         
        
		<div class="overdue-modal-content">
			
			<table id="historyTable">
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
				<%
					//td가 6개
					//tr이 행, td가 열
					RentalDAO rentalDAO2 = new RentalDAO();
					
				%>
					<tr>
						<td id="" ><%=123%></td>
						<td id="" ><%=123%></td>
						<td><%=123%></td>
		
						<td><%=123%></td>
						<td><%=123%></td>
						<td><%=123%></td>
						
		
						<!-- 연체 현황 조회를 위한 form과 hidden된 input창 (아직 구현X) -->
						<form action="return_action.jsp" method="POST" id="frm-return">
							<input type="hidden" id="" name="">
							<input type="hidden" id="" name="">
						</form>
						
					</tr>
			</tbody>
		</table>
			
		</div> <!-- overdue-modal-content 끝 -->
		</div> <!-- overdue-modal-body 끝 -->
	</div> <!-- overdue-modal 끝 -->
	
	
	
	
<!-- +) 메세지 전송 내역 -->
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
					<tr>
						<td>100</td>
						<td>강나은</td>
						<td>대여가 불가능합니다.</td>
						<td>2024.06.22</td>
					</tr>
				</tbody>
			</table>
	
	
	
	
	
	
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
    
    <div class="section-title">도서 정보<button class="right" onclick="btnClick()">도서추가</button>
    	<button class="right" onclick="bookqClick()">도서 수량 업데이트</button>
    </div>
    <div class="bookadd" id="bookadd">
        <h1> 도서 추가</h1>
        <form action="bookaddition_action.jsp" method="post" id="frm_book">
            <label> 책 이름 : <input type ="text" id="input_bname" name= "bname"> </label><br/>
            <label> 저자 : &nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" id="input_bauthor" name= "bauthor"> </label><br/>
            <label> 출판사 : <input type ="text" id="input_bpublish" name= "bpublish"> </label><br/>
            <label> 가격 : &nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" id="input_bprice" name= "bprice"> </label><br/>
            <label> 분류번호 :     
                <select name="genrno">
                    <option id="input_genrno"> 소설 </option>
                    <option id="input_genrno"> 시/에세이 </option>
                    <option id="input_genrno"> 경제/경영 </option>
                    <option id="input_genrno"> 자기계발 </option>
                    <option id="input_genrno"> 만화 </option>
                </select> 
            </label><br/>
            <label> 발행일 : <input type ="date" id="input_bdate" name= "bdate"> </label><br/>
            <label> 수량 : &nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" id="input_bcount" name= "bcount"> </label><br/><br/>
            <button type = "submit" id="btn"> 도서 추가 </button>
        </form>
    </div>
    <div class="bookq" id="bookq">
        <h1> 도서 수량 업데이트 </h1><br/>
        <form action="bookquantity_action.jsp" method="post" id="frm_bookq">
            <label> 책 번호 : <input type ="text" id="input_bookno" name= "bookno"> </label><br/><br/>
            <label> 수량 : &nbsp;&nbsp;&nbsp;&nbsp;<input type ="text" id="input_bcount" name= "bcount"> </label><br/><br/><br/>
            <button type = "submit" id="btn"> 도서 수량 업데이트 </button>
        </form>
    </div>
    <div class="search-box">
        <div class="search-group">
        	<form action="bookRentalSystem.jsp" method="post" id="frm_bookno">
	            <input type="text" id="loanSearch1" placeholder="도서번호" name="bookno">
	            <button type="submit">검색</button>
            </form>
        </div>
        <div class="search-group">
        	<form action="bookRentalSystem.jsp" method="post">
	            <input type="text" id="loanSearch1" placeholder="도서제목" name="bname">
	            <button type="submit">검색</button>
            </form>
        </div>
        <div class="search-group">
        	<form action="bookRentalSystem.jsp" method="post">
	            <input type="text" id="loanSearch2" placeholder="장르명" name="gname">
	            <button type="submit">검색</button>
            </form>
        </div>
        <div class="search-group">
        	<form action="bookRentalSystem.jsp" method="post">
	            <input type="text" id="loanSearch2" placeholder="저자" name="bauthor">
	            <button type="submit">검색</button>
            </form>
        </div>
        <div class="search-group">
        	<form action="bookRentalSystem.jsp" method="post">
	            <input type="text" id="loanSearch2" placeholder="출판사" name="bpublish">
	            <button type="submit">검색</button>
            </form>
        </div>
        <div class="search-group">
        	<form action="bookRentalSystem.jsp" method="post">
	            <input type="text" id="loanSearch2" placeholder="재고" name="bcount">
	            <button type="submit">검색</button>
            </form>
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
                <th>대여하기</th>
            </tr>
        </thead>
        <tbody>
	<%
 		
		List<Book2DTO> getBookList = null;
       	isEmptyStr = false;
       	db_params = new ArrayList<>();
       	targetStr = null;
       	targetNo = 0;
		
		String booknoSTR = request.getParameter("bookno");
		String bname = request.getParameter("bname");
		String bauthor = request.getParameter("bauthor");
		String bpublish = request.getParameter("bpublish");
		String gname = request.getParameter("gname");
		String bcountSTR = request.getParameter("bcount");	
		
		params = new String[] {booknoSTR, bname, bauthor, bpublish, gname, bcountSTR};
		
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
       					if (booknoSTR.isBlank()) { 
       	%>					
       				<script>alert("공백 안됨 다시 입력 Go!");</script>  					       						
       	<%				
       					}
       					else{
       						int bookno = Integer.parseInt(booknoSTR);
       						getBookList = bookDAO.getBookNoList(bookno);
       					}       						
       	           		break;
       				case 1:
       					getBookList = bookDAO.getBookNameList(bname);
       	           		break;
       				case 2:
       					getBookList = bookDAO.getBookAuthorList(bauthor);
       	           		break;
       				case 3:
       					getBookList = bookDAO.getBookPublishList(bpublish);
       	           		break;
       				case 4:
       					getBookList = bookDAO.getBookGnameList(gname);
       	           		break;
       				case 5:
       					if(bcountSTR.isBlank()){
       	%>				
       					<script>alert("공백 안됨 다시 입력 Go!");</script>  					
       	<%			
       					}else{
       						int bcount = Integer.parseInt(bcountSTR);
       						getBookList = bookDAO.getBookCountList(bcount);
       					}	
       	           		break;
       			}           			
       		}
       	}
       	
       	if (isEmptyStr) {
       		getBookList = bookDAO.getBookList();
       	}
		
       	if(getBookList != null){
			for(Book2DTO bookList : getBookList) {
		%>				
	             <tr>
	                <td id="b-id"><%=bookList.getBookno()%></td>
	                <td id="b-name"><%=bookList.getBname()%></td>
	                <td><%=bookList.getBauthor()%></td>
	                <td><%=bookList.getBpublish()%></td>
	                <td><%=bookList.getBprice()%></td>
	                <td><%=bookList.getGname()%></td>
	                <td><%=bookList.getBdate()%></td>
	                <td><%=bookList.getBcount()%></td>
	                <td> <button type = 'button' id="btn-rt-page" onclick="openRt()">대여</button> </td>
	            </tr>       
		<%	
		  	}
		}
		%>        
 	</tbody>
    </table>
    
    <div class="rt-page">
      
      <div class="rt-page-body">
         <h2> RTpage </h2>
          <button type="button" id="btn-close-rt-page" onclick="closeRt()"> X </button>
          
          <form action='rt_action.jsp' method="post" id="frm_rt">
             <p> 도서번호 </p>
             <p id="book-id"></p>
             <p> 도서이름 </p>
             <p id="book-name"></p>
             <input type="hidden" id="book-hiddenId" name="bookHiddenId">
      
             <p> 회원번호 </p>
             <p> <input type="text" id="search_membno" name="memberId" placeholder="회원번호 입력"> </p>
             
            <button type = 'submit' id="btn-rt" onclick="rt()"> 대여 </button>
          </form>
   
      </div>
         
   </div>
    
    
    
    
    
    
    
    
    
    <table id="rankingTable">
    <div class="section-title">인기 도서</div>
    	<thead>
         	<tr>
	             <th>도서 제목</th>
	             <th>저자</th>
	             <th>대여 횟수</th>
	         </tr>
	     </thead>
	     <tbody>
	     	<%
				List<Book3DTO> book3List = bookDAO.getBookRanking();
				for(Book3DTO book : book3List) {	
			%>
	     	<tr>
                <td><%=book.getBname()%></td>
                <td><%=book.getBauthor()%></td>
                <td><%=book.getBookno()%></td>
            </tr>
            <%
				}
			%> 
	     </tbody>
    </table>
    <% 
    } else {
    %>
		<script>
			alert('로그인을 해주세요');
			location.href = 'empLogin.jsp';	//
		</script>
	 <% 
    }
    %>

  
<script src="js/script.js"></script>
</body>
</html>

