<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="../resources/css/find.css">
	
    <c:import url="../template/boot.jsp"></c:import>
</head>
<body>

	<c:import url="../template/header.jsp"></c:import>
		

		<section class="login">
			<div class="section_login">
				<img alt="" src="${pageContext.request.contextPath}/resources/images/id_success.JPG">
						<div style="font-weight: bolder; font-size: large;  text-align: center;">아이디 : ${id}</div>
						<br>
					<a href="./memberLogin" id="find">로그인 하기</a>
				</div>
			</div>
		</section>
		
		
		<c:import url="../template/footer.jsp"></c:import>


		<script type="text/javascript">
		
		
		</script>

</body>
</html>