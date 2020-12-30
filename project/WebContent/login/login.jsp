<%@ page contentType="text/html; charset=UTF-8" %>
<%
	  request.setCharacterEncoding("EUC-KR");
	  String id = (String)session.getAttribute("idKey");
%>
<html>
<head>
<title>로그인</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../css/common.css"> 
<script src="js/slide.js"></script>
<script type="text/javascript">
	function loginCheck() {
		if (document.loginFrm.id.value == "") {
			alert("아이디를 입력해 주세요.");
			document.loginFrm.id.focus();
			return;
		}
		if (document.loginFrm.pwd.value == "") {
			alert("비밀번호를 입력해 주세요.");
			document.loginFrm.pwd.focus();
			return;
		}
		document.loginFrm.submit();
	}
</script>
<style>
#login {
 	width:400px;
	border:1px solid black;
	margin:30px;
	padding:20px;
}

#login h1 {
  margin-top: 20px;
}

#login label {
  display: inline;
  font-size: 15px;
  margin-bottom: 10px;
  margin-top: 30px;
  margin-right: 20px;
}

#login input {
  margin-bottom: 30px;
}

#login button {
  width: 50px;
  height: 30px;
  margin-bottom: 200px;
  border: 1px solid #bd7261;
  border-radius: 20px;
  margin-right: 10px;
  margin-left: 10px;
  background-color: #50403f;
  color: antiquewhite;
  font-size: 1.2em;
}

#login button:focus {
  outline: none;
}

button a {
  text-decoration: none;
  color: antiquewhite;
}

button a:link {
  text-decoration: none;
  color: antiquewhite;
}

button a:visited {
  text-decoration: none;
  color: antiquewhite;
}

button a:active {
  text-decoration: none;
  color: antiquewhite;
}


.btn:hover {
  filter: invert(100%);
  text-decoration: underline;
}
button a {
  text-decoration: none;
  color: antiquewhite;
}
button a:link {
  text-decoration: none;
  color: antiquewhite;
}
button a:visited {
  text-decoration: none;
  color: antiquewhite;
}
button a:active {
  text-decoration: none;
  color: antiquewhite;
}

</style>
</head>
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
   
      <form name="loginFrm" method="post" action="loginProc.jsp">
      
        <h3>로그인</h3>
        <div id="login">
        <label for="ID" style="margin-right: 42px">아이디</label>
        <input type="text" name="id" id="ID" />
        <br />
        <label for="PW">비밀번호</label>
        <input type="password" name="pwd" id="PW" />
        <br />
       
        <input type="button" value="로그인" onclick="loginCheck()">&nbsp;
       <input type="button" value="회원가입" onClick="javascript:location.href='agree.jsp'">
       <input type="button" value="아이디 찾기" onclick="javascript:location.href='searchid.jsp'">
		<input type="button" value="비밀번호 찾기" onclick="javascript:location.href='PwFindOk.jsp'">
       </div>
      </form>
      <div id="footer">
                  <article>
              copyright@<br><br><hr><br>MOVIE주식회사: 인천광역시 서구 서곶로 284 새터빌딩 4층 연희직업전문학교<p/>대표전화: 032-555-1111&nbsp;/&nbsp;Email: movie@gmail.com 
                </article>      
              </div>
      <script src="../src/login.js"></script>
      <script src="../js/link.js"></script>
    </div>
  </body>
</html>