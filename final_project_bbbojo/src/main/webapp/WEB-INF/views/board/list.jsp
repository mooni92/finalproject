<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../includes/head.jsp" />
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
            Nav header start
        ***********************************-->

		<!--**********************************
            Nav header end
        ***********************************-->

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
		<div class="clearfix mb-5 content-body">

			<div class="clearfix">
				<div class="row col-sm-6 my-2 p-0"
					style="float: none; margin: 0 auto">
					<div class="col-sm-6 p-md-0">
						<div class="welcome-text">
						</div>
					</div>

				</div>

				<!-- row -->

				<!-- row -->
				<div class="row">
					<div class="col-xl-6 col-xxl-6 col-lg-6 col-md-6 p-0"
						style="float: none; margin: 0 auto">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title">자유게시판</h4>
								<div class="basic-list-group">
									<div class="list-group">
										<div
											class="list-group-item list-group-item-action flex-column align-items-start active">
											<div class="d-flex w-100 justify-content-between">
												<a href="register?category=2"><h6 class="mb-2 text-white"><i class="fas fa-pencil-alt"></i>  새 글을 작성해주세요!</h6></a>
											</div>
										</div>
										<p></p>
										<c:forEach items="${list}" var="board">
											<div class="col-xl-12 col-xxl-6 col-lg-6 col-sm-6 p-0">
												<div class="card">
													<div class="card-header">
														<h6 class="card-title"><a href="get${page.cri.params}&bno=${board.bno}"><c:out value="${board.title}" /></a></h6></div>
													<div class="card-body">
														<p class="card-text">
														 <c:out value="${board.content}" escapeXml="false"/>
														</p>
													</div>
													<div class="card-footer">
														<p class="card-text d-inline"><fmt:formatDate value="${board.regDate}" pattern="yy-MM-dd" /> <c:out value="${board.writer}" /></p>
														  <div class="card-link float-right"><i class="fas fa-heart"></i> &nbsp; &nbsp; &nbsp;<i class="fas fa-comment-dots"></i><b> [${board.replyCount}]</b></div>
													</div>
												</div>
											</div>
											<p></p>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
					<p></p>
				       <div class="row">
                           <div class="col-sm-12 col-md-5">
                           </div>
                           <div class="col-sm-12 col-md-7">
                              <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                 <ul class="pagination">
                                    <li class="paginate_button page-item previous ${page.prev ? '' : 'disabled' }"" id="dataTable_previous">
                                       <a href="list?pageNum=${page.startPage-1 }&amount=${page.cri.amount}&category=2" class="page-link">Previous</a>
                                    </li>
                                    <c:forEach begin="${page.startPage }" end="${page.endPage}" var="p">
                                    <li class="paginate_button page-item  ${p == page.cri.pageNum ? 'active' : '' }">
                                       <a href="list?pageNum=${p}&amount=${page.cri.amount}&category=2" class="page-link">${p}</a>
                                    </li>
                                    </c:forEach>
                                    
                                    <li class="paginate_button page-item next ${page.next ? '' : 'disabled' }" id="dataTable_next">
                                       <a href="list?pageNum=${page.endPage + 1 }&amount=${page.cri.amount}&category=2"   class="page-link">Next</a>
                                    </li>
                                 </ul>
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



	<!--**********************************
        Main wrapper end
    ***********************************-->

	<!--**********************************
        Scripts
    ***********************************-->
<script>
$(function() {
   var result ='${result}';   
   checkModal(result);
   history.replaceState({}, null , null);
   function checkModal(result) {
      if(!result || history.state) {
         return;
      }
      var text = result == 'success' ? "처리가 완료되었습니다." : "게시글" + result + "번이 등록되었습니다.";
         $("#myModal .modal-body").text(text);
         $("#myModal").modal("show");
   }
   
   $("p > img").css('max-width','100%');
});

</script>
<!-- List Modal-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Message</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"></div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">close</button>
                </div>
            </div>
        </div>
    </div>
    
	<!-- Required vendors -->
	<jsp:include page="../includes/foot.jsp" />

</body>

</html>