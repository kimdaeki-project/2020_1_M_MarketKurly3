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
<body onclick="getParam();">
<c:import url="../template/header.jsp"></c:import>


<div class="page_article">

<div id="lnbMenu">
	
				<div class="inner_listgoods">
				
				
				<div class="inner_lnb">
					<div class="ico_cate">
						<span class="ico"></span>
						
					</div>
				</div> 
				
				<form class="form-inline" action="./productList " >
				
				<!-- 여기 -->
				<input type="hidden"  name="bar"  value="" id="barr2">
				 <!-- 파라미터 bar=new 추가를 위한 input -->
				 
					<!-- 종류 분류 -->
					<div class="input-group input-group-sm col-xs-2" >
				    	<select class="form-control" id="kind" name="kind">
				    		<option value="">전체보기</option>
						    <option value="me">Meat</option>
						    <option value="ve">Vegetable</option>
						    <option value="de">Dessert</option>
		  				</select>
	  				</div>
	  				
					<!-- 검색 -->
					<div class="input-group input-group-sm col-xs-4">
	  				
				      <input type="text" class="form-control" placeholder="Search" name="search">
				      <div class="input-group-btn">
				        <button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
				      </div>
		    		</div>
		    				
				</form>
</div>
</div>
	<div class="goodsList">
	
			<!-- img list -->	
			<div class="list_goodss">
			
				
				<!-- list 반복 -->
				
			<ul class="list">
				
					<c:forEach items="${list}" var="vo">
					
						<input type="hidden"  name="bar"  value="${vo.bar}" id="barr"> <!-- 값 가져오기 -->
						
							<li class="list_li">
								<a href="../product/productSelect?p_num=${vo.p_num}" class="thumb_goods">
									<img src="../resources/uploadproduct/${vo.productFileVOs['0'].fileName}">
								</a>
									<div class="info_goods">
										<span class="name"  ><a href="../product/productSelect?p_num=${vo.p_num}" style="color:#333" >${vo.p_name}</a></span>
										<span class="cost">${vo.price}원</span>
									</div>
							</li>
							
					 </c:forEach>
				
			 </ul>
				
			</div> <!-- innerlistgoods end -->	
					
		</div>


	
						
	<!-- 페이지 이동 -->		
	<div class="page1">
	<ul class="pagination">
		<c:if test="${pager.curBlock gt 1}">
			<li><a href="./productList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}&bar=${pager.bar}">이전</a></li>
		</c:if>
		
		<c:forEach begin="${pager.startNum }" end="${pager.lastNum}" var="i">
			<li><a href="./productList?curPage=${i}&kind=${pager.kind}&search=${pager.search}&bar=${pager.bar}">${i}</a></li>
		</c:forEach>
		
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<li><a href="./productList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}&bar=${pager.bar}">다음</a> </li>
		</c:if>
	</ul>
	</div>		
	
<c:import url="../template/footer.jsp"></c:import>
</body>

<script type="text/javascript">

	

		var params = [];
		
		
		function getParam (){
			
			params = location.search.substr(location.search.indexOf("?") + 1);
		
		
		    params = params.split("&");
		
		
		    params = params[0].split("=");
		    console.log("params : " + params[1]);
		}
		/* 주소창에 찍힌 bar */
		
		
		var bar = $("#barr").val();
		console.log("bar value : "+ bar);
		
		
		
		if(params[1]==null){
			console.log("성공");
			
			$('#barr2').val("");
		
		
		}else{
		
			var bar = $("#barr").val();
			$("#barr2").val(bar); // barr2로 값 넣어주기
		}
		
		
		
		var bar2 = $("#barr2").val();
		console.log("bar value : "+ bar2);
				 
				
		
</script>

</html>
			
<!-- page_article end -->		
	</div>
			
			
			
