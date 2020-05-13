<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productAdmin.css">
	<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="page_article">

<div id="lnbMenu">
	
				<div class="inner_listgoods">
				 <h1>관리자 페이지</h1>
				 <div class="btn">
					<a href="./productWrite" class="btn btn-default">write</a>
				</div>
				</div>
</div>

<div class="goodsList">
	
			<!-- img list -->	
			<div class="list_goodss">
			
				
				<!-- list 반복 -->
				
			<ul class="list">
				
					<c:forEach items="${list}" var="vo">
						
							<li class="list_li">
								<a href="../product/productSelect?p_num=${vo.p_num}" class="thumb_goods">
									<img src="../resources/uploadproduct/${vo.productFileVOs['0'].fileName}">
								</a>
									<div class="info_goods">
										<span class="name"><a href="../product/productSelect?p_num=${vo.p_num}">${vo.p_name}</a></span>
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
		
</div>	<!-- page_article end -->	


			
		
		
			
			
			
