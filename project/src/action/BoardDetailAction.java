package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDetailService;
import vo.ActionForward;
import vo.BoardBean;
import vo.MovieBean;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String boardtype = request.getParameter("boardtype");
		
		int board_num=Integer.parseInt(request.getParameter("board_num"));
	    String page = request.getParameter("page");
	    BoardDetailService boardDetailService = new BoardDetailService();
	    //¼öÁ¤
	    //MovieBean article = boardDetailService.getArticle(board_num); // BoardDetailServiceï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½Ï´ï¿½ ï¿½ï¿½
	    
	    //
	    MovieBean article = boardDetailService.getArticle(board_num, boardtype);
	    //
	    
	    ActionForward forward = new ActionForward();
	    request.setAttribute("page", page);
	    request.setAttribute("article", article);
	    forward.setPath("boardContent.jsp");
	    
	    //boardtype °ª È®ÀÎ
	    System.out.println("boardtype : " + boardtype);
	    System.out.println("board_num : " + board_num);
	    
	    return forward;
	}

}
