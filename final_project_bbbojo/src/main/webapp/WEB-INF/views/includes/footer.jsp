<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <footer class="ftco-footer ftco-section">
      <div class="container">
        <div class="row mt-3 mb-3">
          <div class="col-md">
            <div class="ftco-footer-widget mt-4 mb-4">
            	<h2 class="ftco-heading-2">휴먼대학교 스윗어스</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><span class="icon icon-map-marker"></span><span class="text">(07302) 서울 영등포구 영중로8길 6 6층</span></li>
	                <li><span class="icon icon-phone"></span><span class="text">02.3667.3688</span></li>
	                <li><span class="icon icon-envelope"></span><span class="text">studywithus@human.university.com</span></li>
	              </ul>
	            </div>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mt-4 mb-4">
            	<h2 class="ftco-heading-2">휴먼대학교 도서관</h2>
            	<div class="block-23 mb-3">
	              <ul>
	                <li><i class="icon icon-map-marker"></i><span class="text">(07302) 서울 영등포구 영중로8길 6 6층</span></li>
	                <li><i class="icon icon-phone"></i><span class="text">02.3667.3688</span></li>
	                <li><i class="icon icon-envelope"></i><span class="text">library@human.university.com</span></li>
	              </ul>
	            </div>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget pl-4 mb-2 mt-2">
            	<!-- 지도 -->
			    <div class="map_wrap">
				    <div id="map" style="max-width:300px; height:200px;">
				    </div> 
				    
				    <!-- 좌표 표시해주는 div -->
				<!-- 	<div id="clickLatlng"></div> -->
					<!-- 좌표 표시해주는 div end -->
				
				    <!-- 지도타입 컨트롤 div 입니다 -->
				    <div class="custom_typecontrol radius_border">
				        <span onclick="zoomIn()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_plus.png" style="width: 20px" alt="확대"></span>  
				        <span onclick="zoomOut()"><img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/ico_minus.png" style="width: 20px" alt="축소"></span>
				        <span id="btnRoadmap" class="selected_btn" onclick="setMapType('roadmap')">지도</span>
				        <span id="btnSkyview" class="btn" onclick="setMapType('skyview')">스카이뷰</span>
				    </div>
				    <!-- 지도 확대, 축소 컨트롤 div 입니다 -->
				    <div class="custom_zoomcontrol radius_border"> 
				    </div>
				</div>
			<!-- 지도 끝 -->
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <p>COPYRIGHT &copy;<script>document.write(new Date().getFullYear());</script> HUMAN UNIV. ALL RIGHTS RESERVED.</p>
          </div>
        </div>
      </div>
    </footer>