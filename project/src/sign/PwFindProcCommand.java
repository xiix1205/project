package sign;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.PreparedStatement;

public class PwFindProcCommand implements Command {

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		System.out.println("페이지이동완료2");
		String receiver = request.getParameter("email");
		String receiver_id = request.getParameter("id");
		String res = "";
		MemberDAO mdao = MemberDAO.getInstance();
		
		try {
			res = mdao.PwFind(receiver_id, receiver);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String ALPHA_NUMERIC_STRING = "ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghijklmnopqrstuvwxyz0123456789";
		String pw = "";
		for(int i = 0; i< 8; i++) {
			int n = (int)(Math.random() * ALPHA_NUMERIC_STRING.length());
			pw += ALPHA_NUMERIC_STRING.charAt(n);
		}
		
		System.out.println("새로운 비밀번호는 "  + pw);
		
		if(res.equals("")) {
			request.setAttribute("pwfind", "fail");
		}else {
			try {
				mdao.updateSecondPw(pw, receiver_id);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			SendMail smail = SendMail.getInstance();
			smail.sendMail(receiver, receiver_id, pw);;
			request.setAttribute("pwfind", receiver);
		}
		return "/login/PwFindOk.jsp";
	}
	
	
	


}






















