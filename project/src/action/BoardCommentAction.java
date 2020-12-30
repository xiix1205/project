package action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardCommentService;
import vo.ActionForward;
import vo.MovieBean;
import vo.ReplyBean;

public class BoardCommentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = null;
	    String nowPage = request.getParameter("page");
	    int board_num = Integer.parseInt(request.getParameter("M_REPLY_REF_NUM"));
	    ReplyBean replybean = new ReplyBean();  		
	    String boardtype = request.getParameter("boardtype");
	    
//		파라미터 출력 test
		System.out.println("M_REPLY_NUM: " + request.getParameter("M_REPLY_REF_NUM"));
		System.out.println("id: " + request.getParameter("ID"));
		System.out.println("M_CONTENT: " + request.getParameter("M_CONTENT"));
	    
	    
		replybean.setM_reply_ref_num(Integer.parseInt(request.getParameter("M_REPLY_REF_NUM")));
		replybean.setId(request.getParameter("ID"));
		replybean.setM_content(request.getParameter("M_CONTENT"));	
	 	BoardCommentService boardCommentService = new BoardCommentService();
	 
	 	
	 	boolean isReplySuccess = boardCommentService.replyArticle(replybean);
	 	
	 	
   		if(isReplySuccess){
   		    forward= new ActionForward();
   		    System.out.println("boardtype : " + boardtype);
   	        forward.setPath("boardDetail.bo?boardtype=" +boardtype+ "&board_num=" + board_num + "&page=" + nowPage);
   	        //forward.setPath("boardDetail.bo?boardtype=" +boardtype+ "&board_num=" + board_num + "&page=" + nowPage);
   	        return forward;
   	         
   		} else {
   			response.setContentType("text/html;charset=UTF-8");
   			PrintWriter out = response.getWriter();
   			out.println("<script>");
   			out.println("alert('답장실패')");
   			out.println("history.back()");
   			out.println("</script>");
   		}
   		
   		System.out.println("M_CONTENT: " + request.getParameter("M_CONTENT"));

   		
   		return forward;
	}

}
