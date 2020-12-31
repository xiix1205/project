<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="jquery.js"></script>
 <link rel="stylesheet" href="css/common.css"> 
 <link rel="stylesheet" href="css/loc.css"> 
 <link rel="stylesheet" href="subpage/css/write.css?ver=2">
<link rel="stylesheet" href="subpage/css/boardcommon.css?ver=2">
 
<script>
function fetchPage(name){
    fetch(name).then(function(response){
                    response.text().then(function(text){
                    document.querySelector('#manage').innerHTML = text;
                })
            })
}
</script>
<style type="text/css">
   #registForm{
      width: 500px;
      border : 1px solid; 
      margin:auto; 
   }   
   h2{
      text-align: center;
   }
   table{
      margin:auto;
      width: 450px;
      }
   .td_left{
      width: 150px;
      background:orange;
   }
   .td_right{
      width: 300px;
      background:skyblue;
   }
   #commandCell{
      text-align: center;
      
   }
   
   #main{
   	text-align:center;
   	height:100%;
   	padding-bottom:500px;
   }
   
   .manage_tab li{
   	display:inline-block;
   	margin:15px;
   	cursor:pointer
   }
   
   #manage{
   	margin-bottom:30px;
   }
</style>
 
</head>
<body>
 			 <header id="header">
              <h1 class="title" onclick="javascript:location.href='main/main.jsp'">MOVIEMOA</h1>
            <form method="post" action="main/search.jsp" class="login">
            
             <%
             String ids = request.getParameter("id");
             if (id == null) {%>
             <button type="button" class="login" onclick="javascript:location.href='login/login.jsp'">Login</button>	
              <button type="button" class="login" onclick="javascript:location.href='login/agree.jsp'">Sign in</button>
                 
               <%}else if(id.equals("admin")){%>  
                <button type="button" class="login" onclick="javascript:location.href='adminPage.jsp'">관리자 화면</button>
                 <button type="button" class="login" onclick="javascript:location.href='login/logout.jsp'">Logout</button>
              <%} else if(id != null) {%>
              <span id="hi"><%=id %> 님, 반갑습니다.</span>
                 <button type="button" class="login" onclick="javascript:location.href='login/logout.jsp'">Logout</button><%} %>
            
	              <input type="text" name="search"  id="search" class="login" placeholder="Search...">
	              <input type="submit" id="searchBtn">
              </form>
                  
             <nav id="nav">
                  <span class="btn" onclick="javascript:location.href='movieList.mo'">MovieInfo</span>
                  <span class="btn" onclick="javascript:location.href='subpage/boardList.bo?boardtype=BOARDALL'">MovieTalk</span>
                  <span class="btn" onclick="javascript:location.href='newsList.mo'">MovieNEWS</span>
                  <span class="btn" onclick="javascript:location.href='main/loc.jsp'">Theater</span> 
              </nav>
            </header>  
             
            <div id="sidebar">
   			<div class="sub_tab">
   				<ul>
   					<li><h3>관리자 메인 페이지</h3></li>
   					<li>
   						<span onclick="fetchPage('js/noticeWrite')">공지사항</span>
   					</li>
   					<li>
   						<span onclick="fetchPage('js/movieRegistForm')">최신영화 등록</span>
   					</li>
   					<li>
   						<span onclick="fetchPage('js/newsRegistForm')">최신뉴스 등록</span>
   					</li>
   				</ul>
   			</div>
   		</div>
   		
            <div id="main">
            
           
            <div id = "manage">
            
            </div>
           
            </div>  
               <div id="footer">
                  <article>
              copyright@<br><br><hr><br>MOVIE주식회사: 인천광역시 서구 서곶로 284 새터빌딩 4층 연희직업전문학교<p/>대표전화: 032-555-1111&nbsp;/&nbsp;Email: movie@gmail.com 
                </article>      
              </div>
</body>
</html>