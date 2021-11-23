<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../adminIncludes/head.jsp"/>
<sec:csrfMetaTags/>
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
<jsp:include page="../adminIncludes/header.jsp"/>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
<jsp:include page="../adminIncludes/sidebar.jsp"/>
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
                            <h6 class="m-0 font-weight-bold text-primary float-left mt-2">강의 설정</h6>
                        </div>
                        <div class="card-body">
                            <div class="table dataTable_filter ">
                               	<div class="row justify-content-start">
                               		<div class="col-sm-12 col-md-6 form-inline d-flex mb-3">
	                               		<form class="form-inline">
		                            		<select name="type" class="form-control form-control-sm custom-select custom-select mr-3">
		                            			<option value="D">학과</option>
		                            			<option value="C">수업번호</option>
		                            			<option value="N">교과목명</option>
		                            			<option value="P">교수성명</option>
		                            		</select>
		                            		<div id="dataTable_filter" class="input-group">
		                           				<input type="search" class="form-control form-control" placeholder="search..." aria-controls="dataTable" name="keyword">
		                           				<div class="input-group-append">
					                                <button class="btn btn-primary btn-sm">
					                                    <i class="fas fa-search fa-sm"></i>
					                                </button>
					                            </div>
		                            		</div>
		                            		<input type="hidden" name="pageNum" value="${page.cri.pageNum}">
		                            		<input type="hidden" name="amount" value="${page.cri.amount}">
	                            		</form>
	                            	</div>
	                               	<div class="col-sm-12 col-md-6 form-inline mb-3 justify-content-end">
	                               		<a href="register" class="btn btn-sm btn-primary">수업 추가</a>
	                               	</div>
                               	</div>
                               	<div class="row">
	                               	<div class="col-sm-12">
	                               		<form method="post">
		                               		<table class="table table-bordered dataTable" id="dataTable">
			                                    <thead>
			                                        <tr class="text-center">
				                                        <th>학과</th>
					                                    <th>수업번호</th>
					                                    <th>교과목명</th>
					                                    <th>교수성명</th>
					                                    <th>수업시간</th>
					                                    <th>수업요일</th>
					                                    <th>최대인원</th>
					                                    <th>수강인원</th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
			                                    <c:forEach items="${list}" var="course">
					                            	<tr id="courseList" class="text-center">
					                            		<td><c:out value="${course.deptno}"/></td>
					                            		<td><c:out value="${course.courno}"/></td>
					                            		<td><a href="get${page.cri.params}&courno=${course.courno}"><c:out value="${course.name}"/></a></td>
					                            		<td><c:out value="${course.pic}"/></td>
					                            		<td><c:out value="${course.startTime}시~${course.endTime}시"/></td>
					                            		<td><c:out value="${course.day}"/></td>
					                            		<td><c:out value="${course.maxCnt}"/></td>
					                            		<td><c:out value="${course.cnt}"/></td>
					                            	</tr>
					                            </c:forEach>
			                                    </tbody>
		                               		</table>
	                               		</form>
	                               	</div>
								</div>
	                            <div class="row">
	                      		 	<div class="col-sm-12 col-md-5">
	                      		 	</div>
	                      		 	<div class="col-sm-12 col-md-7">
	                      		 		<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
	                      		 			<ul class="pagination">
	                      		 				<li class="paginate_button page-item previous ${page.prev ? '' : 'disabled'}" id="dataTable_previous">
	                      		 					<a href="list?pageNum=${page.startPage-1}&amount=${page.cri.amount}" aria-controls="dataTable" class="page-link">Previous</a>
	                      		 				</li>
	                      		 				
	                      		 				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
	                      		 				<li class="paginate_button page-item ${p == page.cri.pageNum ? 'active' : ''}">
	                      		 					<a href="list?pageNum=${p}&amount=${page.cri.amount}" aria-controls="dataTable" class="page-link">${p }</a>
	                      		 				</li>
	                      		 				</c:forEach>
	                      		 				
	                      		 				<li class="paginate_button page-item ${page.next ? '' : 'disabled'}" id="dataTable_next">
	                      		 					<a href="list?pageNum=${page.endPage+1}&amount=${page.cri.amount}" aria-controls="dataTable" class="page-link">Next</a>
	                      		 				</li>
	                      		 			</ul>
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
<jsp:include page="../adminIncludes/footer.jsp"/>        
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
<jsp:include page="../adminIncludes/foot.jsp"/>
</body>

</html>