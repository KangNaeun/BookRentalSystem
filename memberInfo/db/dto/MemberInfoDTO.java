package db.dto;

public class MemberInfoDTO {
	// 필드
	int membno;
	String mname;
	String maddress;
	String mphone;
	String mstatus;
	
	// 생성자
	public MemberInfoDTO() {
		super();
	}

	// Getter, Setter
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

	public String getMstatus() {
		return mstatus;
	}

	public void setMstatus(String mstatus) {
		this.mstatus = mstatus;
	}


}