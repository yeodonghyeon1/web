<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>


<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
//로그인 함수
	
String CreateUserId = request.getParameter("UserId");
String CreateUserPwd = request.getParameter("UserPwd");
String CreateUserName = request.getParameter("UserName");
String CreateUserEmail = request.getParameter("UserEmail");

try {
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from idpw");
	
	/* mysql에 database DB만들고 idpw 테이블 생성
	   UserId varchar(45) PK 
	   UserPwd varchar(45) 
	   UserName varchar(45) 
	   UserEmail varchar(45)
	*/
	
	
	if(rs != null){
		while(rs.next()){
			if(rs.getString("UserID").equals(CreateUserId)){
				
				%><jsp:forward page = "CreateAccount.jsp" >
				 <jsp:param value = "아이디가 중복되었습니다." name = "msg" />
				 </jsp:forward><%	
				 
			}
			else if(rs.getString("UserName").equals(CreateUserName)){
				%><jsp:forward page = "CreateAccount.jsp" >
				 <jsp:param value = "이름이 중복되었습니다." name = "msg" />
				 </jsp:forward><%
			}
			else if(rs.getString("UserEmail").equals(CreateUserEmail)){
				%><jsp:forward page = "CreateAccount.jsp" >
				 <jsp:param value = "이메일이 중복되었습니다." name = "msg" />
				 </jsp:forward><%
			}
		}
	}
	

	

	if (rs != null)
		try {
	rs.close();
		} catch (SQLException ex) {
			System.out.println("rs안닫힘");
		}
	if (stmt != null)
		try {
	stmt.close();
		} catch (SQLException ex) {
			System.out.println("stmt안닫힘");
		}
	
	
	
	
	


	pstmt = conn.prepareStatement("INSERT INTO idpw VALUES (?, ?, ?, ?)");
	System.out.println(CreateUserId + CreateUserPwd + CreateUserName + CreateUserEmail);
	pstmt.setString(1 , CreateUserId);
	pstmt.setString(2, CreateUserPwd);
	pstmt.setString(3, CreateUserName);
	pstmt.setString(4, CreateUserEmail);


	pstmt.executeUpdate();




	

	
} catch (SQLException sqlException) {
	System.out.println("sql exception");
} catch (Exception exception) {
	System.out.println("exception");
} finally {
	if (pstmt != null)
		try {
	pstmt.close();
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

response.sendRedirect("CreateAccountSucces.jsp"); //회원가입 성공했다는 페이지로 안 넘어가요ㅠ


%>

