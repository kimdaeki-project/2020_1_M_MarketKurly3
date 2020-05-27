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

			
			/* Style inputs, select elements and textareas */
input[type=text], select, textarea{
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  resize: vertical;
}

/* Style the label to display next to the inputs */
label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

/* Style the submit button */
.nav-tabs input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}



/* Floating column for labels: 25% width */
.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

/* Floating column for inputs: 75% width */
.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}


		</style>
	</head>
<body onload="init();">

<!-- alert -->
<div class="ask-layer-wrapper" style="display:none; z-index:9999;">
	<div class="ask-alert-window ask-alert-type-message">
		<div class="ask-alert-wrapper">
			<div class="ask-alert-header">알림메시지</div>
			<div class="ask-alert-content">
				<p class="ask-alert-message" id="msgCart"></p>
			</div>
			<button class="ask-alert-close-button">계속 쇼핑하기</button>
		</div>
		<div class="ask-alert-footer">
			<button type="button" data-ask-callback-key="1245383937128" class="styled-button __active" id="sel">계속 쇼핑하기</button>
			<button type="button" data-ask-callback-key="1245383937128" class="styled-button __active" id="car" onclick="location.href='../cart/cartList'">장바구니 확인</button>
		</div>
	</div>
	<div class="ask-layer-background"></div>
</div>



	<c:import url="../template/header.jsp"></c:import>
	
	
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
				
				<button type="button" class="test1"> test </button>
				
				<div class="goods_name">
					<span class="btn_share">
						<!-- <button id="btnShere">공유하기</button> -->
					</span>
					<strong class="name" style="font-size: xx-large;">${product.p_name} </strong>
					
				</div>
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
					<form name="fo" method="get">
					<div class="in_option">
						<ul class="list_nopackage">
							<li>
								<span class="tit_item">구매수량</span>
								<div class="option">
									<span class="count">
										
											<input type="hidden" name="sell_price" value="${product.price}">
											<button type="button" class="btn down" onclick="del();" value="-">-</button>
											<input type="number" readonly="readonly" onchange="change();" name="amount" class="inp" value="1" size="10">
											<button type="button" class="btn up" onclick="add();"  value="+"></button>
										
									</span>
									<!-- <span class="price">
										<span class="ori_price">4,800원</span>
										<span class="dc_price">3,360원</span>
									</span> -->
								</div>
							</li>
						</ul>
						<div class="total">
							<div class="price">
								<strong class="tit">총 상품 금액:</strong>
								<span class="sum" name="su">
									<p name="num" class="num" id="num"></p>
									<!-- <span class="num">6,720</span> -->
									<span class="won">원</span>
								</span>
							</div>
							<p class="text_point"></p>
						</div><!-- total close -->
					</div><!-- in_option close -->
					</form>
					
					
					<form action="../cart/cartInsert2" method="post" name="frmWishlist">
						<input type="hidden" id="c2Price" name="totalPrice" value="ㅎㅎ">
						<input type="hidden" name="count" id="ct2" value="1">
						<input type="hidden" name="p_num" value="${product.p_num}">
						<div class="group_btn">
							<span class="btn_type1">
								<button type="submit" class="pay_type">즉시 구매</button>
							</span>
							
						</div>
					</form>
					
					
					
					
					
					
					<form action="../cart/cartInsert" method="post" name="frmWishlist">
						<input type="hidden" name="count"  value="1" id="ct">
						<input type="hidden" name="p_num" value="${product.p_num}" id="pn">
						<div class="group_btn">
							<span class="btn_type1">
								<button type="button" class="txt_type">장바구니 담기</button>
							</span>
							
						</div>
					</form>
				</div><!-- inner_option close -->
			<!-- 	<form action="" method="post" name="frmBuyNow">
					<input type="hidden" name="mode" value="addItem">
					<input type="hidden" name="goodsno" value="">
				</form> -->
				
					
				
				
				
			</div><!-- cartput close -->
	  	</div>
	</div>
  
  	 <div class="contents">
  	 
  	 	  <ul class="nav nav-tabs">

  <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
  <li><a data-toggle="tab" href="#menu1">상품 후기</a></li>
  <li><a data-toggle="tab" href="#menu2">상품 문의</a></li>
</ul>

