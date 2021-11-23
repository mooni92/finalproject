<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
   <jsp:include page="../includes/header.jsp"/>
    <div class="authincation h-100 mt-4">
        <div class="container-fluid h-100 mt-4">
            <div class="row justify-content-center h-100 align-items-center mt-4">
                <div class="col-md-6 mt-5">
                    <div class="authincation-content mt-5">
                        <div class="row no-gutters">
                            <div class="col-xl-12">
                                <div class="auth-form">
                                    <h4 class="text-center mb-4 mt-4">로그인</h4>
                                   		<form class="user" method="post" action="/login">
                                        		<div class="form-group">
                                            		<label for ="id"><strong>아이디</strong></label>
                                            		<input type="text" class="form-control form-control-user" 
                                           			 name="username" value="kwak" placeholder="아이디를 입력해주세요">
                                        		</div>
		                                        <div class="form-group">
		                                            <label for="password"><strong>패스워드</strong></label>
		                                           <input type="password" class="form-control form-control-user"
		                                           	name="password" value="pw00" placeholder="비밀번호를 입력해주세요">
				                                </div>
				                                <div class="text-center">
                                            		<button type="submit" class="btn btn-primary btn-block">로그인</button>
                                        		</div>
                                        		<!-- <div class="form-group">
		                                                 <input type="checkbox" class="custom-control-input" id="customCheck">
                                                		<label class="custom-control-label" for="customCheck">Remember Me! X</label>
                                            	</div> -->
		                                        <div class="form-row d-flex justify-content-between mt-4 mb-2">
                                           			 <div class="form-group">
                                                		<a href="page-forgot-password.html">패스워드 찾기</a>
                                            		</div>
                                        		</div>
                                        <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
                                        <sec:csrfInput/>
                                    </form>
                                    <div class="new-account mt-3">
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
<jsp:include page="../includes/foot.jsp"/>
</html>