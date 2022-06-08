<%@page import="mall.ProductBean"%>
<%@page import="mall.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String pnum = request.getParameter("pnum");


ProductDao pdao = ProductDao.getInstance();
ProductBean bean  = pdao.selectByPnum(pnum); 
%>
<%@ include file = "admain_top.jsp"%>

	<table class="outline" width="600">	
		<h3>상품상세보기</h3>
		<tr>
			<th bgcolor="pink" class="table">카테고리 코드</th>
			<td><%=bean.getPcate() %></td>
			<th bgcolor="pink" class="table">상품번호</th>
			<td><%=bean.getPnum() %></td>
		</tr>	
		<tr>
			<th bgcolor="pink" class="table">상품명</th>
			<td><%=bean.getPname() %></td>
		</tr>	
		<tr>
			<th bgcolor="pink" class="table">상품 이미지</th>
			<%
				String imgPath=request.getContextPath()+"/shop/images/"+bean.getPimage();
			%>
			
			<td colspan="3" align="center">
				<img width="100px" height="100px" src="<%=imgPath%>">
			</td>
		</tr>
		<tr>
			<th bgcolor="pink" class="table">상품 수량</th>
			<td><%=bean.getPqty() %></td>
			<th bgcolor="pink" class="table">상품 가격</th>
			<td><%=bean.getPrice() %></td>
		</tr>
		<tr>
			<th bgcolor="pink" class="table">적립 포인트</th>
			<td><%=bean.getPmile() %></td>
		</tr>	
		<tr>
			<th bgcolor="pink" class="table">상품소개</th>
			<td colspan="3">
				<textarea rows="5" cols="30" style="resize:none;" disabled><%=bean.getPinfo() %></textarea></td>
		</tr>
		<tr>
			<td colspan="4"  class="m1" align="center">
				<input type="button" onclick="history.back()" value="돌아가기" class="bt">
			</td>
		</tr>
	</table>
		
<%@ include file = "admain_bottom.jsp"%>
