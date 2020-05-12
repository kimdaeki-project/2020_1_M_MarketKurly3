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
			
				<div class="inner_listgoods">
				
				<div class="btn">
					<a href="./productWrite" class="btn btn-default">write</a>
				</div>
				
				<div class="inner_lnb">
					<div class="ico_cate">
						<span class="ico"></span>
						<span class="tit">신상품</span>
					</div>
				</div> 
				
				<form class="form-inline" action="./productList">
					<!-- 종류 분류 -->
					<div class="input-group input-group-sm col-xs-2" >
				    	<select class="form-control" id="sel1" name="kind">
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
				
				<!-- list 반복 -->
			<c:forEach items="${list}" var="vo">
				<ul class="list">
					<li>
					<a href="../productSelect?p_num=${vo.p_num}" class="thumb_goods">
						<img src="../resources/uploadproduct/${vo.productFileVOs.get(0).fileName}" height="396" width="308">
					</a>
						<div class="info_goods">
							<span><a href="">${vo.p_name}</a></span>
							<span>${vo.price}</span>
						</div>
					</li>
					
				</ul>	
			 </c:forEach>
				
			</div> <!-- innerlistgoods end -->	
					
		</div>
</div>

	
						
	<!-- 페이지 이동 -->		
	<div>
	<ul class="pagination">
		<c:if test="${pager.curBlock gt 1}">
			<li><a href="./productList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
		</c:if>
		<c:forEach begin="${pager.startNum }" end="${pager.lastNum}" var="i">
			<li><a href="./productList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
		</c:forEach>
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<li><a href="./productList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a> </li>
		</c:if>
	</ul>
	</div>		
			
			
			
			
			
			
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>