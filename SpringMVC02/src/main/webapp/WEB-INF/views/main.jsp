<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <script type="text/javascript">
	
	$(document).ready(()=>{
		// HTML 구조가 다 로딩이 된 후에 loadList()실행
		loadList()
	});
	
		const loadList=()=>{
			// BoardController에서 게시글 전체목록을 가져오는 기능
			// ajax 사용
			// JavaScript Object Notation -> JS 객체표현 방식
			// {key : value, key : value, [{key : value}, ...], ...}
			$.ajax({
				url : "boardSelectList.do",
				dataType : "json",
				success : makeView, //callback함수
				error : ()=>{alert("error");}				
			});
		}
		// 성공 시 실행할 makeView 함수 -> jsp에 데이터를 뿌려주는 함수
		const makeView=(data)=>{ // data = [{idx:1, title:"ff",..},{},...]
			console.log(data);
		
			var listHTML = "<table table class='table table-sm' style='text-align:center'>";
			listHTML += "<thead class='table-light'><tr>";
			listHTML += "<th scope='col'>번호</th>";
			listHTML += "<th scope='col' width='35%'>제목</th>";
			listHTML += "<th scope='col'>작성자</th>";
			listHTML += "<th scope='col'>작성일</th>";
			listHTML += "<th scope='col'>추천</th>";
			listHTML += "<th scope='col'>조회수</th>";
			listHTML += "</tr></thead><tbody>";
			// jQuery 반복문
			$.each(data, (index, obj)=>{
				listHTML += "<tr>";
				listHTML += "<th scope='row'>"+(index+1)+"</th>";
				listHTML += "<td style='text-align:left'>"+obj.title+"</td>";
				listHTML += "<td><div onclick='boardSelect()'>"+obj.writer+"</td>";
				listHTML += "<td>"+obj.indate.split(' ',1)+"</td>"; // split(' ',num) ''기준으로 자르고, 배열에 담긴 값중 num개 만 출력 
				listHTML += "<td>"+obj.good+"</td>";
				listHTML += "<td>"+obj.count+"</td>";
				listHTML += "</tr>";
			});		
			listHTML += "</tbody></table>";
			listHTML += "<button type='button' class='btn btn-outline-primary btn-sm' onclick='goForm()' style='float:right'>글쓰기</button>";
			
			$('#view').html(listHTML);
		}
		
		const goForm=()=>{
			$("#view").css("display","none")
			$("#wform").css("display","block")
		}
		
		const goList=()=>{
			$("#wform").css("display","none")
			$("#view").css("display","block")
		}
		
		// 게시글 작성
		const boardInsert=()=>{
			$.ajax({
				url : "boardInsert.do",
				data: $("#form").serialize(),
				type: 'POST',
				success : ()=>{location.reload();}, // 새로고침
				error : ()=>{alert("error");}				
			});
		}
		
		// 게시글 조회
		const boardSelect=()=>{
			$.ajax({
				url : "boardSelect.do",
				data: {"idx" : idx},
				success : ()=>{location.reload();}, // 새로고침
				error : ()=>{alert("error");}				
			});			
		}
		
		
	</script>
	
</head>
<body>
 
<div class="container">
	<h2>SpringMVC02</h2>
  	<div class="card border-light mb-3">
    	<div class="card-header">Board</div>
    	<div class="card-body" id="view"></div>
    	
    	<!-- 글쓰기 폼 -->
    	<div class="card-body" id="wform" style="display:none;">
    		<form id="form" name="form" th:object="${board}" >   							
					<table class="table" >					
						<tr>
							<th scope='col'>제목</td>
							<td><input type="text" id="title" name="title" class="form-control"></td>
						</tr>
						<tr>
							<th scope='col'>내용</td>
							<td><textarea rows="7" cols="" id="content" name="content" class="form-control"></textarea></td>
						</tr>
						<tr>
							<th scope='col'>작성자</td>
							<td><input type="text" id="writer" name="writer" class="form-control"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">
									<button type="button" class="btn btn-outline-success btn-sm" onclick='boardInsert()'>등록</button>
									<button type="button" class="btn btn-outline-secondary btn-sm">초기화</button>
									<button type="button" class="btn btn-outline-primary btn-sm" onclick='goList()'>목록</button>
							</td>
						</tr>
					</table>
				</form>
    		</form>
    	</div>
    	<div class="card-footer">스프링게시판-순</div>
  	</div>
</div>

</body>
</html>
