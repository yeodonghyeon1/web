<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>
    
    
<%


Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String msg = request.getParameter("msg");


//로그인 함수

try {
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from idpw");
	
	
%>





<!DOCTYPE html>
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

      <div class="collapse navbar-collapse"
         id="bs-example-navbar-collapse-1">
         <ul class="nav navbar-nav">
            <li><a href="mainpage.jsp">HOME</a></li>
            <li><a href="mainpage.jsp">게시판</a></li>
         </ul>
         <ul class="nav navbar-nav navbar-right">
            <li class="dropdown"><a href="#" class="dropdown-toggle"
               data-toggle="dropdown" role="button" aria-haspopup="ture"
               aria-expanded="false">Menu<span class="caret"></span></a>
               <ul class="dropdown-menu">
                  <li><a href="Login.jsp">Login</a></li>
                  <li class="active"><a href="CreateAccount.jsp">Join</a></li>
               </ul></li>

         </ul>
      </div>
   </nav>

 
 <%--  나중에 중복확인 기능 추가할 때 사용 지금 버튼 이벤트가 자꾸 안되서 그냥 놔둠
 
        아이디: <input name = "CreateUserId"><input type="submit" value ="중복확인" onclick = 'IdCheck();'></p>
		비밀번호: <input name="CreateUserPwd"></p>
		사용자 이름: <input name = "UserId"><input type="submit" value ="중복확인"></p>
		이메일: <input name = "UserId"><input type="submit" value ="중복확인"></p>
--%>  
    
      <div class="container">
      <div class="col-lg-4"></div>
      <div class="col-lg-4">
         <div class="jumbotron" style="padding-top: 20px;">
         <form method = "post" action="CreateAccountSQL.jsp">
            <h3 style="text-align: center;">회원가입</h3>
            <div class="form-group">
               <input type="text" class="form-control" placeholder="아이디"
                  name="UserId">
            </div>
            <div class="form-group">
               <input type="password" class="form-control" placeholder="비밀번호"
                  name="UserPwd">
            </div>
            <div class="form-group">
               <input type="text" class="form-control" placeholder="이름"
                  name="UserName">
            </div>
               <div class="form-group">
                  <input type="email" class="form-control" placeholder="이메일" name="UserEmail">
               </div>

            </div>

            <input type="submit" class="btn btn-primary form-control"
               value="회원가입">
               
            <%if(msg != null){%>
			<%=msg%>
			<%}%>
			
          </form>
         </div>
      </div>
      <div class="col-lg-4"></div>
   </div>

   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
   <script src="js/bootstrap.js"></script>

</body>
</html>
		




<%
	
} catch (SQLException sqlException) {
	System.out.println("sql exception");
} catch (Exception exception) {
	System.out.println("exception");
} finally {
	if (rs != null)
		try {
	rs.close();
		} catch (SQLException ex) {
		}
	if (stmt != null)
		try {
	stmt.close();
		} catch (SQLException ex) {
		}
	if (conn != null)
		try {
	conn.close();
		} catch (Exception ex) {
		}
}




%>