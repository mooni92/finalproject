<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
                               	<div class="row">
	                               	<div class="col-sm-12">
	                               		<form method="post">
		                               		<table class="table table-bordered dataTable text-center" id="dataTable">
		                                        <tr>
				                                    <th>수업번호</th>
				                            		<td><input value="${course.courno}" id="courno" readonly name="courno"></td>
			                                        <th>학과</th>
				                            		<td><input value="${course.deptno}" id="deptno" name="deptno"></td>
		                                        </tr>
		                                        <tr>
				                                    <th>교과목명</th>
				                            		<td><input value="${course.name}" id="name" name="name"></td>
				                                    <th>최대인원</th>
				                            		<td><input value="${course.maxCnt}" id="maxCnt" name="maxCnt"></td>
		                                        </tr>
		                                        <tr>
				                                    <th>교수성명</th>
				                            		<td><input value="${course.pic}" id="pic" name="pic"></td>
				                                    <th>수업시작시간</th>
				                            		<td><input value="${course.startTime}" id="startTime" name="startTime"></td>
		                                        </tr>
		                                        <tr>
				                                    <th>교수번호</th>
				                            		<td><input value="${course.profno}" id="profno" name="profno"></td>
				                                    <th>수업종료시간</th>
				                            		<td><input value="${course.endTime}" id="endTime" name="endTime"></td>
		                                        </tr>
		                                        <tr>
				                                    <th>수업요일</th>
				                            		<td><input value="${course.day}" id="day" name="day"></td>
		                                        </tr>
		                               		</table>
		                               		<input type="hidden" name="pageNum" value="${cri.pageNum}">
				                        	<input type="hidden" name="amount" value="${cri.amount}">
				                        	<input type="hidden" name="type" value="${cri.type}">
				                        	<input type="hidden" name="keyword" value="${cri.keyword}">
		                               		<div class="float-right">
	                        					<sec:csrfInput/>
			                               		<button class="btn btn-secondary" formaction="modify" type="submit">Modify</button>
			                               		<button class="btn btn-danger" formaction="remove">Remove</button>
					                        	<a class="btn btn-primary" href="list${cri.params}">List</a>
		                               		</div>
	                               		</form>
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