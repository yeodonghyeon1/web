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
	System.out.println("1번");
	
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
	
	
if(NotLoginId == false){
 	%><jsp:forward page="LoginPage.jsp" >
 		<jsp:param value="아이디가 존재하지 않거나 일치하지 않습니다." name="msg" />
 	</jsp:forward><%
 		}else if(NotLoginPwd == false){ 
	%><jsp:forward page="LoginPage.jsp">
 		<jsp:param value="비빌번호가 일치하지 않습니다." name="msg" />
 	</jsp:forward><%
            } 
	


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