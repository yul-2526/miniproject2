package mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;

import mall.ProductBean;

public class ProductDao {
public static ProductDao instance;
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private ProductDao(){
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("conn:" + conn);
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//생성자
	
	public static ProductDao getInstance() {
		if(instance==null) {
			instance=new ProductDao();
		}
		return instance;
	}//getInstance
	
	public int insertProduct(MultipartRequest mr){
		int cnt=-1;
		String sql="insert into product(pnum, pname, pcate, price, pimage, "
				+ "pmile, pqty, pinfo) values(seqprod.nextval,?,?,?,?,?,?,?)";

		try {
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, mr.getParameter("pname"));
			String pcate = mr.getParameter("pcate");
			pcate += mr.getParameter("pcode");
			ps.setString(2, pcate);
			ps.setInt(3, Integer.parseInt(mr.getParameter("price")));
			ps.setString(4, mr.getFilesystemName("pimage"));
			ps.setInt(5, Integer.parseInt(mr.getParameter("pmile")));
			ps.setInt(6, Integer.parseInt(mr.getParameter("pqty")));
			ps.setString(7, mr.getParameter("pinfo"));

			cnt = ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
			} catch (SQLException e) {
				System.out.println("insertProduct close 실패");
			}
		}

		return cnt;

	}//insertProduct
	
	public ArrayList<ProductBean> productAll() {
		ArrayList<ProductBean> list=new ArrayList<ProductBean>();
		String sql="select * from product order by pnum";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				ProductBean pb=new ProductBean();
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setPcate(rs.getString("pcate"));
				pb.setPrice(rs.getInt("price"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPmile(rs.getInt("pmile"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPinfo(rs.getString("pinfo"));
				
				list.add(pb);				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(ps!=null) {
					ps.close();
				}
			} catch (SQLException e) {
				
			}
		}		
		return list;

	}//productAll
	
	public ProductBean selectByPnum(String pnum) {
		ProductBean pb=new ProductBean();
		String sql="select * from product where pnum=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(pnum));
			rs=ps.executeQuery();
			
			if(rs.next()) {
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setPcate(rs.getString("pcate"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPinfo(rs.getString("pinfo"));
				pb.setPmile(rs.getInt("pmile"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(ps!=null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}			
		return pb;

	}//selectByPnum
	
	public int updateProduct(MultipartRequest mr){
		int cnt=-1;
		String sql="update product set pname=?, price=?, pimage=?, pmile=?, pqty=?, pinfo=? where pnum=?";
		try {
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, mr.getParameter("pname"));
			ps.setInt(2, Integer.parseInt(mr.getParameter("price")));

			String pimage2 = mr.getParameter("pimage2");  
			String pimage = mr.getFilesystemName("pimage"); 
			if(pimage == null) { 
				pimage = pimage2;  
			}
			
			ps.setString(3, pimage);  
			ps.setInt(4, Integer.parseInt(mr.getParameter("pmile")));
			ps.setInt(5, Integer.parseInt(mr.getParameter("pqty")));
			ps.setString(6, mr.getParameter("pinfo"));
			ps.setInt(7, Integer.parseInt(mr.getParameter("pnum")));
			
			cnt=ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {

				if(ps!=null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}				
		return cnt;

	}//updateProduct
	
	public int deleteProduct(String pnum){
		int cnt=-1;
		String sql="delete from product where pnum=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(pnum));
			cnt=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}				
		return cnt;

	}//deleteProduct
	
	public ArrayList<ProductBean> productAllNew() {
		ArrayList<ProductBean> list=new ArrayList<ProductBean>();
		String sql="select * from product order by pnum desc";
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				ProductBean pb=new ProductBean();
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setPcate(rs.getString("pcate"));
				pb.setPrice(rs.getInt("price"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPmile(rs.getInt("pmile"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPinfo(rs.getString("pinfo"));
				
				list.add(pb);				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(ps!=null) {
					ps.close();
				}
			} catch (SQLException e) {
				
			}
		}		
		return list;

	}//productAllNew
	
	public ArrayList<ProductBean> selectByCategory(String code){
		
		ArrayList<ProductBean> lists= new ArrayList<ProductBean>();
		String sql="select * from product where pcate like ? order by pnum";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, code+"%"); // child%
			
			rs=ps.executeQuery();
			while(rs.next()) {
				ProductBean pb=new ProductBean();
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setPcate(rs.getString("pcate"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPinfo(rs.getString("pinfo"));
				pb.setPmile(rs.getInt("pmile"));
				lists.add(pb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(ps!=null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return lists;

	}//selectByCategory
}
