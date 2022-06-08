<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String conPath = request.getContextPath();
%>
<link rel="styleSheet" href="<%=conPath%>/style.css" />
<table align="center" width="750">
	<tr>
		<td colspan="2" align="center" height="150"><img
			src="<%=conPath%>/images/장미로고.png" width="100" height="100"></td>
	</tr>
	<tr height="250">
		<td width="550" align="center">

			<h2>아이디 찾기</h2>
			<form action="findidProc.jsp" method="post">
				<table width="550px" height="150" align="center">
					<tr>
						<th bgcolor="pink" class="table">이름</th>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<th bgcolor="pink" class="table">이메일</th>
						<td><input type="text" name="email"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="찾기" class="bt"> <input type="button" value="취소"
							onClick="location.href='<%=request.getContextPath()%>/shop/login/main.jsp'"
							class="bt"></td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">welcome</td>
	</tr>
</table>
