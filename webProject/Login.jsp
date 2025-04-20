<%@ page language="java" contentType="text/html; charset = UTF-8"
   pageEncoding="UTF-8"%>

<%-- 참고:   https://peterkimlab.github.io/jsp/JSP-%EA%B2%8C%EC%8B%9C%ED%8C%90-%EC%9B%B9-%EC%82%AC%EC%9D%B4%ED%8A%B8-%EB%A7%8C%EB%93%A4%EA%B8%B0/ --%> 


<!DOCTYPE html>
<%String msg = request.getParameter("msg"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>과제 풀이 사이트</title>
</head>

<body>
   <nav class="navbar navbar-default">
      <div class="navbar-header">
         <button type="button" class="navbar-toggle collapsed"
            data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
            aria-expanded="false"></button>
         <a class="navbar-brand">과제 풀이 사이트</a>
      </div>

      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
            <li><a href="mainpage.jsp"> HOME</a></li>
         </ul>
         <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
               <a href="#" class = "dropdown-toggle"
                  data-toggle = "dropdown" role = "button" aria-haspopup = "ture"
                  aria-expanded = "false">Menu<span class = "caret"></span></a>
               <ul class="dropdown-menu">
                  <li class="active"><a href="login.jsp">Login</a></li>
                  <li><a href="CreateAccount.jsp">Join</a></li>
               </ul>
            </li>

         </ul>
      </div>
   </nav>
	<div class = "container">
      <div class = "col-lg-4"></div>
      <div class = "col-lg-4">
         <div class = "jumbotron" style = "padding-top: 20px;">
         <form method = "post" action="LoginSQL.jsp">
            <h3 style = "text-align: center;">로그인</h3>
            <div class = "form-group">
               	<input type = "text" class = "form-control" placeholder = "아이디" name = "UserId">
            </div>
            <div class = "form-group">
               	<input type = "password" class = "form-control" placeholder = "비밀번호" name = "UserPwd">
            </div>
            <input type="submit" class = "btn btn-primary form-control" value = "로그인">
         </form>
      </div>
      </div>
      <div class = "col-lg-4"></div>
   </div>

   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>

</body>
</html>