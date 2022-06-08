package order;

import java.util.Vector;

import mall.ProductBean;
import mall.ProductDao;

public class CartBean {  
	private Vector<ProductBean> clist;
	
	public CartBean() {
		clist = new Vector<ProductBean>(); 
 	}
	public void addProduct(String pnum,String oqty){ 
		
		ProductDao pdao=ProductDao.getInstance();
		ProductBean pb=pdao.selectByPnum(pnum); 
 		
		int pnum_new = Integer.parseInt(pnum);
		int oqty_new = Integer.parseInt(oqty);
		 
		for(int i=0;i<clist.size();i++) { 
			int cPnum = clist.get(i).getPnum();  
			if(cPnum == pnum_new) {  
				int cPqty = clist.get(i).getPqty(); 
				clist.get(i).setPqty(cPqty+oqty_new); 
				clist.get(i).setTotolPrice( clist.get(i).getPrice() * (cPqty+oqty_new)   );
				clist.get(i).setTotolPoint( clist.get(i).getPmile() * (cPqty+oqty_new)  );
				
				return;  
			}
		}//for
		
 		pb.setPqty(oqty_new); 
 		int totalPrice = oqty_new * pb.getPrice(); 
		int totalPoint = oqty_new * pb.getPmile(); 
		
		pb.setTotolPrice(totalPrice);
		pb.setTotolPoint(totalPoint);
 		
		clist.add(pb); 
		
	}//addProduct
	
	public Vector<ProductBean> getAllProducts(){
		
		return clist;
	}//getAllProducts
	
	public void setEdit(String pnum,String oqty){ 
		int pnum_new = Integer.parseInt(pnum);
		int oqty_new = Integer.parseInt(oqty);
		
		for(ProductBean pb : clist) { 
			if(pb.getPnum() == pnum_new) {  
				pb.setPqty(oqty_new);
				
				pb.setTotolPrice(pb.getPqty() * pb.getPrice());
				pb.setTotolPoint(oqty_new * pb.getPmile());
			}
		}
		
	}//setEdit
	
	public void removeProduct(String pnum){ 
		int pnum_new = Integer.parseInt(pnum);
		for( ProductBean pb : clist) {
			if(pnum_new == pb.getPnum()) { 
				clist.removeElement(pb); 
				break;
			}
		}
	}//removeProduct
	
	public void removeAllProduct(){
		clist.removeAllElements();  
	}//removeAllProduct
	
}