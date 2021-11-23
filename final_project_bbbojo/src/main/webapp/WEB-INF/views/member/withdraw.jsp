<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="../includes/head.jsp"/>
	<sec:csrfMetaTags/>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Login</title>
    <!-- Custom fonts for this template-->
</head>

<body class="h-100">
   <sec:authentication property="principal" var="pinfo"/>
	<sec:authorize access="isAuthenticated()">
    </sec:authorize>
   <jsp:include page="../includes/header.jsp"/>
    <div class="authincation h-100 mt-4">
        <div class="container-fluid h-100 mt-4">
            <div class="row justify-content-center h-100 align-items-center mt-4">
                <div class="col-md-6 mt-5">
                    <div class="authincation-content mt-5">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4 mt-4">회원 탈퇴</h4>
                                   		<form method="post">
                                        		<div class="form-group">
                                            		<label for ="id"><strong>아이디</strong></label>
                                            		<input type="text" class="form-control form-control-user" 
                                           			 id="id" name="id" placeholder="아이디를 입력해주세요" onkeyup="checkId()">
                                        			<p id="alertid" class="alert"></p>
                                        			<label for ="pw"><strong>패스워드</strong></label>
                                            		<input type="password" class="form-control form-control-user" 
                                           			 id="pw" name="pw" placeholder="패스워드를 입력해주세요" onkeyup="checkId()">
                                        			<p id="alertid" class="alert"></p>
		                                          	<label for="phonenum">전화번호</label>
										 			<p id="alertphone" class="alert"></p>
										 			<input type="text" class="form-control" id="phonenum" name="phonenum" placeholder="전화번호" />
		                                           <input type="button" value="인증번호 전송" class="btn-info bg-info btn-sm" id="btn" onclick="doTimer()">
														<p id="timer"></p>
													<label for="typingcode">인증번호 입력</label>
														<input type="text" class="form-control" id="typingcode" name="typingcode">
														<input type="button" id="conbtn" name="conbtn" class="btn-info bg-info btn-sm" value="확인" onclick="doCodeCheck()">
		                                            <label class="form-check-label" for="comments">탈퇴 사유</label>
		                                           <textarea class="form-control form-control-user text-left" name="comments" id="comments" placeholder="탈퇴 사유를 입력해주세요" onkeyup="checkcomments()">
				                                	</textarea>
				                                	<p id="alertcomments" class="alert"></p>
				                                </div>
				                                <div class="text-left">
                                            		<button type="submit" class="btn btn-primary btn-block" id="withdraw">회원 탈퇴</button>
                                        		</div>
                                        <sec:csrfInput/>
                                    </form>
                                    <div class="new-account mt-3">
                                        <p>마음이 바뀌셨나요?<a class="text-primary" href="/common/index" >인덱스 페이지</a></p>
                                        <p>계정이 없으신가요? <a class="text-primary" href="member/register">회원가입</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<jsp:include page="../includes/footer.jsp"/>
<script>
	var empJ = /\s/g;
	var idcheck = 0;
	var commentcheck = 0;
	var phonecheck = 0;
		function checkId() {
			var id = $('#id').val();
			console.log(id);
			$.getJSON("/member/idcheck?id="+id).done(function(result) {
				if(result != 1) {
					$('#alertid').text("");
					$('#alertid').text("존재하지 않는 ID입니다. 확인 후 ID를 변경해주세요")
					$('#alertid').css('color', 'red');
					idcheck = 0;
				} else{
					$('#alertid').text("");
					$('#alertid').text("존재하는 ID입니다.") 
					$('#alertid').css('color', 'green');
					idcheck = 1;
				}
			});
		}
		function checkcomments() {
			var comments =document.getElementById("comments").value;
			console.log(comments)
			if(!empJ.test(comments)){
				$('#alertcomments').text("탈퇴사유가 입력되지 않았습니다.")
				$('#alertcomments').css('color', 'red');
				commentcheck=0;
			} else {
				$('#alertcomments').text("탈퇴사유가 입력됐습니다.")
				$('#alertcomments').css('color', 'green');
				commentcheck=1;
			}
		};
		var intervalVar = undefined;
		var timeSecond = undefined;
		var phoneNumber;
		// 인증번호
		var authenticationCode = undefined;
		function doTimer() {
			$('#btn').prop('value', '인증번호 재전송');
			phoneNumber = $('#phonenum').val();
			console.log(phoneNumber);
			memberService.get(phoneNumber, function (data) {
				authenticationCode = data;
			})		
		
			timeSecond = 180;
			$('#timer').text(getTimeString(timeSecond));

			if (intervalVar != undefined) {
				clearInterval(intervalVar);
			}

			intervalVar = setInterval(function() {
			   if (timeSecond != 0) {
				   timeSecond = timeSecond - 1;
				   $('#timer').text(getTimeString(timeSecond));
			   } else {
				   clearInterval(intervalVar);
				   intervalVar = false;
			   }
		   }, 1000);
		}

		function getTimeString(second) {
			var minute = '' + (Math.floor(second / 60));
			var dividedSec = second % 60;
			if (dividedSec < 10) {
				dividedSec = '0' + dividedSec;
			}
			// ex) 3:00 -> 3분
			return minute + ":" + dividedSec;
		}
		
		function doCodeCheck() {
			if (!$('#typingcode').prop('value')) {
	                  alert('인증번호를 입력하세요.');
	                  return;
	              }
	              if (timeSecond == 0 || intervalVar == false) {
	                  alert('인증번호 유효시간이 초과하였습니다. 인증번호를 재전송 해주세요.');
	                  return;
	              }
		
			if (authenticationCode == $('#typingcode').val()) {
				alert('인증번호가 동일합니다.');
				phonecheck = 1;
			} else {
				alert('인증번호가 동일하지 않습니다.');
				phonecheck = 0;
			}
		}
		
		$(function () {
			$("#withdraw").click(function () {
				if(idcheck && commentcheck == 1){
					$("#withdraw").unbind('submit').submit();
				}else{
					return false;
				}
			})
		})
</script>
<jsp:include page="../includes/foot.jsp"/>
</html>