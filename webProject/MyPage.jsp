<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width">
<title>과제 풀이 사이트</title>
<link rel="stylesheet" type="text/css" href="Mypage_option.css">
</head>

<body>
   <div class="nav">
      <%if(session.getAttribute("SessionUser") == null) {%>
      		<%="" %>
      <%}else{ %>
      		<%=session.getAttribute("SessionUser")%>님
      <%}%>
      <div class="nav-items"></div>
      <div id="page">
         <header>
            <div id="logo"></div>
            <div id="top_menu">
               <a href="mainpage.jsp">HOME</a> <a href="Logout.jsp"> LOGOUT </a>
            </div>
         </header>

      </div>
   </div>
   
   <main>
      <aside>
         <ul class="sidebar">
            <li><a href="mypage3.jsp">내 게시글</a></li>
            <li><a href="InformationAccount.jsp">계정 정보 수정</a></li>
            <li><a href="DeleteAccount.jsp">회원 탈퇴</a></li>
         </ul>
      </aside>
      <div class="content">
         <div class="divider"></div>
         <article>
            <h2>본문 표시 영역</h2>
            <table class = "table table-hover">
            <thead>
            	<tr><th>글 번호</th><th>글 제목</th><th>작성자</th><th>작성일자</th></tr>
            </thead>
            
            </table>
         </article>
      </div>
   </main>
</body>
</html>