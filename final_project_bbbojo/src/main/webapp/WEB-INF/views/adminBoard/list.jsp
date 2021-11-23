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
                            <h6 class="m-0 font-weight-bold text-primary float-left mt-2">게시판 관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table dataTable_filter ">
                               	<div class="row justify-content-start">
                               		<div class="col-sm-12 col-md-6 form-inline d-flex mb-3">
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
		                            		<input type="hidden" name="pageNum" value="${page.cri.pageNum}">
		                            		<input type="hidden" name="amount" value="${page.cri.amount}">
		                            		<input type="hidden" name="category" value="${page.cri.category}">
	                            		</form>
	                            	</div>
	                            	<div class="col-sm-12 col-md-6 form-inline mb-3 justify-content-end">
	                               		<a href="register?category=${page.cri.category}" class="btn btn-sm btn-primary">Register</a>
	                               	</div>
                               	</div>
                               	<div class="row">
	                               	<div class="col-sm-12">
	                               		<form method="post">
		                               		<table class="table table-bordered dataTable" id="boardList" >
			                                    <thead>
			                                        <tr class="text-center">
				                                        <th>번호</th>
			                                            <th>제목</th>
			                                            <th>작성자</th>
			                                            <th>작성일</th>
					                                    <th>카테고리</th>
			                                        </tr>
			                                    </thead>
			                                    <tbody>
			                                    <c:forEach items="${list}" var="board">
					                            	<tr class="text-center">
					                            		<td><c:out value="${board.bno}"/></td>
			                                    		<td><a href="get${page.cri.params}&bno=${board.bno}&category=2"><c:out value="${board.title}"/></a></td>
			                                    		<td><c:out value="${board.writer}"/></td>
			                                    		<td><fmt:formatDate value="${board.regDate}" pattern="yy-MM-dd"/></td>
			                                    		<td><c:out value="${board.category}"/>
			                                    		<input type="hidden" class="categoryName" value="${board.category}"></td>
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
	                      		 					<a href="list?pageNum=${page.startPage-1}&amount=${page.cri.amount}&category=2" aria-controls="dataTable" class="page-link">Previous</a>
	                      		 					<a href="list?pageNum=${page.startPage-1}&amount=${page.cri.amount}" aria-controls="dataTable" class="page-link">Previous</a>
	                      		 					<a href="list?pageNum=${page.startPage-1}&amount=${page.cri.amount}&category=${page.cri.category}" aria-controls="dataTable" class="page-link">Previous</a>
	                      		 				</li>
	                      		 				
	                      		 				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
	                      		 				<li class="paginate_button page-item ${p == page.cri.pageNum ? 'active' : ''}">
	                      		 					<a href="list?pageNum=${p}&amount=${page.cri.amount}&category=2" aria-controls="dataTable" class="page-link">${p }</a>
	                      		 					<a href="list?pageNum=${p}&amount=${page.cri.amount}" aria-controls="dataTable" class="page-link">${p }</a>
	                      		 					<a href="list?pageNum=${p}&amount=${page.cri.amount}&category=${page.cri.category}" aria-controls="dataTable" class="page-link">${p }</a>
	                      		 				</li>
	                      		 				</c:forEach>
	                      		 				
	                      		 				<li class="paginate_button page-item ${page.next ? '' : 'disabled'}" id="dataTable_next">
	                      		 					<a href="list?pageNum=${page.endPage+1}&amount=${page.cri.amount}&category=2" aria-controls="dataTable" class="page-link">Next</a>
	                      		 					<a href="list?pageNum=${page.endPage+1}&amount=${page.cri.amount}" aria-controls="dataTable" class="page-link">Next</a>
	                      		 					<a href="list?pageNum=${page.endPage+1}&amount=${page.cri.amount}&category=${page.cri.category}" aria-controls="dataTable" class="page-link">Next</a>
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
    <script>
    			
    	$(function() {
    		$("#boardList tr").each(function() {
    			var category = $(this).find('td').eq(4).text();
    			console.log(category);
    			if(category == 1) {
    				$(this).find('td').eq(4).html('공지사항');
    			} else if (category == 2) {
    				$(this).find('td').eq(4).html('자유게시판');
    			}
    		})
    	})
    </script>
<jsp:include page="../adminIncludes/foot.jsp"/>
</body>

</html>