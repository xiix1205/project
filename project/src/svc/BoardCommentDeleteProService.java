package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.BoardDAO;
import vo.BoardBean;

public class BoardCommentDeleteProService {
	
	   public boolean removeArticle(int m_reply_num) throws Exception{
		      // TODO Auto-generated method stub
		      
		      boolean isRemoveSuccess = false;
		      Connection con = getConnection();
		      BoardDAO boardDAO = BoardDAO.getInstance();
		      boardDAO.setConnection(con);
		      int deleteCount = boardDAO.deleteReplyArticle(m_reply_num);
		      
		      if(deleteCount > 0){
		         commit(con);
		         isRemoveSuccess=true;
		      }
		      else{
		         rollback(con);
		      }
		      
		      close(con);
		      return isRemoveSuccess;
		   }
	   
}
