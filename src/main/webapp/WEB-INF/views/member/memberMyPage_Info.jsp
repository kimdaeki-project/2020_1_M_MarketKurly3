<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  <!-- c:~ 사용 -->
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="../resources/css/mypage.css">
<link rel="stylesheet" type="text/css" href="../resources/css/mypage_info.css">
<c:import url="../template/boot.jsp"></c:import>

	 <!-- jusoPopup 스크립트 (도로명주소)-->   
	    <script language="javascript">
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";
	
	function goPopup(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("./jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}
	
	
	function jusoCallBack(roadFullAddr,addrDetail,jibunAddr){
		
		console.log(roadFullAddr);
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadFullAddr.value = roadFullAddr;
			document.form.addrDetail.value = addrDetail;
			document.form.jibunAddr.value = jibunAddr; /* document의 form태그의 name이 'form'인 input의 name이 'jibunAddr'인 value의 값 */
	}
	</script>



</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<section class="mypage">
	
<!-- top -->

	<div class="mypage_top">
		<div class="user"><span class=glad>일반</span> &ensp; <input style="text" class="name" value="${sessionScope.member.name}" readonly="readonly"> 님~ 방문을 환영합니다!</div>
	</div> 
	
	
<!-- contents -->	
	<div class="mypage_contents2">
			<span style="font-size:30px; font-weight:500;" >회원 정보</span>
			<br><br>
			
				<span style="font-size:20px; font-weight:500;" >&ensp;기본 정보</span>
				<br><br>
				
				<!-- line1 시작 -->
		<form id="form" name="form" method="post" action="./memberUpdate"><!-- 여기서 action은 controller주소를 뜻한다. -->
				
				<div class="line1">
				<!-- controller login파트에서 session.setAttribute("member", memberVO);으로 설정하였으므로 member=memberVO가 되고, -->
				<!-- ${sessionScope.member.id}는 session의 memberVO에서 id라는 정보를 찾는다는 의미이다. -->
				
					<table>
						<tr>
							<td class="msubject">아이디*</td>
							<td class="mcontent">
								<input type="text" name="id" label="아이디"
										value="${sessionScope.member.id}" id="mmId" readonly="readonly"> <span style="color:gray;">&ensp;※ID는 변경불가</span>
							</td>
						</tr>
						
						<tr>
							<td class="msubject">현재 비밀번호</td>
							<td class="mcontent">
								<input type="text" label="현재 비밀번호" id="mmPw">
								<input type="hidden" value="${sessionScope.member.pw}" id="mmPw1">
							</td>
						</tr>
						
						<tr>
							<td class="msubject">새 비밀번호</td>
							<td class="mcontent">
								<input type="text" name="pw" label="새 비밀번호" id="mmPw2">
							</td>
						</tr>
						
						<tr>
							<td class="msubject">비밀번호 확인</td>
							<td class="mcontent">
								<input type="text" label="비밀번호 확인" id="mmPw3">
							</td>
						</tr>
						
						<tr>
							<td class="msubject">이름*</td>
							<td class="mcontent">
								<input type="text" name="name" label="이름"
										value="${sessionScope.member.id}" id="mmName"> 
							</td>
						</tr>
												
						<tr>
							<td class="msubject">이메일*</td>
							<td class="mcontent">
								<input type="text" name="email" label="이메일"
										value="${sessionScope.member.email}" id="mmEmail"> 
							</td>
						</tr>
												
						<tr>
							<td class="msubject">휴대폰*</td>
							<td class="mcontent">
								<input type="text" name="phone" label="휴대폰"
										value="${sessionScope.member.phone}" id="mmPhone"> 
							</td>
						</tr>

						<tr>
							<td class="msubject">배송주소</td>
							<td class="mcontent2">
	 							<a href="javascipt:void(0);" onclick="goPopup(); return false;">
											<span class="bns_button br2" style="margin-top: 15px;">
												<span class="ico"></span>
												<span class="txt">주소 검색</span>
											</span>
										</a>
<!-- 도로명 주소 검색 / jusoPopup설정:form의 id, name이 form인 경우 -->

		<div id="callBackDiv">
			<table>
				<tr><!-- DB로 넘어가는 정보 -->
					<td><input type="hidden" style="width: 400px;" id="roadFullAddr"
						name="roadFullAddr" /></td>
				</tr>
				
				<tr><!-- 보이는 정보 -->
					<td><input type="text" style="width: 400px;" id="jibunAddr" class="ch"
						name="jibunAddr" readonly="readonly"/></td>
				</tr>
				
				<tr>
					<td><input type="text" style="width: 400px;" id="addrDetail" 
						name="addrDetail" readonly="readonly"/></td>
				</tr>

			</table>
		</div>
							</td>
						</tr>						
					
					</table>
				
	
			</div>
			
			<!-- line1 끝 -->	
			
				<br><br>
				
			<!-- line2 시작 -->
				
				<span style="font-size:20px; font-weight:500;" >&ensp;추가 정보</span>
				<br><br>
				<div class="line2">
					<table>
						<tr>
							<td class="msubject">성별</td>
							<td class="mcontent3">
							
							<input type="hidden" id="sex" value="${member.sex}"><!--1단계. DB에서 값 가지고 오기 -->
							
							
										<div class="group_radio" id="mSex" >	
											<label class="label_radio">
												<input type="radio" name="sex" label="성별" value="man" class="sex" >
												<span class="text_position">남자</span>
											</label>
											<label class="label_radio">
												<input type="radio" name="sex" label="성별" value="woman" class="sex">
												<span class="text_position">여자</span>
											</label>
											<label class="label_radio">
												<input type="radio" name="sex" label="성별" value="nochoice" class="sex">
												<span class="text_position">선택안함</span>
											</label>
				
										</div>
							</td>
						</tr>
						
						<tr>
							<td class="msubject">생년월일</td>
							<td class="mcontent3"><br>
							
							<input type="hidden" id="birth" value="${member.birth}">
							
								<div class="birthday" id="mBir">	
									<!-- birth_year/birth_mon/birth_day의 value값 post로 넘기기 -->
										<input type="text" name="birth_year" id="birth_year" size="4" maxlength="4" placeholder="YYYY">
										<span class="bar">/</span>
										<input type="text" name="birth_mon" id="birth_mon" size="2" maxlength="2" placeholder="MM">
										<span class="bar">/</span>
										<input type="text" name="birth_day" id="birth_day" size="2" maxlength="2" placeholder="DD">
														
								</div>
							</td>
						</tr>
						
					</table>
				</div>

				<!-- line2 끝 -->
				
				
				<br><br>
				
				
				<!-- line3 시작 / DB만들어야함...귀찮-->
<!-- 				
				<span style="font-size:20px; font-weight:500;" >&ensp;이용약관 동의</span>
				<br><br>
				<div class="line3">
					ddd
				</div>
 -->
				<!-- line3 끝 -->
				
		<!-- 수정, 삭제 버튼 시작-->
			<div class="line4">
			<input type="button" class="btn_delete" id="btn_delete" value="탈퇴하기">
			<input type="submit" class="btn_update" id="btn_update" value="회원정보 수정">
			</div>
		</form>			
		<!-- 수정, 삭제 버튼 끝-->	
	</div>
</section>

<c:import url="../template/footer.jsp"></c:import>
	
	
	<script type="text/javascript">
		//sex
		
		var sex =  $("#sex").val(); /*2단계. script에 db정보받기*/
		console.log(sex);
		
		//라디오버튼전체> #mSex
		if($("#mSex input[value=man]").val()==sex){ /* 3단계. 해당 라디오 버튼의 밸류값과 DB의 값이 같다면 DB밸류값과 같은 밸류의 라디오 버튼에 checked한다. */
			$("#mSex input[value=man]").prop("checked",true); // prop > 적용한다. (java의 '=' 와 같은 의미)
		}else if($("#mSex input[value=woman]").val()==sex){
			$("#mSex input[value=woman]").prop("checked",true);
		} else {
			$("#mSex input[value=nochoice]").prop("checked",true);
		} 
		
		
		//birth
		
		var birth = $("#birth").val();
		console.log(birth);
		console.log(birth.substring(0,4));

		$("#birth_year").prop("value",birth.substring(0,4));
		$("#birth_mon").prop("value",birth.substring(4,6));
		$("#birth_day").prop("value",birth.substring(6,8));

		

		
		//update (id:btn_update > $("#btn_update"))
		//넘어가기 전에 확인하려면 input타입의 submit을 button으로 바꿔서 실행해본다

		var check=true;

		$("#btn_update").click(function(e){ //버튼을 클릭했을때
			
			//mmPw:현재 비밀번호 , mmPw1:DB에서 불러온 비밀번호 , mmPw2:새 비밀번호 , mmPw3:비밀번호 확인 
			
			if($("#mmPw").val()==""){ // mmPw값을 입력하지않았을 경우
				
				if(($("#mmPw2").val()=="")&&($("#mmPw3").val()=="")){ //mmPw2와 mmPw3가 ""일 경우
					alert("정보가 수정되었습니다.");
				}else{
					alert("현재 비밀번호를 정확히 입력해 주세요.");
					e.preventDefault();
				}

				
			}else if($("#mmPw").val()==$("#mmPw1").val()){ //mmPw와 mmPw1값과 일치하는 경우 
			
					if($("#mmPw2").val()==$("#mmPw3").val() && !($("#mmPw2").val()=="")){ //mmPw2와 mmPw3 값이 같고 둘다 null값이 아닐때
							
							if($("#mmPw2").val().length>=6){ //mmPw2가 6글자 이상인 경우
								
								if(!($("#mmPw").val()==$("#mmPw2").val())){ //현재비밀번호와 새비밀번호가 다를때
									alert("정보가 수정되었습니다.");
								}else{
									alert("현재 비밀번호와 다르게 입력해 주세요.")
									e.preventDefault();
								}
								
							}else{
								alert("비밀번호를 6자이상 입력해주세요.")
								e.preventDefault();
							}
							
					}else{
						alert("새 비밀번호를 확인해 주세요.");
						e.preventDefault();
				}
				
				
			}else{ //mmPw값을 정확히 입력하지 않았다면
				
				alert("현재 비밀번호를 정확히 입력해 주세요.");
				e.preventDefault();
			}
	
			
		}); 
		
	</script>
	

</body>
</html>