
function btnClick() {
    const mydiv = document.getElementById('bookadd');
    if (mydiv.style.display === 'none') {
        mydiv.style.display = 'block';
    } else {
        mydiv.style.display = 'none';
    }
}

const frm_book = document.querySelector('#frm_book');		
frm_book.addEventListener('submit', (e)=>{
    e.preventDefault();	//기본 이벤트 중지. submit 폼 전송 막기!
        
    let input_bname = document.querySelector('#input_bname');
    let input_bauthor = document.querySelector('#input_bauthor');
    let input_bpublish = document.querySelector('#input_bpublish');
    let input_bprice = document.getElementById('input_bprice');
    let input_genrno = document.getElementById('input_genrno');
    let input_bdate = document.querySelector('#input_bdate');
    let input_bcount = document.querySelector('#input_bcount');

    input_bname.value = input_bname.value.trim();
    input_bauthor.value = input_bauthor.value.trim();
    input_bpublish.value = input_bpublish.value.trim();
    input_bprice.value = input_bprice.value.trim();
    input_genrno.value = input_genrno.value.trim();
    input_bdate.value = input_bdate.value.trim();
    input_bcount.value = input_bcount.value.trim();
    
    if(input_bname.value.trim() == '' || input_bname.value == null ){	//.trim() -> 띄어쓰기 빈칸이 있는지 확인!
        alert('책 이름은 필수 입력입니다.');
        input_bname.focus();
        return false;
    }
    if(input_bauthor.value.trim() == '' || input_bname.value == null ){
        alert('저자는 필수 입력입니다.');
        input_bauthor.focus();
        return false;
    }
    if(input_bpublish.value.trim() == '' || input_bname.value == null ){
        alert('출판사는 필수 입력입니다.');
        input_bpublish.focus();
        return false;
    }
    if(input_bprice.value.trim() == '' || input_bname.value == null ){
        alert('가격은 필수 입력입니다.');
        input_bprice.focus();
        return false;
    }
    if(input_genrno.value.trim() == '' || input_bname.value == null ){
        alert('분류이름은 필수 입력입니다.');
        input_genrno.focus();
        return false;
    }
    if(input_bdate.value.trim() == '' || input_bname.value == null ){
        alert('날짜는 필수 입력입니다.');
        input_bdate.focus();
        return false;
    }
    if(input_bcount.value.trim() == '' || input_bname.value == null ){
        alert('수량은 필수 입력입니다.');
        input_bcount.focus();
        return false;
    }
    
    //검증 모두 통과
    //저장하는 단계 진행!
    frm_book.submit();
    
});	


function bookqClick() {
    const mydiv = document.getElementById('bookq');
    if (mydiv.style.display === 'none') {
        mydiv.style.display = 'block';
    } else {
        mydiv.style.display = 'none';
    }
}

function employeeClick() {
	    const mydiv = document.getElementById('employee');
    if (mydiv.style.display === 'none') {
        mydiv.style.display = 'block';
    } else {
        mydiv.style.display = 'none';
    }
}

function communityClick() {
	    const mydiv = document.getElementById('community');
    if (mydiv.style.display === 'none') {
        mydiv.style.display = 'block';
    } else {
        mydiv.style.display = 'none';
    }
}




