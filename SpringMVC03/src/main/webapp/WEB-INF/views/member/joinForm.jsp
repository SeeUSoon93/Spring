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
  	const registerCheck=()=>{
  		var memId = $("#memId").val();
  			console.log(memId);
     	// MemberController에서 registerCheck.do라고 비동기 요청시
    	// 해당 아이디가 존재하면 0반환, 존재하지않으면 1반환
    	
    	// 체크하는 방법
      	// 해당 memId가 일치하는 회원의 정보를 가져옴(그때의 데이터타입 = Member)
      	// 있다면 객체를 반환, 없으면 null 값일 것
      	// null -> 사용가능 -> 1반환 , null X -> 사용불가 -> 0반환
      
  		$.ajax({
            url: "${contextPath}/registerCheck.do",
            type: 'get',
            data: { "memId": memId },
            success:(data)=>{           	
				console.log(data);
				if(data == 0){
					$("#checkMessage").text("사용할 수 없는 아이디입니다!")
				}else{
					$("#checkMessage").text("사용할 수 있는 아이디입니다!")
				}
				$("#myModal").modal("show");
            },
            error: () => { alert("error"); }
          });
  	}	
  
  </script>
  
  
</head>
<body> 

 
<div class="container">
  <h2>SpringMVC03</h2>
  <div class="card border-light mb-3">
    <div class="card-header">회원가입</div>
    <div class="card-body">
    	<form action="${contextPath}/join.do" method="post">
    		<table class="table table-bordered" style="text-align: center; border :1px solid #dddddd">
    			<tr>
    				<td style="width:120px; vertical-align:middle;">아이디</td>
    				<td>
    					<input type="text" name="memId" id="memId" class="form-control" placeholder="아이디를 입력해주세요." maxlength="20">
    				</td>
    				<td style="width:120px; vertical-align:middle;">
    					<button onclick="registerCheck()" type="button" class="btn btn-sm btn-primary">중복확인</button>
    				</td>
    			</tr>
    			
    			<tr>
    				<td style="width:120px; vertical-align:middle;">비밀번호</td>
    				<td colspan="2">
    					<input type="password" name="memPw" id="memPw" class="form-control" placeholder="비밀번호를 입력해주세요." maxlength="20">
    				</td>
    			</tr>
    			<tr>
    				<td style="width:120px; vertical-align:middle;">비밀번호 확인</td>
    				<td colspan="2">
    					<input type="password" name="memPw2" id="memPw2" class="form-control" placeholder="비밀번호를 입력해주세요." maxlength="20">
    				</td>
    			</tr>
    			<tr>
    				<td style="width:120px; vertical-align:middle;">사용자 이름</td>
    				<td colspan="2">
    					<input type="text" name="memName" id="memName" class="form-control" placeholder="이름을 입력해주세요." maxlength="20">
    				</td>
    			</tr>
    			<tr>
    				<td style="width:120px; vertical-align:middle;">나이</td>
    				<td colspan="2">
    					<input type="number" name="memAge" id="memAge" class="form-control" placeholder="나이를 입력해주세요." maxlength="3">
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
    
    <!-- The Modal -->
		<div class="modal" id="myModal">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title">중복체크</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        <p id="checkMessage">Modal body..</p>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
		      </div>
		
		    </div>
		  </div>
		</div>
    
  </div>
</div>

</body>
</html>
