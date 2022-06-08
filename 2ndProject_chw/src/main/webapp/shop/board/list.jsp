<%@page import="board.BoardDao"%>
<%@page import="board.BoardBean"%>  
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../mall/mall_top.jsp"%>

<style type="text/css"> 
	body{
		text-align: center;
	} 
	table{
		margin:auto;
	}
</style>

<%
	String pageNum = request.getParameter("pageNum");
	System.out.println("pageNum:" + pageNum);
	
	if(pageNum == null){
		pageNum = "1";
	}
	 
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	int pageSize = 10; // 한 페이지에 10개의 글이 보이도록 하겠다.
	int currentPage = Integer.parseInt(pageNum); // "1"=>1
	int startRow = (currentPage-1) * pageSize +1;
	int endRow = currentPage * pageSize;
	/* 1페이지클릭 : 1,10 
	2페이지클릭 : 11,20 
	3페이지클릭 : 21,30  */       
	ArrayList<BoardBean> list = new ArrayList<BoardBean>();    
	BoardDao bdao = BoardDao.getInstance();   
	int count = bdao.getArticleCount();
	System.out.println("count:" + count);
	 
	int number = count - (currentPage-1) * pageSize; 
	list = bdao.getArticles(startRow,endRow);  
%> 

<table width="500" border="1">
	<tr>
		<td align="right"  colspan="6"><a href="writeForm.jsp">글쓰기</a></td>
	</tr>
	<tr>
		<td align="center">번호</td>
		<td align="center">제목</td>
		<td align="center">작성자</td>
		<td align="center">작성일</td>
		<td align="center">조회</td>
		<td align="center">IP</td>
	</tr>
	<%
		for(int i=0;i<list.size();i++){
			BoardBean article = list.get(i);
	%>
		<tr>
			<td align="center"><%= number-- %></td>
			<td>
			<%
				if(article.getRe_level()>0){
					int wid = article.getRe_level()*20; //20 40 60
			%>
					<img src="images/level.gif" width="<%=wid %>" height="15">
					<img src="images/re.gif">
			<%						
				}//if
			%>
			<a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>"><%= article.getSubject()%></a>
			
			<%
				if(article.getReadcount() >=10){
			%>
					<img src="images/hot.gif" height="13">
			<%					
				}//if
			%>
				
			</td>
			<td align="center"><%= article.getWriter() %></td>
			<td align="center"><%= sdf.format(article.getReg_date()) %></td>
			<td align="center"><%= article.getReadcount() %></td>
			<td align="center"><%= article.getIp()%></td>
		<tr>
	<%			
		}//for
	%>
</table>
<!-- 페이지 번호 설정 -->
<%
	if(count > 0){
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); // 전체 
		int pageBlock = 10; // 한 페이지
		
		int startPage = ((currentPage-1) / pageBlock*pageBlock) + 1;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		if(startPage > 10){
		%>
			<a href="list.jsp?pageNum=<%=startPage-10%>"> [이전] </a>
		<%
		}
		
		for(int i=startPage;i<=endPage;i++){
		%>
			<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
		<%			
		}//for
		
		if(endPage < pageCount){
		%>
			<a href="list.jsp?pageNum=<%=startPage+10%>"> [다음] </a>
		<%			
		}
	}
%>

 <%@ include file = "../mall/mall_bottom.jsp"%>