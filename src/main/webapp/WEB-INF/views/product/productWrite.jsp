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
<h2 align="center">관리자 상품 등록</h2>
<br>
<form action="./productWrite" id="frm" method="post" enctype="multipart/form-data">
  	
  	<div class="form-group">
  	<label for="files">상단바  종류:</label>
      <select class="form-control" id="bar" name="bar" >
				  <option value="new" selected="selected" >신상품</option>
				  <option value="best" >베스트</option>
				  <option value="save" >알뜰 쇼핑</option>
  	  </select>
    </div> 
  	
  	
  	<div class="form-group">
  	<label for="files">상품 종류:</label>
      <select class="form-control" id="kind" name="kind" >
				  <option value="me" selected="selected" >Meat</option>
				  <option value="ve" >Vegetable</option>
				  <option value="de" >Dessert</option>
  	  </select>
    </div>
  
  	 <div class="form-group">
      <label for="files">타이틀 이미지:</label>
      <input type="file" class="form-control files" id="files" placeholder="타이틀 이미지 선택" name="files" >
    </div>
  
     <div class="form-group">
      <label for="p_name">상품 이름:</label>
      <input type="text" class="form-control" id="p_name" placeholder="Enter Title" name="p_name" >
    </div>
    
    <div class="form-group">
      <label for="price">상품 가격:</label>
      <input type="text" class="form-control" id="price" placeholder="Enter price" name="price">
    </div>
    
     <div class="form-group">
      <label for="contents">상품 상세 내용:</label>
      <textarea rows="20" cols=""  class="form-control" id="contents" placeholder="Enter Contents" name="contents"></textarea>
    </div>
      
   
    <input type="button" id="btn" class="btn btn-default" value="Write">
   
</form>

</div> 
</div>

<script type="text/javascript" src="../resources/js/boardForm.js" >
</script>




<c:import url="../template/footer.jsp"></c:import>
</body>
</html>