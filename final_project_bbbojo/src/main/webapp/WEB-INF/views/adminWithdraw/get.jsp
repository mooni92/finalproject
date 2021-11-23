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
                            <h6 class="m-0 font-weight-bold text-primary float-left mt-2">탈퇴 회원</h6>
                        </div>
                        <div class="card-body">
                            <div class="table dataTable_filter ">
                               	<div class="row">
	                               	<div class="col-sm-12">
	                               		<form method="post">
		                               		<table class="table table-bordered dataTable" id="dataTable">
			                                    <thead>
			                                        <tr class="text-center">
				                                        <th>ID</th>
					                                    <th>탈퇴날짜</th>
					                                    <th>탈퇴사유</th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
					                            	<tr class="text-center">
					                            		<td><c:out value="${withdraw.id}"/></td>
					                            		<td><c:out value="${withdraw.wdate}"/></td>
					                            		<td><c:out value="${withdraw.comments}"/></td>
					                            	</tr>
			                                    </tbody>
		                               		</table>
		                               		<div class="float-right">
												<a class="btn btn-secondary" href="modify${cri.params}&id=${withdraw.id}">Modify</a>
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