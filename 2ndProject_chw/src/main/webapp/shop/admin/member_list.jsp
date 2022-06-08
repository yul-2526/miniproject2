<%@page import="member.MemberDao"%>
<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "admain_top.jsp"%>

<script type="text/javascript">
	function del(pnum,pimage){ 
		
		var answer = window.confirm("해당 유저를 탈퇴시키겠습니까?");
		
		if(answer){ 
			location.href="mem_delete.jsp?pnum="+pnum;
		}
	}
</script>

<%
MemberDao mdao=MemberDao.getInstance();
ArrayList<MemberBean> list=mdao.getAllMember();
%>

	<table>
	<tr>
	<td colspan="7"><br><br></td>
	</tr>

		<tr >
			<th align="center" bgcolor="pink" class="table">번호</th>
			<th align="center" bgcolor="pink" class="table">유저 이름</th>
			<th align="center" bgcolor="pink" class="table">유저 아이디</th>
			<th align="center" bgcolor="pink" class="table">주소</th>
			<th align="center" bgcolor="pink" class="table">이메일</th>
			<th align="center" bgcolor="pink" class="table">전화번호</th>
			<th align="center" bgcolor="pink" class="table">삭제</th>
		</tr>
		<%
		if(list.size()==0){
			out.print("<tr><td colspan=7 align='center'></td></tr>");
		}else{
			for(MemberBean mb : list){
				%>
				<tr>
					<td align="center"><%=mb.getNum()%></td>
					<td align="center"><%=mb.getName() %></td>
					<td align="center"><%=mb.getId() %></td>
					<td align="center"><%=mb.getAddress() %></td>
					<td align="center"><%=mb.getEmail() %></td>
					<td align="center">010-<%=mb.getHp1() %>-<%=mb.getHp2() %></td>
					<td>
						<a href="javascript:del('<%=mb.getNum()%>')">삭제</a>
					</td>
				</tr>
				<%
			}
		}
		%>
	</table>


<%@ include file = "admain_bottom.jsp"%>

    