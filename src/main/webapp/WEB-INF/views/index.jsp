<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

	<c:import url="./template/boot.jsp"></c:import>
</head>
<body>
<c:import url="./template/header.jsp"></c:import>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" 
crossorigin="anonymous"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" 
crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" 
crossorigin="anonymous"></script>



<section class="contents">

	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
			    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
			     <div class="carousel-item active">
			     	 <img class="d-block w-100" src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1590110156.jpg" alt="First slide">
			    </div>
			    <div class="carousel-item">
			     	 <img class="d-block w-100" src="https://img-cf.kurly.com/shop/data/main/1/pc_img_1587981141.jpg" alt="Second slide">
			    </div>
			    <div class="carousel-item">
			     	 <img class="d-block w-100" src="./resources/images/pc_img.png" alt="Third slide">
			    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
		  </a>
	</div>



<!-- ------------------------------------------------- -->
<!-- 			<div class="mainImage">
				<div class="listGoods"> 
					<a href="#"></a>
				</div>
			</div> -->
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
<script type="text/javascript">

		$('.carousel').carousel({
			  interval: 4000
		})
		
		$('#myCarousel').on('slide.bs.carousel', function () {
		  // do something…
		})
			
</script>
</body>
</html>
