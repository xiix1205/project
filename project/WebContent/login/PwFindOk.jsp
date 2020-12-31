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
#main h1{
  margin-top: 80px;
  text-align:center;
}

#main h5{
	color: #777;
}

#findpwd{
	margin: 0 auto;
  width: 400px;
  height: 200px;
  padding:35px;
  margin-bottom:300px;
  text-align: center;
  border-top:1px solid #333;
  border-bottom:1px solid #333;
}

#findpwd label {
  display: inline;
  font-size: 15px;
  font-weight: bold;
  margin-right:15px;
}

.findbtn{
	width:140px;
	height:30px;
	margin:13px;
	margin-top:25px;
	font-size:13px;
	font-weight:200;
	cursor:pointer;
	background-color:#333;
	color:white;
}
</style>
</head>
<body>
	
	<header id="header">
              <h1 class="title" onclick="javascript:location.href='../main/main.jsp'">MOVIEMOA</h1>
            <form method="post" action="../main/search.jsp" class="login">
               <%if (id != null) {%>
                 <span id="hi"><%=id %> ��, �ݰ����ϴ�.</span>
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
                  <span class="btn" onclick="javascript:location.href='.../newsList.mo'">MovieNEWS</span>
                  <span class="btn" onclick="javascript:location.href='../main/loc.jsp'">Theater</span> 
              </nav>
                  
         </header>
  <div id="main" align="center">  
  
	<h1>��й�ȣ ã��</h1>
	<h5>��ȸ�������� ��ϵ� �̸��Ϸ� �ӽú�й�ȣ�� �����帳�ϴ�.</h5>
	
		<form action="PwFindProc.do">
		<div id="findpwd">
		
		<label>���̵�</label>
		<input type="text" name="id" placeholder="���̵� �Է��ϼ���." required="required"/>
		<p/>
		
		<label>�̸���</label>
		<input type="text" name="email" placeholder="�̸����� �Է��ϼ���." required="required"/>
		<p/>
		
		<input type="submit" value="����" class="findbtn">
		<input type="button" value="���" class="findbtn" onclick="location.href='login.jsp'"/>
		</div>
		</form>
		
	</div>	
	
	
	<div id="footer">
       <article>copyright@<br><br><hr><br>MOVIE�ֽ�ȸ��: ��õ������ ���� ������ 284 ���ͺ��� 4�� �������������б�<p/>��ǥ��ȭ: 032-555-1111&nbsp;/&nbsp;Email: movie@gmail.com</article>      
    </div>
</body>
</html>