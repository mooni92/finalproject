<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
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
                <!-- row -->
                <div class="row content-body">
                    <div class="col-lg-6" style="float: none; margin: 0 auto">
                        <div class="card pr-3">
                            <div class="card-body">
                                </div>
                                <div class="email-right-box ml-0 ml-sm-4 ml-sm-0">
                                    <div class="compose-content">
		                            	<form method="post">
                               <div class="form-group">
                                  <label for="bno" class="text-dark font-weight-bold">Bno</label>
                                  <input class="form-control" id="bno" name="bno" disabled value="${board.bno}">
                               </div>
                              <div class="form-group">
                                  <label for="title" class="text-dark font-weight-bold">Title</label>
                                  <input class="form-control" id="title" name="title" disabled value="${board.title}">
                               </div>
                          
                       <%--           <div class="form-group">
                                    <label for="content" class="text-dark font-weight-bold">Content</label>
                                    <textarea class="form-control" id="content" name="content" disabled>${board.content}</textarea>
                               </div> --%>
                               
                                <div class="form-group">
                                    <label for="content" class="text-dark font-weight-bold">Editor Content</label>
                                    <div>
                                       <c:out value="${board.content}" escapeXml="false"/>
                                    </div>
                               </div>
                               <div class="form-group">
                                  <label for="writer" class="text-dark font-weight-bold">Writer</label>
                                  <input class="form-control" id="writer" name="writer" disabled value="${board.writer}">
                              
                               </div>
                               <sec:authentication property="principal" var="pinfo"/> 
                                <sec:authorize access="isAuthenticated()"> 
                               <c:if test="${pinfo.username==board.writer }">
                               <a class="btn btn-warning" href="modify${cri.params}&bno=${board.bno}">modify</a>   
                               </c:if> 
                              </sec:authorize> 
                               <input type="hidden" name="userId" id="userId" value="${pinfo.memberVo.id}"/>
                               <a class="btn btn-primary" href="list${cri.params}">List</a>   
                             </form>
                             	<p class="text-right">좋아요 개수</p>
			                   <p class="text-right" id="likeCount">0</p>
                                     <!-- file -->
                        <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">File Attach</h6>
                        </div>
                        <div class="card-body">
                            <div class="uploadResult">
                        <ul class="list-group">
                        </ul>
                             </div>
                  </div>
                     </div>
                     <!-- reply -->
                     <div class="card shadow mb-4">
                        <div class="card-header py-3 clearfix">
                            <h6 class="m-0 font-weight-bold text-primary float-left"><i class="fa fa-comments"></i> Reply</h6>
                            <button class="btn btn-primary float-right btn-sm" id="btnRegFrm">New Reply</button>
                        </div>
                        <ul id="replyUL" class="list-group list-group-flush">
                        </ul>
                        <div class="card-footer text-center">
                            <button class="btn btn-primary btn-block" id="btnShowMore">더보기</button>
                        </div>
                    </div>
                    <!-- end of reply -->
                </div>
                <!-- /.container-fluid -->
       
            </div>
            <!-- End of Main Content -->
            <script src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
<script>
   //get방식을 제외한 비동기처리에 필요함
var csrfHeader = $("meta[name='_csrf_header']").attr("content");
var csrfToken = $("meta[name='_csrf']").attr("content");

$(document).ajaxSend(function(e, xhr) {
	xhr.setRequestHeader(csrfHeader, csrfToken);
})


