<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../resources/css/mypage.css">
<link rel="stylesheet" type="text/css" href="../resources/css/mypage_purchase.css">
<c:import url="../template/boot.jsp"></c:import>

</head>
<body>
<c:import url="../template/header.jsp"></c:import>

	<section class="mypage">
		
	<!-- top -->
	
		<div class="mypage_top">
			<div class="user"><span class=glad>일반</span> &ensp; <input style="text" class="name" value="${sessionScope.member.name}" readonly="readonly"> 님~ 방문을 환영합니다!</div>
		</div> 
		
	
	<!-- contents -->	
	
	<div class="mypage_contents3">
		<span style="font-size:30px; font-weight:500;" >구매 내역</span> <span style="font-size:12px;" >&ensp;&ensp;지난 3년간의 주문 내역 조회가 가능합니다.</span>
		<br><br>
		
		<div class="line_p">
	<%-- 		
			<div class="listp">- 20/05/21 </div>
						<div class="list_p">
							<div class="list_p_name" style="font-weight: bold; font-size: large;">닭가슴살 외 3건 <span class="list_p_name2"><img alt="" src="${pageContext.request.contextPath}/resources/images/rrr.PNG"></span></div>
							<div class="list_p_content">
								<div class="list_p_photo"><img alt="" src="${pageContext.request.contextPath}/resources/uploadproduct/1dfd018f-2754-49d0-aa25-e1238d67a88b_e355fbd6-22c9-4b49-8ab2-3486579a4f2f_1589259411368l0.jpg" width="67px" height="79px"> </div>
								<div class="list_p_contents1">
									<div class="list_p_contents2"><span style="font-size: small;">주문번호</span> &ensp; <span style="font-weight: bold;">200182</span></div>
									<div class="list_p_contents2"><span style="font-size: small;">결제금액</span> &ensp; <span style="font-weight: bold;">161500원</span></div>
									<div class="list_p_contents2"><span style="font-size: small;">주문상태</span> &ensp; <span style="font-weight: bold;">결제완료</span></div>
								</div>
							</div>
						</div>
			
 --%>
	 		
					<c:forEach items="${list}" var="vo"> <!-- PayInfoVO에서 받아온 정보 : "vo" -->
						
						<div class="listp">-  ${vo.payDate} </div>	
							<div class="list_p">
								<a href="../pay/paySelect?order_num=${vo.order_num}"  style="color: black; text-decoration: none;">
								<div class="list_p_name" style="font-weight: bold; font-size: large;">${vo.productVOs['0'].p_name} 외 ${vo.count}건 <span class="list_p_name2"><img alt="" src="${pageContext.request.contextPath}/resources/images/rrr.PNG"></span></div>
								</a>
								<div class="list_p_content">
									<div class="list_p_photo"><img alt="" src="${pageContext.request.contextPath}/resources/uploadproduct/${vo.productFileVOs['0'].fileName}" width="67px" height="79px"> </div>
									<div class="list_p_contents1">
										<div class="list_p_contents2"><span style="font-size: small;">주문번호</span> &ensp; <span style="font-weight: bold;">${vo.order_num}</span></div>
										<div class="list_p_contents2"><span style="font-size: small;">결제금액</span> &ensp; <span style="font-weight: bold;">${vo.total_price}원</span></div>
										<div class="list_p_contents2"><span style="font-size: small;">주문상태</span> &ensp; <span style="font-weight: bold;">결제완료</span></div>
									</div>
								</div>
							</div>
						 		
					 </c:forEach>
		 
		</div>
		
		
		<!-- page -->
	<div class="purchase_page">
	<ul class="pagination">
		<c:if test="${pager.curBlock gt 1}">
			<li><a href="./payList?curPage=${pager.startNum-1}">이전</a></li>
		</c:if>
		
		<c:forEach begin="${pager.startNum }" end="${pager.lastNum}" var="i">
			<li><a href="./payList?curPage=${i}">${i}</a></li>
		</c:forEach>
		
		<c:if test="${pager.curBlock lt pager.totalBlock}">
			<li><a href="./payList?curPage=${pager.lastNum+1}">다음</a> </li>
		</c:if>
	</ul>
	</div>	
		
		
		
	</div>
	
	
	</section>


	


<c:import url="../template/footer.jsp"></c:import>
</body>
</html>