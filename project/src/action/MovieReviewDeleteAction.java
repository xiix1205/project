package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.MovieReviewDeleteService;
import vo.ActionForward;

public class MovieReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		
	      int r_num=Integer.parseInt(request.getParameter("r_num"));
	      int m_id = Integer.parseInt(request.getParameter("m_id"));
	      
	      MovieReviewDeleteService movieReviewDeleteService = new MovieReviewDeleteService();
	      
	
	         boolean isDeleteSuccess = movieReviewDeleteService.removeReview(r_num);

	         if(!isDeleteSuccess){
	            response.setContentType("text/html;charset=UTF-8");
	            PrintWriter out=response.getWriter();
	            out.println("<script>");
	            out.println("alert('리뷰 삭제 실패');");
	            out.println("history.back();");
	            out.println("</script>");
	            out.close();
	         }
	         else{
	        	
	            forward = new ActionForward();
	            forward.setRedirect(true);
	            forward.setPath("movieView.mo?m_id=" + m_id);
	         }
	         


	      return forward;
	}

}
