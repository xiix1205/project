package svc;

import static db.JdbcUtil.*;

import dao.BoardDAO;
import vo.ReplyBean;
import java.sql.Connection;
import java.util.ArrayList;


public class BoardCommentService {
	public boolean replyArticle(ReplyBean replybean) throws Exception{
		// TODO Auto-generated method stub
		
		// ArrayList<ReplyBean> reply= null;
		boolean isReplySuccess = false;
		int insertCount = 0;
		
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		insertCount = boardDAO.insertReplyArticle(replybean);
		
		if(insertCount > 0){
			commit(con);
			isReplySuccess = true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isReplySuccess;
		
	}

	public ArrayList<ReplyBean> selectReply(ReplyBean replybean,int board_num) throws Exception{
		// TODO Auto-generated method stub
		
		ArrayList<ReplyBean> reply= null;
		
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		reply = boardDAO.selectReplyArticle(replybean,board_num);
		
		if(reply != null){
			commit(con);
			
		}
		else{
			rollback(con);
		}
		
		close(con);
		return reply;
	
	}
}
