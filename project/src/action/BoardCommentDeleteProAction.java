	package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.ActionForward;
import vo.BoardBean;
import svc.BoardCommentDeleteProService;

public class BoardCommentDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
	    int m_reply_num=Integer.parseInt(request.getParameter("m_reply_num"));
	    int board_num=Integer.parseInt(request.getParameter("board_num"));
	    String nowPage = request.getParameter("page");
	    String boardtype = request.getParameter("boardtype");
	    
	    BoardCommentDeleteProService boardCommentDeleteProService = new BoardCommentDeleteProService();

	    boolean isDeleteSuccess = boardCommentDeleteProService.removeArticle(m_reply_num);

	    if(!isDeleteSuccess){
	            response.setContentType("text/html;charset=UTF-8");
	            PrintWriter out=response.getWriter();
	            out.println("<script>");
	            out.println("alert('��������');");
	            out.println("history.back();");
	            out.println("</script>");
	            out.close();
	    } else {
	        	forward = new ActionForward();
	            forward.setRedirect(true);
	            forward.setPath("boardDetail.bo?boardtype=" +boardtype+ "&board_num=" +board_num+ "&page=" + nowPage);
	    }
	        

	    return forward;
	}

}
