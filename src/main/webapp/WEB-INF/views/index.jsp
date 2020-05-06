<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<c:import url="./template/boot.jsp"></c:import>
</head>
<body>
<c:import url="./template/header.jsp"></c:import>

<section class="contents">
			<div class="mainImage">
				<div class="listGoods"> 
					<a href="#"></a>
				</div>
			</div>
			<div class="product_list">
				<div class="tit_goods">
					<h3>
						<span>이 상품 어때요?</span>
					</h3>
				</div>
				<div class="list_goods">
					<ul>
						<li>
							<a href="#" class="thumb_goods">
								<img src="./resources/images/goods_img_01.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[제주창해수산] 딱새우 300g(냉동)</a></span>
								<span class="price">6,800원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
						<li>
							<a href="#" class="thumb_goods">
								<img src="./resources/images/goods_img_02.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[일건식] 무가당 생강진액 1L</a></span>
								<span class="price">15,500원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
						<li>
							<a href="#" class="thumb_goods">
								<img src="./resources/images/goods_img_03.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[교토마블] 데니쉬 식빵 6종</a></span>
								<span class="price">7,200원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
						<li>
							<a href="#" class="thumb_goods">
								<img src="./resources/images/goods_img_04.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[상하] 더블업 모짜렐라 슬라이스</a></span>
								<span class="price">3,588원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
					</ul>
					
					<br/>
					<br/>
					<br/>
				
					<ul>
						<li>
							<a href="#" class="thumb_goods">
								<img src="./resources/images/goods_img_01.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[제주창해수산] 딱새우 300g(냉동)</a></span>
								<span class="price">6,800원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
						<li>
							<a href="#" class="thumb_goods">
								<img src="./resources/images/goods_img_02.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[일건식] 무가당 생강진액 1L</a></span>
								<span class="price">15,500원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
						<li>
							<a href="#" class="thumb_goods">
								<img src="./resources/images/goods_img_03.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[교토마블] 데니쉬 식빵 6종</a></span>
								<span class="price">7,200원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
						<li>
							<a href="#" class="thumb_goods">
								<img src="./resources/images/goods_img_04.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[상하] 더블업 모짜렐라 슬라이스</a></span>
								<span class="price">3,588원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="event_news">
				<div class="inner_event">
					<div class="tit_event">
						<h3>
							<span>이벤트 소식 ></span>
						</h3>
					</div>
					<div class="list_event">
						<ul>
								<li>
									<a href="#" class="event_goods">
										<img src="./resources/images/event_img_01.jpg">
									</a>
									<div class="info_goods">
										<span class="name"><a href="#">내 몸을 위한 식단관리 모음전</a></span>
										<span class="con"><a href="#">가볍게 시작하는 한 끼</a></span>
									</div>
								</li>
								<li>
									<a href="#"  class="event_goods">
										<img src="./resources/images/event_img_02.jpg">
									</a>
									<div class="info_goods">
										<span class="name"><a href="#">컬리의 테이블웨어 모음전</a></span>
										<span class="con"><a href="#">일상에 산뜻함을 더해요</a></span>
									</div>
								</li>
								<li>
									<a href="#" alt="" class="event_goods">
										<img src="./resources/images/event_img_03.jpg">
									</a>
									<div class="info_goods">
										<span class="name"><a href="#">해화당 최대 45% 할인</a></span>
										<span class="con"><a href="#">한 입 베어물면 퍼지는 육즙</a></span>
									</div>
								</li>
							</ul>
							
						</div>
					</div>
			</div>
			<div class="bnr_main">
				<div class="banner">
					<a href="#"><img src="./resources/images/bottom_banner.jpg" alt=""></a>
				</div>
			</div>			
		
		</section>



<c:import url="./template/footer.jsp"></c:import>
</body>
</html>
