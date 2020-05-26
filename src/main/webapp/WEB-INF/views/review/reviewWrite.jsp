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
<h2 align="center">후기 등록</h2>
<br>
<form action="./reviewWrite" id="frm" method="post" enctype="multipart/form-data">
  	


  

  
     <div class="form-group">
      <label for="p_name">구매한 상품:</label>
      <input type="text" class="form-control" id="p_name" placeholder="Enter Title" name="p_name" value="${review.p_name}" readonly="readonly">
    </div>
    
    <div class="form-group">
      <label for="files">후기 이미지:</label>
      <input type="file" class="form-control files" id="files" placeholder="타이틀 이미지 선택" name="files" >
    </div>
    
     <div class="form-group">
      <label for="title">제목:</label>
      <input type="text" class="form-control" id="title" placeholder="Enter Title" name="title" value="">
    </div>
    
     <div class="form-group">
      <label for="title">작성자:</label>
      <input type="text" class="form-control" id="writer" placeholder="Enter Title" name="id" value="${review.id}" readonly="readonly">
    </div>
    
 
     <div class="form-group">
      <label for="contents">후기 내용:</label>
      <textarea rows="20" cols=""  class="form-control" id="contents" placeholder="Enter Contents" name="contents"></textarea>
    </div>
      
	<input type="hidden" class="form-control" id="p_num" placeholder="Enter Title" name="p_num" value="${review.p_num}">
   
    <input type="button" id="btn" class="btn btn-default" value="Write">
   
</form>

</div> 
</div>

<script type="text/javascript" src="../resources/js/boardForm.js" >
</script>




<c:import url="../template/footer.jsp"></c:import>
</body>
</html>