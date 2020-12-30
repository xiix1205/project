package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MovieReviewRegistService;
import vo.ActionForward;
import vo.MovieReviewBean;

public class MovieReviewRegistAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
		HttpSession session = request.getSession();
		
	    MovieReviewBean movieReviewBean = new MovieReviewBean();
	    
	    System.out.println("m_id: " + Integer.parseInt(request.getParameter("m_id")));
	    System.out.println("m_star: " + Integer.parseInt(request.getParameter("m_star")));
	    System.out.println("m_review: " + request.getParameter("m_review"));
	    System.out.println("id: " + (String)session.getAttribute("idKey"));
	    	    
	    int m_id = Integer.parseInt(request.getParameter("m_id"));
	    movieReviewBean.setM_id(m_id);
	    movieReviewBean.setM_star(Integer.parseInt(request.getParameter("m_star")));
	    movieReviewBean.setM_review(request.getParameter("m_review"));
	    movieReviewBean.setId((String)session.getAttribute("idKey"));	
	    
	    
	    
		
	    
	    
	    
	 	MovieReviewRegistService movieReviewRegistService = new MovieReviewRegistService();
	 	boolean isRegistSucess = movieReviewRegistService.registMovieReview(movieReviewBean);
	 	
   		if(isRegistSucess){
   			forward = new ActionForward("movieView.jsp",true);
   			forward.setRedirect(true);
   			forward.setPath("movieView.mo?m_id=" + m_id);
   		}
   		else{
   			response.setContentType("text/html;charset=UTF-8");
   			PrintWriter out = response.getWriter();
   			out.println("<script>");
   			out.println("alert('리뷰 등록 실패')");
   			out.println("history.back()");
   			out.println("</script>");
   		}
   		
   		return forward;
	}

}
