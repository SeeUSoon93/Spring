<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<jsp:include page="../common/header.jsp"></jsp:include>	
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script type="text/javascript">
	
  $(document).ready(()=>{
		if(${not empty msgType}){
			if(${msgType eq "실패 메세지"}){
				$("#msgType").attr("class","modal-header bg-danger text-white");
			}
			$("#msgModal").modal("show");
		}
	});
  
  	const registerCheck=()=>{
  		var memId = $("#memId").val();
  			console.log(memId);
    	// 해당 아이디가 존재하면 0반환, 존재하지않으면 1반환
      	// null -> 사용가능 -> 1반환 , null X -> 사용불가 -> 0반환
  		$.ajax({
            url: "${contextPath}/registerCheck.do",
            type: 'get',
            data: { "memId": memId },
            success:(data)=>{           	
				console.log(data);
				if(data == 0){
					$("#checkMessage").text("사용할 수 없는 아이디입니다!");
					$("#checkId").attr("class","modal-header bg-danger text-white");
				}else{
					$("#checkMessage").text("사용할 수 있는 아이디입니다!");
					$("#checkId").attr("class","modal-header bg-info");
				}
				$("#myModal").modal("show");
            },
            error: () => { alert("error"); }
          });
  	}	
  	
  	const pwCheck=()=>{
  		var memPw1 = $("#memPw1").val();
  		var memPw2 = $("#memPw2").val();
  		
  		if(memPw1 != memPw2){
  			$("#PwCheckMessage").text("비밀번호를 확인해주세요");
  		}else{
  			$("#PwCheckMessage").text("");
  			$("#memPw").val(memPw2);
  		}
  		
  	}
  	
  	const goHome=()=>{
  		window.location.replace("./");
  	}
  	
/*   	// 유효성 검사
  const checkform=()=>{
	  if ( document.joinForm.memId.value == "") {
		  	$("#idcheckMsg").text("아이디를 입력하세요");
			return false;
		} else if (document.joinForm.memPw1.value == ""){
			$("#pw1checkMsg").text("비밀번호를 입력하세요");
			return false;
		}else if (document.joinForm.memPw2.value == ""){
			$("#pw2checkMsg").text("비밀번호를 입력하세요");
			return false;
		}else if (document.joinForm.memName.value == ""){
			$("#namecheckMsg").text("이름을 입력하세요");
			return false;
		}else if (document.joinForm.memAge.value == ""){
			$("#agecheckMsg").text("나이를 입력하세요");
			return false;
		}else if (document.joinForm.memEmail.value == ""){
			$("#emailcheckMsg").text("이메일를 입력하세요");
			return false;
		}
	} */
	
  </script>
  <style>
   input {
      display: none;
   }
</style>
  
</head>
<body> 

 
<div class="container">
  <h2>SpringMVC03</h2>
  <div class="card border-light mb-3">
    <div class="card-header">회원가입</div>
    <div class="card-body">
    	<form action="${contextPath}/join.do" method="post" name="joinForm">
    		<input type="hidden" id="memPw" name="memPw" value="">
    		<table class="table table-bordered" style="text-align: center; border :1px solid #dddddd">
    			<tr>
    				<td style="width:120px; vertical-align:middle;">아이디</td>
    				<td>
    					<input type="text" name="memId" id="memId" class="form-control" placeholder="아이디를 입력해주세요." maxlength="20" required>
    					<!-- <span id="idcheckMsg" style="color :red; float:left;"></span> -->
    				</td>
    				<td style="width:120px; vertical-align:middle;">
    					<button onclick="registerCheck()" type="button" class="btn btn-sm btn-primary">중복확인</button>
    				</td>
    			</tr>
    			
    			<tr>
    				<td style="width:120px; vertical-align:middle;">비밀번호</td>
    				<td colspan="2">
    					<input type="password" name="memPw1" id="memPw1" class="form-control" placeholder="비밀번호를 입력해주세요." maxlength="20" required>
    					<!-- <span id="pw1checkMsg" style="color :red; float:left;"></span> -->
    				</td>
    			</tr>
    			<tr>
    				<td style="width:120px; vertical-align:middle;">비밀번호 확인</td>
    				<td colspan="2">
    					<input onkeyup="pwCheck()" type="password" name="memPw2" id="memPw2" class="form-control" placeholder="비밀번호를 확인해주세요." maxlength="20" required>
	    				<span id="PwCheckMessage" style="color :red; float:left;"></span>
	    				<!-- <span id="pw2checkMsg" style="color :red; float:left;"></span> -->
    				</td>
    			</tr>
    			<tr>
    				<td style="width:120px; vertical-align:middle;">사용자 이름</td>
    				<td colspan="2">
    					<input type="text" name="memName" id="memName" class="form-control" placeholder="이름을 입력해주세요." maxlength="20">
    					<!-- <span id="namecheckMsg" style="color :red; float:left;"></span> -->    					
    				</td>
    			</tr>
    			<tr>
    				<td style="width:120px; vertical-align:middle;">나이</td>
    				<td colspan="2">
    					<input type="number" name="memAge" id="memAge" class="form-control" placeholder="나이를 입력해주세요." maxlength="3" required>
    					<!-- <span id="agecheckMsg" style="color :red; float:left;"></span> -->
    				</td>
    			</tr>
    			<tr>
    				<td style="width:120px; vertical-align:middle;">성별</td>
    				<td colspan="2">    					
	    				<div class="form-group" style="text-align:left; margin:0 auto;">
	    					<div class="btn-group" data-toggle="buttons">
	    						<label class="btn btn-primary active">
	    							<input type="radio" id="memGender" name="memGender" value="남자">남자
	    						</label>
	    						<label class="btn btn-primary">
	    							<input type="radio" id="memGender" name="memGender" value="여자">여자
	    						</label>
	    					
	    					</div>
	    				</div>
    				</td>
    			</tr>
    			<tr>
    				<td style="width:120px; vertical-align:middle;">이메일</td>
    				<td colspan="2">
    					<input type="email" name="memEmail" id="memEmail" class="form-control" placeholder="이메일을 입력해주세요." maxlength="100">
    					<!-- <span id="emailcheckMsg" style="color :red; float:left;"></span> -->
    				</td>
    			</tr>
    			<tr>
    				<td colspan="3">
    					<input type="submit" class="btn btn-success" value="등록"> 
    					<input type="reset" class="btn btn-warning" value="초기화"> 
    				</td>
    			</tr>
    				
    		</table>
    	
    	</form>
    
    
    
    </div>
    <div class="card-footer">스프링게시판-순</div>
  </div>
</div>

    <!-- 중복확인 모달 -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		
	      <!-- Modal Header -->
		    <div class="modal-content">
		      <div id="checkId" class="modal-header bg-info">
		        <h4 class="modal-title" >메세지</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        <p id="checkMessage">Modal body..</p>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
		<!-- 회원가입 모달 -->
		<div class="modal" id="msgModal">
		  <div class="modal-dialog">
		
	      <!-- Modal Header -->
		    <div class="modal-content">
		      <div id="msgType" class="modal-header bg-info">
		        <h4 class="modal-title" >${msgType}</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        <p id="">${msg}</p>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button onclick="goHome()" type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
		        <button onclick="goHome()" type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
		      </div>
		
		    </div>
		  </div>
		</div>

</body>
</html>
