<%@ page import="db.dto.MsgDTO"%>
<%@ page import="db.dao.MsgDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림메세지전송</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8"); //문자 인코딩 설정 한글깨짐 방지
		
		//폼에서 전달받은  input 값 각 변수에 저장
		int membno = Integer.parseInt(request.getParameter("insert_membno"));
		String message = request.getParameter("insert_msg");
		
		
		System.out.println(membno);
		System.out.println(message);

		
		MsgDAO msgDAO = new MsgDAO(); //msgDAO 객체 생성
		
		int result = msgDAO.insertMessage(membno, message);//insertMessage메서드를 호출하고 알림을 전송할 내용을 result에 저장, 결과를 int로 반환
		
		System.out.println(result);
		
	 	 %>

</body>
</html>