<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="en">

<head>
<jsp:include page="../includes/head.jsp"/>
</head>
<body class="bg-gradient-primary">
        <!--**********************************
            Header start
        ***********************************-->
        <jsp:include page="../includes/header.jsp"/>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->
		
        <!--**********************************
            Sidebar start
        ***********************************-->
        
        <!-- 사이드바 부분인데 지워놨음 -->
        
        <!--**********************************
            Sidebar end
        ***********************************-->
        <!--**********************************
            Content body start
        ***********************************-->
       
        <!--**********************************
            Content body end
        ***********************************-->
<body>
	<sec:authentication property="principal" var="pinfo"/>
	<sec:authorize access="isAuthenticated()">
    </sec:authorize>
    <div class="authincation container mt-5 h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-50 align-items-center">
                <div class="col-md-6">
                    <div class="authincation-content">
                        <div class="row no-gutters">
                            <div class="col-md-12">
                                <div class="auth-form h-50">
                                    <h4 class="text-center mb-4 mt-5">회원정보수정</h4>
                                    <form method="POST" >
											 	<div class="form-group">
										 			<label for="id">아이디</label>
										 				<input type="text" class="id form-control" id="id" name="id" value="${pinfo.memberVo.id}"  placeholder="아이디" onkeyup="checkId()" onchange="checkidJ()" readonly>
										 				<p id="alertid" class="alert"></p>
										 			<label for="pw">패스워드</label>
										 				<input type="password" class="form-control" id="pw" name="pw"  placeholder="패스워드" onkeyup="checkPw()" onchange="checkpwJ()">
										 			<label for="pwck">패스워드확인</label>
										 				<input type="password" class="form-control" id="pwck" name="pwck" 	placeholder="패스워드 확인" onkeyup="checkPw()" onchange="checkpwJ()">
										 				<p id="alertpw" class="alert"></p>
										 			<label for="name">이름</label>
										 				<input type="text" class="form-control" id="name" name="name" value="${pinfo.memberVo.name}" placeholder="이름" onchange="checkName()">
										 				<p id="alertname" class="alert"></p>
										 			<label for="nickname">닉네임</label>
										 				<input type="text" class="form-control" id="nickname" name="nickname" value="${pinfo.memberVo.nickname}" placeholder="닉네임" onkeyup="checkNick()">
										 				<p id="alertnick" class="alert"></p>
										 			<label for="email">이메일</label>
										 				<input type="text" class="form-control" id="email" name="email" value="${pinfo.memberVo.email}" placeholder="이메일" onkeyup="checkEmail()" onchange="checkemailJ()">
										 				<p id="alertemail" class="alert"></p>
										 			<label for="phonenum">전화번호</label>
										 				<input type="text" class="form-control" id="phonenum" name="phonenum" value="${pinfo.memberVo.phonenum}" placeholder="전화번호" onkeyup="checkPhone()" onchange="checkphoneJ()">
										 				<p id="alertphone" class="alert"></p>
										 			<label for="grade">학년</label>
										 				<select id = "grade" name="grade" class="custom-select mb-3">
							                                <option selected>학년</option>
							                                <option value="1학년">1학년</option>
							                                <option value="2학년">2학년</option>
							                                <option value="3학년">3학년</option>
							                                <option value="4학년">4학년</option>
							                                <option value="5학년">5학년</option>
							                                <option value="6학년">6학년</option>
							                                <option value="졸업생">졸업생</option>
						                              	</select>
						                            <label for="studno">학번</label>
						                            	<input type="text" class="form-control" id="studno" name="studno" value="${pinfo.memberVo.studno}" placeholder="학번" readonly onchange="checkstudnoAtstudent()" onkeyup="checkstudno()">
									    				<p id="alertstudnoatstudent" class="alert"></p>
									    				<p id="alertstudno" class="alert"></p>
									    			<button type="submit" class="btn btn-primary btn-block">회원가입</button>
											 	</div>
											 <sec:csrfInput/>
									</form>
                                    <div class="new-account mt-3">
                                        <p>계정이 있으신가요? <a class="text-primary" href="/customLogin">로그인!</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<jsp:include page="../includes/footer.jsp"/>
