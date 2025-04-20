<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>
<%@ page import= "myapp.main" import= "java.util.ArrayList"%>
<%@page import="java.sql.Timestamp"%>

<% // 카테고리, 게시글 코드는 주석 처리 (나중에 만들 때 해제할 예정)
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
ResultSet rs2 = null;
String[] category = new String[4];
String id = "";
int counter = 0;
int cPage = 1;
main function = new main();
try {
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "1234");
stmt = conn.createStatement();
rs = stmt.executeQuery("select * from new_table");
%>
<%-- 카테고리 변수 선언(범용성 좋게 바꾸기) --%>  

<%-- getParameter는 sql 값 가져오기 --%>
<%
//카테고리 부분
if(rs != null){
	while(rs.next()){
		category[counter] = rs.getString("idnew_table");
		counter++;
	}
}


//게시글 부분

String tempPage = request.getParameter("page");
if(tempPage == null || tempPage.length() == 0){
	cPage = 1;
}
try{
	cPage = Integer.parseInt(tempPage);
	
}catch(NumberFormatException e){
	cPage =1;
}
int len = 5;  //한 페이지에 들어갈 데이터 갯수
int pageLength = 5; // 보여줄 페이지 블럭 갯수
int totalRows = function.getTotalRows("post");
int totalPages = totalRows % len == 0 ? totalRows / len : (totalRows / len) + 1;

if (totalPages == 0) {
    totalPages = 1;
}
if (cPage > totalPages) {
    cPage = 1;
}

int currentBlock = function.currentBlock(cPage, pageLength);
int startPage = function.startPage(currentBlock, pageLength);
int endPage = function.endPage(startPage,pageLength);
if (endPage > totalPages) {
    endPage = totalPages;
}


int start = (cPage -1) * pageLength;

//ArrayList<DeptDto> list = dao.select(start, len);



%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>과제 풀이 사이트</title>
  <link href="./test.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <header>
    <div class="top-menu">
      <div class="page-name">과제 풀이 사이트</div>
      <div class="menu-items">
      
      
      <%-- 로그인되면 이름으로 변경됨. 이름을 클릭하면 마이페이지 접속--%>
      <%-- 로그인 되었을 경우만 글쓰기 나타남 --%>
        <a href="mainpage.jsp">HOME</a> 
        
        <%if(session.getAttribute("SessionUser") == null) {%>
            <a href="Login.jsp">LOGIN</a> 
        <%}else{ %>
        <a href="Write.jsp">글쓰기</a>
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
  </header>
  <main>
    <div class="search-section">
   	 <form method = "post" action  = "SearchPostPage.jsp">
      <input type="text" name = "text" placeholder="문제를 검색하세요">
      <button type="submit">검색</button>
      </form>
    </div>
    <div class="category-section">
      <ul>
        <li><a href="#"><%=category[0]%></a></li> 
        <li><a href="#"><%=category[1]%></a></li>
        <li><a href="#"><%=category[2]%></a></li>
        <li><a href="#"><%=category[3]%></a></li>
      </ul>
    </div>
    <div class="recent-questions">
      <h2>최신 질문</h2>
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
					<% 
			        StringBuffer tablePage = new StringBuffer();
			        tablePage.append("select * from post ORDER BY PostNumber DESC LIMIT ");
			        int one = (cPage * len) - len;

			        int two = len;
			        tablePage.append(one + "," + two);
			        System.out.println(tablePage.toString());
					rs = stmt.executeQuery(tablePage.toString());
if(rs != null)
	counter = 0;
//int[] PostCount = new int[10];
	while(rs.next()){
			String number = rs.getString("PostNumber");
			String postname = rs.getString("PostName");
			Timestamp date = rs.getTimestamp("PostDate");
			String user = rs.getString("PostUser");
			int click = rs.getInt("PostClick");
	%>
		<tr>
			<td><%=number%></td>
			<td><a href="WriteIn.jsp?number=<%=number%>"><%=postname%></a></td>
			<td><%=user%></td>
			<td><%=date%></td>
			<td><%=click%></td>
		</tr>
		<%
	}
%>



</tbody>
</table>
<% if (startPage == 1) {%>
<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
<%} else {%>
<a class="page-link" href="mainpage.jsp?page=<%=startPage - 1%>"
	tabindex="-1" aria-disabled="true">Previous</a>
<%}%><%
for (int i = startPage; i <= endPage; i++) {%>
<a class="page-link" href="mainpage.jsp?page=<%=i%>"><%=i%></a>
<%}%><%
// 마지막 페이지 숫자와 startPage에서 pageLength 더해준 값이 일치할 때
// (즉 마지막 페이지 블럭일 때)
if (totalPages == endPage) {%>
<a class="page-link" href="#">Next</a><%
} else {%>
<a class="page-link" href="mainpage.jsp?page=<%=endPage + 1%>">Next</a><%
}%></main>
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