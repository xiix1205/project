package sign;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class PwAction extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    String RequestURI=request.getRequestURI();
	    String contextPath=request.getContextPath();
	    
	    System.out.println(contextPath.length());
	    
	    String command=RequestURI.substring(contextPath.length());
	    
	    Command action=null;
	    
	    System.out.print(command);
	    
	    if(command.equals("/login/PwFindProc.do")){
            action = new PwFindProcCommand();
            System.out.println("페이지이동완료1");
            try{
               action.execute(request, response);
               response.sendRedirect("../login/PwFindOkNext.jsp");
               System.out.println("페이지이동완료3");
            }catch(Exception e){
               e.printStackTrace();
            }
	    }
	}
	    
	       
//	    ���� ������ �̵�
//	    if(forward != null){
//	         
//	         if(forward.isRedirect()){
//	            response.sendRedirect(forward.getPath());
//	         }else{
//	            RequestDispatcher dispatcher=
//	                  request.getRequestDispatcher(forward.getPath());
//	            dispatcher.forward(request, response);
//	         }
//	         
//	      }
//	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
