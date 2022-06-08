<%@page import="mall.ProductBean"%>
<%@page import="mall.ProductDao"%>
<%@page import="mall.CategoryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "admain_top.jsp"%>

<%
String pnum = request.getParameter("pnum");

ProductDao pdao = ProductDao.getInstance();
ProductBean bean  = pdao.selectByPnum(pnum);
%>
	<form action="prod_update_proc.jsp" method="post" enctype = "multipart/form-data">
			<table border="0" class="outline" width="600">
			<caption><b>상품 수정</b></caption>
				<tr>
					<th  align="center" bgcolor="pink" class="table">상품번호</th>
					<td>
						<%=bean.getPnum() %>		
						<input type="hidden" name="pnum" value="<%=bean.getPnum()%>">
							
					</td>
				</tr>
				
				<tr>
					<th align="center" bgcolor="pink" class="table">상품명</th>
					<td>
						<input type="text" name="pname" value="<%=bean.getPname()%>">
					</td>
				</tr>
			
				<tr>
					<th align="center" bgcolor="pink" class="table">카테고리</th>
					<td>
						<input type="text" name="pcate" value="<%=bean.getPcate()%>" disabled>
						<input type="hidden" name="pcate" value="<%=bean.getPcate()%>">
						
						<!-- 
						disabled 단독으론 데이터가 넘어가지 않아 hidden을 같이 사용
						readonly는 단독으로 사용해도 데이터가 넘어감
						-->
					</td>
				</tr>
				
				<tr> 
					<th align="center" bgcolor="pink" class="table">상품이미지</th>
					<td>
					<%
						String imgPath=request.getContextPath()+"/shop/images/"+bean.getPimage();
					%>
						<img src="<%=imgPath %>" width="100" height="100"> 
						<input type="file" name="pimage"> 
						<input type="text" name="pimage2" value="<%=bean.getPimage() %>"> 
					</td>
				</tr>
				
				<tr>
					<th  align="center" bgcolor="pink" class="table">상품 수량</th>
					<td>
						<input type="text" name="pqty" value="<%=bean.getPqty() %>">
					</td>
				</tr>
				
				<tr>
					<th align="center" bgcolor="pink" class="table">상품 가격</th>
					<td>
						<input type="text" name="price" value="<%=bean.getPrice() %>">
					</td>
				</tr>
				
				<tr>
					<th align="center" bgcolor="pink" class="table">상품 소개</th>
					<td>
						<textarea name="pinfo" rows=5 cols=50 style="resize:none;"><%=bean.getPinfo() %></textarea>
					</td>
				</tr>
				
				<tr>
					<th align="center" bgcolor="pink" class="table">상품 포인트</th>
					<td>
						<input type="text" name="pmile" value="<%=bean.getPmile() %>">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="상품수정" class="bt">
						<input type="button" value="취소" class="bt" onClick="location.href='prod_list.jsp'">
					</td>
				</tr>
			</table>
		</form>

<%@ include file = "admain_bottom.jsp"%>

    