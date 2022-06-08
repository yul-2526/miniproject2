<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="mall.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mall.CategoryDao"%>

<%
String conPath = request.getContextPath();
%>

<link rel="stylesheet" href="<%=request.getContextPath() %>/style.css">
<table align="center" width="750" >
	<tr>
		<td colspan="2" align="center" height="150"><img
			src="<%=conPath%>/images/장미로고.png" width="100" height="100"></td>
	</tr>
	<tr height="250">
		<td width="550" align="center">

			<h2>login</h2>
			<form method="post" action="<%=conPath%>/shop/login/loginProc.jsp">
				<table height="150">
					<tr>
						<td bgcolor="pink" class="table">아이디</td>
						<td><input type="text" name="id"></td>
					</tr>
					<tr border="1">
						<td bgcolor="pink" class="table">비번</td>
						<td><input type="password" name="password"></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="로그인" class="bt">
							<input type="button" class="bt" value="회원가입" onClick="location.href='<%=conPath%>/shop/login/regist.jsp'"> 
							<input type="button" class="bt" value="아이디 찾기" onClick="location.href='<%=conPath%>/shop/login/findid.jsp'"> 
							<input type="button" class="bt" value="비번 찾기" onClick="location.href='<%=conPath%>/shop/login/findpw.jsp'">
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">welcome</td>
	</tr>
</table>
