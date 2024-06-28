<%@ page import="db.dao.TestDAO" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	        <form action="bookaddition_action.jsp" method="post" id="frm_book">
            <label> 책 이름 : <input type ="text" id="input_bname" name= "bname"> </label><br/>
            <label> 저자 : <input type ="text" id="input_bauthor" name= "bauthor"> </label><br/>
            <label> 출판사 : <input type ="text" id="input_bpublish" name= "bpublish"> </label><br/>
            <label> 가격 : <input type ="text" id="input_bprice" name= "bprice"> </label><br/>
            <label> 분류번호 :     
                <select name="genrno">
                    <option id="input_genrno" >소설</option>
                    <option id="input_genrno" >시/에세이</option>
                    <option id="input_genrno" >경제/경영</option>
                    <option id="input_genrno" >자기계발</option>
                    <option id="input_genrno" >만화</option>
                </select> 
            </label><br/>
            <label> 발행일 : <input type ="date" id="input_bdate" name= "bdate"> </label><br/>
            <button type = "submit" id="btn"> 도서 추가 </button>
        </form>

	<script>
		const frm_book = document.querySelector('#frm_book');
		
		frm_book.addEventListener('submit', (e)=>{
			e.preventDefault();	//기본 이벤트 중지. submit 폼 전송 막기!
				
			let input_bname = document.querySelector('#input_bname');
			let input_bauthor = document.querySelector('#input_bauthor');
			let input_bpublish = document.querySelector('#input_bpublish');
			let input_bprice = document.getElementById('input_bprice');
			let input_genrno = document.getElementById('input_genrno');
			
			input_bname.value = input_bname.value.trim();
			input_bauthor.value = input_bauthor.value.trim();
			input_bpublish.value = input_bpublish.value.trim();
			input_bprice.value = input_bprice.value.trim();
			input_genrno.value = input_genrno.value.trim();
			
			if(input_bname.value.trim() == '' || input_bname.value == null ){	//.trim() -> 띄어쓰기 빈칸이 있는지 확인!
				alert('책 이름은 필수 입력입니다.');
				input_deptno.focus();
				return false;
			}
			if(input_bauthor.value.trim() == '' || input_bname.value == null ){
				alert('저자는 필수 입력입니다.');
				input_dname.focus();
				return false;
			}

			if(input_bpublish.value.trim() == '' || input_bname.value == null ){
				alert('출판사는 필수 입력입니다.');
				input_loc.focus();
				return false;
			}
			if(input_bprice.value.trim() == '' || input_bname.value == null ){
				alert('가격은 필수 입력입니다.');
				input_loc.focus();
				return false;
			}
			if(input_genrno.value.trim() == '' || input_bname.value == null ){
				alert('분류는 필수 입력입니다.');
				input_loc.focus();
				return false;
			}
			
			//검증 모두 통과
			//저장하는 단계 진행!
			frm_book.submit();
			
		});	
		
	</script>

</body>
</html>