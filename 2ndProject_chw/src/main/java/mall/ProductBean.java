package mall;

public class ProductBean {

	private int pnum;
	private String pname;
	private String pcate;
	private int price;
	private String pimage;
	private int pmile;
	private int pqty;
	private String pinfo;
	private int totolPrice;
	private int totolPoint;
	
	public ProductBean(int pnum, String pname, String pcate, String pimage, int pqty, int price,
			String pinfo, int pmile) {
		super();
		this.pnum = pnum;
		this.pname = pname;
		this.pcate = pcate;
		this.pimage = pimage;
		this.pqty = pqty;
		this.price = price;
		this.pinfo = pinfo;
		this.pmile = pmile;
	}
	
	public ProductBean() {
 	}

	public int getTotolPrice() {
		return totolPrice;
	}
	public void setTotolPrice(int totolPrice) {
		this.totolPrice = totolPrice;
	}
	public int getTotolPoint() {
		return totolPoint;
	}
	public void setTotolPoint(int totolPoint) {
		this.totolPoint = totolPoint;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPcate() {
		return pcate;
	}
	public void setPcate(String pcate) {
		this.pcate = pcate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getPmile() {
		return pmile;
	}
	public void setPmile(int pmile) {
		this.pmile = pmile;
	}
	public int getPqty() {
		return pqty;
	}
	public void setPqty(int pqty) {
		this.pqty = pqty;
	}
	public String getPinfo() {
		return pinfo;
	}
	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}
	
}