<jsp:include page="../includes/foot.jsp"/>

</body>
	<script>
	//정규식 변수
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ =  /^[A-za-z0-9]{5,15}/g;
	// 비밀번호 정규식
	var pwJ = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/
	// 이름 정규식
	var nameJ = /^[가-힣]{2,8}$/;
	// 이메일 검사 정규식
	var emailJ = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	//닉네임 정규식
	var nicknameJ = /^[가-힣][A-Za-z0-9]{4,25}$/
	var studnoJ = /^[0-9]{9}$/
	//아이디 유효성체크
		function checkId() {
			var id = $('#id').val();
			$.getJSON("/member/idcheck?id="+id).done(function(result) {
				if(result == 1) {
					$('#alertid').text("");
					$('#alertid').text("이미 사용중인 ID입니다. ID를 변경해주세요")
					$('#alertid').css('color', 'red');
				} else{
					$('#alertid').text("");
					$('#alertid').text("사용가능한 ID입니다.") 
					$('#alertid').css('color', 'green');
				}
			});
		}
		function checkidJ() {
			var id = $('#id').val();
			console.log(id);
			console.log(!/^[A-za-z0-9]{5,15}/.test($("#id").val()));
			$('#id').keyup(function (){
					if(id == "" || empJ.test(id)) {
					$('#alertid').css('color', 'red');
					$('#alertid').text('아이디를 입력하지 않으셨습니다. 아이디를 입력해주세요');
					}else if (!/^[A-za-z0-9]{5,15}/.test($("#id").val())) {
						$('#alertid').text("아이디는 숫자와 영어 대소문자로 5~15자까지 사용가능합니다. ID를 변경해주세요.")
						$('#alertid').css('color', 'red');
					} else if(/^[A-za-z0-9]{5,15}/.test($("#id").val())) {
						$('#alertid').text("사용가능한 ID입니다.") 
						$('#alertid').css('color', 'green');
						$('#alertid').text("");
					}
				})	
			}	
	function checkPw(){
		var pw = $('#pw').val();
		var pwck = $('#pwck').val();
		
		$('#pwck').keyup(function () {
				if(pw!=pwck) {
					$('#alertpw').text('패스워드와 패스워드 확인이 일치 하지 않습니다. 확인 후 다시 입력해주세요.');
					$('#alertpw').css('color', 'red');
				} else {
					$('#alertpw').text('패스워드와 패스워드 확인이 일치합니다.');
					$('#alertpw').css('color', 'green');
				}
			})
		}
	function checkpwJ() {
		var pw = $('#pw').val();
		if(pw== "" || pwck== "" || pw != empJ || pwck != "") {
				$('#alertpw').text('패스워드나 패스워드 확인을 입력하지 않으셨습니다. 아이디를 입력해주세요');
			}
				if(!/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/
						.test(pw.value)) {
					$('#alertpw').text('비밀번호는 4~16자까지 숫자,영문,특수문자를 각 1개 씩 입력하셔야됩니다. 다시 입력해주세요')
					$('#alertpw').css('color', 'red');
				} else if (/^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/
				.test(pw.value)) {
					$('#alertpw').text('사용 가능한 비밀번호입니다.');
					$('#alertpw').css('color', 'green');
				}
			} 

	function checkName(){
		var name = $('#name').val();
		if(name!=nameJ) {
			$('#alertname').text('이름은 가~힣으로 완성 된 2~8자 까지만 입력 가능합니다. 다시 입력해주세요');
			$('#alertname').css('color', 'red');
			} else {
				$('#alertname').text('');
				$('#alertname').text('사용하실 수 있는 이름입니다.');
				$('#alertname').css('color', 'green');
			}
		}
	function checkNick(){
		var nickname = $('#nickname').val();
		
		$('#nickname').keyup(function () {
				if(nickname!=nicknameJ) {
					$('#alertnick').text('');
					$('#alertnick').text('닉네임은 영어 및 한글로 4~25자 까지만 입력 가능합니다. 확인 후 다시 입력해주세요');
				} else {
					$('#alertnick').text('사용하실 수 있는 닉네임입니다.');
				}
			})
		}
	function checkEmail(){
		var email = $('#email').val();
		$.getJSON("/member/emailcheck?email="+email).done(function(result) {
			if(result == 1) {
				$('#alertemail').text("이미 사용중인 이메일입니다. 이메일을 변경해주세요")
			} else {
				$('#alertemail').text("사용가능한 이메일입니다.") 
			}
		})
	}
	function checkemailJ() {
		var email = $('#email').val();
		if(email!=emailJ){
			$('#alertemail').text("유효하지 않은 이메일입니다. 다시 입력해 주세요")
		} else {
			$('#alertemail').text("사용 할 수 있는 이메일입니다.")
		}
	}
	function checkPhone() {
		var phone = $('#phonenum').val();
		var param = "/member/phonecheck?phone="+encodeURIComponent(phone);
		/* var phonestring = phone.split('-');
		var phonenum1 = phone.substring(0,3)
		var phonenum2 = phone.substring(4,8)
		var phonenum3 = phone.substring(9,13)
		console.log(phonenum1 + "번" + phonenum2 + "번" + phonenum3 + "번") */
		$.getJSON(param).done(function(result) {
			if(result == 1) {
				$('#alertphone').text("");
				$('#alertphone').text("이미 사용중인 전화번호입니다. 전화번호를 변경해주세요")
				$('#alertphone').css('color', 'red');
			} else{
				$('#alertphone').text("");
				$('#alertphone').text("사용가능한 전화번호입니다.") 
				$('#alertphone').css('color', 'green');
			}
		});
	}
	
	function checkphoneJ(){
		var phone = $('#phonenum').val();
		$('#alertphone').keyup(function () {
				if(phoneJ.test(phone)) {
					$('#alertphone').text('유효하지 않은 전화번호 입니다. 확인 후 다시 입력해주세요');
				} else {
					$('#alertphone').text('사용하실 수 있는 전화번호입니다.');
				}
			})
	}
	function checkstudno() {
		var studno = parseInt($('#studno').val());
		$.getJSON("/member/studnocheck?studno="+studno).done(function(result) {
			if(result == 1) {
				if(studnoJ.test(studno)){
				console.log(studnoJ.test(studno));
				$('#alertstudno').text("");
				$('#alertstudno').text("이미 사용중이거나 유효하지 않은 학번입니다. 학번을 변경해주세요")
				$('#alertstudno').css('color', 'red');
			}
			}	else{
				if(studnoJ.test(studno)){$('#alertstudno').text("유효하지 않은 학번입니다. 학번을 변경해주세요")}
				$('#alertstudno').text("사용가능한 학번입니다.") 
				$('#alertstudno').css('color', 'green');
				$('#alertstudno').text("");
				
			}
		});
	}
	function checkstudnoAtstudent() {
		var studno = parseInt($('#studno').val());
		$.getJSON("/member/studnocheckatstudent?studno="+studno).done(function(result) {
			if(result != 1) {
				$('#alertstudnoatstudent').text("");
				$('#alertstudnoatstudent').text("등록되지않은 학번입니다. 확인 후 다시 입력해주세요")
				$('#alertstudnoatstudent').css('color', 'red');
			} else{
				$('#alertstudnoatstudent').text("");
				$('#alertstudnoatstudent').text("존재하는 학번입니다.") 
				$('#alertstudnoatstudent').css('color', 'green');
			}
		});
	}
	</script>
</html>