<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="../includes/head.jsp"/>
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
<jsp:include page="../includes/header.jsp"/>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
            <div class="container-fluid">
                <div class="row page-titles mx-0">
                    <div class="col-sm-6 p-md-0">
                        <div class="welcome-text">
                            <h5>휴먼 대학교</h5>
                            <p class="mb-0">2022-1학기 학부 수강신청</p>
                        </div>
                    </div>
                    <div class="col-sm-6 p-md-0 justify-content-sm-end mt-2 mt-sm-0 d-flex">
                    </div>
                </div>
                  
                <!-- row -->
                <div class="row justify-content-between">
                   <!-- 드래그 이벤트 -->
                   <div class="col-lg-3" id='external-events'>
                      <div class="card">
                         <div class="card-body">
                        <div id="enrollResult">
                               <button class="btn btn-outline-primary w-100 mb-2 btn-sm" id="btnEnroll">수강신청</button>
                        </div>
                        <div class="float-left mt-2">
                            <p>
                               <input type='checkbox' id='drop-remove' class="mt-1" />
                               <label for='drop-remove'>remove after drop</label>
                                </p>
                        </div>
                             <div class="float-right mt-2">
                            <button id="allSave" class="btn btn-rounded btn-outline-primary">저장</button>
                            <button id="allRemove" class="btn btn-rounded btn-outline-primary ml-1">초기화</button>
                            <sec:authentication property="principal" var="pinfo"/>
                                <sec:authorize access="isAuthenticated()">
                                <input type="hidden" name="studno" id="studno" value="${pinfo.memberVo.studno}"/>
                                </sec:authorize>
                             </div>
                         </div>
                      </div>
                 </div>
                    <div class="col-lg-9 justify-content-end">
                        <div class="card">
                            <div class="card-body">
                                 <div id='calendar'></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                </div>
                <div class="row enrollInfo">
                   <div class="card-body">
                        <div class="table-responsive"  id="table">
                            <table class="table primary-table-bordered">
                                <thead class="table-active">
                                    <tr class="text-center">
                                        <th>학과</th>
                                       <th>과목번호</th>
                                       <th>교과목명</th>
                                       <th>교수성명</th>
                                       <th>수업시간</th>
                                       <th>요일</th>
                                       <th>최대인원</th>
                                       <th>수강인원</th>
                                       <th>취소</th>
                                    </tr>
                                </thead>
                                <tbody id="enrollList">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--**********************************
            Content body end
        ***********************************-->
<script src="${pageContext.request.contextPath}/resources/js/course.js"></script>
<script>
var csrfHeader = $("meta[name='_csrf_header']").attr("content");
var csrfToken = $("meta[name='_csrf']").attr("content");

$(document).ajaxSend(function(e, xhr) {
   xhr.setRequestHeader(csrfHeader, csrfToken);
})

var calendar = null;
var all_events = null;
var studno = $("#studno").val();

