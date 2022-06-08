<%@page import="board.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
replyForm.jsp => replyProc.jsp<br>
<!-- 이름,제목,email,내용,비번,ref,re_step,re_level 8가지 -->
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bb" class="board.BoardBean" />
<jsp:setProperty property="*" name="bb" />

<% 
	bb.setReg_date(new Timestamp(System.currentTimeMillis()));
	bb.setIp(request.getRemoteAddr());
	
	BoardDao bdao = BoardDao.getInstance();
	int cnt = bdao.replyArticle(bb); 
	
	if(cnt>0){
		response.sendRedirect("list.jsp");
	}
	else{
	%>
		<script type="text/javascript">
			alert("답글 생성 실패");
			history.go(-1);
		</script>
	<%
	}

%>






