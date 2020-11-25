package Withdraw.model;


import java.sql.Date;

public class WithdrawVO {
	private int wno;
	private String mid;
	private String wrer;
	private Date wred;
	private char wacd;
	
	public int getWno() {
		return wno;
	}
	public void setWno(int wno) {
		this.wno = wno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getWrer() {
		return wrer;
	}
	public void setWrer(String wrer) {
		this.wrer = wrer;
	}
	public Date getWred() {
		return wred;
	}
	public void setWred(Date wred) {
		this.wred = wred;
	}
	public char getWacd() {
		return wacd;
	}
	public void setWacd(char wacd) {
		this.wacd = wacd;
	}
}
