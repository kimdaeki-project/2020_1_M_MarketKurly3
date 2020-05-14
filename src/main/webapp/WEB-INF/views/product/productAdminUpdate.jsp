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
<h2>관리자 상품 업데이트 </h2>

<form action="./productAdminUpdate" id="frm" method="post" enctype="multipart/form-data">
	<input class="kind12" type="hidden" value="${product.kind}">
	<h3 id="h3">${product.kind}</h3>
 
  	<div class="form-group">
  	<label for="kind">kind:</label>
      <select class="form-control" id="kind" name="kind"  onchange="init()">
				  <option value="me" >Meat</option>
				  <option value="ve" >Vegetable</option>
				  <option value="de" >Dessert</option>
  	  </select>
    </div>
  
  	 <div class="form-group">
      <label for="files">Title-Img:</label>
      <input type="file" class="form-control files" id="files" placeholder="타이틀 이미지 선택" name="files" >
      <c:forEach  items="${product.productFileVOs}" var="fileVO">
      <p>${fileVO.oriName}<i id="${fileVO.fileNum}" class="glyphicon glyphicon-remove remove fileDelete"></i></p>
      </c:forEach>
     
    </div>
  
     <div class="form-group">
      <label for="p_name">Title:</label>
      <input type="text" class="form-control" id="p_name" placeholder="Enter Title" name="p_name" value="${product.p_name}" >
    </div>
    
    <div class="form-group">
      <label for="price">Price:</label>
      <input type="text" class="form-control" id="price" placeholder="Enter price" name="price" value="${product.price}">
    </div>
    
     <div class="form-group">
      <label for="contents">Contents:</label>
      <textarea rows="20" cols=""  class="form-control" id="contents" placeholder="Enter Contents" name="contents" >${product.contents}</textarea>
    </div>
      
   
    <input type="button" id="btn" class="btn btn-default" value="update">
   
</form>

</div> 
</div>

<script type="text/javascript" src="../resources/js/boardForm.js" >
</script>

<script type="text/javascript">


/* var kind = document.getElementsByClassName("kind12").value; */
	var kind = document.getElementById("h3").innerText;
	alert(kind);  /* de */
	
	
	if($("#kind").val()==kind){
		$(this).attr("selected", "selected");
	} 
	
	
	function init(){
		var kind = document.getElementById("h3").innerText;	
		 document.getElementById("kind").innerText="ddd"+kind;
	}
	

		
	
	/* $("#kind").val(kind).attr("selected", "selected"); */



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
					alert("Delete Fail");
				}
			});
		}
	});
	
		
	
	
	
	
		
	

	
	

</script>




<c:import url="../template/footer.jsp"></c:import>
</body>
</html>