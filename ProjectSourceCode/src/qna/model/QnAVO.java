package qna.model;

import java.util.Date;

public class QnAVO { 
//	QNO        NOT NULL NUMBER(10)     
//	MID                 VARCHAR2(30)   
//	QTITLE              VARCHAR2(120)  
//	QDATE               DATE           
//	QCONTENT            VARCHAR2(1800) 
//	QREF                NUMBER(10)     
//	QREF_STEP           NUMBER(3)      
//	QREF_LEVEL          NUMBER(3)      
//	QVIEW               NUMBER         
//	QTYPE               VARCHAR2(30)  
	
	private int qno;
	private String mid;
	private String qtitle;
	private Date qdate;
	private String qcontent;
	private int qref;
	private int qref_step;
	private int qref_level;
	private int qview;
	private String qtype;
	private int qcount;
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public Date getQdate() {
		return qdate;
	}
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public int getQref() {
		return qref;
	}
	public void setQref(int qref) {
		this.qref = qref;
	}
	public int getQref_step() {
		return qref_step;
	}
	public void setQref_step(int qref_step) {
		this.qref_step = qref_step;
	}
	public int getQref_level() {
		return qref_level;
	}
	public void setQref_level(int qref_level) {
		this.qref_level = qref_level;
	}
	public int getQview() {
		return qview;
	}
	public void setQview(int qview) {
		this.qview = qview;
	}
	public String getQtype() {
		return qtype;
	}
	public void setQtype(String qtype) {
		this.qtype = qtype;
	}
	public int getQcount() {
		return qcount;
	}
	public void setQcount(int qcount) {
		this.qcount = qcount;
	}
}
