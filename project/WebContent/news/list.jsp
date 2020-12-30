<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="news.BoardBean"%>
<%@page import="java.util.Vector"%>
<jsp:useBean id="bMgr" class="news.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("idKey");

int totalRecord = 0; //전체레코드수
int numPerPage = 9; // 페이지당 레코드 수 
int pagePerBlock = 15; //블럭당 페이지수 

int totalPage = 0; //전체 페이지 수
int totalBlock = 0; //전체 블럭수 

int nowPage = 1; // 현재페이지
int nowBlock = 1; //현재블럭

int start = 0; //디비의 select 시작번호
int end = 10; //시작번호로 부터 가져올 select 갯수

int listSize = 0; //현재 읽어온 게시물의 수

String keyWord = "", keyField = "";
Vector<BoardBean> vlist = null;
if (request.getParameter("keyWord") != null) {
	keyWord = request.getParameter("keyWord");
	keyField = request.getParameter("keyField");
}
if (request.getParameter("reload") != null) {
	if (request.getParameter("reload").equals("true")) {
		keyWord = "";
		keyField = "";
	}
}

if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}
start = (nowPage * numPerPage) - numPerPage;
end = numPerPage;

totalRecord = bMgr.getTotalCount(keyField, keyWord);
totalPage = (int) Math.ceil((double) totalRecord / numPerPage); //전체페이지수
nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock); //현재블럭 계산

totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock); //전체블럭계산
int listtype = Integer.parseInt(request.getParameter("listtype"));
%>
<html>
<head>
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

#mai {
	width: 960px;
	margin: 0 auto;
	overflower: hidden;
}

#mid {
	width: 960px;
}

#mid2 td {
	border-bottom: 1px solid #50403f;
}

td {
	padding: 5px;
}

#backbtn {
	text-align: center;
	width: 80px;
	height: 20px;
	margin-left: 20px;
	margin-right: 20px;
	border-radius: 5px;
	border: 1px solid #50403f;
	background-color: #50403f;
	color: antiquewhite;
	font-size: 1em;
}

#firsttr td {
	background-color: #50403f;
	color: antiquewhite;
}

#listnumbtn {
	background-color: #50403f;
	color: antiquewhite;
	border-radius: 5px;
}

#newnamezone td {
	font-size: 14px;
}

.newdrop {
	width: 300px;
	height: 300px;
	float: left;
	margin: 0 auto;
	margin-right: 13px;
	margin-bottom: 13px;
	background-color: rgba(153, 153, 153, 0.529);
}

.newsimg {
	width: 100%;
	height: 90%;
	/* border: 1px solid black; */
	overflow: hidden;
}

.newsimg img {
	width: 100%;
	height: 100%;
}

.newstitle {
	display: block;
	/* border: 1px solid black; */
	height: 18%;
	text-align: center;
	padding: 10px;
	text-overflow: ellipsis;
	overflow: hidden;
	box-sizing: border-box;
	white-space: nowrap;
}

#hoverzone td {
	font-size: 14px;
}

#hoverzone:hover {
	background-color: #6f5f5e;
	color: antiquewhite;
}

#hoverzone:hover a {
	background-color: #6f5f5e;
	color: antiquewhite;
}
</style>
<title>읽을 거리</title>
<link rel="stylesheet" href="../css/common.css"> 
<script type="text/javascript">
    let val;

    function test() {
        let combo_val = document.getElementById("vote");
        val = combo.options[combo.selectedIndex].value;
        let check1 = document.getElementById('test1');
        let check2 = document.getElementById('test2');

        if (val == 2) {

            document.listtype.action = "list.jsp?listtype=2";
            document.listtype.submit();
        } else if (val == 1) {

            document.listtype.action = "list.jsp?listtype=1";
            document.listtype.submit();
        }
    }

    function list() {
        document.listFrm.action = "list.jsp";
        document.listFrm.submit();
    }

    function pageing(page) {
        document.readFrm.nowPage.value = page;
        document.readFrm.submit();
    }

    function block(value) {
        document.readFrm.nowPage.value =
<%=pagePerBlock%>
    * (value - 1) + 1;
        document.readFrm.submit();
    }

    function read(num) {
        let combo_val = document.getElementById("vote");
        val = combo.options[combo.selectedIndex].value;

        if (val == 2) {
            document.readFrm.num.value = num;
            document.listFrm.action = "read.jsp?num=" + num + "&listtype=2";
            document.listFrm.submit();
        } else if (val == 1) {
            document.readFrm.num.value = num;
            document.listFrm.action = "read.jsp?num=" + num + "&listtype=1";
            document.listFrm.submit();
        }

    }

    function check() {
        if (document.searchFrm.keyWord.value == "") {
            alert("검색어를 입력하세요.");
            document.searchFrm.keyWord.focus();
            return;
        }
        document.searchFrm.submit();
    }