var id = $("#userId").val();
   console.log("id:"+id);

   // ************************************ getList *******************************************
    $(function() {
        console.log(replyService);

        var bno = '${board.bno}';
        var $ul = $("#replyUL");
        console.log(bno);
        showList();
        ShowLikeCount();
        function showList(lastRno,amount){//showList()라는 함수를 만듬 인자는 lastRno,amount
           //replyService에 있는 getList에 인자값 넣음
            replyService.getList({bno:bno,lastRno:lastRno,amount:amount},
                function(data) {//데이터를 넣고
            	console.log(data);
                    if(!data){ //데이터가 없으면
                        return; //리턴시키고
                    }
                    if(data.length == 0){ //데이터의 개수가 0이면
                        $("#btnShowMore").text("댓글이 없습니다.").prop("disabled",true);
                        return;
                    }

                    var str="";
                    for(var i in data){
                    	if(data[i].groupOrd >= 1){
                    str += '<li class="list-group-item pl-5" data-rno="'+ +data[i].rno + '" data-originNo="'+ data[i].originNo +'" data-groupOrd="'+data[i].groupOrd+'" data-groupLayer="'+data[i].groupLayer+'">'
                    	}else{
                    str += '<li class="list-group-item" data-rno="'+ +data[i].rno + '" data-originNo="'+ data[i].originNo +'" data-groupOrd="'+data[i].groupOrd+'" data-groupLayer="'+data[i].groupLayer+'">'
                    	}
                    str += '     <div class="clearfix">'
                    	if(data[i].groupOrd >= 1){
                    str += '           <div class="float-left"><i class="fas fa-long-arrow-alt-right"></i></div>'
                    	}
                    str += '           <div class="float-left text-dark font-weight-bold">'+data[i].writer+'</div>'
                    str += '           <div class="float-right">'+replyService.displayTime(data[i].regdate)+'</div>'
                    str += '           <button class="float-right" id="addReply" data-rno="'+ +data[i].rno + '" data-originNo="'+ data[i].originNo +'" data-groupOrd="'+data[i].groupOrd+'" data-groupLayer="'+data[i].groupLayer+'">대댓글</button>'
                    str += '    </div>'
                    str += '    <div>'+data[i].content+'</div>'
                    str += '</li>'
                } 
                $("#btnShowMore").text("더보기").prop("disabled",false);
                $ul.append(str);
            }
            )
        }
        // ************************************ likeCount *******************************************
        function ShowLikeCount() {
        	replyService.getLike(bno, function (data) {
        		console.log("좋아요 개수:.."+data);
				$("#likeCount").text(data);
			})
		}
        // ************************************ reply frm add *******************************************
        $("#btnRegFrm").click(function(){//새댓글쓰기 벝튼 누르면
           <sec:authorize access="isAnonymous()">
              if(confirm("로그인이 필요한 페이지 입니다. 로그인 페이지로 이동하겠습니까?")){
                   location.href="/customLogin"
              }
              else{
                 return;
              }
            </sec:authorize>
// 			var originNo=$(this).data("originno");
// 			var groupOrd=$(this).data("groupord");
// 			var groupLayer=$(this).data("grouplayer");
// 			var rno=$(this).data("rno");
            $("#myModal").find("input").val("");//#myModal의 input태그의 값을 가져온다
            $("#replyDate").closest("div").hide();//replyDate의 가장 가까운div찾아서 숨김
            $(".btns button").hide();//.btns밑에 있는 버튼들(Register,modify,remove)을 숨김
            $("#btnReg").show();//Register버튼 보여줌
            $("#myModal").modal("show");//모달 띄움
            
        })
        // ************************************ reply frm addReply 대댓글 *******************************************
        $ul.on("click","#addReply",function(){//새댓글쓰기 벝튼 누르면
           <sec:authorize access="isAnonymous()">
              if(confirm("로그인이 필요한 페이지 입니다. 로그인 페이지로 이동하겠습니까?")){
                   location.href="/customLogin"
              }
              else{
                 return;
              }
            </sec:authorize>
			var originNo=$(this).data("originno");
			var groupOrd=$(this).data("groupord");
			var groupLayer=$(this).data("grouplayer");
            $("#myModal").find("input").val("");//#myModal의 input태그의 값을 가져온다
            $("#replyDate").closest("div").hide();//replyDate의 가장 가까운div찾아서 숨김
            $(".btns button").hide();//.btns밑에 있는 버튼들(Register,modify,remove)을 숨김
            $("#btnReg").show();//Register버튼 보여줌
            $("#myModal").data("originNo",originNo);
            $("#myModal").data("groupLayer",groupLayer+1).modal("show");
            
            return false;
        })

        // ************************************ add *******************************************
        $("#btnReg").click(function() {//#btnReg를 클릭하면
           //reply변수에 들어간 데이터들로 replyVo생성자  호출해서 add()에 넣는다
//            	var originNo=$("#myModal").data("originNo");
           	var originNo=$("#myModal").data("originNo");
           	console.log("originNo1:"+originNo);
			var groupLayer=$("#myModal").data("groupLayer");
			var reply = {content:$("#reply").val(), writer: id, bno:bno, originNo: originNo,groupLayer: groupLayer};
        	console.log("reply:"+reply);
        	if(originNo !== undefined){
            replyService.add2(reply,
                function(data) {
                    alert(data);//success띄움
                    var count=$ul.find("li").length;//ul태그에 있는 li개수 구함
                      $ul.html("");//??
                    $("#myModal").find("input").val("");//#myModal의 input태그의 값을 가져온다
                    $("#myModal").modal("hide");//그리고 #myModal을 숨겨
                    showList(0,count+1);//그리고 리스트 보여줌
                    $("#myModal").removeData("originNo");
                    $("#myModal").removeData("groupLayer");
                    $("#myModal").removeData("groupOrd");
                }
            )}
        	else{
            replyService.add(reply,
	              function(data) {
	                  alert(data+"2");//success띄움
	                  var count=$ul.find("li").length;//ul태그에 있는 li개수 구함
	                    $ul.html("");//??
	                  $("#myModal").find("input").val("");//#myModal의 input태그의 값을 가져온다
	                  $("#myModal").modal("hide");//그리고 #myModal을 숨겨
	                  showList(0,count+1);//그리고 리스트 보여줌
	                  $("#myModal").removeData("originNo");
	                    $("#myModal").removeData("groupLayer");
	                    $("#myModal").removeData("groupOrd");
                        }
                    )
        	};
        	
        })
       // ************************************  get   *********************************************   
        $ul.on("click","li",function(){//
            //alert($(this).data("rno"));
            var rno=$(this).data("rno");
            console.log(rno);
            replyService.get(rno,function(data){
                $("#reply").val(data.content);//reply칸에 가져온reply 넣음
                $("#replyer").val(data.writer);//replyer칸에 가져온 replyer넣음
                //replyDate에 가져온 replyDtate넣고 읽기전용으로만 만들고  div찾아서 보여좀
                $("#replyDate").val(replyService.displayTime(data.replyDate)).prop("readonly",true).closest("div").show();
                $(".btns button").hide();//버튼 3개 다숨기고
                $("#btnMod, #btnRmv").show();//수정버튼이랑 삭제버튼만 보여줌
                $("#myModal").data("rno",data.rno).modal("show");//모달 보여줌~
            });
        })
        // ************************************ modify  *******************************************   
        $("#btnMod").click(function(){//modify버튼 클릭하면
           //제목,댓글번호,작성자
            var reply = {content:$("#reply").val(), rno:$("#myModal").data("rno"),writer:$("#replyer").val()};
            replyService.modify(reply, function(data) {
                    alert(data)//success띄우고
                    $("#myModal").modal("hide");//모달창 숨김
                   // showList();
                    $ul.find("li").each(function(){//ul밑에 있는 li들을 찾아서 
                        if($(this).data("rno")==reply.rno){//만약 li의 rno가 위에 rno면
                          $(this).children().eq(0).find("div").first().text(reply.replyer); //replyer바뀜
                          $(this).children().eq(1).text(reply.reply);//reply바뀜
                    }
                    })
                })
        })
        // ************************************ remove  *******************************************   
        $("#btnRmv").click(function(){
            var rno = $("#myModal").data("rno");
          //remove함수에 rno넣고 
            replyService.remove(rno, function(data) { 
                  //success띄움
                    alert(data)
                     //모달창 숨김
                    $("#myModal").modal("hide");
                    //showList();
                    
                    //ul안에 있는 li찾아서 
                    $ul.find("li").each(function(){ 
                       //li의 rno가 위의 rno랑 같으면
                        if($(this).data("rno")==rno)
                        //li지움
                        $(this).remove();
                    })
                })
        })
        // ************************************ 더보기 버튼  *******************************************   
         $("#btnShowMore").click(function(){//더보기 버튼 클릭하면
             var lastRno = $ul.find("li:last").data("originno"); //lastRno에 ul 안에 있는 마지막li의  rno lastRno에 넣는다.
            // alert(lastRno);
             showList(lastRno);//?
         })



         // JS Test

    
        
      
         //첨부파일 불러오기
         $.getJSON("/board/getAttachs/"+bno).done(function(data) {
            console.log(data);
            showUploadedFile(data);
      })
    }); //end of ready
    function showImage(fileCallPath) {
            $("#pictureModal")
            .find("img").attr("src","/display?fileName="+fileCallPath)
            .end().modal("show");
      //   alert(fileCallPath);
      }
    function showUploadedFile(resultArr) {
        var str = "";
        //이미지 업로드 후 콘솔창 확인
        for(var i in resultArr) {
           str += "<li class='list-group-item' "
           str += "data-uuid='" + resultArr[i].uuid + "' ";
           str += "data-path='" + resultArr[i].path + "' ";
           str += "data-origin='"+ resultArr[i].origin + "' ";
           str += "data-size='"+ resultArr[i].size + "' "
           str += "data-image='"+ resultArr[i].image + "' "
           str += "data-mime='"+ resultArr[i].mime + "' "
           str += "data-ext='"+ resultArr[i].ext + "' "
           str += "data-ext='"+ resultArr[i].ext + "' "
           str += ">"
           if(resultArr[i].image) {
              //알럿창에 이미지 이름 띄우기
             str += "<a href='javascript:showImage(\""+resultArr[i].fullPath+"\")'>"
              str += "<img src='/display?fileName=" +  resultArr[i].thumb  + "'>";
             str += "</a>";
           } else {
              str += "<a href='/download?fileName=" + resultArr[i].fullPath + "'>";
              str += "<i class='fas fa-paperclip'></i> " + resultArr[i].origin + "</a>";
           }
           str += "</li>";
        }
        $(".uploadResult ul").append(str);
     }

