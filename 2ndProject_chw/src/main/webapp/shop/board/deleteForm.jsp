<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file = "../mall/mall_top.jsp"%>
deleteForm.jsp<br>
<%
    request.setCharacterEncoding("UTF-8");
    int num = Integer.parseInt(request.getParameter("num"));
    int pageNum = Integer.parseInt(request.getParameter("pageNum"));
    out.print("num:"+num+"<br>");
    out.print("pageNum:"+pageNum+"<br>");
%>

<form method="post" action="deleteProc.jsp?num=<%=num%>">
	<%-- <input type="hidden" name="num" value="<%=num%>"> --%>
	<input type="hidden" name="pageNum" value="<%=pageNum%>">
	
	<table border="1" align="center">
		<tr>
			<td>비밀번호를 입력하세요</td>
		</tr>
		<tr>
			<td>비밀번호: <input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="글삭제">
				<input type="button" value="글목록">
			</td>
		</tr>
	</table>
</form>
 <%@ include file = "../mall/mall_bottom.jsp"%>