<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>


<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	String InputUserId = request.getParameter("UserId");
	String InputUserPwd = request.getParameter("UserPwd");
	boolean NotLoginId = false;
	boolean NotLoginPwd = false;
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from idpw");
	
	//로그인 확인 성공 실패 부분
	if (rs != null) {
		while (rs.next()) {
			if (rs.getString("UserId").equals(InputUserId)) {
				NotLoginId = true;
				if (rs.getString("UserPwd").equals(InputUserPwd)) {
					NotLoginPwd = true;
					// 세션 생성(사용자 아이디, 이름)
					session.setAttribute("SessionID", rs.getString("UserId"));
					session.setAttribute("SessionUser", rs.getString("UserName"));
					// 메인페이지로 이동
					response.sendRedirect("mainpage.jsp");
				}
			}
		}
	}
	
	// alert 참고:   https://cross-milestone.tistory.com/198
	if(NotLoginId == false){%>
 		<script> alert("아이디가 존재하지 않거나 일치하지 않습니다.");
				 history.back(); </script>
  <%} else if(NotLoginPwd == false){%>
		<script> alert("비밀번호가 일치하지 않습니다.");
				 history.back(); </script>
  <%} 
	


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