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
		 	<input type="hidden" name="name" id="name" value="${pinfo.memberVo.name}"/>
		 </sec:authorize>
		  <div class="col-lg-6 mt-5 d-flex justify-content-center">
                        <div class="card mt-5 ml-5 card bg-info align-content-center">
                            <div class="card-header">
                                <h3 class="card-title">회원 정보</h3>
                            </div>
                            <div class="card-body">
                                <div class="bootstrap-media">
                                    <div class="media">
                                         	<div class="container mt-3 h-100">
												<h3>회원 정보</h3>
												<h3 class=".col-lg">${pinfo.memberVo.grade}학년 ${pinfo.memberVo.name}님 환영합니다.</h3>
										      	<h5><a href="/member/modify">정보 수정</a></h5>
										      	<h5><a href="/member/withdraw">회원 탈퇴</a></h5>
											</div>
                                		</div>
                            		</div>
                        		</div>
                    		</div>
                		</div>
<jsp:include page="../includes/footer.jsp"/>
<jsp:include page="../includes/foot.jsp"/>
</body>
<script src="${pageContext.request.contextPath}/resources/js/member.js"></script>

</html>