</script>

</head>
<body>
	<div id="wrapper">
		 <header id="header">
              <h1 class="title" onclick="javascript:location.href='../main/main.jsp'">MOVIEMOA</h1>
            <form method="post" action="../main/search.jsp" class="login">
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
                  <span class="btn" onclick="javascript:location.href='list.jsp?listtype=1'">MovieNEWS</span>
                  <span class="btn" onclick="javascript:location.href='../main/loc.jsp'">Theater</span> 
              </nav>
                  
         </header>
		<br />
		<div align="center" id="mai">
			<h2>읽을거리</h2>
			<table align="center" width="960" cellpadding="5" cellspacing="0">
				<tr>
					<td align="left" colspan="6">Total : <%=totalRecord%>(<font
						color="#50403f"> <%=nowPage%>/<%=totalPage%>Pages
					</font>)
					</td>

					<td colspan="1" align="right">
						<form method="post" name="listtype">
							<select name="uitype" id="combo" onchange="test()"
								style="margin-right: 30px">
								<!-- <option value="">선택</option> -->
								<option value="1" <%if (listtype == 1) {%> selected <%}%>>갤러리형</option>
								<option value="2" <%if (listtype == 2) {%> selected <%}%>>게시판형</option>
							</select>
						</form>
					</td>

				</tr>
			</table>
			<%
				if (listtype == 1) {
			%>
			<table id="mid">
				<tr>

					<%
						vlist = bMgr.getBoardList(keyField, keyWord, start, end);
					listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
					if (vlist.isEmpty()) {
						out.println("등록된 게시물이 없습니다.");
					} else {
					%>
				
				<tr id="newnamezone">
					<td align="center" colspan="7">
						<%
							for (int i = 0; i < numPerPage; i++) {
							if (i == listSize)
								break;
							BoardBean bean = vlist.get(i);
							int num = bean.getNews_num();
							String name = bean.getNews_name();
							String subject = bean.getNews_subject();
							String regdate = bean.getNews_date();
							String img_a = bean.getImg_a();
							int count = bean.getCount();
						%>
						<div class="newdrop">
							<a href="javascript:read('<%=num%>')">
								<div class="newsimg"><%=img_a%></div>
								<div class="newstitle"><%=subject%></div>
							</a>
						</div> <%
 	} //for
 %> <%
 	} //if
 %>
					</td>
				</tr>


				</td>
				</tr>

				<tr>
					<td align="center" style="border-bottom: none" colspan="7">
						<!-- 페이징 및 블럭 처리 Start--> <%
 	int pageStart = (nowBlock - 1) * pagePerBlock + 1; //하단 페이지 시작번호
 int pageEnd = ((pageStart + pagePerBlock) <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
 //하단 페이지 끝번호
 if (totalPage != 0) {
 	if (nowBlock > 1) {
 %> <a href="javascript:block('<%=nowBlock - 1%>')"><input
							id="listnumbtn" type="button" value="prev"></a> <%
 	}
 %>&nbsp; <%
 	for (; pageStart < pageEnd; pageStart++) {
 %> <a href="javascript:pageing('<%=pageStart%>')"> <%
 	if (pageStart == nowPage) {
 %> <%
 	}
 %> <input id="listnumbtn" type="button" value="<%=pageStart%>">
							<%
								if (pageStart == nowPage) {
							%> <%
 	}
 %></a> <%
 	} //for
 %>&nbsp; <%
 	if (totalBlock > nowBlock) {
 %> <a href="javascript:block('<%=nowBlock + 1%>')"><input
							id="listnumbtn" type="button" value="next"></a> <%
 	}
 %>&nbsp; <%
 	}
 %> <!-- 페이징 및 블럭 처리 End-->
					</td>

				</tr>
			</table>
			<%
				} else if (listtype == 2) {
			%>
			<!-- 리스트형 게시판 시작 ////////////////////////////////////////-->

			<table align="center" id="mid2">
				<tr>

					<%
						vlist = bMgr.getBoardList(keyField, keyWord, start, end);
					listSize = vlist.size();//브라우저 화면에 보여질 게시물갯수
					if (vlist.isEmpty()) {
						out.println("등록된 게시물이 없습니다.");
					} else {
					%>
				
				<tr align="center" id="firsttr">
					<td style="border-right: 1px solid black; width: 775px" colspan="4">제
						목</td>
					<td style="border-right: 1px solid black; width: 63px" colspan="2">이
						름</td>
					<td style="width: 116px" colspan="1">날 짜</td>
				</tr>
				<%
					for (int i = 0; i < numPerPage; i++) {
					if (i == listSize)
						break;
					BoardBean bean = vlist.get(i);
					int num = bean.getNews_num();
					String name = bean.getNews_name();
					String subject = bean.getNews_subject();
					String regdate = bean.getNews_date();
					int count = bean.getCount();
				%>
				<tr id="hoverzone">
					<td align="center" style="border-right: 1px solid black"
						colspan="4"><a href="javascript:read('<%=num%>')"><%=subject%></a>
					</td>
					<td align="center" style="border-right: 1px solid black"
						colspan="2"><%=name%></td>
					<td align="center" colspan="1"><%=regdate%></td>
				</tr>
				<%
					} //for
				%>
				<%
					} //if
				%>



				<tr>
					<td align="left" style="border-right: 1px solid black" colspan="6">
						<!-- 페이징 및 블럭 처리 Start--> <%
 	int pageStart = (nowBlock - 1) * pagePerBlock + 1; //하단 페이지 시작번호
 int pageEnd = ((pageStart + pagePerBlock) <= totalPage) ? (pageStart + pagePerBlock) : totalPage + 1;
 //하단 페이지 끝번호
 if (totalPage != 0) {
 	if (nowBlock > 1) {
 %> <a href="javascript:block('<%=nowBlock - 1%>')"><input
							id="listnumbtn" type="button" value="prev"></a> <%
 	}
 %>&nbsp; <%
 	for (; pageStart < pageEnd; pageStart++) {
 %> <a href="javascript:pageing('<%=pageStart%>')"> <%
 	if (pageStart == nowPage) {
 %> <%
 	}
 %> <input id="listnumbtn" type="button" value="<%=pageStart%>">
							<%
								if (pageStart == nowPage) {
							%> <%
 	}
 %></a> <%
 	} //for
 %>&nbsp; <%
 	if (totalBlock > nowBlock) {
 %> <a href="javascript:block('<%=nowBlock + 1%>')"><input
							id="listnumbtn" type="button" value="next"></a> <%
 	}
 %>&nbsp; <%
 	}
 %> <!-- 페이징 및 블럭 처리 End-->
					</td>
					<td align="center" colspan="1"><a href="javascript:list()"><input
							id="listnumbtn" type="button" value="처음으로"></a></td>
				</tr>


			</table>
			<%
				}
			%>
			<!-- </div> -->
			<!-- 리스트형 게시판 끝 ////////////////////////////////////////-->
			<form name="searchFrm" method="get" action="list.jsp"></form>
			<form name="listFrm" method="post">
				<input type="hidden" name="reload" value="true"> <input
					type="hidden" name="nowPage" value="1">
			</form>
			<form name="readFrm" method="get">
				<input type="hidden" name="num"> <input type="hidden"
					name="nowPage" value="<%=nowPage%>"> <input type="hidden"
					name="keyField" value="<%=keyField%>"> <input type="hidden"
					name="keyWord" value="<%=keyWord%>">
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