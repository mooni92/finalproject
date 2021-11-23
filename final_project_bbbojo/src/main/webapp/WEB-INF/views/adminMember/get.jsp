<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../adminIncludes/head.jsp" />
<sec:csrfMetaTags />
</head>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="sk-three-bounce">
			<div class="sk-child sk-bounce1"></div>
			<div class="sk-child sk-bounce2"></div>
			<div class="sk-child sk-bounce3"></div>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->


	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Header start
        ***********************************-->
<jsp:include page="../adminIncludes/header.jsp" />
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->

		<!--**********************************
            Sidebar start
        ***********************************-->
<jsp:include page="../adminIncludes/sidebar.jsp" />
		<!--**********************************
            Sidebar end
        ***********************************-->
		<!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body">
			<div class="container-fluid">
				<!-- Page Heading -->
				<h1 class="h3 mb-2 text-gray-800">Tables</h1>
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary float-left mt-2">회원 목록</h6>
					</div>
					<div class="card-body">
						<div class="table dataTable_filter ">
							<div class="row">
								<div class="col-sm-12">
									<form method="post">
										<table class="table table-bordered dataTable text-center"
											id="dataTable">
											<tr>
												<th>ID</th>
												<td><c:out value="${member.id}" /> <input type="hidden" value="${member.id}" id="id"></td>
												<th>학생번호</th>
												<td><c:out value="${member.studno}" /> <input type="hidden" value="${member.studno}" id="studno"></td>
											</tr>
											<tr>
												<th>이름</th>
												<td><c:out value="${member.name}" /> <input type="hidden" value="${member.name}" id="name"></td>
												<th>이메일</th>
												<td><c:out value="${member.email}" /> <input type="hidden" value="${member.email}" id="email"></td>
											</tr>
											<tr>
												<th>전화번호</th>
												<td><c:out value="${member.phonenum}" /> <input type="hidden" value="${member.phonenum}" id="phonenum"></td>
												<th>등급</th>
												<td><c:out value="${member.grade}" /> <input type="hidden" value="${member.grade}" id="grade"></td>
											</tr>
											<tr>
												<th>닉네임</th>
												<td><c:out value="${member.nickname}" /> <input type="hidden" value="${member.nickname}" id="nickname"></td>
											</tr>
										</table>
										<div class="float-right">
											<a class="btn btn-secondary" href="modify${cri.params}&id=${member.id}&studno=${member.studno}">Modify</a>
											<a class="btn btn-primary" href="list${cri.params}">List</a>
										</div>
									</form>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-sm-12">
									<div id="accordion-one" class="accordion">
										<div class="accordion__item">
											<div class="accordion__header collapsed" data-toggle="collapse" data-target="#default_collapseTwo" aria-expanded="false">
												<span class="accordion__header--text">수강신청한 목록</span> 
												<span class="accordion__header--indicator"></span>
											</div>
											<div id="default_collapseTwo" class="accordion__body collapse " data-parent="#accordion-one" style="">
												<div class="accordion__body--text">
													<table class="table table-bordered text-center" id="dataTable">
														<thead>
							                                <tr class="text-center">
							                                	<th>학과</th>
							                                    <th>과목번호</th>
							                                    <th>교과목명</th>
							                                    <th>교수성명</th>
							                                    <th>수업시간</th>
							                                    <th>수업요일</th>
							                                    <th>최대인원</th>
							                                    <th>수강인원</th>
							                                </tr>
							                            </thead>
							                            <tbody>
							                            <c:forEach items="${course}" var="course">
							                            	<tr id="courseList" class="text-center">
							                            		<td><c:out value="${course.deptno}"/>
							                            		<input type="hidden" value="${course.deptno}" id="deptno"></td>
							                            		<td><c:out value="${course.courno}"/>
							                            		<input type="hidden" value="${course.courno}" id="courno"></td>
							                            		<td><c:out value="${course.name}"/>
							                            		<input type="hidden" value="${course.name}" id="name"></td>
							                            		<td><c:out value="${course.pic}"/>
							                            		<input type="hidden" value="${course.pic}" id="pic"></td>
							                            		<td><c:out value="${course.startTime}시~${course.endTime}시"/>
							                            		<input type="hidden" value="${course.startTime}시~${course.endTime}시" id="hour"></td>
							                            		<td><c:out value="${course.day}"/>
							                            		<input type="hidden" value="${course.day}" id="day"></td>
							                            		<td><c:out value="${course.maxCnt}"/>
							                            		<input type="hidden" value="${course.maxCnt}" id="maxCnt"></td>
							                            		<td><c:out value="${course.cnt}"/>
							                            		<input type="hidden" value="${course.cnt}" id="cnt"></td>
							                            	</tr>
							                            </c:forEach>
							                            </tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--**********************************
            Content body end
        ***********************************-->


		<!--**********************************
            Footer start
        ***********************************-->
<jsp:include page="../adminIncludes/footer.jsp" />
		<!--**********************************
            Footer end
        ***********************************-->

		<!--**********************************
           Support ticket button start
        ***********************************-->

		<!--**********************************
           Support ticket button end
        ***********************************-->


	</div>
	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
	<script src="${pageContext.request.contextPath}/resources/js/course.js"></script>
	<script>
		var csrfHeader = $("meta[name='_csrf_header']").attr("content");
		var csrfToken = $("meta[name='_csrf']").attr("content");

		$(document).ajaxSend(function(e, xhr) {
			xhr.setRequestHeader(csrfHeader, csrfToken);
		})

	</script>
<jsp:include page="../adminIncludes/foot.jsp" />
</body>

</html>