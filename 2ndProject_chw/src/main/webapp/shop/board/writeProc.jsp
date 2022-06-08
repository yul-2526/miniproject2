<%@page import="board.BoardDao"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
writeForm.jsp => writeProc.jsp <br>
<!-- 넘어오는 데이터(이름,제목,Email,내용,비번) Bean으로 묶고
bdao.insertArticle(Bean) 
성공하면 목록보기 이동
실패하면 writeForm.jsp로 이동 -->
<%
request.setCharacterEncoding("UTF-8");

%>
<jsp:useBean id="bb" class="board.BoardBean" />
<jsp:setProperty property="*" name="bb" />
<!-- 
setWriter()
setSubject()
setEmail()
setPasswd()
setContent()
 -->
 <!-- setReg_date(오늘날짜) 
 setIp(ip주소)
 -->
 
 <%
 bb.setReg_date(new Timestamp(System.currentTimeMillis())); 
 bb.setIp(request.getRemoteAddr());
 
 BoardDao bdao = BoardDao.getInstance();
 bdao.insertArticle(bb); 
 response.sendRedirect("list.jsp");
 %>

