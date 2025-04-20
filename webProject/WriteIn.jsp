<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>
<%@ page import= "myapp.main" import= "java.util.ArrayList"%>

<%


Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String msg = request.getParameter("msg");
PreparedStatement pstmt = null;
String postnumber =request.getParameter("number");
System.out.println("postnumber 받음:" + postnumber);
String postcategory = "";
String postname = "";
String postdate = "";
String postuser = "";
int postclick = 0;
String postcontent = "";
String postupload = "";
//로그인 함수

try {
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from post");
	
	//pstmt = conn.prepareStatement("DELETE FROM post WHERE UserId = ?");

	
	//int result = pstmt.executeUpdate();
	
	
%>









<!DOCTYPE html>
<html>
<head>
    <title>글쓰기</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
      <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>과제 풀이 사이트</title>
  <link href="./test.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <header>
    <div class="top-menu">
      <div class="page-name">과제 풀이 사이트</div>
      <div class="menu-items">
      
      
      <%-- 로그인되면 이름으로 변경됨. 이름을 클릭하면 마이페이지 접속--%>
      <%-- 로그인 되었을 경우만 글쓰기 나타남 --%>
        <a href="mainpage.jsp">HOME</a> 
        
        <%if(session.getAttribute("SessionUser") == null) {%>
            <a href="Login.jsp">LOGIN</a> 
        <%}else{ %>
        <a href="Write.jsp">글쓰기</a>
        <a href="MyPage.jsp"><%=session.getAttribute("SessionUser")%>님</a>
        <% } %>
        
        <%-- 로그인 안 되면 회원가입 페이지, 되면 로그아웃 페이지 --%>
        <%if(session.getAttribute("SessionUser") == null) {%>
        	<a href="CreateAccount.jsp">JOIN</a>
        <%}else{ %>
        <a href="Logout.jsp">LOGOUT</a>
        <% } %>
      </div>
    </div>
    <hr>
  </header>
  

  
<% 	
        if(rs != null){
        	while(rs.next()){
        		System.out.println(String.valueOf(rs.getString("PostNumber")));
            	if(rs.getString("PostNumber").equals(postnumber)){//현재 안쓰는 기능들 주석처리
            		 //postcategory = rs.getString("PostCategory");
            		 postname= rs.getString("PostName");
            		 //postdate=rs.getString("PostDate");
            		 postuser= rs.getString("PostUser");
            		 //postclick = rs.getString("PostClick");
            		 postcontent = rs.getString("PostContent");
            		 // postupload = rs.getString("PostUpload");
            		 break;

            	}
            	else{
            		
            	}
            		
        	}
        }


				
%>    <div class="container">
        <h1></h1>
   
        
        <form action="WriteIn.jsp" method="post">
       
        </form>
    </div>
    
</body>
    <div class="container">
        <h1>글쓰기</h1>
        <form action="WriteSQL.jsp" method="post">
            <div class="form-group">
                <label for="title">제목</label>
                <label type="text" class="form-control" name="title"><%=postname%></label>
                
            </div>
                <div class="form-group">
                <label for="title">작성자</label>
                <label type="text" class="form-control" name="title"><%=postuser%></label>
                
            </div>

<%-- 
            <div class="form-group">
                <label for="author">작성자</label>
                <input type="text" class="form-control" id="author" name="author" required>
            </div>
            
--%>
            <div class="form-group">
                <label for="content">내용</label>
                <label class="form-control" name="content" rows="5"><%=postcontent%></label>
            </div>
            
        </form>
    </div>
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

