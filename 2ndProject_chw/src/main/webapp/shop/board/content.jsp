<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file = "../mall/mall_top.jsp"%>
list.jsp(제목클릭하면 번호를 넘긴다.)=>content.jsp<br>
           
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	out.print("num:" + num+"<br>");
	out.print("pageNum:" + pageNum+"<br>");
	
	BoardDao bdao = BoardDao.getInstance();
	BoardBean article = bdao.getArticle(num);
	out.print(article.getRef()+"/"+article.getRe_step()+"/"+article.getRe_level()+"<br>");
%>
<%@ include file="color.jsp" %>    

<body bgcolor="<%=bodyback_c%>">

<table border="1" width="500" align="center">
	<tr>
		<td align="center">글번호</td>
		<td align="center"><%=article.getNum() %></td>
		<td align="center">조회수</td>
		<td align="center"><%=article.getReadcount() %></td>
	</tr>
	<tr>
		<td align="center">작성자</td>
		<td align="center"><%=article.getWriter() %></td>
		<td align="center">작성일</td>
		<td align="center"><%=article.getReg_date() %></td>
	</tr>
	<tr>
		<td align="center">글제목</td>
		<td align="center" colspan="3"><%=article.getSubject() %></td>
	</tr>
	<tr height="50">
		<td align="center">글내용</td>
		<td align="center" colspan="3"><%=article.getContent() %></td>
	</tr>
	<tr align="center"  height="30">
		<td colspan="4">
			<input type="button" value="글수정" onclick="location.href='updateForm.jsp?num=<%=article.getNum() %>&pageNum=<%=pageNum%>'"> 
			<input type="button" value="글삭제" onClick="location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="답글쓰기"  onClick="location.href='replyForm.jsp?ref=<%=article.getRef()%>&re_step=<%=article.getRe_step()%>&re_level=<%=article.getRe_level()%>'">
        
			<input type="button" value="글목록" onClick="location.href='list.jsp?pageNum=<%=pageNum%>'">
		</td>
	</tr>
</table>
</body>
 <%@ include file = "../mall/mall_bottom.jsp"%>