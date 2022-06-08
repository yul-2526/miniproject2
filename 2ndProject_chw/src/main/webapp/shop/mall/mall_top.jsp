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
			<a href="<%=conPath %>/shop/mall/mall_main.jsp">
				<img src="<%=conPath %>/images/장미로고.png"  width="100" height="100">
			</a>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<%
				if(mid.equals("admin")){
			%>
					<a href="<%=conPath%>/shop/admin/admin_main.jsp">관리자홈</a> |
			<%
				}
			%> 
			<a href="<%=conPath %>/shop/mall/mall_cartList.jsp">장바구니</a> | 
			<a href="<%=conPath%>/shop/board/list.jsp">커뮤니티</a> | 
			<a href="<%=conPath%>/shop/mypage/mypage_main.jsp?id=<%=mid %>">마이페이지</a>
			
			<a href="<%=conPath %>/shop/login/logout.jsp" class="right">
				<img src="<%=conPath %>/images/logout.png" width="50" height="20">
			</a>
			
			<span class="right"><%=mid %>님</span>
			
			
		</td>
	</tr>
	<tr height="400">
		<td width="150px" align="center" valign="top">
			카테고리
			<table>
 			<%
			CategoryDao cdao = CategoryDao.getInstance();
			ArrayList<CategoryBean> lists = cdao.categoryAll();
			if(lists.size()==0){
				out.print("<tr><td>등록된 카테고리 없음</td></tr>");
			}
			
			for( CategoryBean cb : lists){
			%>
				<tr class="menu">
					<td>
						<a href="<%=conPath %>/shop/mall/mall_cgList.jsp?cname=<%=cb.getCname() %>&code=<%=cb.getCode() %>">
							<font color="#EFEFE2"><%=cb.getCname()%></font>
						</a>
					</td>
				</tr>	
			<%
			}//for
			%> 
			</table>
		</td>
		<td width="550" align="center">
		
		
		
		