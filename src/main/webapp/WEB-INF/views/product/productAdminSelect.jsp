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
	
	<form action="productAdminDelete" id="plist" name="plist" method="post">
	
	<div class="container">
		<div class="product">
			<div class="inner_view">
				<div class="thumb">
					<c:forEach items="${product.productFileVOs}" var="profile">
					
						<div>
							<img src="${pageContext.request.contextPath}/resources/uploadproduct/${profile.fileName}"/>
						</div>
					</c:forEach>
				</div>
				
				<c:if test="${not empty member}">
					<c:if test="${member.id eq 'admin'}">
						 <div class="btnU">
							<a href="./productAdminUpdate?p_num=${product.p_num}" class="btn btn-default">Update</a>
						 </div>
						 <div class="btndel">
						 
						 	<%-- <a href="./productAdminDelete?p_num=${product.p_num}" class="btn btn-default">Delete</a> --%>
						 	<input type="hidden" id="pn" value="${product.p_num}" name="p_num">
							<button type="submit"  class="btn btn-default" value="" >Delete</button>
						 </div>
					</c:if>
				</c:if>
				
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
			
	  	</div>
	  	
	    
  	
  </div>
	  	
	  	
	 <div class="contents">
	 	<div class="goods-view-infomation detail_wrap_outer">
	 		<ul class="goods-view-infomation-tab-group">
	 		<li class="goods-view-infomation-tab">
	 			<h3>상품 설명</h3>
	 		</li>
	 		</ul>
	 	</div>
	 	
	 	<div class="cimg">  
	 		<div class="contentsImg">
	 			<span>${product.contents}</span>
	 			
	 		</div>
	 	</div>
	    	
	  </div> 	
	

	
  </form>
  

  
  
  
  
  
	<c:import url="../template/footer.jsp"></c:import>
	
	

		<script type="text/javascript">
/* 		var sell_price;
		var amount;
		/* var aaaa = document.getElementById("num")
		aaaa.innerHTML='ddddddd'; 
	
		
		function init () {
			sell_price = parseInt(document.fo.sell_price.value);
			console.log(sell_price);
			console.log(typeof sell_price);
			amount = document.fo.amount.value;
			//document.fo.num.value = sell_price;
			//document.fo.num.value = sell_price;
			
			//document.fo.num.innerHTML=sell_price;
			document.getElementById("num").innerHTML=sell_price;
			change();
		}
		
		//document.getElementById("num").innerHTML=sell_price;
		
		function add () {
			hm = document.fo.amount;
			sum = document.fo.num;
			hm.value ++ ;
			

			//sum.value = parseInt(hm.value) * parseInt(sell_price);
			
			document.getElementById("num").innerHTML = parseInt(hm.value) * parseInt(sell_price);
			$(document).ready(function() {
		        $('#count').val(hm.value);
		    });
		}

		
		function del () {
			hm = document.fo.amount;
			sum = document.fo.num;
				if (hm.value > 1) {
					hm.value -- ;
					//num.value = parseInt(hm.value) * sell_price;
					
					document.getElementById("num").innerHTML = parseInt(hm.value) * parseInt(sell_price);
				}
		}
		
		
		function change(){
			hm = document.fo.amount;
			num = document.fo.num;
				if(hm.value < 0){
					hm.value = 0;
				}
			//num.value = parseInt(hm.value) * sell_price;
			document.getElementById("num").innerHTML = parseInt(hm.value) * parseInt(sell_price);
			
		}
		
	 
		 function btnDel(num) {
			$.post("./productAdmin",{p_num:num},function(data){
				if(data>0){
					 loacation.reload(); 
				}else{
					alert("삭제 실패");
				}
				console.log("here");
				console.log("data : "+data);
			});
		}   */
		

	</script>
	
</body>
</html>