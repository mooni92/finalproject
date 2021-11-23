<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
    <!-- PictureModal -->
     <div class="modal fade" id="pictureModal" >
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Image Detail</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                	<img class="mw-100" src="">
                </div>
            </div>
        </div>
    </div>
 <!--**********************************
        Modal
    ***********************************-->
<div class="modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"></span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">Save changes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script>
var mapContainer = document.getElementById('map'), 
    mapOption = { 
        center: new kakao.maps.LatLng(37.51832731041713, 126.90625990478357), 
        level: 3 // 지도의 확대 레벨
    };  

var map = new kakao.maps.Map(mapContainer, mapOption);
    
function setMapType(maptype) { 
    var roadmapControl = document.getElementById('btnRoadmap');
    var skyviewControl = document.getElementById('btnSkyview'); 
    if (maptype === 'roadmap') {
        map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);    
        roadmapControl.className = 'selected_btn';
        skyviewControl.className = 'btn';
    } else {
        map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);    
        skyviewControl.className = 'selected_btn';
        roadmapControl.className = 'btn';
    }
}

function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}
//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(37.51832731041713, 126.90625990478357); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
var iwContent = '<div style="padding:5px; font-size: 13px;">휴먼교육센터<br><a href="https://map.kakao.com/link/map/휴먼교육센터,37.51832731041713, 126.90625990478357" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/휴면교육센터,37.51832731041713, 126.90625990478357" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new kakao.maps.LatLng(37.51832731041713, 126.90625990478357); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); 
</script>

    <!--**********************************
        Scripts
    ***********************************-->
    <!-- Required vendors -->
    <!--removeIf(production)-->
    <!-- Demo scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/styleSwitcher.js"></script>

    <script src="${pageContext.request.contextPath}/resources/vendor/jqueryui/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/moment/moment.min.js"></script>


    
<%--     <script src="${pageContext.request.contextPath}/resources/vendor/global/global.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/js/quixnav-init.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/resources/js/custom.min.js"></script> --%>


    <!-- Vectormap -->
    <script src="${pageContext.request.contextPath}/resources/vendor/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/morris/morris.min.js"></script>


    <script src="${pageContext.request.contextPath}/resources/vendor/circle-progress/circle-progress.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.bundle.min.js"></script>

    <script src="${pageContext.request.contextPath}/resources/vendor/gaugeJS/dist/gauge.min.js"></script>

    <!--  flot-chart js -->
    <script src="${pageContext.request.contextPath}/resources/vendor/flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/flot/jquery.flot.resize.js"></script>


    <!-- Owl Carousel -->
    <script src="${pageContext.request.contextPath}/resources/vendor/owl-carousel/js/owl.carousel.min.js"></script>

    <!-- Counter Up -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jqvmap/js/jquery.vmap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/jqvmap/js/jquery.vmap.usa.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	
	<!-- 통계관련 지도등등.-->
<%--     <script src="${pageContext.request.contextPath}/resources/js/dashboard/dashboard-1.js"></script> --%>
  <script src="${pageContext.request.contextPath}/resources/js/index/jquery-migrate-3.0.1.min.js"></script>
<%--   <script src="${pageContext.request.contextPath}/resources/js/index/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/bootstrap.min.js"></script> --%>
  <script src="${pageContext.request.contextPath}/resources/js/index/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/jquery.magnific-popup.min.js"></script>
<%--   <script src="${pageContext.request.contextPath}/resources/js/index/aos.js"></script> --%>
  <script src="${pageContext.request.contextPath}/resources/js/index/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/scrollax.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/main.js"></script>
