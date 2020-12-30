<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    // 인코딩
    request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/common.css">
<style>
#findpwd{
	width:450px;
	height:100%;
	border:1px solid black;
	margin:30px;
}
</style>
</head>
<body>
	
	<header id="header">
              <h1 class="title" onclick="javascript:location.href='main.jsp'">MOVIEMOA</h1>
            <form method="post" action="search.jsp" class="login">
               <%if (id != null) {%>
                 <span id="hi"><%=id %> 님, 반갑습니다.</span>
                 <button type="button" class="login" onclick="javascript:location.href='../login/logout.jsp'">Logout</button>
              <%} else {%>
              <button type="button" class="login" onclick="javascript:location.href='../login/login.jsp'">Login</button>	
              <button type="button" class="login" onclick="javascript:location.href='../login/agree.jsp'">Sign in</button><% } %>
              
	              <input type="text" name="search"  id="search" class="login" placeholder="Search...">
	              <input type="submit" id="searchBtn">
              </form>
                  
             <nav id="nav">
                  <span class="btn" onclick="javascript:location.href='../movieList.mo'">MovieInfo</span>
                  <span class="btn" onclick="javascript:location.href='../subpage/boardList.bo?boardtype=BOARDALL'">MovieTalk</span>
                  <span class="btn" onclick="javascript:location.href='../news/list.jsp?listtype=1'">MovieNEWS</span>
                  <span class="btn" onclick="javascript:location.href='loc.jsp'">Theater</span> 
              </nav>
                  
         </header>
  <div id="main" align="center">  
	<section>
	<h3>비밀번호 찾기</h3>
	<div id="findpwd">
		<form action="PwFindProc.do">
		<h5>아이디</h5>
		<input type="text" name="id" required="required"/>
		<h5>이메일</h5>
		<input type="text" name="email" required="required"/><br>
		<p>가입 당시 입력한 이메일로 비밀번호 재설정 메일을 발송합니다.</p>
		<input type="submit" value="전송">
		<input type="button" value="취소" onclick="location.href='login.jsp'"/>
		</form>
		<br>
		
	</div>	
	</section>
	</div>
	<div id="footer">
                  <article>
              copyright@<p></p><hr> MOVIE주식회사: 인천광역시 서구 서곶로 284 새터빌딩 4층 연희직업전문학교<p/>대표전화: 032-555-1111&nbsp;/&nbsp;Email: movie@gmail.com 
                </article>      
              </div>
</body>
</html>