package db.dto;


public class MemberDTO {
	// 필드
	int membno;
	String mname;
	String maddress;
	String mphone;
	String mstatusId;
	
	
	public MemberDTO(int membno, String mname, String maddress, String mphone, String mstatusId) {
		this.membno = membno;
		this.mname = mname;
		this.maddress = maddress;
		this.mphone = mphone;
		this.mstatusId = mstatusId;
	}


	public int getMembno() {
		return membno;
	}


	public void setMembno(int membno) {
		this.membno = membno;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getMaddress() {
		return maddress;
	}


	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}


	public String getMphone() {
		return mphone;
	}


	public void setMphone(String mphone) {
		this.mphone = mphone;
	}


	public String getMstatusId() {
		return mstatusId;
	}


	public void setMstatusId(String mstatusId) {
		this.mstatusId = mstatusId;
	}
	
	
	
	
}
	
	
	