$(function() {
   // 드래그 이벤트
    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    var containerEl = document.getElementById('external-events');
    var calendarEl = document.getElementById('calendar');
    var checkbox = document.getElementById('drop-remove');
    
    // 시간표에 db값 불러오는것
    var event2 = new Array();
    timeTableService.loadingEvents(studno, function (data) {
       for(var i in data){
          var ob = new Object();
//           ob.id = data[i].id;
          ob.title = data[i].title;
          ob.start = moment(data[i].start).format("YYYY-MM-DD");
//           ob.end = moment(data[i].end).format("YYYY-MM-DD hh:mm:ss");
//           ob.end = moment(data[i].end).format("ddd MMM YYYY hh:mm:ss");
//           ob.allDay = data[i].allday ? true : false;
//           ob.studno = data[i].studno;
          event2.push(ob);
          }
       
    })
   all_events = event2;
    
    
    
    
    // initialize the external events
    // -----------------------------------------------------------------

    new Draggable(containerEl, {
      itemSelector: '.fc-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText
        };
      }
    });

    // initialize the calendar
    // -----------------------------------------------------------------
    
    var request =       
       $.ajax({
         type: "get",
         url: "/timeTable/" + studno,
         data: {},
         contentType: "application/json; charset=utf-8",
         dataType: 'json',
      });
    
      request.done(function( data ) {
    
      calendar = new Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      },
      editable: true,
      droppable: true, // this allows things to be dropped onto the calendar
      events: data, // 목록 표시
      eventClick: function (arg) {
       if(confirm("삭제하시겠습니까?")){ // 일정삭제
          arg.event.remove();
       }
      },
    eventRemove: function (arg) { // 일정삭제 db
       timeTableService.remove(arg)
   },

   select: function (arg) { // 일정추가
      var title = prompt("Event Title:")
      if(title){
         calendar.addEvent({
            title: title,
            start: arg.start,
            end: arg.end,
            allDay: arg.allDay
         })
      }
      calendar.unselect(); // 이미 있는일정
   },
   unselect: function (arg) {}, // 이미 있는일정 추가
      drop: function(info) {
        // is the "remove after drop" checkbox checked?
        if (checkbox.checked) {
          // if so, remove the element from the "Draggable Events" list
          info.draggedEl.parentNode.removeChild(info.draggedEl);
        }
      },
      locale: 'ko',
      selectable: true, // 날짜 박스 클릭 가능하게 해주는 것
      navLinks: true, // 일수 클릭시 상세로 변경
      dayMaxEvents: true // 날짜에 일정이 많을경우 more 표시.
    });
    calendar.render();
   });
      
     // 시간표 저장
     $('#allSave').click(function () {
        var allEvent = calendar.getEvents();
        
        var events = new Array();
        for(var i= 0; i < allEvent.length; i++) {
           
           var obj = new Object();
           obj.title = allEvent[i]._def.title;
            obj.allday = allEvent[i]._def.allDay ? 1 : 0;
           obj.start = allEvent[i]._instance.range.start;
           obj.end = allEvent[i]._instance.range.end;
           obj.studno = studno;
           
           events.push(obj);
        }
        var jsondata = events;
        timeTableService.savedata(jsondata);
        alert("저장완료");
      location.reload();
     });
     // 시간표 초기화
   $('#allRemove').click(function () {
      if(confirm("확인 시 시간표가 초기화됩니다.?")){
           timeTableService.removeall(studno)
            location.reload();
           }
           else {
              return;
           }
   });
});
    
