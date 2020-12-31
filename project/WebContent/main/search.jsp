<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<%@page import = "project.MainBoardBean" %>    
<%
	int nowPage = 1;
	request.setCharacterEncoding("EUC-KR");
	String id = (String)session.getAttribute("idKey");
	
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="jquery.js"></script>
    <script src="js/jquery.bxslider.min.js"></script>
    <script src="js/slide.js"></script>
    <link rel="stylesheet" href="css/jquery.bxslider.min.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/shape.css">


</head>
<body>
 <div id="wrapper">
       <header id="header">
              <h1 class="title" onclick="javascript:location.href='main.jsp'">MOVIEMOA</h1>
            <form method="post" action="search.jsp" class="login">
            
             <%
             String ids = request.getParameter("id");
             if (id == null) {%>
             <button type="button" class="login" onclick="javascript:location.href='../login/login.jsp'">Login</button>	
              <button type="button" class="login" onclick="javascript:location.href='../login/agree.jsp'">Sign in</button>
                 
               <%}else if(id.equals("admin")){%>  
                <button type="button" class="login" onclick="javascript:location.href='../adminPage.jsp'">������ ȭ��</button>
                 <button type="button" class="login" onclick="javascript:location.href='../login/logout.jsp'">Logout</button>
              <%} else if(id != null) {%>
              <span id="hi"><%=id %> ��, �ݰ����ϴ�.</span>
                 <button type="button" class="login" onclick="javascript:location.href='../login/logout.jsp'">Logout</button><%} %>
            
	              <input type="text" name="search"  id="search" class="login" placeholder="Search...">
	              <input type="submit" id="searchBtn">
              </form>
                  
             <nav id="nav">
                  <span class="btn" onclick="javascript:location.href='../movieList.mo'">MovieInfo</span>
                  <span class="btn" onclick="javascript:location.href='../subpage/boardList.bo?boardtype=BOARDALL'">MovieTalk</span>
                  <span class="btn" onclick="javascript:location.href='../newsList.mo'">MovieNEWS</span>
                  <span class="btn" onclick="javascript:location.href='loc.jsp'">Theater</span> 
              </nav>
            </header>  
 
                  <section id="search_wrap">
                      <div id="search_name">
                        <h2>SEARCH INFO</h2>        
                     </div>
                  <h2>���հ˻� ����Դϴ�.</h2>
                  <%
                  
                  	
                  	String search = request.getParameter("search");
                  
                  	Connection conn = null;
                  	Statement stmt = null;
                  	
                  	try{
                  		Class.forName("com.mysql.jdbc.Driver");
                  		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviedb?useUnicode=true&characterEncoding=utf8","root","1234");
                  		
                  		if(conn == null)
                  			throw new Exception("�����ͺ��̽� ���� ����");
                  		
                  		stmt = conn.createStatement();
                  		
                  		String sql = "SELECT * FROM boardmovie WHERE MOVIE_CONTENT LIKE '%"+search+"%' UNION all SELECT * FROM boardfree WHERE FREE_CONTENT LIKE '%"+search+"%' ORDER BY movie_date desc";
                  						//12�� 28�� ������ �ذ�
                  		System.out.println(sql);
                  		
                  		ResultSet rs = stmt.executeQuery(sql);
                  		
                  		if(!rs.next()){
                  			out.println("�ش��ϴ� ������ �����ϴ�.");
                  		}else{
                  			rs.previous();
                  		}
                  		
                  		while(rs.next()){
                  			String subject = rs.getString("MOVIE_SUBJECT");
                  			String mov_id = rs.getString("ID");
                  			String date = rs.getString("MOVIE_DATE");
                  			int count = rs.getInt("MOVIE_READCOUNT");
                  			int board_num = rs.getInt("MOVIE_NUM");
                  			String genre = rs.getString("MOVIE_GENRE");
                  			String content = rs.getString("MOVIE_CONTENT");
                  		%>	
                  			
                  			 <div id="search_content">
                             <P class="search_title"><a href="../subpage/boardDetail.bo?boardtype=<%=genre%>&board_num=<%=board_num%>&page=<%=nowPage%>"><%=subject%></a></P>
                             <p class="search_info"><%=genre%>&nbsp;&nbsp;|&nbsp;&nbsp;<%=mov_id %>&nbsp;&nbsp;|&nbsp;&nbsp;<%=date %>&nbsp;&nbsp;|&nbsp;&nbsp;<%=count %>&nbsp;&nbsp;</p>
                        
                     		 <p class="search">
                          		<%=content %>
                      			</p>
                              </div> 
                          <% 
                  		}
                  	}catch(Exception e){
                  		e.printStackTrace();
                  	}
                  	%>    
                           </section>
                           
                           
             <div id="footer">
                  <article>
              copyright@<br><br><hr><br>MOVIE�ֽ�ȸ��: ��õ������ ���� ������ 284 ���ͺ��� 4�� �������������б�<p/>��ǥ��ȭ: 032-555-1111&nbsp;/&nbsp;Email: movie@gmail.com 
                </article>      
              </div>
           
          
         </div> 
       
</body>
</html>











