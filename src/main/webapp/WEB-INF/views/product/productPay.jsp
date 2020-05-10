<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

 <!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cartPay.css">
	<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<!-- cartpay  결제 후 이미지 jsp 파일 -->

<div class="bodyWrap">
	<div class="layBody">
	<!-- 주문 완료 wrap -->
		<div class="cw_hgroup">
			<h2 class="tit_order_end">주문완료</h2>
		</div>
	 
	 <!-- 입금확인 멘트 블록-->
		<div class="OrderEndWrap">
			<div class="endinfo_bank">
				<strong>입금이 완료되었습니다.</strong>
				<p>상품 배송이 시작됩니다.</p>
			</div>
		</div>
		
	<!-- 배송지 정보 확인 블록 -->
		<div class="order_sconts">
			<h3 class="cp_intit">배송지 정보</h3>
			<table class="InDataTable" data-log-actionid-area="delivery" data-is-ab-send="1">
				<caption>배송지정보</caption>
				<colgroup>
					<col style="width:13%;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">받는사람</th>
						<td>
							<div class="InfoW">
								<address>
									<em>신연주</em>
								"	

                        
                        			(42242) 서울특별시 서대문구 동교로 294 (연희동)
                        			"
                        			<span> -/ 010-1111-2222</span>
								</address>
								<div class="address_modify">
									<a href="#"><span>배송지 변경</span></a>
								</div>
							</div>
						</td>
						</tr>
				</tbody>
			</table>
		
			<div class="Btm_infoW">
				<ul>
					<li>배송지 변경은 <em>MY PAGE > 주문 확인</em>에서 가능합니다.</li>
					<li>신용카드 포인트 결제는 카드사 홈페이지의 카드사 포인트 및 세이브 내역에서 확인 가능합니다. </li>
				</ul>
			</div>
		</div>	
		
	<!-- 입금 은행 정보 -->
	<div class="order_sconts">
		<div class="order_hgroup">
			<h3 class="cp_intit">입금은행 정보</h3>
		</div>
		
		<table class="InDataTable">
			<caption>입금은행 정보</caption>
			<colgroup>
				<col style="width:13%;">
				<col>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">입금정보</th>
					<td>신한은행(MarketCurly) <em>1234567890</em>
					"/"
					<span class="tdin_note"> 예금주명은 'MarketCurly'로 확인됩니다.</span>
					</td>
				</tr>
				
				<tr>
					<th scope="row">입금할 금액</th>
					<td>
						<strong class="tdin_price">"34,900"<span>원</span></strong>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	<!-- 환불 정보 -->
	<div class="order_sconts">
		<h3 class="cp_intit">환불 정보</h3>
		<table class="InDataTable">
			 <caption>환불입력 정보</caption>
				 <colgroup>
				 	<col style="width:13%;">
				 	<col>
				 </colgroup>
			<tbody>
				<tr>
					<th scope="row">환불방식</th>
					<th>무통장입금</th>
				</tr>
			</tbody>
		</table>
		
		<div class="Btm_infoW">
				<ul>
					<li>취소/반품 신청 시, 환불 방식은 무통장입금과 캐시 중에 선택하여 신청하실 수 있습니다.</li>
					<li><em>[PC > MY PAGE > 환불/입금내역]</em>에서 환불금액을 입금 받을 계좌를 등록 및 수정할 수 있습니다. </li>
				</ul>
			</div>
	</div>
	
	<!-- 주문하신 상품정보 -->
	<div class="order_sconts">
		<div class="order_hgroup">
			<h3 class="cp_intit">주문하신 상품정보</h3>
		</div>
		<!-- 상품 담기는 테이블 -->
		<div class="CartTable1_Wrap"> 
			<table class="order_tb1" summary="주문한 상품의 상품/옵션정보 , 수량 , 상품금액, 배송비를 보여줍니다">
				<caption>주문하신 상품정보</caption>
				<colgroup>
					<col style="width:122px;">
					<col> 
					<col style="width:90px;">
					<col style="width:150px;">
					<col style="width:150px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col" colspan="2">상품/옵션정보</th>
						<th scope="col">수량</th>
						<th scope="col">상품금액</th>
						<th scope="col">배송비</th>
					</tr>
				</thead>
				<tbody>
				<!-- 통합 배송 상품 -->
					<tr> 
						<td>
							<div class="dp_photo">
								<a href="#">
									<img alt="" src=""> <!-- 상품 대표 이미지 들어갈 공간 90*90pix -->
								</a>
							</div>
						</td>
						<td class="td_prdwrap">
							<div class="OrderPrdw_Goods">
								<div class="infoWrap">
									<div class="pup_info">
										<span class="prdico delayshipping">배송지연보상</span>
									</div>
									<div class="dp_title">
										<a href="#">아디다스 입고, 반팔 반바지 팬츠 레깅스</a>
									</div>
									<p class="result_option"> 타이즈 2종 택1/84-1_DP2389_80(M) / +19,000원</p>
								</div>
							</div>
							
						</td>
						<td>1개</td>
						<td class="prd_price">34,900원</td>
						<td rowspan="1">
						 <div class="deliver_price">
						 	<div class="defbtn_info_wrap">
						 		<em>무료</em>
						 	</div>
						 </div>
						</td>
					</tr>
				<!-- 주문 내역 -->
				</tbody>
			</table>
		</div>
		<!-- 상품담기는테이블 End -->
	</div>
	
	<!-- 결제 내역 -->
	<div class="payment_detail">
		<div class="order_hgroup" style="dislay:">
			<h3 class="cp_intit">결제내역</h3>
			<span class="direct_icon">바로가기OFF</span>
		</div>
		
		
		<div class="PriceCheckWrap" style="display:">
			<div class="PriceCheckWrapT" id="priceCheck3_area">
				<div class="PriceCheckWrapB">
					<!-- 주문 금액 -->
					<div class="R_PriceWrap">
						<div class="OrderSUM_Wrap">
							<div class="PriceSPWrap">
								<h5 class="tit">주문금액</h5>
								<span class="Price">"34,900" 
								 <span class="won">원</span>
								</span>
								::after
							</div>
							<div class="conList">
								<h6 class="intit">구매상품 총 1개</h6>
								<ul>
									<li>
										<span class="payTxt">상품금액</span>
										<span class="Price">34,900원</span>
										::after
									</li>
								</ul>
							</div>
						</div>
						<!-- 할인금액 -->
						<div class="Discount_Wrap">
							<div class="PriceSPWrap">
								<h5 class="tit">할인금액</h5>
								<span class="Price">"0"
								<span class="won">원</span>
								</span>
								::after
							</div>
							<div class="conList">
								<h6 class="intit">구매상품 총 1개</h6>
								<ul>
									<li>
										"
										
										"
										
									</li>
								</ul>
							</div>
						</div>
						<!-- 결제 금액 -->
						<div class="PaymentWrap">
							<div class="PriceSPWrap">
								<h5 class="tit">결제금액</h5>
								<span class="Price">"34,900"
								<span class="won">원</span>
								</span>
								::after
							</div>
							<div class="conList">
								<ul>
									<li>
									<strong class="PointBk">
										<span class="payTxt">무통장 입금</span>
										<span class="Price">34,900원</span>
									</strong>
										::after
									</li>
								</ul>
							</div>
						</div>
						::after
					</div>
				</div>
				
			</div>
		</div>
		<!-- 결제 내역 End -->
		
		<!-- 주문완료 확인 버튼 -->
		<div class="OrderW_FinalLBtnW">
			<a href="#"><span>주문 완료 확인</span></a>
		</div>
	</div>
		
	
	</div>




</div>






<!-- footer -->
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>