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
<h2>관리자 상품 등록</h2>

<form action="./productWrite" id="frm" method="post" enctype="multipart/form-data">
  
  	<div class="form-group">
      <select class="form-control" id="kind" name="kind" >
				  <option value="me" selected="selected">Meat</option>
				  <option value="ve" selected="selected">Vegetable</option>
				  <option value="de" selected="selected">Dessert</option>
  	  </select>
    </div>
  
  	 <div class="form-group">
      <label for="files">Title-Img:</label>
      <input type="file" class="form-control files" id="files" placeholder="타이틀 이미지 선택" name="files" >
    </div>
  
     <div class="form-group">
      <label for="title">Title:</label>
      <input type="text" class="form-control" id="p_name" placeholder="Enter Title" name="p_name" >
    </div>
    
    <div class="form-group">
      <label for="price">Price:</label>
      <input type="text" class="form-control" id="price" placeholder="Enter price" name="price">
    </div>
    
     <div class="form-group">
      <label for="contents">Contents:</label>
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