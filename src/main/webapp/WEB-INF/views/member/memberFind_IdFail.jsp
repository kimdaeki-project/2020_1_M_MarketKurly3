<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="./css/layout.css">
	<link rel="stylesheet" type="text/css" href="./css/login.css">
	<link rel="stylesheet" type="text/css" href="./css/find.css">
	
    <c:import url="../template/boot.jsp"></c:import>
</head>
<body>

	<c:import url="../template/header.jsp"></c:import>
		

		<section class="login">
			<div class="section_login">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/id_fail.JPG">
						

					<a href="./memberFind_Id" style="color:#5f0080; font-weight: bolder;"><span>아이디 다시 찾기</span></a>
				</div>
			</div>
		</section>
		
		
		<c:import url="../template/footer.jsp"></c:import>


		<script type="text/javascript">
		
		
		</script>

</body>
</html>