<%@page import="mall.CategoryBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mall.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<link rel="stylesheet" href="<%=request.getContextPath() %>/style.css?after">

 <%
  	String mid = (String)session.getAttribute("mid");
 	String conPath = request.getContextPath();
 %>
<table align="center" width="750" bgcolor="#f6e9f3">
	<tr>
		<td colspan="2" align="center" height="150">
			<a href="<%=conPath %>/shop/admin/admin_main.jsp">
				<img src="<%=conPath %>/images/장미로고.png"  width="100" height="100">
			</a>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">

			<a href="<%=conPath%>/shop/login/main.jsp">로그인 창</a> | 
			<a href="<%=conPath%>/shop/mall/mall_main.jsp">회원 홈페이지</a>
			
			<a href="<%=conPath %>/shop/login/logout.jsp" class="right">
				<img src="<%=conPath %>/images/logout.png" width="50" height="20">
			</a>
			
			<span class="right"><%=mid %>님</span>
			
			
		</td>
	</tr>
	<tr height="400">
		<td width="150px" align="center" valign="top">
			<table >
				<tr class="menu">
					<td>
						<a href="<%=conPath%>/shop/admin/cate_list.jsp"><font color="#EFEFE2">상품 카테고리 목록</font></a>
					</td>
				</tr>	
				<tr class="menu">
					<td>
						<a href="<%=conPath%>/shop/admin/prod_list.jsp"><font color="#EFEFE2">상품 목록</font></a>
					</td>
				</tr>
				<tr class="menu">
					<td>
						<a href="<%=conPath%>/shop/admin/member_list.jsp"><font color="#EFEFE2">회원 관리</font></a>
					</td>
				</tr>			
			</table>
		</td>
		<td width="550" align="center">
		
		
		
		