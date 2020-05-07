<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productList.css">
	<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="product_list">
				<div class="list_goods">
				
				<div class="btn">
					<a href="./productWrite" class="btn btn-default">write</a>
				</div>
				
				<div class="inner_lnb">
					<div class="ico_cate">
						<span class="ico"></span>
						<span class="tit">신상품</span>
					</div>
				</div> 
				
				<div class="inner_lnb2">
					<div class="ico_cate2">
						<span class="ico2"></span>
						<span class="tit2">전체조회</span>
					</div>
				</div> 
							
				
					<ul >
						<li>
							<a href="#" class="thumb_goods">
								<img src="../resources/images/goods_img_01.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[제주창해수산] 딱새우 300g(냉동)</a></span>
								<span class="price">6,800원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
						<li>
							<a href="#" class="thumb_goods">
								<img src="../resources/images/goods_img_02.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[일건식] 무가당 생강진액 1L</a></span>
								<span class="price">15,500원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
						<li>
							<a href="#" class="thumb_goods">
								<img src="../resources/images/goods_img_03.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[교토마블] 데니쉬 식빵 6종</a></span>
								<span class="price">7,200원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
						<li>
							<a href="#" class="thumb_goods">
								<img src="../resources/images/goods_img_04.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[상하] 더블업 모짜렐라 슬라이스</a></span>
								<span class="price">3,588원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
					</ul>
					

				
					<ul>
						<li>
							<a href="#" class="thumb_goods">
								<img src="../resources/images/goods_img_01.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[제주창해수산] 딱새우 300g(냉동)</a></span>
								<span class="price">6,800원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
						<li>
							<a href="#" class="thumb_goods">
								<img src="../resources/images/goods_img_02.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[일건식] 무가당 생강진액 1L</a></span>
								<span class="price">15,500원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
						<li>
							<a href="#" class="thumb_goods">
								<img src="../resources/images/goods_img_03.jpg">
							</a>
							<div class="info_goods">
								<span class="name"><a href="#">[교토마블] 데니쉬 식빵 6종</a></span>
								<span class="price">7,200원</span>
								<span class="cost">2,180원</span>
							</div>
						</li>
						<li>
							<a href="#" class="thumb_goods">
								<img src="../resources/images/goods_img_04.jpg">
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
			
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>