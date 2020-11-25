package member.model;


import java.sql.Date;

//MID           NOT NULL VARCHAR2(30)  
//MPW           NOT NULL VARCHAR2(20)  
//MNAME         NOT NULL VARCHAR2(20)  
//MEMAIL        NOT NULL VARCHAR2(50)  
//MPHONE        NOT NULL VARCHAR2(20)  
//MZIP_CODE              VARCHAR2(10)  
//M_FIRST_ADDR           VARCHAR2(120) 
//M_SECOND_ADDR          VARCHAR2(90)  
//MDATE                  DATE          
//MBIRTHDAY     NOT NULL NUMBER(8)     
//MGENDER       NOT NULL VARCHAR2(1)   
//AUTHORITY     NOT NULL NUMBER(1)  


public class memberVO {
	private int mno;
	private String mid;
	private String mpw;
	private String mname;
	private String memail;
	private String mphone;
	private String mzip_code;
	private String m_first_addr;
	private String m_second_addr;
	private Date mdate;
	private int authority;
	private int mbirthday;
	private int mgender;
	private int login_type;
	
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
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMphone() {
		return mphone;
	}
	public void setMphone(String mphone) {
		this.mphone = mphone;
	}
	public String getMzip_code() {
		return mzip_code;
	}
	public void setMzip_code(String mzip_code) {
		this.mzip_code = mzip_code;
	}
	public String getM_first_addr() {
		return m_first_addr;
	}
	public void setM_first_addr(String m_first_addr) {
		this.m_first_addr = m_first_addr;
	}
	public String getM_second_addr() {
		return m_second_addr;
	}
	public void setM_second_addr(String m_second_addr) {
		this.m_second_addr = m_second_addr;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	public int getAuthority() {
		return authority;
	}
	public void setAuthority(int authority) {
		this.authority = authority;
	}
	public int getMbirthday() {
		return mbirthday;
	}
	public void setMbirthday(int mbirthday) {
		this.mbirthday = mbirthday;
	}
	public int getMgender() {
		return mgender;
	}
	public void setMgender(int mgender) {
		this.mgender = mgender;
	}
	public int getLogin_type() {
		return login_type;
	}
	public void setLogin_type(int login_type) {
		this.login_type = login_type;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	
	

}
