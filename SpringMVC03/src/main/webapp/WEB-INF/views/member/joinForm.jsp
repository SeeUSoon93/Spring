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


	function registerCheck() {
		// 아이디 중복체크
		var memId = $("#memId").val();

		// MemberController에서 registerCheck.do라고 비동기 요청시
		// 해당 아이디가 존재하면 0반환, 존재하지 않으면 1반환

		// 체크하는 방법
		// 해당 memId가 일치하는 회원의 정보를 가져옴(Member)
		// 있으면 객체를 반환, 없으면 null 값일 것
		// null -> 1반환, null X -> 0반환

		// 만들어야 하는 것
		// MemberMapper.java, MemberMapper.xml 파일 만들기
		$.ajax({
			url : "${contextPath}/registerCheck.do",
			type : "get",
			data : {
				"memId" : memId
			},
			success : function(data) {
				// console.log(data);
				if (data == 1) {
					$("#checkMessage").text("사용할 수 있는 아이디입니다.");
					// id=checkId -> class="modal-content panel-primary"
					$("#checkId").attr("class", "modal-content panel-primary");
				} else {
					$("#checkMessage").text("사용할 수 없는 아이디입니다.");
					// id=checkId -> class="modal-content panel-warning"
					$("#checkId").attr("class", "modal-content panel-warning");
				}
				$("#myModal").modal("show");
			},
			error : function() {
				alert("error");
			}
		});

	}

	function pwCheck() {
		// 비밀번호가 일치하는지 확인
		var memPw1 = $("#memPw1").val();
		var memPw2 = $("#memPw2").val();

		if (memPw1 != memPw2) {
			// 비밀번호 일치X
			$("#PwCheckMessage").text("비밀번호가 일치하지 않습니다.");
		} else {
			// 비밀번호 일치O
			$("#PwCheckMessage").text("");
			$("#memPw").val(memPw1);
		}

	}
</script>
</head>
<body>

	<div class="container">
		<jsp:include page="../common/header.jsp"></jsp:include>
		<h2>SpringMVC03</h2>
		<div class="panel panel-default">
			<div class="panel-heading">회원가입</div>
			<div class="panel-body">
				<form action="${contextPath}/join.do" method="post">
					<input type="hidden" id="memPw" name="memPw" value="">
					<table class="table table-bordered"
						style="text-align: center; border: 1px solid #dddddd">

						<tr>
							<td style="width: 110px; vertical-align: middle;">아이디</td>
							<td><input type="text" name="memId" id="memId"
								class="form-control" placeholder="아이디를 입력해주세요." maxlength="20">
							</td>
							<td style="width: 110px; vertical-align: middle;">
								<button onclick="registerCheck()" type="button"
									class="btn btn-sm btn-primary">중복확인</button>
							</td>
						</tr>

						<tr>
							<td style="width: 110px; vertical-align: middle;">비밀번호</td>
							<td colspan="2"><input onkeyup="pwCheck()" type="password"
								name="memPw1" id="memPw1" placeholder="비밀번호를 입력해주세요"
								class="form-control" maxlength="20"></td>
						</tr>
						<tr>
							<td style="width: 110px; vertical-align: middle;">비밀번호 확인</td>
							<td colspan="2"><input onkeyup="pwCheck()" type="password"
								name="memPw2" id="memPw2" placeholder="비밀번호를 입력해주세요"
								class="form-control" maxlength="20"> <span
								id="PwCheckMessage" style="color: red; float: left;"></span></td>
						</tr>
						<tr>
							<td style="width: 110px; vertical-align: middle;">사용자 이름</td>
							<td colspan="2"><input type="text" name="memName"
								id="memName" placeholder="이름을 입력해주세요" class="form-control"
								maxlength="20"></td>
						</tr>
						<tr>
							<td style="width: 110px; vertical-align: middle;">나이</td>
							<td colspan="2"><input type="number" name="memAge"
								id="memAge" placeholder="나이를 입력해주세요" class="form-control"
								maxlength="3"></td>
						</tr>

						<tr>
							<td style="width: 110px; vertical-align: middle;">성별</td>
							<td colspan="2">
								<div class="form-group"
									style="text-align: center; margin: 0 auto;">
									<div class="btn-group" data-toggle="buttons">
										<label class="btn btn-primary active"> <input
											type="radio" id="memGender" name="memGender" value="남자">남자
										</label> <label class="btn btn-primary"> <input type="radio"
											id="memGender" name="memGender" value="여자">여자
										</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td style="width: 110px; vertical-align: middle;">이메일</td>
							<td colspan="2"><input type="email" name="memEmail"
								id="memEmail" placeholder="이메일을 입력해주세요" class="form-control"
								maxlength="20"></td>
						</tr>

						<tr>
							<td colspan="3"><input type="submit" class="btn btn-success"
								value="등록"> <input type="reset" class="btn btn-warning"
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
