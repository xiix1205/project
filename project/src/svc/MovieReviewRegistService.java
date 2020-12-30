package svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import dao.MovieReviewDAO;
import vo.MovieReviewBean;

public class MovieReviewRegistService {

	public boolean registMovieReview(MovieReviewBean movieReviewBean) {
	      
		  MovieReviewDAO movieReviewDAO = MovieReviewDAO.getInstance();
	      Connection con = getConnection();
	      movieReviewDAO.setConnection(con);
	      
	      int insertMovieReview = movieReviewDAO.insertMovieReview(movieReviewBean);
	      
	      boolean isRegistSucess = false;
	      
	      if(insertMovieReview  > 0) {
	         commit(con);
	         isRegistSucess = true;
	      }else {
	         rollback(con);
	      }
	      
	      close(con);
	   
	      return isRegistSucess;
	   }
	
}
