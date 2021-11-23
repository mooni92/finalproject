<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
<jsp:include page="../indexIncludes/head.jsp"/>
<sec:csrfMetaTags/>
  </head>
  <body>
<jsp:include page="../indexIncludes/header.jsp"/>
    <section class="hero-wrap js-fullheight" style="background-image: url('${pageContext.request.contextPath}/resources/images/index/mainImg.jpg');" data-section="home">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-md-8 ftco-animate mt-5" data-scrollax=" properties: { translateY: '70%' }">
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">PULSE OF INNOVATION</h1>
            <p class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">THE BEST FOR A BETTER WORLD</p>
          </div>
        </div>
      </div>
    </section>
		
	<%-- <section class="ftco-section ftco-services ftco-no-pt">
      <div class="container">
        <div class="row services-section">
          <div class="col-md-4 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services text-center d-block">
              <div class="icon"><span class="flaticon-layers"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Perfectly Design</h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                <p><a href="#" class="btn btn-primary">Read more</a></p>
              </div>
            </div>      
          </div>
          <div class="col-md-4 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services text-center d-block">
              <div class="icon"><span class="flaticon-compass-symbol"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Carefully Planned</h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                <p><a href="#" class="btn btn-primary">Read more</a></p>
              </div>
            </div>    
          </div>
          <div class="col-md-4 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services text-center d-block">
              <div class="icon"><span class="flaticon-layers"></span></div>
              <div class="media-body">
                <h3 class="heading mb-3">Smartly Execute</h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.</p>
                <p><a href="#" class="btn btn-primary">Read more</a></p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section> --%>

    <section class="ftco-section ftco-project bg-light" data-section="projects">
    	<div class="container-fluid px-md-5">
    		<div class="row justify-content-center pb-5">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">Study With Us</span>
            <h2 class="mb-4">Human Projects</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-12 testimonial">
            <div class="carousel-project owl-carousel">
            	<div class="item">
            		<div class="project">
		    					<div class="img">
				    				<img src="${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211103_154241722.jpg" class="img-fluid" alt="Colorlib Template">
				    				<a href="${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211103_154241722.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
				    					<span class="icon-expand"></span>
				    				</a>
			    				</div>
			    				<div class="text px-4">
			    					<h5><a href="#">Campus Business Story</a></h5>
			    					<span>Interior Design</span>
			    				</div>
		    				</div>
            	</div>
            	<div class="item">
            		<div class="project">
		    					<div class="img">
				    				<img src="${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211103_165949833_02.jpg" class="img-fluid" alt="Colorlib Template">
				    				<a href="${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211103_165949833_02.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
				    					<span class="icon-expand"></span>
				    				</a>
			    				</div>
			    				<div class="text px-4">
			    					<h5><a href="#">소문내기 이벤트</a></h5>
			    					<span>Interior Design</span>
			    				</div>
		    				</div>
            	</div>
            	<div class="item">
            		<div class="project">
		    					<div class="img">
				    				<img src="${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211103_154241568.jpg" class="img-fluid" alt="Colorlib Template">
				    				<a href="${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211103_154241568.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
				    					<span class="icon-expand"></span>
				    				</a>
			    				</div>
			    				<div class="text px-4">
			    					<h5><a href="#">교육봉사단 신규모집</a></h5>
			    					<span>봉사단 1기 모집</span>
			    				</div>
		    				</div>
            	</div>
            	<div class="item">
            		<div class="project">
		    					<div class="img">
				    				<img src="${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211103_165949833.jpg" class="img-fluid" alt="Colorlib Template">
				    				<a href="${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211103_165949833.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
				    					<span class="icon-expand"></span>
				    				</a>
			    				</div>
			    				<div class="text px-4">
			    					<h5><a href="#">학자금 대출 이자</a></h5>
			    					<span>Interior Design</span>
			    				</div>
		    				</div>
            	</div>
            	<div class="item">
            		<div class="project">
		    					<div class="img">
				    				<img src="${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211103_165949833_01.jpg" class="img-fluid" alt="Colorlib Template">
				    				<a href="${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211103_165949833_01.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
				    					<span class="icon-expand"></span>
				    				</a>
			    				</div>
			    				<div class="text px-4">
			    					<h5><a href="#">서포터즈 신규모집</a></h5>
			    					<span>Interior Design</span>
			    				</div>
		    				</div>
            	</div>
            	<div class="item">
            		<div class="project">
		    					<div class="img">
				    				<img src="${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211104_032756383.jpg" class="img-fluid" alt="Colorlib Template">
				    				<a href="${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211104_032756383.jpg" class="icon image-popup d-flex justify-content-center align-items-center">
				    					<span class="icon-expand"></span>
				    				</a>
			    				</div>
			    				<div class="text px-4">
			    					<h5><a href="#">독서동아리 신규모집</a></h5>
			    					<span>Interior Design</span>
			    				</div>
		    				</div>
            	</div>
            </div>
          </div>
    		</div>
    	</div>
    </section>

    <section class="ftco-section" data-section="team">
    	<div class="container-fluid p-0">
    		<div class="row no-gutters justify-content-center pb-5">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">Our Professor</span>
            <h2 class="mb-4">Professor Introduction</h2>
          </div>
        </div>
        <div class="row no-gutters">
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img-wrap d-flex align-items-stretch">
								<div class="img align-self-stretch" style="background-image: url(${pageContext.request.contextPath}/resources/images/index/armin-g4693f6c2d_1920.jpg);"></div>
							</div>
							<div class="text justify-content-around d-flex align-items-center pt-3 text-center">
								<div>
									<span class="position mb-2">컴퓨터공학과</span>
									<h3 class="mb-4">손요한</h3>
									<div class="faded">
										<p>시험 완전 쉬워!!! 응 아니야 넌 C+ ^^</p>
										<p>왜 뭐~ 문제는 쉬워~ 너가 못 푼거지</p>
										<ul class="ftco-social text-center">
			                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
			              </ul>
		              </div>
		            </div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img-wrap d-flex align-items-stretch">
								<div class="img align-self-stretch" style="background-image: url(${pageContext.request.contextPath}/resources/images/index/teacher-g896b8c0a9_1280.jpg);"></div>
							</div>
							<div class="text justify-content-around d-flex align-items-center pt-3 text-center">
								<div>
									<span class="position mb-2">컴퓨터공학과</span>
									<h3 class="mb-4">조윤정</h3>
									<div class="faded">
										<p>어머~... 이거 쉬운건뎅... 못 풀었어요?...</p>
										<p>괜찮아요... 제가 알려드리면 돼죠...ㅎ..</p>
										<ul class="ftco-social text-center">
			                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
			              </ul>
		              </div>
		            </div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img-wrap d-flex align-items-stretch">
								<div class="img align-self-stretch" style="background-image: url(${pageContext.request.contextPath}/resources/images/index/birger-kollmeier-g1f7e74a09_1280.jpg);"></div>
							</div>
							<div class="text justify-content-around d-flex align-items-center pt-3 text-center">
								<div>
									<span class="position mb-2">컴퓨터공학과</span>
									<h3 class="mb-4">최보원</h3>
									<div class="faded">
										<p>아니... 애들아.. 객체지향 공부안했어?</p>
										<p>왜...? 해야 되는거아니야...? 하.. 아니..</p>
										<p>하... 진짜... 너무 한다.. 오늘부터 해.. 애들아... </p>
										<ul class="ftco-social text-center">
			                <li class="ftco-animate"><a hrefㅁ="#"><span class="icon-twitter"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
			              </ul>
		              </div>
		            </div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img-wrap d-flex align-items-stretch">
								<div class="img align-self-stretch" style="background-image: url(${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211104_111515877.png);"></div>
							</div>
							<div class="text justify-content-around d-flex align-items-center pt-3 text-center">
								<div>
									<span class="position mb-2">컴퓨터공학과</span>
									<h3 class="mb-4">곽승협</h3>
									<div class="faded">
										<p>인간과 컴퓨터 상호작용 어질어질하다..</p>
										<p>게임 프로그래밍 해야하는거 아닌가..</p>
										<p>나만 열심히 강의하면 가상및증강현실 가능할지도...?</p>
										<ul class="ftco-social text-center">
			                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
			              </ul>
		              </div>
		            </div>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img-wrap d-flex align-items-stretch">
								<div class="img align-self-stretch" style="background-image: url(${pageContext.request.contextPath}/resources/images/index/KakaoTalk_20211104_111446760.png);"></div>
							</div>
							<div class="text justify-content-around d-flex align-items-center pt-3 text-center">
								<div>
									<span class="position mb-2">영어영문학과</span>
									<h3 class="mb-4">김영문</h3>
									<div class="faded">
										<p>아니 기초영문법을 몰라? 등짝 딱 대</p>
										<p>HELLO,WORLD! 를 모르면 따라와 영문학개론</p>
										<p>뭐어어어~ ?? 낭만을 꿈꿔? 낭만주의영시 </p>
										<ul class="ftco-social text-center">
			                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
			              </ul>
		              </div>
		            </div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img-wrap d-flex align-items-stretch">
								<div class="img align-self-stretch" style="background-image: url(${pageContext.request.contextPath}/resources/images/index/counselor-gb231fbe1a_1280.jpg);"></div>
							</div>
							<div class="text justify-content-around d-flex align-items-center pt-3 text-center">
								<div>
									<span class="position mb-2">컴퓨터공학과</span>
									<h3 class="mb-4">오석호</h3>
									<div class="faded">
										<p>ㅋㅋ.</p>
										<p>와. 간만에 박장대소 했네. 엄청 웃겨요.</p>
										<p>네?? 비웃은거냐구여?? 아뇨. </p>
										<ul class="ftco-social text-center">
			                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
			              </ul>
		              </div>
		            </div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img-wrap d-flex align-items-stretch">
								<div class="img align-self-stretch" style="background-image: url(${pageContext.request.contextPath}/resources/images/index/man-gaa4c71501_1280.jpg);"></div>
							</div>
							<div class="text justify-content-around d-flex align-items-center pt-3 text-center">
								<div>
									<span class="position mb-2">패션디자인학과</span>
									<h3 class="mb-4">김기락</h3>
									<div class="faded">
										<p>여러분덜~ 나와 같이 있으면 패션 그 까이꺼 별거아님다!</p>
										<p>벙거지 모자 대충쓰면 있어보여 아주~<br> 벙거지모자로 얼굴 잘 가리는법 </p>
										<p>대충입어도 돼~~ 여러분덜~<br> 벙거지만 있으면 아주 그냥 다들 쳐다봐아~ ㅎㅎ</p>
										<ul class="ftco-social text-center">
			                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
			              </ul>
		              </div>
		            </div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-3 ftco-animate">
						<div class="staff">
							<div class="img-wrap d-flex align-items-stretch">
								<div class="img align-self-stretch" style="background-image: url(${pageContext.request.contextPath}/resources/images/index/portrait-gde925fd7b_1280.jpg);"></div>
							</div>
							<div class="text justify-content-around d-flex align-items-center pt-3 text-center">
								<div>
									<span class="position mb-2">국어국문학과</span>
									<h3 class="mb-4">박인영</h3>
									<div class="faded">
										<p>쨕쨕쨕 여러분~ 고운말만써야지요~~</p>
										<p>말 이쁘게 하니까 얼마나 좋아요~~</p>
										<p>말 잘들어줬으니 50페이지만 나갈게요 여러부운~</p>
										<ul class="ftco-social text-center">
			                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-google-plus"></span></a></li>
			                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
			              </ul>
		              </div>
		            </div>
							</div>
						</div>
					</div>
				</div>
    	</div>
    </section>


    <section class="testimony-section" data-section="testimony">
      <div class="container">
        <div class="row ftco-animate justify-content-center">
        	<div class="col-md-12 d-flex align-items-center">
        		<div class="carousel-testimony owl-carousel">
	        		<div class="item">
	        			<div class="testimony-wrap d-flex align-items-stretch">
		              <div class="user-img d-flex align-self-stretch" style="background-image: url(${pageContext.request.contextPath}/resources/images/index/testimony-1.jpg)">
		              </div>
		              <div class="text d-flex align-items-center">
		              	<div>
			              	<div class="icon-quote">
			              		<span class="icon-quote-left"></span>
			              	</div>
			                <p class="mb-4">집이 멀어서 힘들다고? 괜찮아! 돌고돌아 늦게 들어가도 괜찮아! 넷플릭스 2편보면 집 도착해있어! ㅎㅎ  노트북이 비록 내 마음대로 안 되고 자꾸 멋대로 팅겨도 난 괜찮아... 액정이 깨졌지만 렉은 안 걸리는 핸드폰이 나에게는 있어! ㅎㅎ 자 나처럼 긍정적으로 살고 싶으면 "행복과 팔자주름 관계론" 수강 신청 해 ~ 하하하하핳</p>
			                <p class="name">양희찬</p>
			                <span class="position">행복과철학 교수</span>
		                </div>
		              </div>
		            </div>
	        		</div>
	        		<div class="item">
	        			<div class="testimony-wrap d-flex align-items-stretch">
		              <div class="user-img d-flex align-self-stretch" style="background-image: url(${pageContext.request.contextPath}/resources/images/index/testimony-2.jpg)">
		              </div>
		              <div class="text d-flex align-items-center">
		              	<div>
			              	<div class="icon-quote">
			              		<span class="icon-quote-left"></span>
			              	</div>
			                <p class="mb-4">정말 아직도 교수를 믿나? 합의알고리즘 어..? 내가 어디까지 강의를 했더라? C+ 가져 자네거야 우린 깐부잖아~ 뭐어~? 나는 아무에게도 시험을 강요한 적 없어. 자네도 제발로 입학한거 아닌가! 아 맞다 그리고 자네가 지금까지 공부를 미뤄온 거는 말이 되고?? 나 정말 무서워어~ 너의 맞는 답이 없는 시험지를 보기가~  </p>
			                <p class="name">오일남</p>
			                <span class="position">컴퓨터공학 교수</span>
		                </div>
		              </div>
		            </div>
	        		</div>
	        	</div>
        	</div>
        </div>
      </div>
    </section>
<jsp:include page="../indexIncludes/footer.jsp"/>
<jsp:include page="../indexIncludes/foot.jsp"/>
  </body>
</html>