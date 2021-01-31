package order.model;


import java.util.Date;

public class orderVO {
	private int ono;
	private String mid;
	private Date odate;
	private int odprice;
	private int ototalprice;
	private int osalesprice;
	private String oname;
	private String ophone;
	private String oaddr1;
	private String oaddr2;
	private String oaddr3;
	private String omemo;
	private String opay;
	private int oamount;
	private int ototalamount;
	private String ostatus;
	private int dno;
	private String BISBN;
	private String btitle;
	private String bcover;
	private int bpriceStandard;
	private int bpricesales;
	
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public Date getOdate() {
		return odate;
	}
	public void setOdate(Date odate) {
		this.odate = odate;
	}
	public int getOdprice() {
		return odprice;
	}
	public void setOdprice(int odprice) {
		this.odprice = odprice;
	}
	public int getOtotalprice() {
		return ototalprice;
	}
	public void setOtotalprice(int ototalprice) {
		this.ototalprice = ototalprice;
	}
	public int getOsalesprice() {
		return osalesprice;
	}
	public void setOsalesprice(int osalesprice) {
		this.osalesprice = osalesprice;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getOphone() {
		return ophone;
	}
	public void setOphone(String ophone) {
		this.ophone = ophone;
	}
	public String getOaddr1() {
		return oaddr1;
	}
	public void setOaddr1(String oaddr1) {
		this.oaddr1 = oaddr1;
	}
	public String getOaddr2() {
		return oaddr2;
	}
	public void setOaddr2(String oaddr2) {
		this.oaddr2 = oaddr2;
	}
	public String getOaddr3() {
		return oaddr3;
	}
	public void setOaddr3(String oaddr3) {
		this.oaddr3 = oaddr3;
	}
	public String getOmemo() {
		return omemo;
	}
	public void setOmemo(String omemo) {
		this.omemo = omemo;
	}
	public String getOpay() {
		return opay;
	}
	public void setOpay(String opay) {
		this.opay = opay;
	}
	public int getOamount() {
		return oamount;
	}
	public void setOamount(int oamount) {
		this.oamount = oamount;
	}
	
	public int getOtotalamount() {
		return ototalamount;
	}
	public void setOtotalamount(int ototalamount) {
		this.ototalamount = ototalamount;
	}
	public String getOstatus() {
		return ostatus;
	}
	public void setOstatus(String ostatus) {
		this.ostatus = ostatus;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getBISBN() {
		return BISBN;
	}
	public void setBISBN(String bISBN) {
		BISBN = bISBN;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcover() {
		return bcover;
	}
	public void setBcover(String bcover) {
		this.bcover = bcover;
	}
	public int getBpriceStandard() {
		return bpriceStandard;
	}
	public void setBpriceStandard(int bpriceStandard) {
		this.bpriceStandard = bpriceStandard;
	}
	public int getBpricesales() {
		return bpricesales;
	}
	public void setBpricesales(int bpricesales) {
		this.bpricesales = bpricesales;
	}
	
	
}
