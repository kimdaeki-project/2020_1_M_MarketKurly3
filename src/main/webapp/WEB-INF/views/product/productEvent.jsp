<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/productList.css">
<c:import url="../template/boot.jsp"></c:import>
</head>
<body onclick="getParam();">
	<c:import url="../template/header.jsp"></c:import>


	<div class="page_article">

		<div id="lnbMenu">

			<div class="inner_listgoods">
			
			<img alt="" src="${pageContext.request.contextPath}/resources/images/event1.JPG">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/event2.JPG">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/event3.JPG">
			<img alt="" src="${pageContext.request.contextPath}/resources/images/event4.JPG">
			
			</div>
		</div>
	</div>
	<c:import url="../template/footer.jsp"></c:import>
	
</body>
</html>