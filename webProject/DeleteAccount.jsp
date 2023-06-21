<%@ page language="java" contentType="text/html; charset=utf-8"
	import="java.sql.*" pageEncoding="utf-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>과제 풀이 사이트</title>
</head>
<body>

	탈퇴하시면 <b><%=session.getAttribute("SessionUser")%></b>님의 모든 정보가 삭제됩니다.<p/><p/>
	계속하시겠습니까?<p/>
	<button type="button" onclick="location.href='DeleteAccountSQL.jsp'">확인</button>
	<button type="button" onclick="location.href='MyPage.jsp'">취소</button>

</body>
</html>