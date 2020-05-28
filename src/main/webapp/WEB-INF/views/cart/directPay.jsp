<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
	<input type="hidden" id="dir" value="${cqn}">
	
	<script type="text/javascript">
	
	
		alert($("#dir").val());
		$.post("../pay/totalInfo",{cqn:$("#dir").val()},function(){
			
		});
	</script>
</body>
</html>