<%@ page import="db.dao.BookDAO" %>
<%@ page import="db.dto.BookDTO" %>
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
		request.setCharacterEncoding("UTF-8");	//문자 인코딩 설정 - 한글깨짐 방지
		//System.out.println(request.getParameter("bname"));		//request - 요청 , response - 응답 
		//System.out.println(request.getParameter("bauthor"));
		//System.out.println(request.getParameter("bpublish"));
		//System.out.println(request.getParameter("bprice"));
		//System.out.println(request.getParameter("genrno"));
		//System.out.println(request.getParameter("bdate"));
		
		//request.getParameter 결과 -> String
		String bname = request.getParameter("bname");
		String bauthor = request.getParameter("bauthor");
		String bpublish = request.getParameter("bpublish");
		int bprice = Integer.parseInt(request.getParameter("bprice"));	//int는 쓸수 없음 대신 integer로 받아서 저장
		String genrnoSTR = request.getParameter("genrno");	//int는 쓸수 없음 대신 integer로 받아서 저장
		int genrno = 0;
		switch (genrnoSTR){
		case "소설" :
			genrno = 1;
		case "시/에세이" :
			genrno = 2;
		case "경제/경영" :
			genrno = 3;
		case "자기계발" :
			genrno = 4;
		case "만화" :
			genrno = 5;			
		}
		String bdate = request.getParameter("bdate");
		int bcount = Integer.parseInt(request.getParameter("bcount"));
	
		BookDAO bookDAO = new BookDAO();
		
		//낱개 저장
		int result = bookDAO.bookaddition(bname, bauthor, bpublish, bprice, genrno, bdate);
		int result2 = bookDAO.bookquantity(bcount);	
		if ( result > 0 && result2 >0){
	%>
		<script>
			alert('저장 성공');
			location.href = 'test.jsp';	//
		</script>
	<%	
		} else {
	%>		
		<script>
			alert('저장 실패');
			history.back();	//뒤로가기		//addDept.jsp 저장하려는 페이지 -> 추가 -> addDept_action.jsp
		</script>
	<% 
		}	
		
	%>
</body>
</html>