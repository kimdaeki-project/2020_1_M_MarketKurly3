<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Market Kurly</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cartLayout.css">
	<c:import url="../template/boot.jsp"></c:import>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cartList.css">
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
<div class="container">
<div class="layout-wrapper">
<div class="layout-page-header">
	<h2 class="layout-page-title">장바구니</h2>
	<div class="pg-sub-desc">
		<p>주문하실 상품명 및 수량을 정확하게 확인해주세요.</p>
	</div>
</div>
<div class="main">
	<div class="contents">
		<!--사이드바-->
		<div id="qnb">
		</div>
		<!--사이드바 end-->



		<div class="user_form_section_cart">
			<form id="viewCart" name="frmCart" method="post" action="/shop/order/order.php">
				<input type="hidden" name="mode" value="setOrder">
				<div class="tbl_comm cart_goods section_cart">
					<table class="tbl_comm tbl_header">
						<caption>장바구니 목록 제목</caption>
						<colgroup>
							<col style="width:375px;">
							<col style="width:432px;">
							<col style="width:115px;">
							<col style="width:110px;">
							<col style="width:auto;">
						</colgroup>
						<thead>
							<tr>
								<th id="thSelect">
									<div class="all_select">
										<label class="label_check checked">
											<input type="checkbox" name="allCheck" class="ico_check">
										</label>
										<span class="tit">
											전체선택 (
											<span class="num_count">1</span>
											/
											<span class="num_total">1</span>
											)
										</span>
									</div>
								</th>
								<th id="thInfo">상품 정보</th>
								<th id="thCount">수량</th>
								<th id="thCost">상품금액</th>
								<th id="thDelete"></th>
							</tr>
						</thead>
					</table>
					<div id="viewGoods">
						<div>
						<div class="view_goods">
							<table class="tbl_goods goods">
								<caption>장바구니 목록 내용</caption>
								<colgroup>
									<col style="width:76px;">
									<col style="width:100px;">
									<col style="width:488px;">
									<col style="width:112px;">
									<col style="width:86px;">
									<col style="width:110px;">
									<col style="width:auto;">
								</colgroup>
								<tbody>
									<c:forEach items="${list}" var="vo" varStatus="status">
									
									<tr>
										<td id="thSelect" class="goods_check">
											
												<label class="label_check checked">
													<input type="checkbox" name="ico_check" value="31176">
												</label>
									
							
										</td>
										<td header="thInfo" class="goods_thumb"><!-- 상품 정보 -->
											<a href="링크걸기" class="thumb">
												<img src="${pageContext.request.contextPath}/resources/images/avocado.jpg" alt="상품 이미지" onerror=""> 
											</a>
										</td>
										<td header="thInfo" class="goods_info">
											<a href="링크걸기" class="name">
												GAP 방울토마토 500g
												${plist[status.index].p_name}
											</a>
											<dl class="goods_cost">
												<dt class="screen_out">판매 가격</dt>
												<dd class="selling_price">
													<span class="num">3,900</span>
													<span class="txt">원</span>
												</dd>
											</dl>
										</td>
										<td header="thInfo" class="goods_condition">
											<div class="condition">
												
											</div>
										</td>
										<td header="thCount">
											<div class="goods_quantity">
											<div class="quantity">
												<strong class="screen_out">수량</strong>
												<button type="button" class="btn btn_reduce">
													<img src="${pageContext.request.contextPath}/resources/images/ico_minus_24x4.png" alt="감소">
												</button>
												<input type="text" readonly="readonly" class="inp_quantity" value="${vo.count}">
												<button type="button" class="btn btn_rise">
													<img src="${pageContext.request.contextPath}/resources/images/ico_plus_24x4.png" alt="증가">
												</button>
											</div>
											</div>
										</td>
										<td header="thCost">
											<dl class="goods_total">
												<dt class="screen_out">합계</dt>
												<dd class="result">
													<span class="num">3,900</span>
													<span class="txt">원</span>
												</dd>
											</dl>
										</td>
										<td header="thDelete" class="goods_delete">
												<button type="button" class="btn btn_delete">
													<img src="${pageContext.request.contextPath}/resources/images/btn_close.jpg" alt="삭제">
												</button>
										</td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						</div>
					</div>
					
				</div>
				
				
				
				
				
				<div class="all_select select_option">
					
					<div class="label_cc">
						<label class="label_check checked">
							<input type="checkbox" name="allCheck" class="ico_check">
						</label>
						<span class="tit">
							전체선택 (
							<span class="num_count">1</span>
							/
							<span class="num_total">1</span>
							)
						</span>
					</div>
					<button type="button" class="btn_delete">선택 삭제</button>
					<!-- <button type="button" class="btn_delete">품절 상품 삭제</button> -->
				</div>
				<div class="cart_result">
					<div class="cart_amount">
						<dl class="list amount cell_except">
							<dt class="tit">상품 금액</dt>
							<dd class="result">
								<span class="inner_result">
									<span class="num">3,900</span>
									<span class="txt">원</span>
								</span>
							</dd>
						</dl>
						<div class="deco deco_plus">
							<img alt="plus" src="${pageContext.request.contextPath}/resources/images/plus.png">
						</div>
						<dl class="list amount_delivery cell_except">
							<dt class="tit">배송비</dt>
							<dd class="result">
								<span class="inner_result add">
									<span class="num">3,000</span>
									<span class="txt">원</span>
								</span>
							</dd>
						</dl>
						<div class="deco deco_equal">
							<img alt="" src="${pageContext.request.contextPath}/resources/images/eq.png">
						</div>
						<dl class="list amout_result cell_except">
							<dt class="tit">결제 예정 금액</dt>
							<dd class="result">
								<span class="inner_result add">
									<span class="num">6,900</span>
									<span class="txt">원</span>
								</span>
							</dd>
						</dl>
					</div>
					<div class="notice_cart"></div>
					<button type="button" class="btn_submit">주문하기
						<span class="price">(6,900 원)</span>
					</button>
				</div>
				<p class="info_notice"></p>
			</form>
		</div>



		<!--loading-->
		<div class="bg_loading">
		</div>
		<!--loading-->

	</div>
</div>



</div><!-- wrapper -->
</div>
	
	
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>