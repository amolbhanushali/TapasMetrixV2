package com.bean;
import java.util.Date;

public class HistoryColumnBean {

	private String column1;	// name
	private String column2;	// team
	private String column3; // product
	private String column4; // activity
	private int column5;	// count activity
	private String column6; // month
	private String column7; // comment
	private Date column8;	// date

	public String getColumn1() {
		
		/*HttpSession session2 = request.getSession();
		UserMaster userMaster = Utility.getUserMaster(session2);
		String capitalUserName = userMaster.getFirstName().substring(0, 1).toUpperCase() + userMaster.getFirstName().substring(1);
		column1 = capitalUserName;*/
		return column1;
	}
	public void setColumn1(String column1) {
		this.column1 = column1;
	}
	public String getColumn2() {
		return column2;
	}
	public void setColumn2(String column2) {
		this.column2 = column2;
	}
	public String getColumn3() {
		return column3;
	}
	public void setColumn3(String column3) {
		this.column3 = column3;
	}
	public String getColumn4() {
		return column4;
	}
	public void setColumn4(String column4) {
		this.column4 = column4;
	}
	public int getColumn5() {
		return column5;
	}
	public void setColumn5(int column5) {
		this.column5 = column5;
	}
	public String getColumn6() {
		return column6;
	}
	public void setColumn6(String column6) {
		this.column6 = column6;
	}
	public String getColumn7() {
		return column7;
	}
	public void setColumn7(String column7) {
		this.column7 = column7;
	}
	public Date getColumn8() {
		return column8;
	}
	public void setColumn8(Date column8) {
		this.column8 = column8;
	}
}
