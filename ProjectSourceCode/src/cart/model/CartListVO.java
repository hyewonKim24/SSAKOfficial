package cart.model;


public class CartListVO {
	//cart
	private int cno;
	private String mid;
	private int dno;
	private String bisbn;
	private int oamount;	
	//book
	private String btitle;
	private String bcover;
	private int bpricestandard;
	private int bpricesales;
	//bookcover
	private String ddesc;
	private String dimg;
	private int dprice;

	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getBisbn() {
		return bisbn;
	}
	public void setBisbn(String bisbn) {
		this.bisbn = bisbn;
	}
	public int getOamount() {
		return oamount;
	}
	public void setOamount(int oamount) {
		this.oamount = oamount;
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
	public int getBpricestandard() {
		return bpricestandard;
	}
	public void setBpricestandard(int bpricestandard) {
		this.bpricestandard = bpricestandard;
	}
	public int getBpricesales() {
		return bpricesales;
	}
	public void setBpricesales(int bpricesales) {
		this.bpricesales = bpricesales;
	}
	
	public String getDdesc() {
		return ddesc;
	}
	public void setDdesc(String ddesc) {
		this.ddesc = ddesc;
	}
	public String getDimg() {
		return dimg;
	}
	public void setDimg(String dimg) {
		this.dimg = dimg;
	}
	public int getDprice() {
		return dprice;
	}
	public void setDprice(int dprice) {
		this.dprice = dprice;
	}

	
	
	
	
	
}
