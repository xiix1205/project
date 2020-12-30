package action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import svc.BoardWriteProService;
import vo.ActionForward;
import vo.MovieBean;

public class BoardWriteProAction implements Action {

   
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      
      ActionForward forward=null;
      MovieBean movieBean = null;
      String realFolder="";
      String saveFolder="/subpage/boardUpload";
      int fileSize=5*1024*1024;
      ServletContext context = request.getServletContext();
      realFolder=context.getRealPath(saveFolder);         
      MultipartRequest multi=new MultipartRequest(request,
            realFolder,
            fileSize,
            "UTF-8",
            new DefaultFileRenamePolicy());
      
      movieBean = new MovieBean();
      movieBean.setMOVIE_GENRE(multi.getParameter("MOVIE_GENRE"));
      movieBean.setMOVIE_SUBJECT(multi.getParameter("MOVIE_SUBJECT"));
      movieBean.setMOVIE_CONTENT(multi.getParameter("MOVIE_CONTENT"));
      movieBean.setMOVIE_FILE((String)multi.getFileNames().nextElement());
      movieBean.setID(multi.getParameter("ID"));    
      
      
      // 영화 테이블과 잡담 테이블을 구분할 매개변수 
      String boardtype = multi.getParameter("MOVIE_GENRE");
      //
      
      BoardWriteProService boardWriteProService = new BoardWriteProService();
      boolean isWriteSuccess = boardWriteProService.registArticle(movieBean, boardtype);

      
      if(!isWriteSuccess){
         response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
         out.println("<script>");
         out.println("alert('write fale')");
         out.println("history.back();");
         out.println("</script>");
      }
      else{
    	 System.out.println("보드타입 : " + boardtype);
         forward = new ActionForward();
         forward.setRedirect(true);
         forward.setPath("boardList.bo?boardtype=BOARDALL");
      }

      return forward;
      
   }     
}