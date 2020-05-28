<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Market Kurly</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cartLayout.css">
	<c:import url="../template/boot.jsp"></c:import>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cartList.css">
</head>
<body onload="count();">
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
			<form id="viewCart" name="frmCart" method="post" action="../pay/payInsert">
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
											<input type="checkbox" id="allCheck" class="allCheck" name="allCheck" checked="checked">
											<!--  class="ico_check" -->
										</label>
										<span class="tit">
											전체선택 (
											<span class="num_count" id="num_count1">1</span>
											/
											<span class="num_total" id="num_total1">1</span>
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
						<div class="view_goods" onload="total();">
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
									<input type="hidden" id="chIdx" value="${fn:length(list)}">
									<tr>
										<td id="thSelect" class="goods_check">
											
												<label class="label_check checked">
													
													<input type="checkbox" class="c1" name="ico_check" id="ch${status.index}" value="31176">
												</label>
									
							
										</td>
										<td header="thInfo" class="goods_thumb"><!-- 상품 정보 -->
											<a href="링크걸기" class="thumb">
												<c:forEach items="${vo.productFileVOs}" var="pf">
												<img src="${pageContext.request.contextPath}/resources/uploadproduct/${pf.fileName}" alt="상품 이미지" onerror=""> 
												</c:forEach>
											</a>
										</td>
										<c:forEach items="${vo.productVOs}" var="pro">
										<td header="thInfo" class="goods_info">
											<a href="링크걸기" class="name">
												
												${pro.p_name}
												
											</a>
											<dl class="goods_cost">
												<dt class="screen_out">판매 가격</dt>
												<dd class="selling_price">
													<span class="num proPrice" id="proPrice${status.index}">${pro.price}</span>
													<span class="txt">원</span>
												</dd>
											</dl>
										</td>
										 </c:forEach>
										<td header="thInfo" class="goods_condition">
											<div class="condition">
												
											</div>
										</td>
										<td header="thCount">
											<div class="goods_quantity">
											<div class="quantity">
												
												<input type="hidden" id="${vo.cq_num}" class="cqn${status.index}">
												<input type="hidden" name="curCnt${status.index}" value="${vo.count}">
												<strong class="screen_out">수량</strong>
												<button type="button" class="btn btn_reduce d${status.index}" onclick="del(${status.index});">
													<img src="${pageContext.request.contextPath}/resources/images/ico_minus_24x4.png" alt="감소">
												</button>
												
												<input type="text" readonly="readonly" class="inp_quantity re${status.index}" id="re${status.index}" value="${vo.count}">
												
									
												<%-- <input type="text" readonly="readonly" class="inp_quantity re${status.index}" id="resultCount" value="${vo.count}"> --%>
												<button type="button" class="btn btn_rise u${status.index}" onclick="add(${status.index});">
													<img src="${pageContext.request.contextPath}/resources/images/ico_plus_24x4.png" alt="증가">
												</button>
											</div>
											</div>
										</td>
										<c:forEach items="${vo.productVOs}" var="pro">
										<td header="thCost">
													
											<dl class="goods_total">
												<dt class="screen_out">합계</dt>
												<dd class="result">
													<span class="num" id="resultPrice${status.index}">${vo.count * pro.price}</span>
													<span class="txt">원</span>
												</dd>
											</dl>
										</td>
										 </c:forEach>
										<td header="thDelete" class="goods_delete">
												
												<button type="button" class="btn btn_delete" onclick="btnDel(${vo.cq_num});">
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
							<input type="checkbox" name="allCheck2" class="allCheck" checked="checked">
						</label>
						<span class="tit">
							전체선택 (
							<span class="num_count" id="num_count2">1</span>
							/
							<span class="num_total" id="num_total2">1</span>
							)
						</span>
					</div>
					<button type="button" class="btn_delete" id="btn_delete">선택 삭제</button>
					<!-- <button type="button" class="btn_delete">품절 상품 삭제</button> -->
				</div>
				<div class="cart_result">
					<div class="cart_amount">
						<dl class="list amount cell_except">
							<dt class="tit">상품 금액</dt>
							<dd class="result">
								<span class="inner_result">
									<span class="num" id="pay_price">3,900</span>
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
									<span class="num" id="delivery">3,000</span>
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
									<input type="hidden" id="totalPrice" value="" name="totalPrice">
									<span class="num" id="total_price">6,900</span>
									<span class="txt">원</span>
								</span>
							</dd>
						</dl>
					</div>
					<div class="notice_cart"></div>
					<button type="submit" class="btn_submit" >주문하기
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


	<script type="text/javascript">
		count();
		var allCheck = document.getElementsByClassName("allCheck");
		var c1 = document.getElementsByClassName("c1");
		console.log("c1.length :" +c1.length);
		console.log(allCheck)
		
		
		
				
		//수량 안내 (n/n)
		document.getElementById("num_total1").innerText = c1.length;
		document.getElementById("num_total2").innerText = c1.length;
		
		
		
		
		$("#num_total1").innerText = c1.length;
	
		
		
		
		
		
		
		//전체 선택  default
		//$(".c1").prop("checked",true);
		for(var i=0; i<c1.length; i++){
			c1[i].checked = true;
		}
		
		

		
		
		
		
		//전체선택 값
		
		var ho = document.getElementById("num_total1").innerText;
		console.log("ho:"+ho);
		
	/* 	console.log("c1[0] : "+c1[0].checked);
		console.log("c1[1] : "+c1[1].checked);
		console.log("c1[2] : "+c1[2].checked);
		console.log("c1[3] : "+c1[3].checked); */
		
		
///////////////////////////
		 
		function count(){
			
			var c1 = document.getElementsByClassName("c1");
			console.log("c1.length :" +c1.length);
			//ch1의길이
			//체크되어있으면 ar에 index 번호 넣어주기
				
			var ar = [];
			for(var i=0; i<c1.length; i++){
				if(c1.checked){
					ar.push(c1);
					console.log("--------------")
					console.log(ar[i]);  //0 1 2 3 4 5
	
				}
			}
			
			
			//가격 배열에 넣어주기
			var arr = [];
			var pay = 0;
			var pid = "resultPrice"; 
			var cnt = 0;
			
			for(var i=0; i<c1.length; i++){// 0 1 2 3 4 5
				if(c1[i].checked){//0
					
					cnt += 1;
					pid = pid + i; //resultPrice0  resultPrice1 . . . >> 합계의 id
					console.log("pid : " + pid);
					var re = document.getElementById(pid).innerText;
					
					pid = "resultPrice";
					pay = pay + parseInt(re);
				}
			}
			
			
			//(n/n)의 첫번째 n
			document.getElementById("num_count1").innerText = cnt;
			document.getElementById("num_count2").innerText = cnt;
			
			
			
			
			
			
			console.log("totalPay : "  + pay);
			
			
		
			//계산한 값 넣어주기
			document.getElementById("pay_price").innerText = pay;
			
			var delivery = 0;
			var deli = document.getElementById("delivery").innerText;
			if(pay>=50000){
				delivery = 0;
			}else if(pay<50000){
				delivery = 3000;
			}else if(pay=0){
				delivery = 0;
			}
			
			document.getElementById("delivery").innerText = delivery;
			
			console.log("잘 실행되고 잇나요");
			console.log(pay);
			document.getElementById("total_price").innerText = (pay+delivery);
			
			$("#totalPrice").val(pay+delivery);
			
			
			if(pay<1){
				document.getElementById("total_price").innerText = 0;
				
			}
			
			console.log(delivery);
			
			
			
			
			
			}
//////////////////////




		
		$(function(){
		  /*  $("#allCheck").on("click",".c1",function(){
				
				$(".c1").prop("checked",$(this).prop("checked"));
				
			}); */
			
		
			
			//allCheck는 default가 true >> checked="checked" 줘놨음
			
			//c1도 default true
			$(".c1").prop("checked",true);
			
			
			//allCheck false일 경우  c1 모두 false
			$(".allCheck").on("click",function(){
				$(".c1").prop("checked", $(this).prop("checked"));
				$(".allCheck").prop("checked",$(this).prop("checked"));
				count();
			});
			
			
			
			//c1 하나라도 false일 경우 allCheck flase
			$(".c1").on("click",function(){
				
				var result = true;
				
				if(!$(this).prop("checked")){
					result = false;
				}
				
				$(".allCheck").prop("checked",result);
				
				
				var re = true;
				for(var i=0; i<c1.length; i++){
					
					if(!c1[i].checked){
						re = false;
						break;
					}
				}
				$(".allCheck").prop("checked",re);
				
				
				
				count();
				
			});

		})
		

		
		
		
		
		//수량 변경 ***********************************************

		
		function init () {
			/* sell_price = document.getElementById("proPrice").innerText;
			console.log(sell_price);
			console.log(typeof sell_price);
			
			
			amount = document.getElementByClassName("resultCount");

			document.getElementById("num").innerHTML=sell_price; */
			//change();
		}
	
		
		function add (num) {	
			//index 숫자 가져와서 이름 생성
			var nn = "re"+num;
			console.log(nn);
			
			//생성한 이름과 같은 Id의 값
			hm = parseInt(document.getElementById(nn).value);  //개수
			
			console.log("index : " + num);
			
			console.log("값 : " + hm);
			console.log("text");
			//해당 개수 증가
			hm++;
			
			
			//증가값 입력
			$(document).ready(function() {
		        $("#"+nn).val(hm);
		    }); 
			
			
			var cqn = ".cqn"+num;
			$.post("../cart/countUpdate",{cq_num:$(cqn).attr("id"), num:hm}, function(data){
				console.log(data);
				
			});
			
			
			
			
			
			
			
			//최종 가격 수정
			var pp = "proPrice"+num;
			
			var proPrice = parseInt(document.getElementById(pp).innerText);
			console.log(hm * proPrice);
			
			var rp = "resultPrice"+num
			document.getElementById(rp).innerText = hm * proPrice;
			
			count();
		}

		
		function del (num) {
			var nn = "re"+num;
			hm = parseInt(document.getElementById(nn).value);  //개수
		
			///sum = document.fo.num;
				if (hm> 1) {
					hm--;
					//num.value = parseInt(hm.value) * sell_price;
					
					//document.getElementById("#resultPrice").innerHTML = parseInt(hm.value) * parseInt(sell_price);
					$(document).ready(function() {
				        $("#"+nn).val(hm);
				    }); 
					
					
					
					var cqn = ".cqn"+num;
					$.post("../cart/countUpdate",{cq_num:$(cqn).attr("id"), num:hm}, function(data){
						console.log(data);
						
					});
					
					
					
					
					//최종 가격 수정
					var pp = "proPrice"+num
					
					var proPrice = parseInt(document.getElementById(pp).innerText);
					console.log(hm * proPrice);
					
					var rp = "resultPrice"+num
					document.getElementById(rp).innerText = hm * proPrice;
				}
				
				
				count();
				
		}
		
		
		function change(){
			hm = document.getElementsByClassName("inp_quantity"); 
			sell_price = document.getElementById("resultPrice").innerText;
			//num = document.fo.num;
				if(hm.value < 0){
					hm.value = 0;
				}
			//num.value = parseInt(hm.value) * sell_price;
			document.getElementById("resultPrice").innerText = parseInt(hm.value) * parseInt(sell_price);
			
		}
		
		
		//cart Delete
		function btnDel (num){
			
			
			$.post("../cart/cartDelete",{cq_num:num},function(data){
				if(data>0){
					
					location.reload();
				}else{
					alert("작성 실패");
				}
				console.log("here")
				console.log("data :" + data);
			});
			
		}
		
 		
		//개별 삭제
		$("#btn_del").click(function(){
		
			$.post("../cart/cartDelete",{cq_num:$(".cqn").attr("id")},function(data){
				
				console.log(data);
			}
			)
					
		}); 
		
		
		
		//선택 삭제
		$("#btn_delete").click(function(){
			//뭐뭐 체크되어있는지 확인 후 그것들의 cq_num을 post로 전송
			var check = "";
			
			for(var i=0; i<c1.length; i++){
				var cid = "ch"+i;
				ckid = document.getElementById(cid);
				
				var cqn = ".cqn"+i;
				
				
				if(ckid.checked){
					var b = $(cqn).attr("id") + "-";
					
					check += b;
					console.log("test"+i);
				}
			
			}
			
			console.log(check);
			
		/* 	for(var i=0; i<check.length; i++){
				console.log(check[i]);
			} */
			
			//배열 check를 보내기
			$.post("../cart/selectDelete",{cqn:check},function(data){
				
				
				
				
				console.log(data);
				
				console.log("data : " + data);
				if(data>0){
					location.reload();
				}
				
			})
			 
			
			
		});
		
		
		
/* 		
		function pay(){
			var totalPay = document.getElementById("total_price").innerText;
			console.log("totalPay..... : " + totalPay)
			$.post("./pay",{totalPrice:totalPay},function(data){
				
			})
			
			
		} */

		
		
		
		/* 선택 구매  */
		$(".btn_submit").click(function(){
			//뭐뭐 체크되어있는지 확인 후 그것들의 cq_num을 post로 전송
			var check = "";
			
			for(var i=0; i<c1.length; i++){
				var cid = "ch"+i;
				ckid = document.getElementById(cid);
				
				var cqn = ".cqn"+i;
				
				
				if(ckid.checked){
					var b = $(cqn).attr("id") + "-";
					
					check += b;
					console.log("test"+i);
				}
			
			}
			
			console.log(check);
			
 
			$.post("../pay/totalInfo",{cqn:check},function(){
				
			
				
			})
			  
			
			
		});

	
	</script>
</html>



