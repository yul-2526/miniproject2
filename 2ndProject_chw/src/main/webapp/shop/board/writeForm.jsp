<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
writeForm.jsp<br>

<style type="text/css">
	body{
		text-align: center;
	}
	table{
		margin:auto;
	}
</style>
 <%@ include file = "../mall/mall_top.jsp"%>
<b>글쓰기</b>

<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="./js/jquery.js"></script>
<script type="text/javascript" src="check.js"></script>

<!-- include 액션태그:실행한결과
include 지시어:코드복붙 -->

<%@ include file="color.jsp" %>    

<body bgcolor="<%=bodyback_c%>">
<form method="post" action="writeProc.jsp">
	<table border="1">
		<tr>
			<td colspan="2" align="right"><a href="list.jsp">글목록</a></td>
		</tr>
		
		<tr>
			<td align="center" bgcolor="<%=value_c%>">이름</td>
			<td><input type="text" name="writer" value="홍길동"></td>
		</tr>
		
		<tr>
			<td align="center" bgcolor="<%=value_c%>">제목</td>
			<td><input type="text" name="subject" value="제목"></td>
		</tr>
		
		<tr>
			<td align="center" bgcolor="<%=value_c%>">Email</td>
			<td><input type="text" name="email" value="aa@xx.com"></td>
		</tr>
		
		<tr>
			<td align="center" bgcolor="<%=value_c%>">내용</td>
			<td><textarea name="content" rows="15" cols="50">호호호</textarea></td>
		</tr>
		
		<tr>
			<td align="center" bgcolor="<%=value_c%>">비밀번호</td>
			<td><input type="password" name="passwd" value="1234"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="글쓰기" onClick="return check()">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" onClick="location.href='list.jsp'">
			</td>
		</tr>
	</table>

</form>
</body>
 <%@ include file = "../mall/mall_bottom.jsp"%>