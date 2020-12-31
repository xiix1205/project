<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="news.BoardBean"%>
<jsp:useBean id="bMgr" class="news.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("idKey");
int num = Integer.parseInt(request.getParameter("num"));
String nowPage = request.getParameter("nowPage");
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
bMgr.upCount(num);//조회수 증가
BoardBean bean = bMgr.getBoard(num);//게시물 가져오기
String news_name = bean.getNews_name();
String news_subject = bean.getNews_subject();
String news_date = bean.getNews_date();
String img_a = bean.getImg_a();
String content_a = bean.getContent_a();
String img_b = bean.getImg_b();
String content_b = bean.getContent_b();
String img_c = bean.getImg_c();
String content_c = bean.getContent_c();
String img_d = bean.getImg_d();
String content_d = bean.getContent_d();
String img_e = bean.getImg_e();
String content_e = bean.getContent_e();
String img_f = bean.getImg_f();
String content_f = bean.getContent_f();
int count = bean.getCount();
session.setAttribute("bean", bean);//게시물을 세션에 저장
int listtype = Integer.parseInt(request.getParameter("listtype"));
%>
<html>
<head>
<title>JSP Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
    function list() {
        document.listFrm.submit();
    }

    function down(filename) {
        document.downFrm.filename.value = filename;
        document.downFrm.submit();
    }
</script>
<style>
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

td {
	border-bottom: 1px solid;
	padding: 10px;
}

#main {
	width: 960px;
	margin: 0 auto;
}

#listbtntd {
	border: none;
	padding: 10px;
	'
}

#listbtn {
	text-align: center;
	width: 120px;
	height: 50px;
	margin-left: 20px;
	margin-right: 20px;
	border-radius: 15px;
	border: 1px solid #50403f;
	background-color: #50403f;
	color: antiquewhite;
	font-size: 1.2em;
}
</style>
<link rel="stylesheet" href="../css/common.css"> 
</head>
<body>
	<div id="wrapper">
		<header id="header">
              <h1 class="title" onclick="javascript:location.href='../main/main.jsp'">MOVIEMOA</h1>
            <form method="post" action="../main/search.jsp" class="login">
            
             <%
             String ids = request.getParameter("id");
             if (id == null) {%>
             <button type="button" class="login" onclick="javascript:location.href='../login/login.jsp'">Login</button>	
              <button type="button" class="login" onclick="javascript:location.href='../login/agree.jsp'">Sign in</button>
                 
               <%}else if(id.equals("admin")){%>  
                <button type="button" class="login" onclick="javascript:location.href='../adminPage.jsp'">관리자 화면</button>
                 <button type="button" class="login" onclick="javascript:location.href='../login/logout.jsp'">Logout</button>
              <%} else if(id != null) {%>
              <span id="hi"><%=id %> 님, 반갑습니다.</span>
                 <button type="button" class="login" onclick="javascript:location.href='../login/logout.jsp'">Logout</button><%} %>
            
	              <input type="text" name="search"  id="search" class="login" placeholder="Search...">
	              <input type="submit" id="searchBtn">
              </form>
                  
             <nav id="nav">
                  <span class="btn" onclick="javascript:location.href='../movieList.mo'">MovieInfo</span>
                  <span class="btn" onclick="javascript:location.href='../subpage/boardList.bo?boardtype=BOARDALL'">MovieTalk</span>
                  <span class="btn" onclick="javascript:location.href='newsList.mo'">MovieNEWS</span>
                  <span class="btn" onclick="javascript:location.href='../main/loc.jsp'">Theater</span> 
              </nav>
            </header> 
		<br />
		<br />
		<div id="main">
			<table align="center" width="600" cellspacing="0" id="mainnews">
				<tr>
					<td height="25" align="center" colspan="4"><%=news_subject%></td>
				</tr>
				<tr>
					<td colspan="4" align="right"><%=news_name%></td>
				</tr>
				<tr>
					<td colspan="4" text-align="center"><br><%=img_a%><br>
					<br><%=content_a%> <%
 	if (img_b == null) {
 } else if (img_b != null) {
 %> <br>
					<br><%=img_b%><br>
					<br><%=content_b%> <%
 	}
 %> <%
 	if (img_c == null) {
 } else if (img_c != null) {
 %>
						<br>
					<br><%=img_c%><br>
					<br><%=content_c%> <%
 	}
 %> <%
 	if (img_d == null) {
 } else if (img_d != null) {
 %>
						<br>
					<br><%=img_d%><br>
					<br><%=content_d%> <%
 	}
 %> <%
 	if (img_e == null) {
 } else if (img_e != null) {
 %>
						<br>
					<br><%=img_e%><br>
					<br><%=content_e%> <%
 	}
 %> <%
 	if (img_f == null) {
 } else if (img_f != null) {
 %>
						<br>
					<br><%=img_f%><br>
					<br><%=content_f%> <%
 	}
 %></td>
				</tr>
				<tr>
					<td colspan="4" align="right"><%=news_date%></td>
				</tr>

				<tr>
					<td align="center" colspan="4" id="listbtntd"><a
						href="javascript:list()"><input id="listbtn" type="buttun"
							value="List"></a></td>
				</tr>
			</table>

			<form name="downFrm" action="download.jsp" method="post">
				<input type="hidden" name="filename">
			</form>

			<form name="listFrm" method="post" action="list.jsp?listtype=<%=listtype%>">
				<input type="hidden" name="nowPage" value="<%=nowPage%>">
				<%
					if (!(keyWord == null || keyWord.equals(""))) {
				%>
				<input type="hidden" name="keyField" value="<%=keyField%>">
				<input type="hidden" name="keyWord" value="<%=keyWord%>">
				<%
					}
				%>
			</form>
		</div>
		<div id="footer">
                  <article>
              copyright@<br><br><hr><br>MOVIE주식회사: 인천광역시 서구 서곶로 284 새터빌딩 4층 연희직업전문학교<p/>대표전화: 032-555-1111&nbsp;/&nbsp;Email: movie@gmail.com 
                </article>      
              </div>
	</div>
</body>
</html>