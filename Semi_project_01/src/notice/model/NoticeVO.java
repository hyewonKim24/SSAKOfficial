package notice.model;


import java.util.Date;

public class NoticeVO {
//	NNO      NOT NULL NUMBER(10)     
//	MID      NOT NULL VARCHAR2(30)   
//	NTITLE   NOT NULL VARCHAR2(120)  
//	NDATE             DATE           
//	NCONTENT NOT NULL VARCHAR2(4000) 
//	NVIEW    NOT NULL NUMBER  
	
	private int nno;
	private String mid;
	private String ntitle;
	private Date ndate;
	private String ncontent;
	private int nview;
	private int ncount;
	
	public int getNcount() {
		return ncount;
	}
	public void setNcount(int ncount) {
		this.ncount = ncount;
	}
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public Date getNdate() {
		return ndate;
	}
	public void setNdate(Date ndate) {
		this.ndate = ndate;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public int getNview() {
		return nview;
	}
	public void setNview(int nview) {
		this.nview = nview;
	}
}
