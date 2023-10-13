
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

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
<script type="text/javascript">
	$(document).ready(function(){
		if(${not empty msgType}){
			// 회원가입 시도
			if(${msgType eq "실패 메세지"}){
				$("#msgType").attr("class" , "modal-content panel-danger");
			}
			$("#msgModal").modal("show");
		}
	});

</script>
</head>
<body>

	<div class="container">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<h2>SpringMVC03</h2>
		<div class="panel panel-default">
			<div class="panel-heading">로그인</div>
			<div class="panel-body">
				<form action="${contextPath}/login.do" method="post">
					<table class="table table-bordered"
						style="text-align: center; border: 1px solid #dddddd">

						<tr>
							<td style="width: 110px; vertical-align: middle;">아이디</td>
							<td><input type="text" name="memId" id="memId"
								class="form-control" placeholder="아이디를 입력해주세요." maxlength="20">
							</td>
						</tr>

						<tr>
							<td style="width: 110px; vertical-align: middle;">비밀번호</td>
							<td><input type="password"
								name="memPw" id="memPw" placeholder="비밀번호를 입력해주세요"
								class="form-control" maxlength="20"></td>
						</tr>

						<tr>
							<td colspan="2"><input type="submit" class="btn btn-success"
								value="로그인"> <input type="reset" class="btn btn-warning"
								value="초기화"></td>
						</tr>

					</table>

				</form>
			</div>
			<div class="panel-footer">스프링게시판-이주희</div>
		</div>
	</div>

	<!-- 회원가입 실패 성공 유무 -->
	<!-- Modal -->
	<div class="modal fade" id="msgModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<!-- card -->
			<div id="msgType" class="modal-content panel-info">
				<!-- bg-primary -->
				<div class="modal-header panel-heading">
					<!-- card-header -->
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">${msgType}</h4>
				</div>
				<div class="modal-body">
					<p id="">${msg}</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

	<!-- 중복확인 상태 -->
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<!-- card -->
			<div id="checkId" class="modal-content panel-info">
				<!-- bg-primary -->
				<div class="modal-header panel-heading">
					<!-- card-header -->
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">메세지 확인</h4>
				</div>
				<div class="modal-body">
					<p id="checkMessage"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>

</body>
</html>
