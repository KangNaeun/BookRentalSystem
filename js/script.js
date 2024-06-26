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

    input_bname.value = input_bname.value.trim();
    input_bauthor.value = input_bauthor.value.trim();
    input_bpublish.value = input_bpublish.value.trim();
    input_bprice.value = input_bprice.value.trim();
    input_genrno.value = input_genrno.value.trim();
    input_bdate.value = input_bdate.value.trim();
    
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
        alert('분류번호는 필수 입력입니다.');
        input_loc.focus();
        return false;
    }
    if(input_bdate.value.trim() == '' || input_bname.value == null ){
        alert('분류번호는 필수 입력입니다.');
        input_loc.focus();
        return false;
    }
    
    //검증 모두 통과
    //저장하는 단계 진행!
    frm_book.submit();
    
});	


