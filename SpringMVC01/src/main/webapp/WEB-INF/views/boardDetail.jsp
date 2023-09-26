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
				<table class="table">
					<tr>
						<td>제목</td>
						<td>${requestScope.board.title}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${requestScope.board.writer}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td height="200px">${requestScope.board.content}</td>
					</tr>
					<tr>
						<!-- 추천 및 비추 -->
						<td colspan="2" align="center">
							<button type="button" class="btn btn-primary position-relative"
								id="good">
								추천 <span
									class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
									<div id="goodCount">${requestScope.board.good}</div>
								</span>
							</button>
							<button type="button" class="btn btn-primary position-relative"
								id="bad">
								비추 <span
									class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
									>
									<div id="badCount"> ${requestScope.board.bad}</div> </span>
							</button>
						</td>
						<script type="text/javascript">
					/* 추천 */		

					$('#good').on('click', function(){
						var idx = ${requestScope.board.idx};
						$.ajax({
							url : "boardGood.do", /* 어디로 보낼지 */
							data : {"idx" : idx}, /* 어떤 데이터를 보낼지 */
							datatype : "text", /* 어떤 데이터 타입으로 받아올지 */
							cache: false, // 캐시 비활성화
							success : (data)=>{
								console.log(data)
							},
							complete : (data)=>{
								var goodCount = parseInt(data.responseText);
						    if (goodCount != null) {
						        $('#goodCount').html(goodCount);
						    	console.log(goodCount)				
							}else{
							}
							}
						})
					});
					/* 비추 */
					$('#bad').on('click', function(){
						var idx = ${requestScope.board.idx};
						console.log(idx);
						$.ajax({
							url : "boardBad.do", /* 어디로 보낼지 */
							data : {"idx" : idx}, /* 어떤 데이터를 보낼지 */
							datatype : "text", /* 어떤 데이터 타입으로 받아올지 */
							cache: false, // 캐시 비활성화
							success : (data)=>{
								console.log(data)
							},
							complete : (data)=>{
								var badCount = parseInt(data.responseText);
						    if (badCount != null) {
						        $('#badCount').html(badCount);
						    	console.log(badCount)				
							}else{
							}
							}
						})
					});
				</script>

					</tr>
					<tr>
						<td colspan="2" align="center"><a
							href="boardUpdateForm.do?idx=${requestScope.board.idx}"
							class="btn btn-success">수정</a> <a
							href="boardDelete.do?idx=${requestScope.board.idx}"
							class="btn btn-warning">삭제</a> <a href="boardSelectList.do"
							class="btn btn-primary">목록</a></td>
					</tr>
				</table>
			</div>

			<div class="panel-footer">스프링게시판-순</div>
		</div>
	</div>

</body>
</html>
