<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productSelect.css">
		
		<c:import url="../template/boot.jsp"></c:import>
		<style type="text/css">


		</style>
	</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	
	<div class="container">
		<div class="product">
			<div class="inner_view">
				<div class="thumb">
					<c:forEach items="${product.productFileVOs}" var="profile">
					
						<div>
						
							<img src="${pageContext.request.contextPath}/resources/images/uploadproduct/${profile.filename}"/>
						</div>
					</c:forEach>
					<img src="${pageContext.request.contextPath}/resources/images/1538037871289y0.jpg"/>
				</div>
				<p class="goods_name">
					<span class="btn_share">
						<!-- <button id="btnShere">공유하기</button> -->
					</span>
					<strong class="name">${product.p_name}</strong>
					<span>육즙이 가득한 풍성한 맛</span>
				</p>
				<!-- <p class="goods_dcinfo">회원할인가</p> -->
				<p class="goods_price">
					<span class="dc">
						<span class="dc_price">${product.price}
							<span class="won">원</span>
						</span>
						<!-- <span class="dc_percent">30%</span> -->
					</span>
					<!-- <span class="original">
						<span class="ori_price">4800
							<span class="won">원</span>
						</span>
					</span> -->
				</p>
				<div class="goods_info">
					<dl class="list">
						<dt class="tit">배송구분</dt>
						<dd class="desc">샛별배송/택배배송</dd>
					</dl>
					<dl class="list">
						<dt class="tit">포장타입</dt>
						<dd class="desc">냉동/종이포장
							<strong class="emph">택배 배송은 에코포장이 스티로폼으로 대체됩니다.</strong>
						</dd>
					</dl>
					<dl class="list">
						<dt class="tit">알레르기정보</dt>
						<dd class="desc">샛별배송/택배배송</dd>
					</dl>
					<dl class="list">
						<dt class="tit">안내사향</dt>
						<dd class="desc">- 최소 구매 수량은 2개입니다.</dd>
					</dl>
	
				</div>
			</div>
			<div class="cartPut">
				<div class="inner_option">
					<!-- strong>통통살 가라아게</strong> --><!-- display:none -->
					<div class="in_option">
						<ul class="list_nopackage">
							<li>
								<span class="tit_item">구매수량</span>
								<div class="option">
									<span class="count">
										<button type="button" class="btn down">수량내리기</button>
										<input type="number" readonly="readonly" class="inp">
										<button type="button" class="btn up">수량올리기</button>
									</span>
									<span class="price">
										<span class="ori_price">4,800원</span>
										<span class="dc_price">3,360원</span>
									</span>
								</div>
							</li>
						</ul>
						<div class="total">
							<div class="price">
								<strong class="tit">총 상품 금액:</strong>
								<span class="sum">
									<span class="num">6,720</span>
									<span class="won">원</span>
								</span>
							</div>
							<p class="text_point"></p>
						</div><!-- total close -->
					</div><!-- in_option close -->
					<div class="group_btn">
						<span class="btn_type1">
							<button type="button" class="txt_type">장바구니 담기</button>
						</span>
					</div>
				</div><!-- inner_option close -->
				<form action="" method="post" name="frmBuyNow">
					<input type="hidden" name="mode" value="addItem">
					<input type="hidden" name="goodsno" value="">
				</form>
				<form action="" method="post" name="frmWishlist">
					
				</form>
				
				
			</div><!-- cartput close -->
	  	</div>
	</div>
  
  
  
  
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>