$(function() {
   showEnrollclassList(studno);
   // 수강신청 모달 실행
   $('#btnEnroll').on("click", function() {
      $("#myModal").modal("show");
   })

   // 수강신청 데이터 넘기기
   $('tr').on("click",".btnEn", function() {
      var courno = $(this).data("courno");
      var enrollclass = {courno:courno, studno:studno};
      var day = $(this).closest('tr').find(".day").val();
      var starttime = $(this).closest('tr').find(".startTime").val();
      var endtime = $(this).closest('tr').find(".endTime").val();
      var course = {studno:studno, day:day};
      courseService.getOverlap(course, function(data) {
    	  if(data.length == 0) {
		      enrollclassService.add(enrollclass,
		      function(data) {
		         alert(data);
		         showEnrollclass(courno);
		         showEnrollclassList(studno);
		         $("#myModal").modal("hide");
		         courno = 0;
		      })
    	  } else {
			   var result = check(starttime,endtime,data);
			   if(result == 1) {
		     	   alert("다른 수업을 신청해주세요");
			   } else {
	   			  enrollclassService.add(enrollclass,
			      function(data) {
			         alert(data);
			         showEnrollclass(courno);
			         showEnrollclassList(studno);
			         $("#myModal").modal("hide");
			         courno = 0;
			      })
			   }
    	  }
      })
   });
   
   function check(starttime,endtime,data) {
   	   for(var i = 0; i < data.length; i++) {
   		   if(starttime >= data[i].startTime && starttime <= data[i].endTime) {
	     	   return 1;
   		   } else if(endtime >= data[i].startTime && endtime <= data[i].endTime){
   			   return 1;
   		   } 
   	   }
   }
   
   
   // 수강신청한 후 수업 정보 목록
   function showEnrollclass(courno) {
      courseService.get(courno, function(data) {
         if(!data) {
            return;
         }
         var str = "";
         str += '<div class="fc-event fc-daygrid-event fc-daygrid-block-event bg-primary">'
         str += '    <div class="fc-event-main" data-courno='+ data.courno +'>'+ data.name + '  ' + data.pic
         str += '  ' + data.day + '요일'
         str += '    </div>'
         str += '</div>'
         $("#enrollResult").append(str);
      })
   }
   
   // 이전에 수강신청 했던 정보 목록
   function showEnrollclassList() {
      courseService.getList2(studno, function(data) {
         var list = new Array();
         if(!data || !data.length) {
            $('#table').hide();
            return;
         }
         $('#table').show();
         var str = "";
         for(var i =0; i<data.length; i++) {
            str += '         <tr class="text-center">'
            str += '            <td>' + data[i].deptno + '</td>'
            str += '            <td>' + data[i].courno + '</td>'
            str += '            <td>' + data[i].name + '</td>'
            str += '            <td>' + data[i].pic + '</td>'
            str += '            <td>' + data[i].startTime + '시~' + data[i].endTime + '시</td>'
            str += '            <td>' + data[i].day + '요일' + '</td>'
            str += '            <td>' + data[i].maxCnt + '</td>'
            str += '            <td>' + data[i].cnt + '</td>'
            str += '            <td><button class="btn btn-outline-primary btn-sm btnCl" id="btnCl" data-course='+data[i].courno+'>취소</button></td>'
            str += '         </tr>'
         }
         $("#enrollList").html(str);
      })
   }
   
   // 수강신청 취소
   $('#enrollList').on("click",".btnCl", function() {
      var course = $(this).data("course");
      var enrollclass = {courno:course, studno:studno};
      if(confirm("수강신청을 취소하시겠습니까?")) {
         enrollclassService.remove(enrollclass,
         function(data) {
            alert(data);
            history.go(0);
         })
      } else {
         return false;
      }
      
   });
         
   // 모달 크기 조절
   $(document).ready(function () {
       $('head').append('<style type="text/css">.modal .modal-body {max-height: ' + ($('body').height() * .6) + 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
   });

   // 캘린더
//        var calendarEl = document.getElementById('calendar');
//        var calendar = new FullCalendar.Calendar(calendarEl, {
//          initialView: 'dayGridMonth',
//          locale: 'ko'
//        });
//        calendar.render();
});
</script>

        <!--**********************************
            Footer start
        ***********************************-->
<jsp:include page="../includes/footer.jsp"/>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
   <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
       <div class="modal-dialog modal-lg" style="max-width: 100%; width: auto; display: table;">
           <div class="modal-content">
               <div class="modal-header">
                   <h5 class="modal-title">수강 신청</h5>
                   <button type="button" class="close" data-dismiss="modal"><span>×</span>
                   </button>
               </div>
               <div class="modal-body scroll type1">
                   <div class="row justify-content-start">
                         <div class="col-sm-12 col-md-6 form-inline d-flex justify-content-start mb-2">
                        </div>
                         <div class="col-sm-12">
                           <table class="table table-bordered" id="dataTable">
                               <thead>
                                   <tr class="text-center">
                                      <th>학과</th>
                                       <th>과목번호</th>
                                       <th>교과목명</th>
                                       <th>교수성명</th>
                                       <th>수업시간</th>
                                       <th>수업요일</th>
                                       <th>최대인원</th>
                                       <th>수강인원</th>
                                      <th>신청</th>
                                   </tr>
                               </thead>
                               <tbody>
                               <c:forEach items="${courseList}" var="course">
                                  <tr id="courseList" class="text-center">
                                     <td><c:out value="${course.deptno}"/></td>
                                     <td><c:out value="${course.courno}"/></td>
                                     <td><c:out value="${course.name}"/></td>
                                     <td><c:out value="${course.pic}"/></td>
                                     <td><c:out value="${course.startTime}시~${course.endTime}시"/>
                                     <input type="hidden" class="startTime" name="startTime" value="${course.startTime}">
                                     <input type="hidden" class="endTime" name="endTime" value="${course.endTime}"></td>
                                     <td><c:out value="${course.day}"/>
									 <input type="hidden" class="day" name="day" value="${course.day}"></td>
                                     <td><c:out value="${course.maxCnt}"/></td>
                                     <td><c:out value="${course.cnt}"/></td>
                                     <td>
                                         <div class="m-0">
                                            <button class="btn btn-outline-primary btn-sm btnEn" data-courno="${course.courno}">신청</button>
                                         </div>
                                     </td>
                                  </tr>
                               </c:forEach>
                               </tbody>
                           </table>
                         </div>
                    </div>               
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
                   <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
               </div>
           </div>
       </div>
   </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Required vendors -->
<jsp:include page="../includes/foot.jsp"/>
</body>

</html>