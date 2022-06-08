<%@page import="board.BoardBean"%>
<%@page import="board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
updateForm.jsp => updateProc.jsp <br>
<!-- 번호,이름,제목,이메일,내용,비번,pageNum -->
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bb" class="board.BoardBean" />
<jsp:setProperty property="*" name="bb" />

<%
   BoardDao bdao = BoardDao.getInstance();
   int cnt = bdao.updateArticle(bb);
   if(cnt > 0){
	   response.sendRedirect("list.jsp?pageNum="+request.getParameter("pageNum"));
   }
   else{
	   //response.sendRedirect("updateForm.jsp?num="+bb.getNum());
	%>
	  <script type="text/javascript">
		   alert('비번이 맞지 않습니다.');
		   history.go(-1);
	</script>
	<%   
   }
%>


 