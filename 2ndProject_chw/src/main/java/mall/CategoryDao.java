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

public class CategoryDao{
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static CategoryDao instance;	
	
	public static CategoryDao getInstance() {
		if(instance == null) {
			instance = new CategoryDao();
		}
		return instance;
	}

	private CategoryDao(){
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

	}// 생성자

	public int insertCatogory(CategoryBean bean){
		String sql="insert into category(cnum,code,cname) values(seqcate.nextval,?,?)";
		int cnt=-1;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, bean.getCode());
			ps.setString(2, bean.getCname());
			cnt=ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return cnt;

	}//insertCatogory
	
	public ArrayList<CategoryBean> categoryAll(){
		String sql="select * from category order by cnum";
		ArrayList<CategoryBean> list = new ArrayList<CategoryBean>();
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				CategoryBean cb = new CategoryBean();
				int cnum=rs.getInt("cnum");
				String code=rs.getString("code");
				String cname=rs.getString("cname");
				
				cb.setCnum(cnum);
				cb.setCode(code);
				cb.setCname(cname);
				list.add(cb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(rs!=null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;

	}//categoryAll
	
	public int categoryDelete(String cnum ){
		String sql = "delete from category where cnum=?";
		int cnt=-1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,cnum);
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return cnt;
	}//categoryDelete
}



