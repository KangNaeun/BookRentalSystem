package db.dto;

public class MemberDTO {

	int mno;
	String mname;
	String mid;
	String mpw;
	String mphone;

	// 생성자
	
	public MemberDTO() {}
	
	public MemberDTO(int mno, String mname, String mid, String mpw, String mphone) {
		super();
		this.mno = mno;
		this.mname = mname;
		this.mid = mid;
		this.mpw = mpw;
		this.mphone = mphone;
	}

	// Getter, Setter
	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

}
