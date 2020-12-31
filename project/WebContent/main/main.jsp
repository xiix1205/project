<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import = "project.MainBoardBean" %>
<%@page import = "project.BestBoardBean" %>
<%@page import = "project.MovieBean" %>
<%@page import = "news.BoardBean" %>
<%@page import="java.util.Vector" %>
<jsp:useBean id="bMgr" class="project.BoardMgr"/> 

<%
	request.setCharacterEncoding("EUC-KR");

	int numPerPage = 8;		//������ �� ���ڵ� ��
	int totalRecord = 0;	//��ü ���ڵ� ��
	int listSize = 0;		//���� �о�� �Խù��� ��
	int nowPage = 1;		//���� ������


	int mlistSize = 0;
	int blistSize = 0;
	int nlistSize = 0;
	
	String keyWord = "", keyField = "";
	Vector<MainBoardBean> vlist = null;
	
	
	String BkeyWord = "", BkeyField = "";
	Vector<BestBoardBean> blist = null;
	if(request.getParameter("BkeyWord")!= null){
		BkeyWord = request.getParameter("BkeyWord");
		BkeyField = request.getParameter("BkeyField");
	}
	
	String mWord = "", mField = "";
	Vector<MovieBean> mlist = null;
	if(request.getParameter("mWord")!= null){
		mWord = request.getParameter("mWord");
		mField = request.getParameter("mField");
	}
	
	String nWord = "", nField = "";
	Vector<BoardBean> nlist = null;
	if(request.getParameter("nWord")!= null){
		nWord = request.getParameter("nWord");
		nField = request.getParameter("nField");
	}

	if(request.getParameter("reload")!=null){
		if(request.getParameter("reload").equals("true")){
			keyWord = "";
			keyField = "";
			}
		}
	
	if(request.getParameter("reload")!=null){
		if(request.getParameter("reload").equals("true")){
			BkeyWord = "";
			BkeyField = "";
			}
		}
	
	
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	 String id = (String)session.getAttribute("idKey");
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MOVIE</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="jquery.js"></script>
    <script src="../js/jquery.bxslider.min.js"></script>
    <script src="../js/slide.js"></script>
    <script src="../js/link.js"></script>
    <link rel="stylesheet" href="../css/jquery.bxslider.min.css">
    <link rel="stylesheet" href="../css/shape.css">
     <link rel="stylesheet" href="../css/common.css"> 
<script> 
  $(function(){
      $('.post_wrap').bxSlider({
          auto: true,
          pause:4000,
          speed:600,  
          pager:false
        
      });
  });
  
  
  

