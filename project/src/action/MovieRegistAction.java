package action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.MovieRegistService;
import vo.ActionForward;
import vo.MovieList;

public class MovieRegistAction implements Action {

   

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      MovieRegistService movieRegistService = new  MovieRegistService();
      
      String realFolder = "";
      
      String saveFolder = "/moviefile";
      String encType = "UTF-8";
      int maxSize = 1024*1024*1024;
      
      ServletContext context = request.getServletContext();
      realFolder = context.getRealPath(saveFolder);
      
      MultipartRequest multi = new MultipartRequest(request,
            realFolder, maxSize, encType,
            new DefaultFileRenamePolicy());
      
      Enumeration files = multi.getFileNames();
      
      ArrayList<String> movieInfo = new ArrayList<String>();
      ArrayList<String> movieFileName = new ArrayList<String>();
      
//      String poster = (String)files.nextElement();
//      String banner = (String)files.nextElement();
//      String slide1 = (String)files.nextElement();
//      String slide2 = (String)files.nextElement();
//      String slide3 = (String)files.nextElement();
//      String slide4 = (String)files.nextElement();
//      String slide5 = (String)files.nextElement();
//      String slide6 = (String)files.nextElement();
      
      while(files.hasMoreElements()) {
    	 movieInfo.add((String)files.nextElement());
      }
      
      
      
//      for(String movieFile : movieInfo) {
//    	  movieFileName.add(multi.getFilesystemName(movieFile));
//      }
      
//      System.out.println(movieFileName.toString());
      
      String s1 = multi.getFilesystemName(movieInfo.get(0));
      String s2 = multi.getFilesystemName(movieInfo.get(1));
      String s3 = multi.getFilesystemName(movieInfo.get(2));
      String s4 = multi.getFilesystemName(movieInfo.get(3));
      String s5 = multi.getFilesystemName(movieInfo.get(4));
      String s6 = multi.getFilesystemName(movieInfo.get(5));
      String s7 = multi.getFilesystemName(movieInfo.get(6));
      String s8 = multi.getFilesystemName(movieInfo.get(7));
      
//      System.out.println(s1 + ":" + s2 + ":" + s3 + ":" + s4 + ":" + s5 + ":" + s6 + ":" + s7 + ":" + s8) ;
      
      
      	movieFileName.add(s1);
      	movieFileName.add(s2);
      	movieFileName.add(s3);
      	movieFileName.add(s4);
      	movieFileName.add(s5);
      	movieFileName.add(s6);
      	movieFileName.add(s7);
      	movieFileName.add(s8);
      
       
       Collections.sort(movieFileName);
            
      
      MovieList movieList = new MovieList(
              0, 
              multi.getParameter("m_title"), 
              movieFileName.get(0),  
              multi.getParameter("m_date"),
              movieFileName.get(1),
              multi.getParameter("m_title_eng"),
              Integer.parseInt(multi.getParameter("m_year")),
              multi.getParameter("m_nation"),
              multi.getParameter("m_age"),
              multi.getParameter("m_genre"),
              multi.getParameter("m_time"),
              multi.getParameter("m_total"),
              multi.getParameter("m_director"),
              multi.getParameter("m_actor"),
              multi.getParameter("m_summary1"),
              multi.getParameter("m_summary2"),
              multi.getParameter("m_summary3"),
              movieFileName.get(2),
              movieFileName.get(3),
              movieFileName.get(4),
              movieFileName.get(5),
              movieFileName.get(6),
              movieFileName.get(7),
              multi.getParameter("m_video"));
      
      
      boolean isRegistSucess = movieRegistService.registMovieList(movieList);
      
      ActionForward forward = null;
      
      if(isRegistSucess) {
         forward = new ActionForward("movieList.mo",true);
      }else {
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('등록 실패');");
         out.println("history.back();");
         out.println("</script>");
      }
      
      return forward;
   }

}