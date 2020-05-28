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
		
	<form action="./memberFind_Pw_Final" method="post">
		<section class="login">
			<div class="section_login">
				<h3 class="tit_login"><strong>비밀번호 찾기</strong></h3>
				<div class="write_form">
					
						<span style="font-size: small; font-weight: bold;">새비밀번호 등록</span><input type="text" name="newPw" placeholder="새비밀번호를 입력해주세요" value="" id="newPw">						
						<div style="font-size: 12px; ">최소 6글자 이상 입력 바랍니다.</div><br>
						<span style="font-size: small; font-weight: bold;">새비밀번호 확인</span><input type="text" name="newPw2" placeholder="새비밀번호를 한번 더 입력해주세요" value="" id="newPw2">						
						<input type="hidden" name="email" value="${email}">
						
					<button type="submit" style="margin-top: 20px;" id="ddd"><span>확인</span></button>
				</div>
			</div>
		</section>
	</form>
		
		<c:import url="../template/footer.jsp"></c:import>


		<script type="text/javascript">
			$("#ddd").click(function(e) {
				
				if($("#newPw").val().length>=6){
					
					if($("#newPw").val()==$("#newPw2").val()){
						alert("비밀번호가 변경되었습니다.");
					}else{
						alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
						e.preventDefault();
					}
					
				}else{
					alert("비밀번호를 6글자 이상입력해 주세요.");
					e.preventDefault();
				}
				

			});
		</script>

</body>
</html>