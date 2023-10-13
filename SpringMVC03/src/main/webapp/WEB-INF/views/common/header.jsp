<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 변수 만드는 태그 -->
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${contextPath}/">Spring</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${contextPath}/">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Page 1-1</a></li>
            <li><a href="#">Page 1-2</a></li>
            <li><a href="#">Page 1-3</a></li>
          </ul>
        </li>
        <li><a href="#">Page 2</a></li>
        <li><a href="${contextPath}/boardMain.do">게시판</a></li>
      </ul>
      
      
      <c:if test="${empty mvo}">
    	  <ul class="nav navbar-nav navbar-right">
     	   <li><a href="${contextPath}/joinForm.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
     	   <li><a href="${contextPath}/loginForm.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
     	 </ul>
      </c:if>
      
      <c:if test="${not empty mvo}">
    	  <ul class="nav navbar-nav navbar-right">
     	   <li><a href="${contextPath}/updateForm.do"><span class="glyphicon glyphicon-wrench"></span> 회원정보수정</a></li>
     	   <li><a href="${contextPath}/imageForm.do"><span class="glyphicon glyphicon-picture"></span> 프로필업로드</a></li>
     	   <li><a href="${contextPath}/logout.do"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>
     	 </ul>
      </c:if>
      
      
    </div>
  </div>
</nav>
</body>
</html>