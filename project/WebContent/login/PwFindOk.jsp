<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
    // ���ڵ�
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
                 <span id="hi"><%=id %> ��, �ݰ����ϴ�.</span>
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
	<h3>��й�ȣ ã��</h3>
	<div id="findpwd">
		<form action="PwFindProc.do">
		<h5>���̵�</h5>
		<input type="text" name="id" required="required"/>
		<h5>�̸���</h5>
		<input type="text" name="email" required="required"/><br>
		<p>���� ��� �Է��� �̸��Ϸ� ��й�ȣ �缳�� ������ �߼��մϴ�.</p>
		<input type="submit" value="����">
		<input type="button" value="���" onclick="location.href='login.jsp'"/>
		</form>
		<br>
		
	</div>	
	</section>
	</div>
	<div id="footer">
                  <article>
              copyright@<p></p><hr> MOVIE�ֽ�ȸ��: ��õ������ ���� ������ 284 ���ͺ��� 4�� �������������б�<p/>��ǥ��ȭ: 032-555-1111&nbsp;/&nbsp;Email: movie@gmail.com 
                </article>      
              </div>
</body>
</html>