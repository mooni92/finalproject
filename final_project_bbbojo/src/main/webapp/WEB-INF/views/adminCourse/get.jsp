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
						<h6 class="m-0 font-weight-bold text-primary float-left mt-2">강의
							설정</h6>
					</div>
					<div class="card-body">
						<div class="table dataTable_filter ">
							<div class="row">
								<div class="col-sm-12 form-inline mb-3 justify-content-end">
									<button class="btn btn-sm btn-primary" id="addSub">과목 추가</button>
								</div>
								<div class="col-sm-12">
									<form method="post">
										<table class="table table-bordered dataTable text-center"
											id="dataTable">
											<tr>
												<th>수업번호</th>
												<td><c:out value="${course.courno}" /> <input type="hidden" value="${course.courno}" id="courno"></td>
												<th>학과</th>
												<td><c:out value="${course.deptno}" /> <input type="hidden" value="${course.deptno}" id="deptno"></td>
											</tr>
											<tr>
												<th>교과목명</th>
												<td><c:out value="${course.name}" /> <input type="hidden" value="${course.name}" id="name"></td>
												<th>최대인원</th>
												<td><c:out value="${course.maxCnt}" /> <input type="hidden" value="${course.maxCnt}" id="maxCnt"></td>
											</tr>
											<tr>
												<th>교수성명</th>
												<td><c:out value="${course.pic}" /> <input type="hidden" value="${course.pic}" id="pic"></td>
												<th>수업시작시간</th>
												<td><c:out value="${course.startTime}시" /> <input type="hidden" value="${course.startTime}" id="hour"></td>
											</tr>
											<tr>
												<th>교수번호</th>
												<td><c:out value="${course.profno}" /> <input type="hidden" value="${course.profno}" id="profno"></td>
												<th>수업종료시간</th>
												<td><c:out value="${course.endTime}시" /> <input type="hidden" value="${course.endTime}" id="hour"></td>
											</tr>
											<tr>
												<th>수업요일</th>
												<td><c:out value="${course.day}" /> <input type="hidden" value="${course.day}" id="day"></td>
												<th>수강인원</th>
												<td><c:out value="${course.cnt}" /> <input type="hidden" value="${course.cnt}" id="cnt"></td>
											</tr>
										</table>
										<div class="float-right">
											<a class="btn btn-secondary" href="modify${cri.params}&courno=${course.courno}">Modify</a>
											<a class="btn btn-primary" href="list${cri.params}">List</a>
										</div>
									</form>
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-sm-12">
									<div id="accordion-one" class="accordion">
										<div class="accordion__item">
											<div class="accordion__header collapsed" data-toggle="collapse" data-target="#default_collapseOne" aria-expanded="false">
												<span class="accordion__header--text">수업 과목 목록</span> 
												<span class="accordion__header--indicator"></span>
											</div>
											<div id="default_collapseOne" class="accordion__body collapse" data-parent="#accordion-one" style="">
												<div class="accordion__body--text">
													<table class="table table-bordered text-center subTable" id="subTable">
														<thead>
															<tr>
																<th>과목번호</th>
																<th>과목명</th>
															</tr>
														</thead>
														<tbody id="sub">
															<c:forEach items="${subject}" var="subject">
																<tr>
																	<td><c:out value="${subject.subno}" /><input type="hidden" id="subno" name="subno" value="${subject.subno}"></td>
																	<td><c:out value="${subject.name}" /></td>
																	<td>
																		<button class="btn btn-outline-primary btn-sm btnRmSub" id="btnRmSub" data-subno="${subject.subno}">삭제</button>
																	</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="accordion__item">
											<div class="accordion__header collapsed" data-toggle="collapse" data-target="#default_collapseTwo" aria-expanded="false">
												<span class="accordion__header--text">수강신청한 학생 목록</span> 
												<span class="accordion__header--indicator"></span>
											</div>
											<div id="default_collapseTwo" class="accordion__body collapse " data-parent="#accordion-one" style="">
												<div class="accordion__body--text">
													<table class="table table-bordered text-center" id="dataTable">
														<thead>
															<tr>
																<th>학생번호</th>
																<th>아이디</th>
																<th>이름</th>
																<th>신청일</th>
																<th>삭제</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${member}" var="member">
																<tr>
																	<td><c:out value="${member.studno}" /> <input type="hidden" id="studno" name="studno" value="${member.studno}"></td>
																	<td><c:out value="${member.id}" /></td>
																	<td><c:out value="${member.name}" /></td>
																	<td><fmt:formatDate value="${member.enrollclasses[0].edate}" pattern="yy-MM-dd" /></td>
																	<td>
																		<button class="btn btn-outline-primary btn-sm btnRm" data-studno="${member.studno}">삭제</button>
																	</td>
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


		var courno = $("#courno").val();

		$(function() {
			var csrfHeader = $("meta[name='_csrf_header']").attr("content");
			var csrfToken = $("meta[name='_csrf']").attr("content");
			
			$(document).ajaxSend(function(e, xhr) {
				xhr.setRequestHeader(csrfHeader, csrfToken);
			})
			
			$('#dataTable tr').on("click", ".btnRm", function() {
				var studno = $(this).data("studno");
				console.log(studno);
				var enrollclass = {
					courno : courno,
					studno : studno
				};
				if (confirm("수강신청한 학생을 삭제하시겠습니까?")) {
					enrollclassService.remove(enrollclass, function(data) {
						alert(data);
						history.go(0);
					})
				} else {
					return false;
				}

			});
			
			$('#subTable tr').on("click", ".btnRmSub", function() {
				var subno = $(this).data("subno");
				console.log(subno);
				if (confirm("과목을 삭제하시겠습니까?")) {
					subjectService.remove(subno, function(data) {
						alert(data);
						history.go(0);
					})
				} else {
					return false;
				}
			});

			$('#addSub').click(function() {
				var str = "";
				str += '<tr>'
				str += '	<td><input class="subno form-control text-center" ></td>'
				str += '	<td><input class="subname form-control text-center" ></td>'
				str += '	<td>'
				str += '		<input type="hidden" class="courno" value="'+${course.courno}+'">'
				str += '		<button class="btn btn-outline-primary btn-sm btnAddSub" >추가</button>'
				str += '	</td>'
				str += '</tr>'
				$("#sub").append(str);
			})
			
			$('.subTable').on("click", ".btnAddSub", function() {
				var addSubno = $(this).closest('tr').find(".subno").val();
				var addSubname = $(this).closest('tr').find(".subname").val();
				var subject = {subno:addSubno, name:addSubname, courno:courno};
				console.log(subject);
				subjectService.add(subject, function(data) {
					alert(data);
					history.go(0);
				})
			})
		});
	</script>
<jsp:include page="../adminIncludes/foot.jsp" />
</body>

</html>