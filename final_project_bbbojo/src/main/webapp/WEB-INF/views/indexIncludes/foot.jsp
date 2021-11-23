<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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


// $(function() {
/* 	detectBotton();
	detectTop();
	
	function detectBottom() {
	    var scrollTop = $(window).scrollTop();
	    var innerHeight = $(window).innerHeight();
	    var scrollHeight = $('body').prop('scrollHeight');
	    if (scrollTop + innerHeight >= scrollHeight) {
	    	document.getElementById("scrollLogo").src = "${pageContext.request.contextPath}/resources/images/index/blueLogo.png";
	        return true;
	    } else {
	        return false;
	    }
	}
	
	function detectTop() {
	    var scrollTop = $(window).scrollTop();
	    if (scrollTop == 0) {
	        return true;
	    } else {
	        return false;
	    }
	} */
// })
</script>
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <script src="${pageContext.request.contextPath}/resources/js/index/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/aos.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/scrollax.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/index/main.js"></script>