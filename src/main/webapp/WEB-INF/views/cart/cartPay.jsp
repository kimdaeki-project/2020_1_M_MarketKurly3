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

<div id="layBodyWrap">
	<div id="layBody">
	<!-- 주문 완료 wrap -->
		<div class="cw_hgroup">
			<h2 class="tit order_end">주문완료</h2>
		</div>
	 
	 <!-- 입금확인 멘트 블록-->
		<div class="OrderW_EndTop">
			<div class="endinfo_bank">
				<h2><strong>입금이 완료되었습니다.</strong></h2>
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
									<span>${member.name}<span><br>
									
                        			${member.address}
                        			<span> ${member.phone} </span>
								</address>
								
								<div class="address_modify">
									<a href="#" class="btn_modify">
									<span>배송지 변경</span>
									</a>
								</div>
							</div>
						</td>
						</tr>
				</tbody>
			</table>
		
			
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
					<td>카카오페이(MarketCurly) <em>1234-5678-90</em>
					/
					<span class="tdin_note"> 예금주명은 'MarketCurly'로 확인됩니다.</span>
					</td>
				</tr>
				
				<tr>
					<th scope="row">입금할 금액</th>
					<td>
						<strong class="tdin_price">${infoP.total_price+infoP.delivery}<span>원</span></strong>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	
	
	</div>
	
	<!-- 주문하신 상품정보 -->
	<div class="order_sconts">
		<div class="order_hgroup">
			<h3 class="cp_intit">주문하신 상품정보</h3>
		</div>
		<!-- 상품 담기는 테이블 -->
		<div class="CartTable1_Wrap"> 
			<table class="order_tbl" summary="주문한 상품의 상품/옵션정보 , 수량 , 상품금액, 배송비를 보여줍니다">
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
						<th scope="col">비고</th>
					</tr>
				</thead>
				<tbody>
				
				<!-- 통합 배송 상품 반복 추가 -->
				<!-- 장바구니의 상품 가지오기 -->
				 <c:forEach items="${yeon} " var="vo22" varStatus="status">
				
					 <tr> 
					
						<td>
							<div class="dp_photo"> 
						 	<c:forEach items="${yeon[status.index].productFileVOs}" var="pfs">
							<a href="링크">
								<img width="90" height="90" alt="상품이미지" src="${pageContext.request.contextPath}/resources/uploadproduct/${pfs.fileName}"> 
							</a>
							</c:forEach> 
							</div>
							
						</td>
					
					
						<td class="td_prdwrap">
							<div class="OrderPrdW_Goods">
								<div class="infoWrap">
									
									<div class="dp_title">
									<c:forEach items="${yeon[status.index].productVOs}" var="prn">
										<a href="링크" style="color:#333">${prn.p_name}</a>
									</c:forEach>
									</div>
									
								</div>
							</div>
							
						</td>
				
					
				
					<td id="cartc${status.index}">${yeon[status.index].count}</td> <!-- 결제 수량 -->
					
					
					<c:forEach items="${yeon[status.index].payVOs}" var="pay">
						<td class="prd_price" id="proPrice${status.index}">${pay.pay_price}</td> <!-- 결제 가격 -->
					</c:forEach>
						<td rowspan="1">
						 <div class="deliver_price">
						 	<div class="defbtn_info_wrap">
						 		<span></span> <!-- 배송비 -->
						 	</div>
						 </div>
						</td>
					</tr> 
					
					</c:forEach> 
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
			
		</div>

		<div class="PriceCheckWrap" style="display:">
			<div class="PriceCheckWrapT" id="priceCheck3_area">
				<div class="PriceCheckWrapB">
					<!-- 주문 금액 -->
					<div class="R_PriceWrap">
						<div class="OrderSUM_Wrap">
							<div class="PriceSPWrap">
								<h5 class="tit">주문금액</h5>
								<span class="Price">
							
									
									${infoP.total_price}
										
	
								 <span class="won">원</span>
								</span>
								
							</div>
							<div class="conList">
								
								<ul>
									<li>
										
										
									</li>
								</ul>
							</div>
						</div>
						<!-- 할인금액 -->
						<div class="Discount_Wrap">
							<div class="PriceSPWrap">
								<h5 class="tit">배송비</h5>
								<span class="Price">${infoP.delivery}
								<span class="won">원</span>
								</span>
								
							</div>
							<div class="conList">
								
								<ul>
									<li>
										
										
										
									</li>
								</ul>
							</div>
						</div>
						<!-- 결제 금액 -->
							<div class="PaymentWrap">
								<div class="PriceSPWrap">
									<h5 class="tit">결제금액</h5>
									<span class="Price">${infoP.total_price+infoP.delivery}
									<span class="won">원</span>
									</span>
								</div>
								<div class="conList">
									<ul>
										<li>
										<strong class="PointBk">
											
										</strong>
											
										</li>
									</ul>
								</div>
							</div><!-- paymentWrap -->
						
					</div>
				</div>
				
			</div>
		</div>
		<!-- 결제 내역 End -->
	
		<!-- 주문완료 확인 버튼 -->
		<div class="OrderW_FinaLBtnW">
			<a href="#" class="defbtn_xlar xladtype" data-is-ab-send="1"><span>주문 완료 확인</span></a>
		</div>
		 
		
	</div>
	<!-- payment detail End --> 		
	
	</div>
	<!-- layBody End -->



</div>






<!-- footer -->
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>