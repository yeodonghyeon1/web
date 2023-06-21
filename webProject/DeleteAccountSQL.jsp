<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>
<html>
<body>
<%
	// 세션에서 사용자 아이디값을 얻습니다.
	String UserId = (String)session.getAttribute("SessionID");
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "1234");
		
		// SQL DELETE문
		pstmt = conn.prepareStatement("DELETE FROM idpw WHERE UserId = ?");
		System.out.println(UserId);
		pstmt.setString(1, UserId);
		
		int result = pstmt.executeUpdate();
		
		if (result == 1) { // 탈퇴 성공
			session.invalidate(); //세션에서 정보 삭제
			response.sendRedirect("DeleteAccountSuccess.jsp");
		} else { // 탈퇴 실패
			response.sendRedirect("MyPage.jsp");
		} 
	} catch (Exception e) {
		System.out.println("exception");
	} finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch(Exception e) {}
	}
%> 
	
</body>
</html>