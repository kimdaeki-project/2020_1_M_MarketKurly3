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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
	<style type="text/css">
		.container	{
			height:1000px;
			
		}
		
		.container_inner	{
			height:700px;
		}
		
		
		.sweet-alert	{
			margin:0;
			position:relative;
			top:100px;
			left:331px;
		}
		
		.sweet-alert button	{
			background: #5f0080;
		}
		
		
	</style>
	
</head>
<body>
<c:import url="../template/header.jsp"></c:import>


<div class="container">

<div class="container_inner">
<h2 align="center">후기 등록</h2>
<br>







<div class="sweet-alert showSweetAlert visible" data-custom-class="" data-has-cancel-button="false" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="false" data-animation="pop" data-timer="null" style="display: block; margin-top: -169px;"><div class="sa-icon sa-error" style="display: none;">
      <span class="sa-x-mark">
        <span class="sa-line sa-left"></span>
        <span class="sa-line sa-right"></span>
      </span>
    </div><div class="sa-icon sa-warning" style="display: none;">
      <span class="sa-body"></span>
      <span class="sa-dot"></span>
    </div><div class="sa-icon sa-info" style="display: none;"></div><div class="sa-icon sa-success animate" style="display: block;">
      <span class="sa-line sa-tip animateSuccessTip"></span>
      <span class="sa-line sa-long animateSuccessLong"></span>

      <div class="sa-placeholder"></div>
      <div class="sa-fix"></div>
    </div><div class="sa-icon sa-custom" style="display: none;"></div><h2>Congratulations!</h2>
    <p style="display: block;">후기 등록이 완료되었습니다.</p>
    <fieldset>
      <input type="text" tabindex="3" placeholder="">
      <div class="sa-input-error"></div>
    </fieldset><div class="sa-error-container">
      <div class="icon">!</div>
      <p>Not valid!</p>
    </div><div class="sa-button-container">
      <button class="cancel" tabindex="2" style="display: none; box-shadow: none;">Cancel</button>
      <div class="sa-confirm-button-container">
        <button class="confirm" tabindex="1" style="display: inline-block; background-color: #5f0080; 
        box-shadow: rgba(140, 212, 245, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.05) 0px 0px 0px 1px inset;"
        onClick="location.href='../'">메인 화면으로</button>
      	<button class="confirm" tabindex="1" style="display: inline-block; background-color: #5f0080; 
      	box-shadow: rgba(140, 212, 245, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.05) 0px 0px 0px 1px inset;"
      	onClick="location.href='../product/productSelect?p_num='+${p_num}">확인하러 가기</button>
      </div>
    </div></div>

</div> 
</div>

<script type="text/javascript">

	

	



</script>




<c:import url="../template/footer.jsp"></c:import>
</body>
</html>