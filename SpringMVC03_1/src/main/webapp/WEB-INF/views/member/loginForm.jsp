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
  
  </script>
  
</head>
<body> 

 
<div class="container">
  <h2>SpringMVC03</h2>
  <div class="card border-light mb-3">
    <div class="card-header">로그인</div>
    <div class="card-body">
    	<form action="${contextPath}/login.do" method="post" name="joinForm">
    		<table class="table table-bordered" style="text-align: center; border :1px solid #dddddd">
    			<tr>
    				<td style="width:120px; vertical-align:middle;">아이디</td>
    				<td>
    					<input type="text" name="memId" id="memId" class="form-control" placeholder="아이디를 입력해주세요." maxlength="20" required>
    				</td>
    			</tr>
    			
    			<tr>
    				<td style="width:120px; vertical-align:middle;">비밀번호</td>
    				<td>
    					<input type="password" name="memPw" id="memPw" class="form-control" placeholder="비밀번호를 입력해주세요." maxlength="20" required>
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2">
    					<input type="submit" class="btn btn-success" value="로그인"> 
    					<input type="reset" class="btn btn-warning" value="초기화"> 
    				</td>
    			</tr>
    		</table>
    	</form>
    
    
    </div>
    <div class="card-footer">스프링게시판-순</div>
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
