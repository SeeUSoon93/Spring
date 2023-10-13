<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<jsp:include page="common/header.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>SpringMVC03</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <script type="text/javascript">
  $(document).ready(()=>{
		if(${empty mvo}){
			if(${logout eq "logout"}){
				$("#logoutModal").modal("show");				
			}
		}else{
			if(${msgType eq "성공 메세지" }){
				$("#loginModal").modal("show");
			}
		}
	});	 
  </script>
</head>
<body>

  
<div class="container">
  <h3>Collapsible Navbar</h3>
  <p>In this example, the navigation bar is hidden on small screens and replaced by a button in the top right corner (try to re-size this window).
  <p>Only when the button is clicked, the navigation bar will be displayed.</p>
</div>

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

		<!-- 로그인 모달 -->
<div class="modal" id="loginModal">
  <div class="modal-dialog">
  <!-- Modal Header -->
    <div class="modal-content">
      <div id="msgType" class="modal-header bg-info">
        <h4 class="modal-title" >로그인 성공</h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <p id="">${msg}</p>
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