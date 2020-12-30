package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.BoardDeleteProAction;
import action.MovieListAction;
import action.MovieRegistAction;
import action.MovieRegistFormAction;
import action.MovieReviewDeleteAction;
import action.MovieReviewRegistAction;
import action.MovieViewAction;
import vo.ActionForward;


@WebServlet("*.mo")
public class MovieFrontController extends HttpServlet {
   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      doProcess(request,response);
      
   }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      doProcess(request,response);
      
   }
   
   protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("UTF-8");
      String requestURI = request.getRequestURI();
      //��û URL : http://localhost:8088/boardProject/boardWriteFrom.bo
      //requestURI : /boardProject/boardWriteForm.bo ��ȯ
      
      
      String contextPath = request.getContextPath();
      //   /boardProject ��ȯ
      
      String command = requestURI.substring(contextPath.length());
      Action action = null;
      ActionForward forward = null;
      
      if(command.equals("/movieList.mo")){
         action = new MovieListAction();
         
         try {
            forward = action.execute(request, response);
         } catch (Exception e) {
            e.printStackTrace();
         }      
      }else if(command.equals("/movieView.mo")) {
    	  action = new MovieViewAction();
    	  try {
    		  forward = action.execute(request, response);
    	  }catch(Exception e){
    		  e.printStackTrace();
    	  }
      
      }else if(command.equals("/movieRegistForm.mo")) {
    	  action = new MovieRegistFormAction();
    	  
    	  try {
    		  forward = action.execute(request, response);
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
      }else if(command.equals("/movieRegist.mo")) {
    	  action = new MovieRegistAction();
    	  
    	  try {
    		  forward = action.execute(request, response);
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
      }else if(command.equals("/movieReviewRegist.mo")) {
    	  action = new MovieReviewRegistAction();
    	  
    	  try {
    		  forward = action.execute(request, response);
    	  }catch(Exception e) {
    		  e.printStackTrace();
    	  }
      
      }else if(command.equals("/movieReviewDelete.mo")){
	    	int m_id=Integer.parseInt(request.getParameter("m_id"));
	  	  	request.setAttribute("m_id",m_id);
	  	  	int r_num=Integer.parseInt(request.getParameter("r_num"));
	  	  	request.setAttribute("r_num",r_num);
	  	  	forward=new ActionForward();
			action = new MovieReviewDeleteAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
      
    
      
      if(forward != null) {
         if(forward.isRedirect()) {
            response.sendRedirect(forward.getPath());
         }else {
            RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
            dispatcher.forward(request, response);
         }
      }
   }

}