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
          <a class="nav-link" href="${contextPath}/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="boardMain.do">Board</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${contextPath}/joinForm.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
      
    </div>
  </div>
</nav>

</body>
</html>
