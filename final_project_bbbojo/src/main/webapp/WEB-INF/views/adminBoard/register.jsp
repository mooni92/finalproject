<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
   
        <!--**********************************
            Nav header end
        ***********************************-->

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
                <!-- row -->
                <div class="content-body">
                    <div class="container-fluid">
                        <div class="card shadow mb-4">
                        	<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary float-left mt-2">게시판 관리</h6>
							</div>
                            <div class="card-body">
                                <div class="table dataTable_filter ">
									<div class="row">
										<div class="col-sm-12">
			                            		<form method="post">
													<div class="form-group">
														<label for="title" class="text-dark font-weight-bold">Title</label>
														<input class="form-control" id="title" name="title">
													</div>
													 <div class="form-group">
					                                    <label for="content" class="text-dark font-weight-bold">Content</label>
					                                    <textarea class="form-control h-25" rows="10" id="content" name="content"></textarea>
					                               </div>
					                               <div class="form-group">
					                                  <label for="id" class="text-dark font-weight-bold">Writer</label>
					                                 <sec:authentication property="principal.username" var="userId"/> 
					                                  <input class="form-control" id="id" name="id" value="userId" readonly>
					                                  <input type="hidden" class="form-control" id="writer" name="writer" value="${userId}">
					                                  <input type="hidden" class="form-control" id="category" name="category" value="${param.category}">
					                               </div>
					                               <sec:csrfInput/>
					                               <button class="btn btn-primary" id="btnSubmit">Submit</button>
					                               <button class="btn btn-danger" type="reset">Reset</button>   
					                             </form>
			                             		<p></p>
			                                     <div class="card shadow mb-4">
						                        <div class="card-header py-3">
						                            <h6 class="m-0 font-weight-bold text-primary">File Attach</h6>
						                        </div>
						                        <div class="card-body">
						                           <div class="form-group uploadDiv">
						                               <label for="files" class="btn btn-primary px-4"><i class="far fa-file mr-2"></i> File</label>
						                               <input type="file" class="form-control d-none" id="files" name="files" multiple>
						                            </div>
						                           <div class="uploadResult">
								                        <ul class="list-group">
								                        </ul>
								                     </div>
							                     </div>
							                    </div>
							               </div>
							              </div>
                <!-- /.container-fluid -->
							</div>
            			</div>
                 </div>
               
             </div>
         </div>
            <!-- End of Main Content -->
<script>
		var category = $("#category").val();
		console.log(category);
      var csrfHeader = $("meta[name='_csrf_header']").attr("content");
      var csrfToken = $("meta[name='_csrf']").attr("content");
      
      $(document).ajaxSend(function(e, xhr) {
      xhr.setRequestHeader(csrfHeader, csrfToken);
   })
      
       function showImage(fileCallPath) {
          $("#pictureModal")
             .find("img").attr("src", "/display?fileName="+fileCallPath)
          .end().modal("show");
       }
      $(function() {
         var cloneObj = $(".uploadDiv").clone();
         
         
         var regex = /(.*?)\.(exe|sh|zip|alz)$/;
         var maxSize = 1024 * 1024 * 5;

         function checkExtension(fileName, fileSize) {
            if(fileSize >= maxSize) {
               alert("파일 사이즈 초과");
               return false;
            }
            if(regex.test(fileName)) {
               alert("해당 종류의 파일은 업로드 할 수 없습니다.");
               return false;
            }
            return true;
         }
         
         function showUploadedFile(resultArr) {
            var str = "";
            for(var i in resultArr) {
               str += "<li class='list-group-item' "
               str +="data-uuid='" + resultArr[i].uuid + "' ";
               str +="data-path='" + resultArr[i].path + "' ";
               str +="data-origin='" + resultArr[i].origin + "' "; 
               str +="data-size='" + resultArr[i].size + "' "
               str +="data-image='" + resultArr[i].image + "' "
               str +="data-mime='" + resultArr[i].mime + "' "
               str +="data-ext='" + resultArr[i].ext + "' "
               str +=">"
               if(resultArr[i].image) {
                 str += "<a href='javascript:showImage(\"" + resultArr[i].fullPath + "\")'>"
                  str += "<img src='/display?fileName=" +  resultArr[i].thumb  + "'>";
                  str +="</a>"
               } else {
               str += "<a href='/download?fileName=" + resultArr[i].fullPath + "'>";
               str += "<i class='fas fa-paperclip'></i> " + resultArr[i].origin + "</a>"
                  
               }
               str += "  <small><i data-file='"+ resultArr[i].fullPath + "'data-image='" +  resultArr[i].image + "'";
               str += "class='fas fa-trash-alt text-danger'></i></small></li>";
            }
            $(".uploadResult ul").append(str);
         }

         $(".uploadDiv").on("change","#files",function() {
            var files = $("#files")[0].files;
            console.log(files);

            var formData = new FormData();
            for(var i in files) {
                  if(!checkExtension(files[i].name, files[i].size)){
                     return false;
                  }
               formData.append("files", files[i]);
            }

            $.ajax("/upload", {
               processData:false,
               contentType:false,
               data:formData,
               dataType : 'json',
               type:"POST",
               beforeSend : function(xhr) {
            xhr.setRequestHeader(csrfHeader, csrfToken)
         },
               success:function(result) {
                  console.log(result);   
                  $(".uploadDiv").html(cloneObj.html());
                  showUploadedFile(result);
               }
               
            })   
         });
         
         $(".uploadResult").on("click", "small i", function() {
            var $li = $(this).closest("li");
              $.ajax("/deleteFile", {
                 type : "post",
                 data : {fileName:$(this).data("file"), image:$(this).data("image")},
                 success : function(result) {
                        $li.remove();
                 }
              }) 
            });
         
         // 글 작성 이벤트
         $("#btnSubmit").click(function() {
            event.preventDefault();
            
            var str = "";
            var datas= ["uuid", "path", "origin", "ext", "mime", "size", "image"];
            $(".uploadResult li").each(function(i) {
               for(var j in datas)
               str += "<input type='hidden' name='attachs["+i+"]." + datas[j] + "' value='" +$(this).data(datas[j])+ "'>";
           });
             $(this).closest("form").append(str).submit();
            //console.log($(this).closest("form").append(str).html());
         })
     })

   </script>
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

        
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
<jsp:include page="../adminIncludes/foot.jsp" />



</body>

</html>