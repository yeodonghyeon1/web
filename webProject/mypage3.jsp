<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>게시판</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>게시판</h1>
        <table class="table">
            <thead>
                <tr>
                	<th>글 번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="post" items="${posts}">
                    <tr>
                    	<td>${post.num }</td>
                        <td>${post.title}</td>
                        <td>${post.author}</td>
                        <td>${post.date}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <a href="write.jsp" class="btn btn-primary">글쓰기</a>
    </div>
</body>
</html>