<div class="tab-content">
  <div id="home" class="tab-pane fade in active">

  	 
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
  <div id="menu1" class="tab-pane fade">
	  
	  
	  	  	<p class="reviewTitle">PRODUCT REVIEW</p>
	  		<p>
	  			<span class="reviewCon">· 상품에 대한 후기를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</span>
	  			<span class="reviewCon">· 배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</span>
	  		</p>
	  		<div class="section">
	  		

	  		
	  		<table>
	  		
	  		
	  		<c:forEach items="${review}" var="ro" varStatus="index">
	  		
	  		
					
					<tr class="reviewList">
						<td>
							<div class="list_p_photo">
								<div class="phInner">
									<div class="phText"> </div>
									<img alt="" src="${pageContext.request.contextPath}/resources/uploadReview/${ro.fileName}" width="67px" height="79px"> 
								</div>
							</div>
						</td>
						
						<td class="second">
							<div class="list_p_contents2"><span class="ti">상품 이름</span><p>${ro.p_name}</p></div>
							<div class="list_p_contents2"><span class="ti">제목</span><p>${ro.title}</p></div>
							<div class="list_p_contents2"><span class="ti">내용</span><p>${ro.contents}</p></div>
						</td>
						
						<td>
							<p><span class="ti">작성자</span><span>${ro.id}</span></p>
							<p><span class="ti">작성날짜</span><span>${ro.rDate}</span></p>
							<p><span class="ti">조회수</span><span>${ro.hit}</span></p>
						</td>
					</tr>		
					
					<!-- review -->
					<div class="ask-layer-wrapper2" style="display:none; z-index:9999;">
						<div class="ask-alert-window ask-alert-type-message">
							<div class="ask-alert-wrapper">
								<div class="ask-alert-header">하하...하하하</div>
								<div class="ask-alert-content">
									<p class="ask-alert-message" id="msgCart"></p>
									<img alt="" src="${pageContext.request.contextPath}/resources/uploadReview/${ro.fileName}" width="67px" height="79px">
								</div>
								<button class="ask-alert-close-button">계속 쇼핑하기</button>
							</div>
							<div class="ask-alert-footer">
								<button type="button" data-ask-callback-key="1245383937128" class="styled-button __active" id="sel">계속 쇼핑하기</button>
								<button type="button" data-ask-callback-key="1245383937128" class="styled-button __active" id="car" onclick="location.href='../cart/cartList'">장바구니 확인</button>
							</div>
						</div>
						<div class="ask-layer-background"></div>
					</div>
					<!-- review -->
					
					
			</c:forEach>
			
			
			</table>
			
	  		</div>  

  </div>
  
  <div id="menu2" class="tab-pane fade">
   	
   	<div class="container2">

	<div class="row">
	<h4 class="qna">상품 문의</h4> <!--  qna -->
		 <form class="form-inline" action="./qnaList">
	<!-- 	    <div class="input-group input-group-sm col-xs-2" >
		    
		    	<select class="form-control" id="kind" name="kind">
				    <option value="ti">제목</option>
				    <option value="wr">작성자</option>
				     <option value="co">내용</option>
  				</select>
  				</div>
  				
  				<div class="input-group input-group-sm col-xs-4">
  				
			      <input type="text" class="form-control" placeholder="Search" name="search">
			      <div class="input-group-btn">
			        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
			      </div>
	    		</div> -->
	    		<c:if test="${not empty member}">
	    			<a href="../qna/qnaWrite?p_num=${product.p_num}" class="btn btn_qna">문의하기</a>
	    		</c:if>
	 	 </div>
	 	 <br>
		<table class="table table-hover">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		
		<c:forEach items="${qlist}" var="voo"> <!-- list 에서 하나꺼내서  vo에 넣어서 돌리기 -->
		<tr>
			<td>${voo.num}</td>
			<td>
			<c:catch>
			 <c:forEach begin="1" end="${voo.depth}">
			 		[답변]
			 	<!-- &nbsp;&nbsp; //스페이스바역할 -->
			</c:forEach> 
			</c:catch>
			<a href="../qna/qnaSelect?num=${voo.num}&p_num=${product.p_num}"> ${voo.title}</a></td>
			<td>${voo.writer }</td>
			<td>${voo.regDate }</td>
			<td>${voo.hit}</td>
		</tr>
		</c:forEach>
		</table>
		
		<div><!-- 페이지 이동을 위한  -->
		<ul class="pagination">
			<c:if test="${pager.curBlock gt 1 }">
			<li><a href="./qnaList?curPage=${pager.startNum-1}"> 이전</a></li>
			</c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li><a href="./qnaList?curPage=${i} ">${i}</a></li>
			</c:forEach>
			<c:if test="${pager.curBlock lt pager.totalBlock}">
			<li><a href="./qnaList?curPage=${pager.lastNum+1}"> 다음 </a></li>
			</c:if>
			</ul>
		</div>
		
		
	<%-- 	<c:catch>
		<c:choose>
			<c:when test="${board eq 'qna'}">
				<c:if test="${member.id eq 'admin'}">
					<div>
						<a href="../qna/qnaWrite" class="btn btn-danger">문의하기</a>
					</div>
				
				</c:if>
			</c:when>
			<c:otherwise>
				<c:if test="${not empty member}">
					<div>
						<a href="../qna/qnaWrite" class="btn btn-danger">문의하기</a>
					</div>
				</c:if>
			</c:otherwise>
		</c:choose>
		</c:catch> --%>
		
		 </form>
	</div>
  </div>
