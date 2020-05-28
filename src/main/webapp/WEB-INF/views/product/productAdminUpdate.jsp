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
<h2 align="center">관리자 상품 업데이트 </h2>

<form action="./productAdminUpdate" id="frm" method="post" enctype="multipart/form-data">
	<input class="kind12" type="hidden" value="${product.kind}">
	<h5 id="h3" >${product.kind}</h5>
	
	<div id="bb2" class="bb2" style="display:none">${product.bar}</div>
 	
 	
 	<div class="form-group">
  	<label for="bar">상단바:</label>
      <select class="form-control" id="bar" name="bar"  >
				  <option value="new"  >신상품</option>
				  <option value="best" >베스트</option>
				  <option value="save" >알뜰 쇼핑</option>
  	  </select>
    </div>
 	
 	
  	<div class="form-group">
  	<label for="kind">상품 종류:</label>
      <select class="form-control" id="kind" name="kind"  >
				  <option value="me"  >Meat</option>
				  <option value="ve" >Vegetable</option>
				  <option value="de" >Dessert</option>
  	  </select>
    </div>
    
  	<div class="form-group">
     
      <input type="hidden" class="form-control" id="p_num" placeholder="Enter Title" name="p_num" value="${product.p_num}" >
    </div>
  	
  	 <div class="form-group">
      <label for="files">타이틀 이미지:</label>
      <input type="file" class="form-control files" id="files" placeholder="타이틀 이미지 선택" name="files" >
      
      <c:forEach  items="${product.productFileVOs}" var="fileVO">
      	<p>${fileVO.oriName}<i id="${fileVO.fileNum}" class="glyphicon glyphicon-remove remove fileDelete"></i></p>
      	<p>${fileVO.fileNum}</p>
      </c:forEach>
     
    </div>
  
     <div class="form-group">
      <label for="p_name">상품 이름:</label>
      <input type="text" class="form-control" id="p_name" placeholder="Enter Title" name="p_name" value="${product.p_name}" >
    </div>
    
    <div class="form-group">
      <label for="price">상품 가격:</label>
      <input type="text" class="form-control" id="price" placeholder="Enter price" name="price" value="${product.price}">
    </div>
    
     <div class="form-group">
      <label for="contents">상품 상세 내용:</label>
      <textarea rows="20" cols=""  class="form-control" id="contents" placeholder="Enter Contents" name="contents" >${product.contents}</textarea>
    </div>
      
   
    <input type="button" id="btn" class="btn btn-default" value="update">
   
</form>

</div> 
</div>

<script type="text/javascript" src="../resources/js/boardForm.js" >
</script>

<script type="text/javascript">


	
	var kind = $("#h3").text();
	var bar = $("#bb2").text();
	/* console.log($("#bar option[value=best]").val()); */
	
	
	if($("#kind option[value=me]").val()==kind){
		$("#kind option[value=me]").prop("selected",true);
	}else if($("#kind option[value=ve]").val()==kind){
		$("#kind option[value=ve]").prop("selected",true);
	} else {
		$("#kind option[value=de").prop("selected",true);
	} 
	
	
	if($("#bar option[value=new]").val()==bar){
		$("#bar option[value=new]").prop("selected",true);
	}else if($("#bar option[value=best]").val()==bar){
		$("#bar option[value=best]").prop("selected",true);
	} else {
		$("#bar option[value=save]").prop("selected",true);
	} 
	


	count = 1;
	$(".fileDelete").click(function() {
		var check = confirm("정말 삭제하시겠습니까?");
		if(check){
			var s=$(this);
			$.post("../productFile/fileDelete",{fileNum:$(this).attr("id")},function(data){
				
				
				if(data>0){
					s.parent().remove();
					count--;
					alert("Delete Success");
				}else{
					console.log($(this).attr("id"));
					alert("Delete Fail");
				}
			});
		}
	});
	
		
	


</script>




<c:import url="../template/footer.jsp"></c:import>
</body>
</html>