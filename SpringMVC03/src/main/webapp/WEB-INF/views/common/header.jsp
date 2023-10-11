<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <style type="text/css">
 
  a {
     text-decoration: none;
     
  }
  
  .navbar-collapse {
     justify-content: space-between;
  }
  
  .navbar-nav>li{
     padding: 0 20px;

  }
  
  .navbar-nav>li>a {
    color : #C7C8C9;
  }
  #header{
  	margin-bottom:50px;
  }
  
  </style>
  <script type="text/javascript">
  $(document).ready(()=>{
		if(${empty mvo}){
			if(${logout eq "logout"}){
				$("#logoutModal").modal("show");				
			}
		}
	});	 
  
  
  </script>
  
</head>
<body>
<!-- 변수 만드는 태그 -->
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<nav id="header" class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="${contextPath}/">김군순짱</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="boardMain.do">게시판</a>
        </li>
      </ul>
      
      <c:choose>
	      <c:when test="${empty mvo}">
	      <ul class="nav navbar-nav navbar-right" id="successLogin">
	        <li><a href="${contextPath}/joinForm.do"><i class="bi bi-people"></i>&nbsp회원가입</a></li>
	        <li><a href="#"><i class="bi bi-box-arrow-right"></i>&nbsp로그인</a></li>
	      </ul>
	      </c:when>
	      
	      <c:otherwise>
	      <ul class="nav navbar-nav navbar-right" id="successLogin">
	        <li><a href=""><i class="bi bi-person-square"></i>&nbsp프로필</a></li>
	        <li><a href=""><i class="bi bi-person-circle"></i>&nbsp회원정보 수정</a></li>
	        <li><a href="${contextPath}/logout.do"><i class="bi bi-box-arrow-left"></i>&nbsp로그아웃</a></li>
	      </ul>
	      </c:otherwise>
      </c:choose>
    </div>
  </div>
</nav>
		<!-- 로그아웃 모달 -->
		<div class="modal" id="logoutModal">
		  <div class="modal-dialog">
	      <!-- Modal Header -->
		    <div class="modal-content">
		      <div id="msgType" class="modal-header bg-info">
		        <h4 class="modal-title" >로그아웃 성공</h4>
		        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        <p id="">로그아웃에 성공하셨습니다</p>
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
		        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
</body>
</html>

