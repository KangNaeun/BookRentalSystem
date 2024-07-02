function openStopCancelList(){
	document.querySelector(".stop-cancel-modal").style.display = 'flex';
}

function closeStopCancelList(){
	document.querySelector(".stop-cancel-modal").style.display = 'none';
}


function convertToStopCancel(i){
	//정지 대여번호
	let st_cancel_rentno = document.querySelector("#st-cancel-rental-no"+i).innerText;
	
	let st_cancel_hidden_input = document.querySelector("#input-st-cancel-rentno");
	st_cancel_hidden_input.value = st_cancel_rentno;
	
	console.log(st_cancel_hidden_input.value);
	
	if(st_cancel_hidden_input.value != null){
		document.querySelector("#frm-stop-cancel").submit();
	} else {
		alert("대여번호가 바르게 전송되지 않았습니다");
	}
}




//연체버튼이 눌리면 대여번호를 가져와서 form 전송
function convertToOverdue(i){
	//연체대여번호
	let od_rentno = document.querySelector("#od-rental-no"+i).innerText;
	
	let od_hidden_input = document.querySelector("#input-od-rentno");
	od_hidden_input.value = od_rentno;
	
	console.log(od_hidden_input.value);
	
	if(od_hidden_input.value != null){
		document.querySelector("#frm-overdue").submit();
	} else {
		alert("대여번호가 바르게 전송되지 않았습니다");
	}
	
}


function openStopList(){
	//정지 현황 모달창 flex
	document.querySelector(".stop-modal").style.display = 'flex';
}

function closeStopList(){
	//정지 현황 모달창 none
	document.querySelector(".stop-modal").style.display = 'none';
}



function convertToStop(i){
	//정지대여번호
	let st_rentno = document.querySelector("#st-rental-no"+i).innerText;
	
	let st_hidden_input = document.querySelector("#input-st-rentno");
	st_hidden_input.value = st_rentno;
	
	console.log(st_hidden_input.value);
	
	if(st_hidden_input.value != null){
		document.querySelector("#frm-stop").submit();
	} else {
		alert("대여번호가 바르게 전송되지 않았습니다");
	}
}









//도서정보에서 대여 버튼을 누르면 모달창이 열리게 함
function openRt(){
      document.querySelector('.rt_page').style.display ='block';
      
      //도서 번호를 가져옴
      let b_id = document.querySelector('#b-id').innerText;
      document.querySelector('#book-id').innerText = b_id;
      
      //도서 번호를 가져옴 회원이름을 가져옴
      let b_name = document.querySelector('#b-name').innerText;
      document.querySelector('#book-name').innerText = b_name;
      
      //hidden 처리된 input창에 도서 번호를 넣음
      document.querySelector('#book-hiddenId').value = b_id;
      console.log(document.querySelector('#book-hiddenId').value);
 }
 
//도서정보에서 열린 모달창이 닫히게 함  
function closeRt(){
      document.querySelector('.rt_page').style.display ='none';
}





//연체조회버튼이 눌리면 modal창을 나오게 하는 함수(아직 구현X)
function openOverdueList(){
	console.log("연체조회 버튼 눌림");
	document.querySelector(".overdue-modal").style.display = 'flex';
}

function closeOverdueList(){
	console.log("연체조회 버튼 눌림");
	document.querySelector(".overdue-modal").style.display = 'none';
}


//회원 대여내역 조회에서 반납버튼을 누르면 hidden된 input창에 대여번호를 담고 form을 날리는 메소드
function openConfirmReturn(i){				
	let return_result = confirm("반납으로 전환하시겠습니까?");
	
	//confirm창에서 관리자가 확인을 누르면(값이 true)					
	if(return_result){
		
		//hidden된 input창에 동적할당된 id값을 가지고 있는 tr의 대여번호를 담음				
		let return_no = document.querySelector("#returnNoInput");
		return_no.value = document.querySelector("#membRentalNO"+i).innerText;
					
		console.log(return_no.value);
		
		//대여 번호를 잘 가져왔으면 form 전송				
		if(return_no != null ){
			document.getElementById("frm-return").submit();
		} else {
			alert("도서번호와 회원 정보가 제대로 전송되지 않았습니다.");
		}
						
						
	} else { //confirm창에서 취소를 누르면
		alert("반납이 취소되었습니다");
	}
					
}


