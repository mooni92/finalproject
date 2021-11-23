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
				                                    <th>교과목명</th>
				                            		<td><input id="name" name="name" class="form-control"></td>
			                                        <th>학과</th>
				                            		<td><input id="deptno" name="deptno" class="form-control"></td>
		                                        </tr>
		                                        <tr>
				                                    <th>교수성명</th>
				                            		<td><input id="pic" name="pic" class="form-control"></td>
				                                    <th>최대인원</th>
				                            		<td><input id="maxCnt" name="maxCnt" class="form-control"></td>
		                                        </tr>
		                                        <tr>
				                                    <th>교수번호</th>
				                            		<td><input id="profno" name="profno" class="form-control"></td>
				                                    <th>수업시작시간</th>
				                            		<td><input id="startTime" name="startTime" class="form-control"></td>
		                                        </tr>
		                                        <tr>
				                                    <th>수업요일</th>
				                            		<td><input id="day" name="day" class="form-control"></td>
				                                    <th>수업종료시간</th>
				                            		<td><input id="endTime" name="endTime" class="form-control"></td>
		                                        </tr>
		                               		</table>
		                               		<div class="float-right">
	                        					<sec:csrfInput/>
			                               		<button class="btn btn-secondary" id="btnSubmit">Submit</button>
	                        					<button class="btn btn-danger" type="reset">Reset</button>
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