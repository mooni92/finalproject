<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../includes/head.jsp" />
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
<jsp:include page="../includes/header.jsp" />
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->

        <!--**********************************
            Sidebar end
        ***********************************-->
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
			<div class="container-fluid">
                <!-- Page Heading -->
              <!--   <h1 class="h3 mb-2 text-gray-800t text-center" >Tables</h1> -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4 col-sm-8" style="float: none; margin: 0 auto">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary float-left mt-2">공지사항</h6>
                        </div>
                        <div class="card-body">
                            <div class="dataTable_filter ">
                               	<div class="row">
                               		<div class="col-sm-12 col-md-6 form-inline mb-3">
                               			<form class="form-inline">
		                            		<select name="type" class="form-control form-control-sm custom-select custom-select mr-3">
		                            			<option value="T">제목</option>
		                            			<option value="C">내용</option>
		                            			<option value="W">작성자</option>
		                            		</select>
		                            		<div id="dataTable_filter" class="input-group">
		                           				<input type="search" class="form-control form-control" placeholder="search..." aria-controls="dataTable" name="keyword">
		                           				<div class="input-group-append">
					                                <button class="btn btn-primary btn-sm">
					                                    <i class="fas fa-search fa-sm"></i>
					                                </button>
					                            </div>
		                            		</div>
		                            		<input type="hidden" name="pageNum" value="1">
		                            		<input type="hidden" name="amount" value="${page.cri.amount}">
                                    		<input type="hidden" name="category" value="1">
		                           		</form>
	                            	</div>
                            
                               	</div>
                               	<div class="row">
	                               	<div class="col-sm-12">
	                               		<form method="post">
		                               		<table border="1" class="table table-bordered dataTable" id="dataTable">
			                                    <thead>
			                                        <tr class="text-center">
				                                        <th colspan="1">번호</th>
			                                            <th colspan='3'>제목</th>
			                                            <th>작성자</th>
			                                            <th colspan='1'>작성일</th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
			                                    <c:forEach items="${list}" var="board">
					                            	<tr id="boardList" class="text-center">
					                            		<td><c:out value="${board.bno}"/></td>
			                                    		<td colspan='3'><a href="noticeGet${page.cri.params}&bno=${board.bno}&category=1"><c:out value="${board.title}"/></a></td>
			                                    		<td><c:out value="${board.writer}"/></td>
			                                    		<td><fmt:formatDate value="${board.regDate}" pattern="yy-MM-dd"/></td>
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
	                      		 					<a href="noticeList?pageNum=${page.startPage-1}&amount=${page.cri.amount}&category=1" aria-controls="dataTable" class="page-link">Previous</a>
	                      		 				</li>
	                      		 				
	                      		 				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
	                      		 				<li class="paginate_button page-item ${p == page.cri.pageNum ? 'active' : ''}">
	                      		 					<a href="noticeList?pageNum=${p}&amount=${page.cri.amount}&category=1" aria-controls="dataTable" class="page-link">${p }</a>
	                      		 				</li>
	                      		 				</c:forEach>
	                      		 				
	                      		 				<li class="paginate_button page-item ${page.next ? '' : 'disabled'}" id="dataTable_next">
	                      		 					<a href="noticeList?pageNum=${page.endPage+1}&amount=${page.cri.amount}&category=1" aria-controls="dataTable" class="page-link">Next</a>
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
<jsp:include page="../includes/footer.jsp"/>     
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
<jsp:include page="../includes/foot.jsp" /> 
</body>

</html>