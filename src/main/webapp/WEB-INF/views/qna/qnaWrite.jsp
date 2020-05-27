<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productWrite.css">
	<c:import url="../template/boot.jsp"></c:import>
	<c:import url="../template/summer.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>


<div class="container">

<div class="container_inner">
<h2 align="center">문의하기</h2>
<br>
<form action="./qnaWrite" id="frm" method="post" enctype="multipart/form-data">
  	
  	<input  type="hidden" name="p_num" value="${product.p_num }">
  	
     <div class="form-group">
      <label for="title">제목:</label>
      <input type="text" class="form-control" id="title" placeholder="Enter Title" name="title" >
    </div>
    
    <div class="form-group">
      <label for="writer">작성자:</label>
      <input type="text" class="form-control" id="writer" value="${member.id}" name="writer" readonly="readonly"> 
    </div>
    
     <div class="form-group">
      <label for="contents">문의 내용:</label>
      <textarea rows="20" cols=""  class="form-control" id="contents" placeholder="Enter Contents" name="contents"></textarea>
    </div>
      
   
    <input type="button" id="btn"  class="btn btn-default btnW " value="등록" style="float: right"  >
   
</form>

</div> 
</div>

<script type="text/javascript" src="../resources/js/boardForm.js" >
</script>




<c:import url="../template/footer.jsp"></c:import>
</body>
</html>