package db.dto;

public class MemberinfoDTO {
	
	int membno;
	String mname;
	String maddress;
	String mphone;
	String mstatus_id;
	
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
	public String getMstatus_id() {
		return mstatus_id;
	}
	public void setMstatus_id(String mstatus_id) {
		this.mstatus_id = mstatus_id;
	}
	public MemberinfoDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberinfoDTO(int membno, String mname, String maddress, String mphone, String mstatus_id) {
		super();
		this.membno = membno;
		this.mname = mname;
		this.maddress = maddress;
		this.mphone = mphone;
		this.mstatus_id = mstatus_id;
	}
	
	
	
}
