<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
        <div class="quixnav">
            <div class="quixnav-scroll">
                <ul class="metismenu" id="menu">
                    <%-- <li class="nav-label first">관리자</li>
                    <li>
                    	<a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    		<i class="icon icon-single-04"></i><span class="nav-text">기본 설정</span>
                    	</a>
                        <ul aria-expanded="false">
                            <li><a href="${pageContext.request.contextPath}/common/adminIndex">관리자 설정</a></li>
                        </ul>
                    </li> --%>
                    <li class="nav-label">회원</li>
                    <li>
                    	<a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    		<i class="icon icon-app-store"></i><span class="nav-text">회원 관리</span>
                    	</a>
                        <ul aria-expanded="false">
                            <li><a href="${pageContext.request.contextPath}/adminMember/list">회원 목록</a></li>
                            <li><a href="${pageContext.request.contextPath}/adminWithdraw/list">탈퇴 회원</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">게시판</li>
                    <li>
                    	<a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    		<i class="icon icon-chart-bar-33"></i><span class="nav-text">게시판 관리</span>
                    	</a>
                        <ul aria-expanded="false">
                            <li><a href="${pageContext.request.contextPath}/adminBoard/list?category=1">공지사항</a></li>
                            <li><a href="${pageContext.request.contextPath}/adminBoard/list?category=2">게시글</a></li>
                        </ul>
                    </li>
                    <li class="nav-label">수강</li>
                    <li>
                    	<a class="has-arrow" href="javascript:void()" aria-expanded="false">
                    		<i class="icon icon-world-2"></i><span class="nav-text">수강 강의</span>
                    	</a>
                        <ul aria-expanded="false">
                            <li><a href="${pageContext.request.contextPath}/adminCourse/list">강의 설정</a></li>
                        </ul>
                    </li>
            	</ul>
            </div>
        </div>