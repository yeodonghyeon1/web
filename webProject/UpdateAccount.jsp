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
      
      
      <%--  --%>
        <a href="mainpage.jsp">HOME</a> 
        
        <%if(session.getAttribute("SessionUser") == null) {%>
            <a href="Login.jsp">
        	LOGIN</a> 
        <%}else{ %>
        <a href="MyPage.jsp"><%=session.getAttribute("SessionUser")%>님</a>
        <% } %>
        
        <a href="Logout.jsp">LOGOUT</a>
        
      </div>
    </div>
    <hr>
  </header>
  

<%
	request.setCharacterEncoding("UTF-8");
	
	// information.jsp에서 데이터를 전달받아서 화면에 미리 보여지도록 처리
	String UserId = (String)request.getAttribute("UserId");
	String UserName = (String)request.getAttribute("UserName");
	String UserPwd = (String)request.getAttribute("UserPwd");
	String UserEmail = (String)request.getAttribute("UserEmail");
%>  
  
  
  	<form method="post" action="UpdateAccountSQL.jsp">
  		<table>
  			<tr>
  				<td>아이디</td>
  				<td><input type="text" name="UserId" value="<%=UserId%>" readonly></td>
  			</tr>
  			<tr>
  				<td>비밀번호</td>
  				<td><input type="password" name="UserPwd"value="<%=UserPwd%>"></td>
  			</tr>
  			<tr>
  				<td>사용자 이름</td>
  				<td><input type="text" name="UserName" value="<%=UserName%>"></td>
  			</tr>
  			<tr>
  				<td>이메일</td>
  				<td><input type="text" name="UserEmail" value="<%=UserEmail%>"></td>
  			</tr>
  			<tr>
  				<td><input type="submit" value="수정"></td>
  			</tr>
  		</table>
	</form>
	<button type="button" onclick="location.href='MyPage.jsp'">취소</button>
	
</body>
</html>