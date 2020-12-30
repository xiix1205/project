package sign;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;
import static db.JdbcUtil.*;

public class MemberDAO {
	
	DBConnectionMgr pool;
	public MemberDAO(){
		try {
			pool = DBConnectionMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연결 실패");
		}
	}
	
	DataSource ds;
	Connection conn;
	

	   
	private static MemberDAO memberDAO;
	   
	public static MemberDAO getInstance() {
		 if(memberDAO == null){
			 memberDAO = new MemberDAO();
	      }
	      return memberDAO;
	}

	public String PwFind(String id, String email)throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select id from user where id = ? and email = ?";
		String res = "";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, email);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				res = rs.getString("id");
			}
		}finally {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
		}
		return res;
	}
		

	public int updateSecondPw(String pwd,String id)throws SQLException{
		int update = 0;
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = "update user set pwd = ? where id = ?";
		
		try {
			conn = getConnection();
			ps = conn.prepareStatement(sql);
			ps.setString(1, pwd);
			ps.setString(2, id);
			
			update = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			pool.freeConnection(conn, ps);
		}
		return update;
	}


	

}
