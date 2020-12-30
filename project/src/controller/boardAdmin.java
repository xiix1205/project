package controller;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import static db.JdbcUtil.*;

public class boardAdmin {
	DataSource ds;
	Connection conn;
	
	public boolean admin_login(String id,String pass){
		PreparedStatement pstmt = null;
	    ResultSet rs = null;

		boolean b = false;

		try {

			String sql = "select * from user where id = ? and pwd = ?";

			Connection conn = getConnection();

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, id);

			pstmt.setString(2, pass);

			rs = pstmt.executeQuery();

			b=rs.next();

		} catch (Exception e) {

			System.out.println("admin_login err : " + e);

		} finally {

			try {

				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();

			} catch (Exception e2) {

				// TODO: handle exception

			}

		}

		return b;
	}


}
