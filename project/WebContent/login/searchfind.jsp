<%@ page language="java" contentType="text/html; charset=EUC-KR"

    pageEncoding="EUC-KR"%>

<%@ page import="svc.SearchService" %>

<%
String id = (String)session.getAttribute("idKey");
%>	

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/common.css"> 
<style>
#findid{
	width:400px;
	height:100%;
	border:1px solid black;
	margin:30px;
}
#findid h4{
	display:inline-block;
}
</style>

</head>

<%

   request.setCharacterEncoding("euc-kr");

   String name = request.getParameter("Name");
   
   String email = request.getParameter("Email");

   SearchService searchService = SearchService.getInstance();

   String userId = searchService.searchId(name, email);

%>

<body>
  <header id="header">
              <h1 class="title" onclick="javascript:location.href='../main/main.jsp'">MOVIEMOA</h1>
            <form method="post" action="../main/search.jsp" class="login">
               <%if (id != null) {%>
                 <span id="hi"><%=id %> 님, 반갑습니다.</span>
                 <button type="button" class="login" onclick="javascript:location.href='logout.jsp'">Logout</button>
              <%} else {%>
              <button type="button" class="login" onclick="javascript:location.href='login.jsp'">Login</button>	
              <button type="button" class="login" onclick="javascript:location.href='agree.jsp'">Sign in</button><% } %>
              
	              <input type="text" name="search"  id="search" class="login" placeholder="Search...">
	              <input type="submit" id="searchBtn">
              </form>
                  
             <nav id="nav">
                  <span class="btn" onclick="javascript:location.href='../movieList.mo'">MovieInfo</span>
                  <span class="btn" onclick="javascript:location.href='../subpage/boardList.bo?boardtype=BOARDALL'">MovieTalk</span>
                  <span class="btn" onclick="javascript:location.href='../news/list.jsp?listtype=1'">MovieNEWS</span>
                  <span class="btn" onclick="javascript:location.href='../main/loc.jsp'">Theater</span> 
              </nav>
                  
         </header>     
	<div id="main" align="center">  
   <form method="post" action="startPage.jsp">
   <%if(userId!= null){ %>
  	 <h3>아이디 찾기</h3>
		<div id="findid">
		
			<h4><%=name %></h4>님의 아이디는 <h4><%=userId %></h4>입니다.
		
		<input type="submit" name="search" value="로그인하기">
		 <%} else{%>
		 <h3>아이디 찾기</h3>
			<div id="findid">
		 <h4><%=name %></h4> 님의 가입정보가 없습니다.
		 <p>
		 <input type="button" value="회원가입하기"onclick="location.href='member.jsp'">
		  <input type="button" value="처음으로"onclick="location.href='login.jsp'">
		</p>
			
        
        
        	</div>
        	
		</div>
		
		</form>
		<%} %>
	</div>	


</body>

</html>