</script>

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
                  <span class="btn" onclick="javascript:location.href='../news/list.jsp?listtype=1'">MovieNEWS</span>
                  <span class="btn" onclick="javascript:location.href='loc.jsp'">Theater</span> 
              </nav>
            </header>  
             
             <div id ="slider_wrap">
                <div id = "side" class="slide">
                    <ul>
                    <li><img src="images/slide1.jfif" width="1200px" height="500px"></li>  
                    <li><img src="images/slide2.jfif" width="1200px" height="500px"></li> 
                    <li><img src="images/slide3.jfif" width="1200px" height="500px"></li> 
                    <li><img src="images/slide4.jfif" width="1200px" height="500px"></li> 
                    </ul>    
                </div>
            </div>
                
              <div id="main">
               			
                  <section id="section">
                  
                      <h4 class = "w_title"><article>��ȭ</article></h4>
                      <a href="http://localhost:9988/project/subpage/boardList.bo?boardtype=BOARDMOVIE"><h6 class = "w_plus">+������</h6></a>
                     <div class="w_content">
                     	<%
								vlist = bMgr.getBoardList();
								listSize = vlist.size(); //������ ȭ�鿡 ��Ÿ�� �Խù� ����
									if(vlist.isEmpty()){
										out.println("��ϵ� �Խù��� �����ϴ�.");
									}
							%>	
                      		     
                          <ul class="_ul">
                              <li class="page1">
                                  <ul class="list_unit">
                                  <%
									for(int i = 0; i<numPerPage; i++){
										if(i == listSize)  
											break;
										MainBoardBean bean = vlist.get(i);
										int board_num = bean.getMOVIE_NUM();
										String subject = bean.getMOVIE_SUBJECT();
										String genre = bean.getMOVIE_GENRE();
										%>
                                    <li class="rank">
                                    	
                                    <span class="rank_wrap"><span class="rank_list"><%=i+1 %></span></span>
                                       <span class="rank_main"><a class="main_title" href="../subpage/boardDetail.bo?boardtype=<%=genre%>&board_num=<%=board_num%>&page=<%=nowPage%>"><%=subject %></a></span>
                                       </li>
                                     <% } %> 
                                  </ul>    
                              </li>
                          </ul>
                    </div>
                  </section>
                  
                  <section id="section2">
                    <h4 class = "w_title"><article>���</article></h4>
                      <a href="http://localhost:9988/project/subpage/boardList.bo?boardtype=BOARDFREE"><h6 class = "w_plus">+������</h6></a>
                      <div class="w_content">
                      	<%
								blist = bMgr.getBestList(BkeyField, BkeyWord);
								blistSize = blist.size(); //������ ȭ�鿡 ��Ÿ�� �Խù� ����
									if(blist.isEmpty()){
										out.println("��ϵ� �Խù��� �����ϴ�.");
									}
							%>	
                          <ul class="_ul">
                              <li class="page1">
                                  <ul class="list_unit">
                                  <%
									for(int i = 0; i< numPerPage; i++){
										if(i == blistSize)  
											break;
										BestBoardBean bean = blist.get(i);
										int board_num = bean.getFREE_NUM();
										String subject = bean.getFREE_SUBJECT();
										String genre = bean.getFREE_GENRE();
										%>
                                    <li class="rank">
                                      <span class="rank_wrap"><span class="rank_list"><%=i+1 %></span></span>
                                      <span class="rank_main"><a class="main_title" href="../subpage/boardDetail.bo?boardtype=<%=genre%>&board_num=<%=board_num%>&page=<%=nowPage%>"><%=subject %></a></span>
                                    </li>
                                   <% } %>
                                  </ul>    
                              </li>
                          </ul>
                    </div>
                    
                  </section>
                  
                  <section id="section3">
                      <h4 class = "m_banner"><article>�������</article></h4>
                    <div class="post_wrap">
                      <div class="post_view">
                        <%
                          mlist = bMgr.getMovieList(mField, mWord);
							mlistSize = mlist.size(); //������ ȭ�鿡 ��Ÿ�� �Խù� ����
								if(mlist.isEmpty()){
									out.println("��ϵ� �Խù��� �����ϴ�.");
								}
						%>
						<%
						for(int i = 0; i < 4; i++){
							if(i == mlistSize)  
								break;
						MovieBean bean = mlist.get(i);
							int m_id = bean.getM_id();
							String m_title = bean.getM_title();
							String m_poster = bean.getM_poster();
							String m_date = bean.getM_date();
						%>
					
                      <a href="../movieView.mo?m_id=<%=m_id%>" class="post_area">
                        <div class="post_thumb"> 
                        <img src="../moviefile/<%=m_poster%>" width="220" height="200"> 
                        </div>
                        <div class="post_info">
                            <span class="m_title"><span class="m_rank"><%=m_id%></span><%=m_title%></span>
                            <dl class="m_list">
                            <dt class="m_dt">������</dt>
                                <dd><%=m_date%></dd>
                            </dl>
                        </div>  
                       
                      </a>
                      <% } %> 
                        </div> 
                        
                         <div class="post_view">
                        <%
                          mlist = bMgr.getMovieList(mField, mWord);
							mlistSize = mlist.size(); //������ ȭ�鿡 ��Ÿ�� �Խù� ����
								if(mlist.isEmpty()){
									out.println("��ϵ� �Խù��� �����ϴ�.");
								}
						%>
						<%
						for(int i = 4; i < 8; i++){
							if(i == mlistSize)  
								break;
						MovieBean bean = mlist.get(i);
							int m_id = bean.getM_id();
							String m_title = bean.getM_title();
							String m_poster = bean.getM_poster();
							String m_date = bean.getM_date();
						%>
					
                      <a href="../movieView.mo?m_id=<%=m_id%>" class="post_area">
                        <div class="post_thumb"> 
                        <img src="../moviefile/<%=m_poster%>" width="220" height="200"> 
                        </div>
                        <div class="post_info">
                            <span class="m_title"><span class="m_rank"><%=m_id%></span><%=m_title%></span>
                            <dl class="m_list">
                            <dt class="m_dt">������</dt>
                                <dd><%=m_date%></dd>
                            </dl>
                        </div>  
                       
                      </a>
                      <% } %> 
                        </div> 
                          
                      
                      </div>
                               
                  </section>
                  <section id="section4">
                    <div id="news">
                    <%
                          nlist = bMgr.getNewsList(nField, nWord);
							nlistSize = nlist.size(); //������ ȭ�鿡 ��Ÿ�� �Խù� ����
								if(nlist.isEmpty()){
									out.println("��ϵ� �Խù��� �����ϴ�.");
								}
						%>
                      <ul class="news_list">
                      	<%
							for(int i = 0; i< 3; i++){
								if(i == nlistSize)  
									break;
							BoardBean bean = nlist.get(i);
								int news_num = bean.getNews_num();
							String news_subject = bean.getNews_subject();
							String img_a = bean.getImg_a();
							String content_a = bean.getContent_a();
							
						%>
                        <li>
                            <a href="../news/read.jsp?num=<%=news_num%>&listtype=1">
                               <%=img_a%>  
                                <div class="news_text">
                                <p class="news_title">
                                    <%=news_subject%>
                                </p>
                                    <div class="news_content">
                                    <%=content_a%>
                                    </div>    
                                </div>
                            </a>  
                        </li>
                        <% } %>
                        
                          <div class="news_plus"><a href="../news/list.jsp?listtype=1">MORE</a></div>
                        </ul>
                      
                      </div>
                  </section>
                </div>    
            
        
           
            <div id="footer">
                  <article>
              copyright@<br><br><hr><br>MOVIE�ֽ�ȸ��: ��õ������ ���� ������ 284 ���ͺ��� 4�� �������������б�<p/>��ǥ��ȭ: 032-555-1111&nbsp;/&nbsp;Email: movie@gmail.com 
                </article>      
              </div>
           
          </div>
      
</body>
</html>