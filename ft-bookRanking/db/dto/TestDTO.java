package db.dto;

public class TestDTO {
	// 필드
	int mno;
	String mname;
	String mid;
	String mpw;
	String mbirth;
	
	// 생성자
	public TestDTO(int mno, String mname, String mid, String mpw, String mbirth) {
		super();
		this.mno = mno;
		this.mname = mname;
		this.mid = mid;
		this.mpw = mpw;
		this.mbirth = mbirth;
	}
	
	public TestDTO(String mid, String mpw) {
		super();
		this.mid = mid;
		this.mpw = mpw;
	}
	
	public TestDTO() {
		
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

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}	
	
}
