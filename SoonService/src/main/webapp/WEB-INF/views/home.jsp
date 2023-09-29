<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Soon Service</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>

  <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

  <script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
    integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh"
    crossorigin="anonymous"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

  <script type="text/javascript">
	$(document).ready(()=>{
		// HTML 구조가 다 로딩이 된 후에 loadList()실행
		loadList()
	});
	
		const loadList=()=>{
			// BoardController에서 게시글 전체목록을 가져오는 기능
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
		
			var listHTML = "<div class='card'>";
			listHTML += "<div class='card-body'>";			
			// jQuery 반복문
			$.each(data, (index, obj)=>{
				listHTML += "<h5 class='card-title'>"+obj.bTitle+"</h5>";
        listHTML += "<h6 class='card-subtitle mb-2 text-muted'>"+obj.nick+"</h6>";
        listHTML += "<p class='card-text'>"+obj.bContent+"</p><hr>";
        listHTML += "<p class='card-text' style='font-size: smaller;'>"+obj.bDate+"</p>";
        listHTML += "<p class='card-text'>💓<span>"+obj.bGood+"</span></p>";
        listHTML += "<div id='repleArea'><input type='text' id='reple' name='reple' class='form-control'><button id='reIns' type='button' class='btn btn-primary btn-sm' onclick='repleInsert()'>등록</button></div>";
			});		
			listHTML += "</div></div>";
			
			$('#CList').html(listHTML);
		}







  </script>



</head>

<body>
  <!-- 헤더 -->
  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid" id="headCon">
      <a class="navbar-brand" href="/">순이</a>
      <ul class="nav nav-pills">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">타임라인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">마이페이지</a>
        </li>
      </ul>
    </div>
  </nav>

  <!-- 첫 화면 로그인 -->
  <div class="accordion" id="login" style="display:none">
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingOne">
        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne"
          aria-expanded="true" aria-controls="collapseOne">
          카카오로 시작하기
        </button>
      </h2>
      <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
        data-bs-parent="#accordionExample">
        <div class="accordion-body">
          <ul>
            <li id="kakao-login-btn" onclick="kakaoLogin();">
              <a href="javascript:void(0)">
                <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" alt="카카오 로그인 버튼">
              </a>
            </li>
            <!-- 로그인 시작 -->
            <script>
              //카카오로그인
              const kakaoLogin = () => {
                Kakao.Auth.login({
                  scope: 'profile_nickname, account_email',
                  success: () => {
                    Kakao.API.request({
                      url: '/v2/user/me',
                      success: (response) => {
                        console.log(response)
                        // Ajax를 이용해 post방식으로 값 넘기기                   
                        $.ajax({
                          type: 'POST',
                          url: 'EmailCheck',
                          data: { email: response.kakao_account.email },
                          datatype: "text",
                          success: (data) => {
                            if (data == 'false') {
                              $.ajax({
                                // 로그인 시키기
                                type: 'POST',
                                url: 'LoginService',
                                data: {
                                  nickName: response.properties.nickname,
                                },
                                success: (result) => {
                                  console.log(result);
                                  location.replace();
                                },
                                error: () => {
                                  location.replace();
                                }
                              })
                            } else {
                              $.ajax({
                                // 중복이 아니니까 회원가입 시키기
                                type: 'POST',
                                url: 'JoinService',
                                data: {
                                  nickName: response.properties.nickname,
                                  email: response.kakao_account.email,
                                },
                                success: (result) => {
                                  console.log(result);
                                  location.replace();
                                },
                                error: (error) => {
                                  console.log(error);
                                  location.replace();
                                }
                              })
                            }
                          }
                        });
                      },
                      fail: (error) => {
                        console.log(error)
                      },
                    })
                  },
                  fail: (error) => {
                    console.log(error)
                  },
                })
              }
            </script>
            <!-- 
              ✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️✌️
             -->



          </ul>
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingTwo">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo"
          aria-expanded="false" aria-controls="collapseTwo">
          메일로 로그인
        </button>
      </h2>
      <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
        data-bs-parent="#accordionExample">
        <div class="accordion-body">
          로그인 넣기
        </div>
      </div>
    </div>
    <div class="accordion-item">
      <h2 class="accordion-header" id="headingThree">
        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
          data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          메일로 회원가입
        </button>
      </h2>
      <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
        data-bs-parent="#accordionExample">
        <div class="accordion-body">
          회원가입 넣기
        </div>
      </div>
    </div>
  </div>

  <!-- 로그인 하면 타임라인, 마이페이지 중 선택 (기본은 스레드) -->

  <!-- 타임라인 목록 -->
  <div id="CList">
    
  </div>





</body>

</html>