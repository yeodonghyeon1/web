<%@ page language="java" contentType="text/html; charset=utf-8" import = "java.sql.*" 
      pageEncoding="utf-8"%>


<% // 카테고리, 게시글 코드는 주석 처리 (나중에 만들 때 해제할 예정)
/*
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;



String[] category = new String[4];

String id = "";
int counter = 0;

try {

conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/database", "root", "1234");
stmt = conn.createStatement();

rs = stmt.executeQuery("select * from new_table, new_table2");
*/
%>

<%-- 카테고리 변수 선언(범용성 좋게 바꾸기) --%>  

<%-- getParameter는 sql 값 가져오기 --%>
<%

//카테고리 부분
/*
if(rs != null){
	while(rs.next()){
		category[counter] = rs.getString("idnew_table");
		counter++;
	}
}




//게시글 부분
if(rs != null)
//int[] PostCount = new int[10];








*/
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
      <div class="page-name">페이지 이름</div>
      <div class="menu-items">
      
      
      <%-- 로그인되면 이름으로 변경됨. 이름을 클릭하면 마이페이지 접속--%>
        <a href="#">HOME</a> 
        
        <%if(session.getAttribute("SessionUser") == null) {%>
            <a href="Login.jsp">LOGIN</a> 
        <%}else{ %>
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
      <input type="text" placeholder="문제를 검색하세요">
      <button type="submit">검색</button>
    </div>
    <div class="category-section">
      <ul>
        <%-- <li><a href="#"><%=category[0]%></a></li> --%>
        <li><a href="#">카테고리1</a></li>
        <li><a href="#">카테고리2</a></li>
        <li><a href="#">카테고리3</a></li>
        <li><a href="#">카테고리4</a></li>
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
          <tr>
            <td>1</td>
            <td><a href="#">최신 질문 제목</a></td>
            <td>글쓴이 이름</td>
            <td>23-06-03</td>
            <td>조회수</td>
          </tr>
          <tr>
            <td>2</td>
            <td><a href="#">최신 질문 제목</a></td>
            <td>글쓴이 이름</td>
            <td>23-06-03</td>
            <td>조회수</td>
          </tr>
          <tr>
            <td>3</td>
            <td><a href="#">최신 질문 제목</a></td>
            <td>글쓴이 이름</td>
            <td>23-06-03</td>
            <td>조회수</td>
          </tr>
          <tr>
            <td>4</td>
            <td><a href="#">최신 질문 제목</a></td>
            <td>글쓴이 이름</td>
            <td>23-06-03</td>
            <td>조회수</td>
          </tr>
          <tr>
            <td>5</td>
            <td><a href="#">최신 질문 제목</a></td>
            <td>글쓴이 이름</td>
            <td>23-06-03</td>
            <td>조회수</td>
          </tr>
        </tbody>
      </table>
    </div>
  </main>
</body>
</html>


<%
/*
} catch( SQLException sqlException ) {
System.out.println("sql exception");
} catch( Exception exception ) {
System.out.println("exception");
} finally {
if( rs != null )
try { rs.close(); }
catch( SQLException ex ) {}
if( stmt != null )
try { stmt.close(); }
catch( SQLException ex ) {}
if( conn != null )
try { conn.close(); }
catch( Exception ex ) {}
}
*/
%>
