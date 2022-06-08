<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "admain_top.jsp"%>


<%
	CategoryDao cdao = CategoryDao.getInstance();
	ArrayList<CategoryBean> list = cdao.categoryAll();
%>

		<table  width="500" >
			<tr align="center">
				<td colspan="4" align="left	">
					<input type="button" value="카테고리 추가" class="bt" onClick="location.href='cate_add.jsp'">
				</td>
			</tr>
			<tr>
				<th  align="center" bgcolor="pink" class="table">번호</th>
				<th  align="center"  bgcolor="pink" class="table">카테고리 코드</th>
				<th  align="center"  bgcolor="pink" class="table">카테고리명</th>
				<th  align="center"   bgcolor="pink" class="table">삭제</th>
			</tr>
			<%
				if(list.size() == 0){
					out.println("<tr><td colspan=4 align=center>등록된 카테고리가 없습니다.</td></tr>");
				}
				for( int i=0;i<list.size();i++){
					CategoryBean cb = list.get(i);
			%>
					<tr>
						<td><%=cb.getCnum() %></td>
						<td><%=cb.getCode() %></td>
						<td><%=cb.getCname() %></td>
						<td><a href="cate_delete.jsp?cnum=<%=cb.getCnum() %>">삭제</a></td>
					</tr>
			<%					
				}//for
			%>

		</table>


<%@ include file = "admain_bottom.jsp"%>

    