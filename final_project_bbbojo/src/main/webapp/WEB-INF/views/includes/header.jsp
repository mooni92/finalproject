<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark ftco-navbar-light scrolled sleep awake" id="ftco-navbar">
	    <div class="container">
	      <a class="navbar-brand" href="${pageContext.request.contextPath}/index"><img id="scrollLogo" style="max-width: 200px" src="${pageContext.request.contextPath}/resources/images/index/blueLogo.png" alt="logo"></a>
	      <button class="navbar-toggler js-fh5co-nav-toggle fh5co-nav-toggle" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="oi oi-menu"></span> Menu
	      </button>
		
	      <div class="collapse navbar-collapse" id="ftco-nav" aria-expanded="true">
	        <ul class="navbar-nav nav ml-auto">
	        	<li class="nav-item"><a href="${pageContext.request.contextPath}/notice/noticeList" class="nav-link"><span>공지사항</span></a></li>
	        	<li class="nav-item"><a href="${pageContext.request.contextPath}/board/list" class="nav-link"><span>게시판</span></a></li>
	          	<li class="nav-item"><a href="${pageContext.request.contextPath}/course/enrollclass" class="nav-link"><span>수강신청</span></a></li>
	         	<li class="nav-item"><a href="${pageContext.request.contextPath}/course/credit" class="nav-link"><span>학점계산기</span></a></li>
	         	<li class="nav-item"><a href="http://spring.980108.shop" class="nav-link"><span>책방</span></a></li>
	        	<li class="nav-item dropdown header-profile">
	                <button class="nav-link ml-2" id="profile" data-toggle="dropdown" aria-expanded="false">
	                    <i class="icon icon-user"></i>
	                </button>
	                <div class="dropdown-menu dropdown-menu-right">
	                    <a href="/member/myinfo" class="dropdown-item">
	                        <i class="icon-user"></i>
	                        <span class="ml-2">My info </span>
	                    </a>
	                    <sec:authorize access="isAnonymous()">
	                    <a href="/customLogin" class="dropdown-item">
	                        <i class="icon-lock"></i>
	                        <span class="ml-2"> Login </span>
	                    </a>
	                    </sec:authorize>
	                    <sec:authorize access="isAuthenticated()">
	                    <a href="#" onclick="document.getElementById('logout-form').submit();" class="dropdown-item">
						<i class="icon-unlock"></i>
	                    <span class="ml-2">Logout </span>
						<form id="logout-form" action='<c:url value='/logout'/>' method="POST">
						   <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						</form>
						</a>
						</sec:authorize>
	                    <sec:authentication property="principal" var="pinfo"/>
                       	<sec:authorize access="isAuthenticated()">
                       	<input type="hidden" name="grade" id="grade" value=""${pinfo.memberVo.grade}>
                       	<c:if test="${pinfo.memberVo.grade == 'admin'}">
	                    <a href="${pageContext.request.contextPath}/adminMember/list" class="dropdown-item">
	                        <i class="icon-key"></i>
	                        <span class="ml-2">Admin </span>
	                    </a>
                       	</c:if>
                       	</sec:authorize>
	                </div>
	            </li>
	        </ul>
	      		
	      </div>
	    </div>
	  </nav>