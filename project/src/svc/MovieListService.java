package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.BoardDAO;
import dao.MovieListDAO;
import vo.BoardBean;
import vo.MovieList;

import static db.JdbcUtil.*;

public class MovieListService {

	public int getListCount() throws Exception{
	      // TODO Auto-generated method stub
	      
	      int listCount = 0;
	      Connection con = getConnection();
	      MovieListDAO MovieDAO = MovieListDAO.getInstance();
	      MovieDAO.setConnection(con);
	      listCount = MovieDAO.selectListCount();
	      close(con);
	      return listCount;
	      
	   }
	
	
	
	
	public ArrayList<MovieList> getMovieList(int page, int limit) throws Exception{
		
		ArrayList<MovieList> movieList = null;
		MovieListDAO MovieDAO = MovieListDAO.getInstance();
		Connection con = getConnection();
		MovieDAO.setConnection(con);
		movieList = MovieDAO.selectMovieList(page,limit);
		return movieList;
	}

}
