package db.dto;


public class MemberDTO {
	// 필드
	int membno;
	String mname;
	String maddress;
	String mphone;
	String mstatusId;
	
	int rentalno;
	//회원명
	String bookName;
	
	String rDate;
	String rtDate; 
	String odDate; 
	String stDate; 
	String coDate; 
	
	String rStatus; 
	
	
	
	
	
	
	
	
	
	public MemberDTO(int rentalno, String mname,  String bookName, String rDate, String rtDate, String odDate,
			String stDate, String coDate, String rStatus) {
		
		this.mname = mname;
		this.rentalno = rentalno;
		this.bookName = bookName;
		
		this.rDate = rDate;
		this.rtDate = rtDate;
		this.odDate = odDate;
		
		this.stDate = stDate;
		this.coDate = coDate;
		this.rStatus = rStatus;
	}


	public String getrDate() {
		return rDate;
	}


	public void setrDate(String rDate) {
		this.rDate = rDate;
	}


	
	
	
	
	
	public int getRentalno() {
		return rentalno;
	}


	public void setRentalno(int rentalno) {
		this.rentalno = rentalno;
	}


	public String getBookName() {
		return bookName;
	}


	public void setBookName(String bookName) {
		this.bookName = bookName;
	}


	public String getRtDate() {
		return rtDate;
	}


	public void setRtDate(String rtDate) {
		this.rtDate = rtDate;
	}


	public String getOdDate() {
		return odDate;
	}


	public void setOdDate(String odDate) {
		this.odDate = odDate;
	}


	public String getStDate() {
		return stDate;
	}


	public void setStDate(String stDate) {
		this.stDate = stDate;
	}


	public String getCoDate() {
		return coDate;
	}


	public void setCoDate(String coDate) {
		this.coDate = coDate;
	}


	public String getrStatus() {
		return rStatus;
	}


	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}


	


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
	
	
	