<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="check.js"></script>
 <%@ include file = "../mall/mall_top.jsp"%>    
content.jsp(num,pageNum) => updateForm.jsp<br>
<%
int num=Integer.parseInt(request.getParameter("num"));
int pageNum=Integer.parseInt(request.getParameter("pageNum"));
out.print("num:" + num+"<br>");
out.print("pageNum:" + pageNum+"<br>");

BoardDao bdao = BoardDao.getInstance();
BoardBean article = bdao.oneSelect(num);
 
 %>
 
<form method="post" action="updateProc.jsp?num=<%=article.getNum() %>"  onSubmit="return check()"> 
	
	<%-- <input type="hidden" name="num" value="<%=article.getNum() %>"> --%>
	<input type="hidden" name="pageNum" value="<%=pageNum %>">
	<table border="1">
		<tr>
			<td colspan="2" align="right"><a href="list.jsp">글목록</a></td>
		</tr>
		
		<tr>
			<td align="center">이름</td>
			<td><input type="text" name="writer" value="<%=article.getWriter()%>"></td>
		</tr>
		
		<tr>
			<td align="center">제목</td>
			<td><input type="text" name="subject" value="<%=article.getSubject()%>"></td>
		</tr>
		
		<tr>
			<td align="center">Email</td>
			<td><input type="text" name="email" value="<%=article.getEmail()%>"></td>
		</tr>
		
		<tr>
			<td align="center">내용</td>
			<td><textarea name="content" rows="15" cols="50"><%=article.getContent()%></textarea></td>
		</tr>
		
		<tr>
			<td align="center">비밀번호</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글쓰기">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onClick="location.href='list.jsp'">
			</td>
		</tr>
	</table>

</form>
 <%@ include file = "../mall/mall_bottom.jsp"%>