</script>
 		</div>
 	</div>
 

</div>
            <!-- Footer -->
    <jsp:include page="../includes/footer.jsp"/>   
     <!-- End of Footer -->


 <!-- End of Content Wrapper -->
<!-- End of Page Wrapper -->
<!-- List Modal-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
 <div class="modal-dialog" role="document">
     <div class="modal-content">
         <div class="modal-header">
             <h5 class="modal-title" id="exampleModalLabel">Reply Modal</h5>
             <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                 <span aria-hidden="true">×</span>
             </button>
         </div>
         <div class="modal-body">
             <div class="form-group">
                 <label for="reply" class="text-dark font-weight-bold">Reply</label>
                 <input class="form-control" id="reply" name="reply" placeholder="NEW REPLY">
             </div>
             <div class="form-group">
                 <label for="reply" class="text-dark font-weight-bold">Replyer</label>
                 <input class="form-control" id="replyer" name="replyer" placeholder="${pinfo.memberVo.id }" value="${pinfo.memberVo.id}">
             </div> 
            <div class="form-group">
                 <label for="reply" class="text-dark font-weight-bold">Reply Date</label>
                 <input class="form-control" id="replyDate" name="replyDate" placeholder="">
             </div>         
         </div>
         <div class="modal-footer text-right">
             <div class="btns">
                 <button class="btn btn-info" id="btnReg">Register</button>
                 <button class="btn btn-warning" id="btnMod">Modify</button>
                 <button class="btn btn-danger" id="btnRmv">Remove</button>
             </div>
             <button class="btn btn-dark" type="button" data-dismiss="modal">Close</button>
         </div>
     </div>
 </div>
</div>
<jsp:include page="../includes/foot.jsp"/>     
</body>

</html>