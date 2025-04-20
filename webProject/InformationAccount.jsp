<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>
<html>
  
<%-- 참고:   https://rsorry.tistory.com/189 --%> 
<%-- 계정정보 수정(InformationAccount, UpdateAccount, UpdateAccountSQL), 회원탈퇴(DeleteAccount) --%>
<%
	// 수정 화면으로 가기 전에 아이디를 기준으로 회원정보를 조회해서 다음 화면으로 전달
	
	String UserId = (String)session.getAttribute("SessionID"); //세션 아이디 가져오기
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String UserPwd= "";
	String UserName = "";
	String UserEmail = "";
	
	try {
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "1234");
		
		pstmt = conn.prepareStatement("SELECT * FROM idpw WHERE UserId = ?");
		pstmt.setString(1, UserId);
		
		rs = pstmt.executeQuery();
		
		if (rs.next()) {
			if(rs.getString("UserId").equals(UserId)){
				UserPwd = rs.getString("UserPwd");
				UserName = rs.getString("UserName");
				UserEmail = rs.getString("UserEmail");
			}
			
			System.out.println("rs.next() 값:" + UserId + UserPwd + UserName + UserEmail);
			// 포워드로 전달하기 위해
			request.setAttribute("UserId", UserId);
			request.setAttribute("UserPwd", UserPwd);
			request.setAttribute("UserName", UserName);
			request.setAttribute("UserEmail", UserEmail);
			
			// 포워드로 UpdateAccount.jsp 이동
			request.getRequestDispatcher("UpdateAccount.jsp").forward(request, response);
			
		} else { // 세션이 만료된 경우
			response.sendRedirect("MyPage.jsp"); 
		} 
	} catch (Exception e) {
		System.out.println("exception");
	} finally {
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch(Exception e) {}
	}
%>
  
</body>
</html>