</div>

	  
	    	
	    	
	  </div> <!-- contents -->
	  
	  
	  

    
    
    
    

	  
	  
	  
	  
	  
  
  
	<c:import url="../template/footer.jsp"></c:import>
	
	

		<script type="text/javascript">
		var sell_price;
		var amount;
		/* var aaaa = document.getElementById("num")
		aaaa.innerHTML='ddddddd'; */
	
		
		function init () {
			sell_price = parseInt(document.fo.sell_price.value);
			console.log(sell_price);
			console.log(typeof sell_price);
			amount = document.fo.amount.value;
			//document.fo.num.value = sell_price;
			//document.fo.num.value = sell_price;
			
					console.log(document.getElementById("num").innerHTML);
		
			
			
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
			
			//cartInsert2
			var aa = document.getElementById("num").innerHTML;
			document.getElementById("c2Price").value = aa;
			console.log(document.getElementById("c2Price").value);
			//
			
			
			//ct2 -- cartInsert2의 count
			var ct = $(".inp").val();
			$("#ct2").val(ct);
		}

		
		function del () {
			hm = document.fo.amount;
			sum = document.fo.num;
				if (hm.value > 1) {
					hm.value -- ;
					//num.value = parseInt(hm.value) * sell_price;
					
					document.getElementById("num").innerHTML = parseInt(hm.value) * parseInt(sell_price);
				}

				//cartInsert2
				var aa = document.getElementById("num").innerHTML;
				document.getElementById("c2Price").value = aa;
				console.log(document.getElementById("c2Price").value);
				//
				
				
				//ct2 -- cartInsert2의 count
				var ct = $(".inp").val();
				$("#ct2").val(ct);
		}
		
		
		function change(){
			hm = document.fo.amount;
			num = document.fo.num;
				if(hm.value < 0){
					hm.value = 0;
				}
			//num.value = parseInt(hm.value) * sell_price;
			document.getElementById("num").innerHTML = parseInt(hm.value) * parseInt(sell_price);
			
			
			//cartInsert2
			var aa = document.getElementById("num").innerHTML;
			document.getElementById("c2Price").value = aa;
			console.log(document.getElementById("c2Price").value);
			//
			
			
			
		}
		
		
		/* alert x 버튼 */
		
		$(".ask-alert-close-button").click(function(){
			$(".ask-layer-wrapper").prop("style","display:none;");
		
		})
	
		
		
		
		/* 계속 쇼핑하기 버튼 */	
		$("#sel").click(function(){
			$(".ask-layer-wrapper").prop("style","display:none;");
		})
		
		
		
		
		
		$(".txt_type").click(function(){/*장바구니 버튼 클릭시*/
			console.log($("#pn").val());
			console.log($(".inp").val());
			
			$.post("../cart/cartInsert",{p_num:$("#pn").val(), count:$(".inp").val()},function(result){
		
				
				result = result.trim();
				/*if(result>0){
					alert("성공");
					alert(result);
					console.log(result);
			
				}else{
					alert("중복")
					alert(result);
					console.log(result);
				}  */
				
				
				$("#msgCart").text(result);
				
				
				
			});

			
			$(".ask-layer-wrapper").prop("style","display:block; z-index:9999;");
			
		})
		
	
		
		
		
		$(".pay_type1").click(function(){/*즉시구매 버튼 클릭시*/
			console.log($("#pn").val());
			console.log($(".inp").val());
			
			$.post("../cart/cartInsert2",{p_num:$("#pn").val(), count:$(".inp").val()},function(){

			});

			
			
			
		})
		
		
		
		
		
		
		
		
	
		
		$(".test1").click(function(){
			$(".ask-layer-wrapper").prop("style","display:block; z-index:9999;");
		})
		
		
		
		
		$(".reviewList").click(function(){/*장바구니 버튼 클릭시*/
	
			$(".ask-layer-wrapper2").prop("style","display:block; z-index:9999;");
			
		})
		
		
		
		
		
	</script>
	
</body>
</html>