<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file = "../mall/mall_top.jsp"%>
content.jsp=>replyForm.jsp <br>
<%
	String ref = request.getParameter("ref");
	String re_level = request.getParameter("re_level");
	String re_step = request.getParameter("re_step");
	out.print(ref+"/"+re_step+"/"+re_level+"<br>"); // 지금 작성하려는 답글의 부모 정보 
%>

<style type="text/css">
	body{
		text-align: center;
	}
	table{
		margin:auto;
	} 
</style>
<b>답글쓰기</b>

<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="check.js"></script>


<form method="post" action="replyProc.jsp">
	<input type="hidden" name="ref" value="<%=ref %>" />
	<input type="hidden" name="re_step" value="<%=re_step %>" />
	<input type="hidden" name="re_level" value="<%=re_level %>" />

	<table border="1">
		<tr>
			<td colspan="2" align="right"><a href="list.jsp">글목록</a></td>
		</tr>
		
		<tr>
			<td align="center">이름</td>
			<td><input type="text" name="writer" value="홍길동"></td>
		</tr>
		
		<tr>
			<td align="center">제목</td>
			<td><input type="text" name="subject" value="[답글]"></td>
		</tr>
		
		<tr>
			<td align="center">Email</td>
			<td><input type="text" name="email" value="aa@xx.com"></td>
		</tr>
		
		<tr>
			<td align="center">내용</td>
			<td><textarea name="content" rows="15" cols="50">호호호</textarea></td>
		</tr>
		
		<tr>
			<td align="center">비밀번호</td>
			<td><input type="password" name="passwd" value="1234"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="답글쓰기" onClick="return check()">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onClick="location.href='list.jsp'">
			</td>
		</tr>
	</table>

</form>
 <%@ include file = "../mall/mall_bottom.jsp"%>