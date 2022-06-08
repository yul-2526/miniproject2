package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class BoardDao {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String userid="jspid";
	String pw="jsppw";

	Connection conn= null;
	PreparedStatement ps = null;
	ResultSet rs = null;

 	private static BoardDao instance = null;
	private BoardDao(){ 
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,userid,pw);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("드라이버 로드 실패");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}// 생성자

	public static BoardDao getInstance() {
		if(instance == null) {
			instance = new BoardDao();
		}
		return instance;
	}//getInstance

	public int getArticleCount(){

		String sql = "select count(*) as cnt from board";
		int count = 0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			}catch(SQLException e) {

			}
		}
		return count;
	}//getArticleCount

	public ArrayList<BoardBean> getArticles(int start, int end){  
		String sql = "select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip " ;		        
		sql += "from (select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from (select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip ";
		sql += "from board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";	 	
 		
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("subject"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setReg_date(rs.getTimestamp("reg_date"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("re_step"));
				bean.setRe_level(rs.getInt("re_level"));
				bean.setContent(rs.getString("content"));
				bean.setIp(rs.getString("ip"));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			}catch(SQLException e) {

			}
		}

		return list;
	}//getArticles

	public void insertArticle(BoardBean bean){  

		String sql="insert into board(num,writer,email,subject,passwd,"
				+ "reg_date,readcount,ref,re_step,re_level,content,ip)"
				+ "values(board_seq.nextval,?,?,?,?,?,?, board_seq.currval ,?,?,?,?)";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,bean.getWriter());
			ps.setString(2,bean.getEmail());
			ps.setString(3,bean.getSubject());
			ps.setString(4,bean.getPasswd());
			ps.setTimestamp(5,bean.getReg_date());
			ps.setInt(6,bean.getReadcount());
			ps.setInt(7,0);
			ps.setInt(8,0);
			ps.setString(9,bean.getContent());
			ps.setString(10,bean.getIp());

			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)
					ps.close();
			}catch(SQLException e) {

			}
		}
	}//insertArticle



	public BoardBean getArticle(int num){

		String sql2 = "update board set readcount = readcount+1 where num=?";
		String sql="select * from board where num=?";
		BoardBean bean = null;
		try {

			ps=conn.prepareStatement(sql2);
			ps.setInt(1, num);
			ps.executeUpdate();

			ps=conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();

			while(rs.next()) {

				bean = new BoardBean();

				bean.setNum(rs.getInt("num"));
				bean.setWriter(rs.getString("writer"));
				bean.setEmail(rs.getString("email"));
				bean.setSubject(rs.getString("subject"));
				bean.setPasswd(rs.getString("passwd"));
				bean.setReg_date(rs.getTimestamp("reg_date"));
				bean.setReadcount(rs.getInt("readcount"));
				bean.setRef(rs.getInt("ref"));
				bean.setRe_step(rs.getInt("re_step"));
				bean.setRe_level(rs.getInt("re_level"));
				bean.setContent(rs.getString("content"));
				bean.setIp(rs.getString("ip"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			}catch(SQLException e) {

			}
		}

		return bean;

	}// getArticle

	public BoardBean oneSelect(int num){

		String sql="select * from board where num=?";
		BoardBean bean = null;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();

			while(rs.next()) {

				int num2 = rs.getInt("num");
				String writer = rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String passwd = rs.getString("passwd");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level = rs.getInt("re_level");
				String content = rs.getString("content");
				String ip = rs.getString("ip");

				bean = new BoardBean(num2, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip);

			} 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
			} catch(SQLException e) {
			}
		}

		return bean;
	}//oneSelect


	public int updateArticle(BoardBean bb) {
 		
		String sql2 = "select passwd from board where num=?";
		String sql = "update board set writer=?, subject=?, email=?, content=? where num=?";
		int cnt = -1;
		try { 
			
			ps = conn.prepareStatement(sql2);
			ps.setInt(1, bb.getNum());
			rs = ps.executeQuery();
			if(rs.next()) {
				String dbpw = rs.getString("passwd");
				if(dbpw.equals(bb.getPasswd())) { // DB pw == 입력한 pw
					
					ps = conn.prepareStatement(sql);

					ps.setString(1, bb.getWriter());
					ps.setString(2, bb.getSubject());
					ps.setString(3, bb.getEmail());
					ps.setString(4, bb.getContent());
					ps.setInt(5, bb.getNum());

					cnt = ps.executeUpdate();
				}
				else { 
					
				}
			}

		}catch(SQLException e) {

		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
			} catch(SQLException e) {
				
			}
		}
		return cnt;
	}//updateArticle

	public int deleteArticle(int num,String passwd) {
		int cnt = -1;
		String sql2 = "select passwd from board where num=?";
		String sql = "delete board where num=?";
		
		try {
			ps = conn.prepareStatement(sql2);
			ps.setInt(1,num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				String dbpw = rs.getString("passwd");
				if(dbpw.equals(passwd)) {
					ps = conn.prepareStatement(sql);
					ps.setInt(1,num);
					cnt = ps.executeUpdate();
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;

	}//deleteArticle
	
	public int replyArticle(BoardBean bb){ 
		System.out.println(bb.getRef());
		
		String sql2 = "update board set re_step=re_step+1 where ref=? and re_step>?";
		String sql = "insert into board(num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip)"
				+ " values(board_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
		
		int cnt = -1;
		
		try {
			ps = conn.prepareStatement(sql2);
			ps.setInt(1,bb.getRef());
			ps.setInt(2,bb.getRe_step());
			ps.executeUpdate();
			
			ps = conn.prepareStatement(sql);
			ps.setString(1,bb.getWriter());
			ps.setString(2,bb.getEmail());
			ps.setString(3,bb.getSubject());
			ps.setString(4,bb.getPasswd());
			ps.setTimestamp(5,bb.getReg_date());
			ps.setInt(6,bb.getRef());
			ps.setInt(7,bb.getRe_step()+1);
			ps.setInt(8,bb.getRe_level()+1);
			ps.setString(9,bb.getContent());
			ps.setString(10,bb.getIp());
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null)
					rs.close();
				if(ps != null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cnt;
		
	}//replyArticle
}






