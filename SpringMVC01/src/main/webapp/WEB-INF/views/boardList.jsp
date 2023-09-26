<%@page import="com.board.entity.Board"%>
<%@page import="java.util.List"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<h2>SpringMVC01</h2>
		<div class="panel panel-default">
			<div class="panel-heading">Board</div>
			<div class="panel-body">
				<table class="table table-bordq`ered table-hover">
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
					</tr>
					<!-- BoardController에서 받아온 list데이터를 for문 사용해서 아래에 출력 -->

					<%
					List<Board> boardList = (List<Board>)request.getAttribute("boardList");%>

					<!-- EL문법으로 출력하기 -->
					<c:forEach var="boardList" items="${boardList}" varStatus="s">
						<tr>
							<td>${s.count}</td>
							<td><a href="boardContent.do?idx=${boardList.idx}">${boardList.title}</a></td>
							<td>${boardList.writer}</td>
							<td>${boardList.indate}</td>
							<td>${boardList.count}</td>
						</tr>
					</c:forEach>
					
				</table>
					<a href="boardForm.do" class="btn btn-primary">글쓰기</a>
			</div>
			<div class="panel-footer">스프링게시판-순</div>
		</div>
	</div>

</body>
</html>
