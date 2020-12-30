package svc;

import java.sql.Connection;

import dao.MovieListDAO;
import vo.MovieList;
import static db.JdbcUtil.*;

public class MovieRegistService {

   public boolean registMovieList(MovieList movieList) {
      
      MovieListDAO movieListDAO = MovieListDAO.getInstance();
      Connection con = getConnection();
      movieListDAO.setConnection(con);
      
      int insertMovie = movieListDAO.insertMovieList(movieList);
      
      boolean isRegistSucess = false;
      
      if(insertMovie > 0) {
         commit(con);
         isRegistSucess = true;
      }else {
         rollback(con);
      }
      
      close(con);
   
      return isRegistSucess;
   }
}