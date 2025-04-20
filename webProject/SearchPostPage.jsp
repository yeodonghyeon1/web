<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>
<%@ page import= "myapp.main" import= "java.util.ArrayList"%>
    
 <%  
 
 
 Class.forName("com.mysql.cj.jdbc.Driver");
 Connection conn = null;
 Statement stmt = null;
 ResultSet rs = null;
 String text = request.getParameter("text");
 PreparedStatement pstmt = null;
 String PostName = "PostName";
 
try {
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "1234");
stmt = conn.createStatement();

pstmt = conn.prepareStatement("select * from post WHERE PostName like ? OR PostUser like ?  ORDER BY PostNumber DESC");

pstmt.setString(1, "%" + text + "%");
pstmt.setString(2, "%" + text + "%");





 %>
 
 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <link href="./test.css" rel="stylesheet" type="text/css" />
<title>검색</title>
</head>
<body>
    <div class="top-menu">
      <div class="page-name">검색</div>
      <div class="menu-items">
      
      
      <%-- 로그인되면 이름으로 변경됨. 이름을 클릭하면 마이페이지 접속--%>
        <a href="mainpage.jsp">HOME</a> 
        
        <%if(session.getAttribute("SessionUser") == null) {%>
            <a href="Login.jsp">LOGIN</a> 
        <%}else{ %>
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
    <div class="search-section">
   	 <form method = "post" action  = "SearchPostPage.jsp">
      <input type="text" name = "text" value=<%=text%>>
      <button type="submit">검색</button>
      </form>
    </div>
      <div class="recent-questions">
    	<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
		<tbody>
		<% rs = pstmt.executeQuery();
		if(rs != null)
		//int[] PostCount = new int[10];
		while(rs.next()){
			String number = rs.getString("PostNumber");
			String postname = rs.getString("PostName");
			String date = rs.getString("PostDate");
			String user = rs.getString("PostUser");
			String click = rs.getString("PostClick");%>
		<tr>
			<td><%=number%></td>
			<td><a href="WriteIn.jsp?number=<%=number%>"><%=postname%></a></td>
			<td><%=user%></td>
			<td><%=date%></td>
			<td><%=click%></td>
		</tr>
		<%}%>

		</tbody>
		</table>
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