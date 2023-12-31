<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<jsp:include page="../common/header.jsp"></jsp:include>	
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
				url : "board/all",
				type : "get",
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
				listHTML += "<td style='text-align:left' id='t"+obj.idx+"'><a href='javascript:goContent("+obj.idx+")'>"+obj.title+"</a></td>";
				listHTML += "<td>"+obj.writer+"</td>";
				listHTML += "<td>"+obj.indate.split(' ',1)+"</td>"; // split(' ',num) ''기준으로 자르고, 배열에 담긴 값중 num개 만 출력 
				listHTML += "<td>"+obj.good+"</td>";
				listHTML += "<td>"+obj.count+"</td>";
				listHTML += "</tr>";
			
				// 상세 게시글 보여주기
				listHTML += "<tr id='c"+obj.idx+"' style='display:none;'>";
				listHTML += "<td>내용</td>";			
				listHTML += "<td colspan='5'>";			
				listHTML += "<textarea id='ta"+obj.idx+"' readonly class='form-control' rows='7'>";
				listHTML += "</textarea>";			
				
				listHTML += "<span id='up"+obj.idx+"'><button class='btn btn-success' onclick='goUpdateForm("+obj.idx+")'>수정</button></span> &nbsp;";
				listHTML += "<button class='btn btn-warning' onclick='goDelete("+obj.idx+")'>삭제</button>";
				
				listHTML += "</td>";			
				listHTML += "</tr>";
			});	
			
			listHTML += "</tbody></table>";
			listHTML += "<button type='button' class='btn btn-outline-primary btn-sm' onclick='goForm()' style='float:right'>글쓰기</button>";
			
			$('#view').html(listHTML);
			goList();
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
				url : "board/new",
				data: $("#form").serialize(),
				type: 'POST',
				success : loadList, // 새로고침
				error : ()=>{alert("error");}				
			});
			$("#fclear").trigger("click");
		}
		
		// 게시글 상세조회
		const goContent = (idx) => {
		    if ($("#c" + idx).css("display") == "table-row") {
		        $("#c" + idx).css("display", "none");
		        // 조회수 올리기
		        $.ajax({
		            url: "board/count/"+idx,
		            type: 'put',
		            success: loadList,
		            error : ()=>{alert("error");}
		        });
		    } else {
		    	// 내용 비동기 방식으로 가져온 다음 태그 형식으로 넣어주면 됨 
		    	
		     $.ajax({
		            url: "board/"+idx,
		            dataType: "json",
		            type: "get",
		            success: (data)=>{
		            	$("#ta"+idx).val(data.content);
		            },
		            error : ()=>{alert("error");}
		        });
		    	
		    	
		    	
		        $("#c" + idx).css("display", "table-row");

		    }
		}

		// 게시글 삭제
		const goDelete=(idx)=>{
			$.ajax({
				url : "board/"+idx,
				type: 'delete',
				success : loadList, // 새로고침
				error : ()=>{alert("error");}				
			});
			$("#fclear").trigger("click");
		}		
		
		// 수정화면 만들어주는 부분
		const goUpdateForm=(idx)=>{
			$("#ta"+idx).attr("readonly", false);
			
			// title 부분을 input태그로 바꾸기
			var title = $("#t"+idx).text();
			var newInput = "<input type='text' id='nt"+idx+"' class='form-control' value='"+title+"'>"; 
			$("#t"+idx).html(newInput);
			
			// 수정 버튼을 DB값을 바꾸는 버튼으로 바꾸기
			var newButton = "<button class='btn btn-primary' onclick='goUpdate("+idx+")'>등록</button>";
			$("#up"+idx).html(newButton);
		}
		
		// 값을 수정해주기
		const goUpdate=(idx)=>{
			var title = $("#nt"+idx).val();
			var content = $("#ta"+idx).val();			
			$.ajax({
				url : "board/update",
				type: 'put', // put방식은 json 형식을 인식 못함
				contentType : "application/json; charset=UTF-8", // put방식에서 타입 명시
				// javascript에서 쓰이는 자바객체(클래스)를 활용해서 보내줘야 함 -> JSON이라는 클래스 활용
				data: JSON.stringify({'title':title,
						'content':content,
						'idx':idx}),
				success : loadList, // 새로고침
				error : ()=>{alert("error");}				
			});
		}
		
	</script>
	
</head>
<body>
 
<div class="container">
	<h2>SpringMVC03</h2>
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
									<button type="reset" class="btn btn-outline-secondary btn-sm" id='fclear'>초기화</button>
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
