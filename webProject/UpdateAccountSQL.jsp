<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>
<html>
<body>
<%-- alert 참고: https://homzzang.com/b/js-1748 --%>
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
		System.out.println(UserPwd + UserName + UserEmail +UserId); // 여기는 되는데.....
		pstmt.setString(1, UserPwd);
		pstmt.setString(2, UserName);
		pstmt.setString(3, UserEmail);
		pstmt.setString(4, UserId);//요거 추가 안해서 생긴 문제였음
		System.out.println("문제2");
		int result = pstmt.executeUpdate();
		System.out.println("문제");
		
		if (result == 1) { // 업데이트 성공  ERROR(수정함)
			session.setAttribute("SessionUser", UserName); //세션에 저장된 사용자 이름 변경%>
			<script> alert("성공적으로 계정 정보가 수정되었습니다.");
	 		 window.location.href = "MyPage.jsp";</script>
	 <%} 
		
		else { // 업데이트 실패%>
			<script> alert("계정 정보 수정에 실패하였습니다.");
		 			 window.location.href = "MyPage.jsp";</script>
	 <%} 
		
	} catch (Exception e) {
		System.out.println("exception");%>
		<script> alert("계정 정보 수정에 실패하였습니다.");
		 		 window.location.href = "MyPage.jsp";</script>
	<%} finally {
		try {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch(Exception e) {}
	}
%> 
	
</body>
</html>