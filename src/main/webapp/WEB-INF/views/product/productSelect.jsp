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
			.nav-tabs{
				width:1170px;
				margin:0 auto;
			}
			
			.tab-content	{
				width:1170px;
				margin:0 auto;
			}

		</style>
	</head>
<body onload="init();">

	


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
					
					<form action="../cart/cartInsert" method="post" name="frmWishlist">
						<input type="hidden" name="count" id="count" value="1">
						<input type="hidden" name="p_num" value="${product.p_num}">
						<div class="group_btn">
							<span class="btn_type1">
								<button type="submit" class="txt_type">장바구니 담기</button>
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
  <li><a data-toggle="tab" href="#menu1">Menu 1</a></li>
  <li><a data-toggle="tab" href="#menu2">Menu 2</a></li>
</ul>

<div class="tab-content">
  <div id="home" class="tab-pane fade in active">
    <h3>HOME</h3>
    <p>Some content.</p>
    

  	 
  	 
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
  
  </div>
  <div id="menu2" class="tab-pane fade">
   	
   	<div class="container">

	<div class="row">
	<h4>상품 문의</h4> <!--  qna -->
		 <form class="form-inline" action="./qnaList">
		    <div class="input-group input-group-sm col-xs-2" >
		    
		    	<select class="form-control" id="sel1" name="kind">
				    <option value="ti">제목</option>
				    <option value="co">내용</option>
				    <option value="wr">작성자</option>
  				</select>
  				</div>
  				
  				<div class="input-group input-group-sm col-xs-4">
  				
			      <input type="text" class="form-control" placeholder="Search" name="search">
			      <div class="input-group-btn">
			        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
			      </div>
	    		</div>
	    		
	    	<a href="./qnaWrite" class="btn btn-danger">문의하기</a>
	 	 </form>
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
			 	--
			 	<!-- &nbsp;&nbsp; //스페이스바역할 -->
			</c:forEach> 
			</c:catch>
			<a href="./productSelect?p_num=${voo.num}"> ${voo.title}</a></td>
			<td>${voo.writer }</td>
			<td>${voo.regDate }</td>
			<td>${voo.hit}</td>
		</tr>
		</c:forEach>
		</table>
		
		<div><!-- 페이지 이동을 위한  -->
		<ul class="pagination">
			<c:if test="${pager.curBlock gt 1 }">
			<li><a href="./qnaList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}"> 이전</a></li>
			</c:if>
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li><a href="./qnaList?curPage=${i} &kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			</c:forEach>
			<c:if test="${pager.curBlock lt pager.totalBlock}">
			<li><a href="./qnaList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}"> 다음 </a></li>
			</c:if>
			</ul>
		</div>
		
		
		<c:catch>
		<c:choose>
			<c:when test="${board eq 'qna'}">
				<c:if test="${member.id eq 'admin'}">
					<div>
						<a href="./${board}Write" class="btn btn-danger">write</a>
					</div>
				
				</c:if>
			</c:when>
			<c:otherwise>
				<c:if test="${not empty member}">
					<div>
						<a href="./${board}Write" class="btn btn-danger">write</a>
					</div>
				</c:if>
			</c:otherwise>
		</c:choose>
		</c:catch>
		
		
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
		
		
		
	
	</script>
	
</body>
</html>