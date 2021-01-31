package book.model;


public class BookVO {
//
//	BISBN             VARCHAR2(10)   
//	BCATEGORYID       VARCHAR2(10)   
//	BTITLE            VARCHAR2(500)  
//	BAUTHOR           VARCHAR2(400)  
//	BDISCRIPTION      VARCHAR2(1800) 
//	BCOVER            VARCHAR2(300)  
//	BPRICESTANDARD    NUMBER(6)      
//	BPRICESALES       NUMBER(6)      
//	BPUBLISHER        VARCHAR2(100)  
//	BPUBDATE          VARCHAR2(10)   
//	BSTOCK            NUMBER(3)      
//	BBEST             NUMBER(1)      
//	BNEW              NUMBER(1)      
//	BBLOG             NUMBER(1)      
//	BCATEGORY         NUMBER(1)     
	
	private String BISBN;
	private String bcategoryid;
	private String btitle;
	private String bauthor;
	private String bdiscription;
	private String bcover;
	private int bpriceStandard;
	private int bpricesales;
	private String bpublisher;
	private String bpubDate;
	private int bstock;
	private int bbest;
	private int bnew;
	private int bblog;
	private int bcategory;
	private int bno;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBISBN() {
		return BISBN;
	}
	public void setBISBN(String bISBN) {
		BISBN = bISBN;
	}
	public String getBcategoryid() {
		return bcategoryid;
	}
	public void setBcategoryid(String bcategoryid) {
		this.bcategoryid = bcategoryid;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBauthor() {
		return bauthor;
	}
	public void setBauthor(String bauthor) {
		this.bauthor = bauthor;
	}
	public String getBdiscription() {
		return bdiscription;
	}
	public void setBdiscription(String bdiscription) {
		this.bdiscription = bdiscription;
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
	public String getBpublisher() {
		return bpublisher;
	}
	public void setBpublisher(String bpublisher) {
		this.bpublisher = bpublisher;
	}
	public String getBpubDate() {
		return bpubDate;
	}
	public void setBpubDate(String bpubDate) {
		this.bpubDate = bpubDate;
	}
	public int getBstock() {
		return bstock;
	}
	public void setBstock(int bstock) {
		this.bstock = bstock;
	}
	public int getBbest() {
		return bbest;
	}
	public void setBbest(int bbest) {
		this.bbest = bbest;
	}
	public int getBnew() {
		return bnew;
	}
	public void setBnew(int bnew) {
		this.bnew = bnew;
	}
	public int getBblog() {
		return bblog;
	}
	public void setBblog(int bblog) {
		this.bblog = bblog;
	}
	public int getBcategory() {
		return bcategory;
	}
	public void setBcategory(int bcategory) {
		this.bcategory = bcategory;
	}
	
	
	

	

}
