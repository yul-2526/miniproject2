package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.MemberBean;

public class MemberDao {
	public static MemberDao instance;
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	private MemberDao(){
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//생성자
	
	public static MemberDao getInstance() {
		if(instance==null) {
			instance=new MemberDao();
		}
		return instance;
	}//getInstance
	
	public MemberBean getmemberInfo(String id, String password) {
		MemberBean mb=null;
		String sql="select * from member where id=? and password=?";
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				mb=new MemberBean();
				
				mb.setNum(rs.getInt("num"));
				mb.setName(rs.getString("name"));
				mb.setId(rs.getString("id"));
				mb.setPassword(rs.getString("password"));
				mb.setAddress(rs.getString("address"));
				mb.setEmail(rs.getString("email"));
				mb.setHp1(rs.getString("hp1"));
				mb.setHp2(rs.getString("hp2"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mb;
	}//getmemberInfo
	
	public int insertMember(MemberBean mb){
		
		System.out.println(mb.getName());
		System.out.println(mb.getId());
		
        int cnt = -1;
		String sql = "insert into member(num,name,id,password,address,"
				+ "email,hp1,hp2)"
				+ "values(memseq .nextval,?,?,?,?,?,?,?)";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mb.getName());
			ps.setString(2, mb.getId());
			ps.setString(3, mb.getPassword());
			ps.setString(4, mb.getAddress());
			ps.setString(5, mb.getEmail());
			ps.setString(6, mb.getHp1());
			ps.setString(7, mb.getHp2());
			
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {

			}
		}
		return cnt;

	}//insertMember
	
	public boolean searchId(String id) {

		boolean flag = false;

		try {
			String sql = "select * from member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next())
				flag = true;

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;

	}//searchId
	
	public String getMemberByNameEmail(String name, String email) {
		String sql="select id from member where name=? and email=?";
		String id=null;
		
		try {
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, name);
			ps.setString(2, email);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				id=rs.getString("id");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return id;
	}//getMemberByNameEmail
	
	public String getMemberByIdNameHp(String id, String name, String hp1, String hp2) {
		String sql="select password from member where id=? and name=? and hp1=? and hp2=?";
		String pw=null;
		
		try {
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, hp1);
			ps.setString(4, hp2);
			
			rs=ps.executeQuery();
			
			while(rs.next()){
				pw=rs.getString("password");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				rs.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return pw;
	}//getMemberByIdNameHp
	
	public ArrayList<MemberBean> getAllMember() {
		ArrayList<MemberBean> list=new ArrayList<MemberBean>();
		String sql="select * from member order by num";
		
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				MemberBean mb=new MemberBean();
				
				mb.setNum(rs.getInt("num"));
				mb.setName(rs.getString("name"));
				mb.setId(rs.getString("id"));
				mb.setPassword(rs.getString("password"));
				mb.setAddress(rs.getString("address"));
				mb.setEmail(rs.getString("email"));
				mb.setHp1(rs.getString("hp1"));
				mb.setHp2(rs.getString("hp2"));
				
				list.add(mb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}//getAllMember
	
	public int memDelete(String num) {
		String sql = "delete from member where num=?";
		int cnt=-1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,num);
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
	}//memDelete
	
	public MemberBean selectById(String id) {
		MemberBean mb=new MemberBean();
		String sql="select * from member where id=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				mb.setNum(rs.getInt("num"));
				mb.setName(rs.getString("name"));
				mb.setId(rs.getString("id"));
				mb.setPassword(rs.getString("password"));
				mb.setAddress(rs.getString("address"));
				mb.setEmail(rs.getString("email"));
				mb.setHp1(rs.getString("hp1"));
				mb.setHp2(rs.getString("hp2"));
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
		return mb;
	}//selectById
	
	public int updateMember(String id,String name,String password,String address,String email,String hp1,String hp2) {

		String sql="update member set name=?, password=?, address=?, email=?, hp1=?, hp2=? where id=?";
		int cnt=-1;
		
		try {
			ps=conn.prepareStatement(sql);
			
			ps.setString(1,name);
			ps.setString(2,password);
			ps.setString(3, address);
			ps.setString(4, email);
			ps.setString(5,hp1);
			ps.setString(6, hp2);
			ps.setString(7, id);
			
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
	}//updateMember
}
