<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>
<%@ page import= "myapp.main" import= "java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>
<%--참고:  https://sseozzzy.tistory.com/m/111--%>


<%


Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
PreparedStatement pstmt = null;

String title = request.getParameter("title"); //게시글 이름
String author = (String)session.getAttribute("SessionUser"); // 작성자
String content = request.getParameter("content"); // 내용
String upload = request.getParameter("upload"); //사진 또는 업로드 파일

int PostClick = 0; //조회수
Timestamp PostDate = new Timestamp(System.currentTimeMillis()); // 현재 날짜 출력

int postnumber = 0; //게시글 번호


//로그인 함수
try {
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "1234");
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from post ORDER BY PostNumber DESC");
	System.out.println("오류 1번");

	if(rs != null){
		if(rs.next()){	
		postnumber = Integer.parseInt(rs.getString("PostNumber"));
		postnumber++; //가장 마지막 게시글 다음 번호
	}
}
	
	
	
	//1번호, 2카테고리, 3게시글제목, 4날짜, 5사용자이름, 6 조회수, 7게시글내용, 8게시글 업로드
	pstmt = conn.prepareStatement("INSERT INTO post VALUES (?, ?, ?, ?, ?, ?, ?, ?)"); 
	System.out.println(postnumber + "카테고리" + title + PostDate + author + "조회수" + content + "upload");
	
	pstmt.setString(1 , String.valueOf(postnumber));
	pstmt.setString(2, null);
	pstmt.setString(3, title);
	pstmt.setTimestamp(4, PostDate);
	pstmt.setString(5, author);
	pstmt.setInt(6, PostClick);
	pstmt.setString(7, content);
	pstmt.setString(8, null);

	System.out.println("오류 2번");
	
	int result = pstmt.executeUpdate();
	System.out.println("문제");
	
	if (result == 1) { // 업데이트 성공  ERROR(수정함)%>
		<script> window.location.href = "mainpage.jsp";</script>
 <%} 
	
	else { // 업데이트 실패%>
		<script> alert("게시글 등록 실패.");
	 			 window.location.href = "mainpage.jsp";</script>
 <%} 
	System.out.println("오류 3번");
%>
	
	




<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

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

