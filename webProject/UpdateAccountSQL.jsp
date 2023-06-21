<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>
<html>
<body>
<%
	// UpdateAccount.jsp <form>에서 받은 데이터를 처리
	
	request.setCharacterEncoding("UTF-8");
	
	String UserId = request.getParameter("UserId");
	String UserPwd = request.getParameter("UserPwd");
	String UserName = request.getParameter("UserName");
	String UserEmail = request.getParameter("UserEmail");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "1234");
		
		//SQL UPDATE문
		pstmt = conn.prepareStatement("UPDATE idpw SET UserPwd = ?, UserName = ?, UserEmail = ? WHERE UserId = ?");
		System.out.println(UserPwd + UserName + UserEmail); // 여기는 되는데.....
		pstmt.setString(1, UserPwd);
		pstmt.setString(2, UserName);
		pstmt.setString(3, UserEmail);
		
		int result = pstmt.executeUpdate();
		
		if (result == 1) { // 업데이트 성공  왜 성공을 못 시키냐 야이바보야 코딩똥손아
			//session.setAttribute("SessionUser", UserName); //세션에 저장된 사용자 이름 변경
			response.sendRedirect("UpdateAccountSuccess.jsp");
		} else { // 업데이트 실패
			response.sendRedirect("UpdateAccountFail.jsp");
		} 
	} catch (Exception e) {
		System.out.println("exception");
		response.sendRedirect("UpdateAccountFail.jsp");
	} finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch(Exception e) {}
	}
%> 
	
</body>
</html>