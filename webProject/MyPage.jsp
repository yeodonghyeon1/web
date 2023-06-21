<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>과제 풀이 사이트</title>
  <link href="./test.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <header>
    <div class="top-menu">
      <div class="page-name">마이페이지</div>
      <div class="menu-items">
      
      
        <a href="mainpage.jsp">HOME</a> 
        
        <%if(session.getAttribute("SessionUser") == null) {%>
            <a href="Login.jsp">
        	LOGIN</a> 
        <%}else{ %>
        <a href="MyPage.jsp"><%=session.getAttribute("SessionUser")%>님</a>
        <% } %>
        
        <%-- 로그아웃 누르면 로그아웃 페이지로 --%>
        <a href="Logout.jsp">LOGOUT</a>
        
      </div>
    </div>
    <hr>
  </header>
  <aside>
    <ul>
  		<li><a href="InformationAccount.jsp">계정 정보 수정</a></li>
  		<li><a href="">내 게시글</a></li>
  		<li><a href="">내 댓글</a></li>
  		<li><a href="DeleteAccount.jsp">회원탈퇴</a></li>
   </ul>
  </aside>
</body>
</html>