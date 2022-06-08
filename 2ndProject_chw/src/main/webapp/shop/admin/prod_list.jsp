<%@page import="mall.ProductBean"%>
<%@page import="mall.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "admain_top.jsp"%>

<script type="text/javascript">
	function del(pnum,pimage){ 
		
		var answer = window.confirm("정말 삭제하시겠습니까?");
		
		if(answer){ 
			location.href="prod_delete.jsp?pnum="+pnum+"&pimage="+pimage;
			
		}
	}
</script>
<%
String cname = request.getParameter("cname");
String code = request.getParameter("code");
ProductDao pdao=ProductDao.getInstance();
ArrayList<ProductBean> list=pdao.selectByCategory(code);
%>
	<table>
	<tr>
	<td colspan="7"><br><br></td>
	</tr>
		<tr align="center">
			<td colspan="2" align="left	">
				<input type="button" value="상품 추가" class="bt" onClick="location.href='prod_add.jsp'">
			</td>
				<td colspan="5" align="right">
					<form action="prod_list.jsp" method="post">
						<input type="text" name="code" value="">
						<input type="submit" value="카테고리로 검색" class="bt">
					</form>
				</td>
		</tr>
		<tr class="m2">
			<th align="center" bgcolor="pink" class="table">번호</th>
			<th align="center" bgcolor="pink" class="table">상품코드</th>
			<th align="center" bgcolor="pink" class="table">상품명</th>
			<th align="center" bgcolor="pink" class="table">이미지</th>
			<th align="center" bgcolor="pink" class="table">가격</th>
			<th align="center" bgcolor="pink" class="table">수량</th>
			<th align="center" bgcolor="pink" class="table">수정/삭제</th>
		</tr>
		<%
		if(list.size()==0){
			out.print("<tr><td colspan=7 align='center'></td></tr>");
		}else{
			for(ProductBean pb : list){
				%>
				<tr>
					<td align="center"><%=pb.getPnum()%></td>
					<td align="center"><%=pb.getPcate() %></td>
					<td align="center"><%=pb.getPname() %></td>
					<%
					String imgPath=request.getContextPath()+"/shop/images/"+pb.getPimage();
					%>
					<td align="center">
					<a href="prod_view.jsp?pnum=<%=pb.getPnum() %>"><img src="<%=imgPath%>" width=40 height=40></a>
					</td>
					<td align="center"><%=pb.getPrice() %>원</td>
					<td align="center"><%=pb.getPqty() %>개</td>
					<td>
					<a href="prod_update.jsp?pnum=<%=pb.getPnum() %>">수정</a> / 
					<a href="javascript:del('<%=pb.getPnum()%>')">삭제</a>
					</td>
				</tr>
				<%
			}
		}
		%>
	</table>


<%@ include file = "admain_bottom.jsp"%>

    