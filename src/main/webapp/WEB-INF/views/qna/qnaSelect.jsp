<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/qnaSelect.css">
	<c:import url="../template/boot.jsp"></c:import>
	<c:import url="../template/summer.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="container"> 
<h2 align="center">문의 사항</h2>

<input type="text" name="p_num" value="${product.p_num}"> 

	<div class="panel panel-default">
		<div class="panel-heading"><strong>제목</strong></div>
		<div class="panel-body"> ${vo.title }</div>
		<div class="panel-heading"><strong>작성자</strong></div> 
		<div class="panel-body">${vo.writer }</div>
		<div class="panel-heading"><strong>문의 내용</strong> </div> 
		<div class="panel-body"> ${vo.contents } </div> 
	</div>


	<div class="btn">
	
		<c:if test="${member.id eq 'admin'}">
			<a href="./qnaReply?num=${vo.num}&p_num=${product.p_num}" class="btn btn-default">답변달기</a>
			<!-- <a href="./qnaReply" class="btn btn-default">답변달기</a> -->
		</c:if>
		
	</div>
</div>




<c:import url="../template/footer.jsp"></c:import>
</body>
</html>