//로그아웃	
function logout(){
	location.href="logout_action.jsp";
}


//알림메세지	
function msg(){	//알림메세지 모달창 열기
	document.querySelector('.msg_page').style.display ='block';
}

function closeMsg(){ //알림메세지 모달창 닫기
	document.querySelector('.msg_page').style.display ='none';
}
function sendMsg(){ //알림메세지 전송
	document.querySelector('.msg_page').style.display ='none';
}


//회원추가	
function openAdd(){ //회원추가 모달창 열기
	document.querySelector('.add_page').style.display ='block';
}

function closeAdd(){ //회원추가 모달창 닫기
	document.querySelector('.add_page').style.display ='none';
}

function add(){ //회원추가
	document.querySelector('.add_page').style.display ='none';
}


//회원알림
function openSelect(){ //회원추가 모달창 열기
	document.querySelector('.select_page').style.display ='block';
}

function closeSelect(){ //회원추가 모달창 닫기
	document.querySelector('.select_page').style.display ='none';
}


//대여추가	
function openRt(){ //대여추가 모달창 열기
	document.querySelector('.rt_page').style.display ='block';
	
	//책 아이디의 innerText를 전달받아서 변수에 저장 
	let b_id = document.querySelector('#b-id').innerText;
	document.querySelector('#book-id').innerText = b_id;
	
	//책 이름의 innerText를 전달받아서 변수에 저장 
	let b_name = document.querySelector('#b-name').innerText;
	document.querySelector('#book-name').innerText = b_name;
	
	//책아이디와 회원번호를 폼으로 날리기 위해서 새로만든 hidden타입의 hiddenId의 value값을 b_id로 설정
	document.querySelector('#book-hiddenId').value = b_id;
	console.log(document.querySelector('#book-hiddenId').value);
}

function closeRt(){ //대여추가 모달창 닫기
	document.querySelector('.rt_page').style.display ='none';
}

function rt(){ //대여내역 추가
	document.querySelector('.rt_page').style.display ='none';
	
	
}


