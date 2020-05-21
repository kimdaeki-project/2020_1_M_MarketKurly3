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
			
					<c:forEach items="${list}" var="vo"> <!-- PayInfoVO에서 받아온 정보 : "vo" -->
						
							<div class="list_p">
								<a href="../product/productSelect?p_num=${vo.p_num}" class="thumb_goods">
									<img src="../resources/uploadproduct/${vo.productFileVOs['0'].fileName}">
								</a>
									<div class="info_goods">
										<span class="name"  ><a href="../product/productSelect?p_num=${vo.p_num}" style="color:#333" >${vo.p_name}</a></span>
										<span class="cost">${vo.price}원</span>
									</div>
							</div>
							
					 </c:forEach>
		
		</div>
	</div>
	
	
	</section>


<c:import url="../template/footer.jsp"></c:import>
</body>
</html>