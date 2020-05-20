<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="../resources/css/layout.css">
	<link rel="stylesheet" type="text/css" href="../resources/css/join.css">
	
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
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			document.form.roadFullAddr.value = roadFullAddr;
			document.form.addrDetail.value = addrDetail;
			document.form.jibunAddr.value = jibunAddr;
	}
	</script>



</head>
<body>
<!-- 경로 : member/memberJoin이 기준 -->
	<c:import url="../template/header.jsp"></c:import>
			
		<section class="join">
			<div class="content">
			
				<div class="page_location">
					<a class="link" href="${pageContext.request.contextPath}">홈</a> >
					<a class="link" href="${pageContext.request.contextPath}/member/memberJoinConfirm">약관동의</a> >
					<strong class="currnet">회원가입</strong>
				</div>
				
				<div class="tit_join">
					<p>회원가입</p>
				</div>
				
				<div class="member_join">
					<h3>*필수입력사항</h3>
					
					<form id="form" name="form" method="post" action="./memberJoin">
						
						<div class="border_write">
							<table class="tbl_comm">
								<tr>
									<td class="memberCols1 br">아이디*</td>
									<td class="memberCols2">
										<input type="text" name="id" label="아이디"
										placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" id="mId" class="ch">
										
										&emsp;<a href="javascipt:void(0);" onclick="overlap_id(); return false;" id="test"><span class="bns_button">중복확인</span></a>
										<p id="s1"></p>
										<p id="s1_1"></p>
									</td>
								</tr>
								<tr>
									<td class="memberCols1 br">비밀번호*</td>
									<td class="memberCols2">
										<input type="password" name="pw" label="비밀번호"
										placeholder="비밀번호를 입력해주세요" id="mPw"  class="ch">
										<p id="s2"></p>
									</td>
								</tr>
								<tr>
									<td class="memberCols1 br">비밀번호확인*</td>
									<td class="memberCols2">
										<input type="password" label="비밀번호체크"
										placeholder="비밀번호를 한번 더 입력해주세요" id="mPw2">
										<p id="s3"></p>
									</td>
								</tr>
								<tr>
									<td class="memberCols1 br">이름*</td>
									<td class="memberCols2">
										<input type="text" name="name" label="이름"
										placeholder="고객님의 이름을 입력해주세요" class="ch" id="mName">
										<p id="s4"></p>
									</td>
								</tr>
								<tr>
									<td class="memberCols1 br">이메일*</td>
									<td class="memberCols2">
										<input type="text" name="email" label="이메일"
										placeholder="예: marketkurly@kurly.com" class="ch br2" id="mEmail">
										
										&emsp;<a href="javascipt:void(0);" onclick="email_injeung(); return false;"><span class="bns_button disabled">인증번호받기</span></a>
										<p id="s5"></p>
										<p id="s5_0"></p>
										<input type="text" name="emailNum" label="인증번호"
										placeholder="인증번호 입력란" class="br2" id="mEmailNum">
										
										&emsp;<a href="javascipt:void(0);" onclick="email_hwagin(); return false;"><span class="bns_button2 disabled">인증번호 확인</span></a>
										<p id="s5_1"></p>
										
									</td>
								</tr>
								<tr class="mobile">
									<td class="memberCols1">휴대폰*</td>
									<td class="memberCols2">
										<input type="text" name="phone" label="휴대폰" id="mPhone"
										placeholder="ex. 010-0000-0000 (숫자만 입력)" class="ch">
									</td>
								</tr>
								<p id="s6"></p>
								<tr class="add">
									<td class="memberCols1">배송주소*</td>
									
									<td class="memberCols2">
										<a href="javascipt:void(0);" onclick="goPopup(); return false;">
											<span class="bns_button br2">
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
					<td><input type="text" style="width: 400px;" id="jibunAddr" class="br2 ch"
						name="jibunAddr" readonly="readonly"/></td>
				</tr>
				
				<tr>
					<td><input type="text" style="width: 400px;" id="addrDetail" class="br2"
						name="addrDetail" readonly="readonly"/></td>
				</tr>

			</table>
		</div>
										<p class="text_guide">
											<span>배송가능 여부를 확인할 수 있습니다.</span>
										</p>
										<p id="s7"></p>
									</td>
									
								</tr>
								<tr class="select_sex">
									<td class="memberCols1 br">성별</td>
									<td class="memberCols2">
										<div class="group_radio" id="mSex" >	
											<label class="label_radio">
												<input type="radio" name="sex" label="성별" value="man" class="sex">
												<span class="text_position">남자</span>
											</label>
											<label class="label_radio">
												<input type="radio" name="sex" label="성별" value="woman" class="sex">
												<span class="text_position">여자</span>
											</label>
											<label class="label_radio">
												<input type="radio" name="sex" label="성별" value="nochoice" class="sex" checked="checked">
												<span class="text_position">선택안함</span>
											</label>
				
										</div>
										<p id="s8"></p>
									</td>
								</tr>
								<br>
								<tr class="birth">
									<td class="memberCols1 br">생년월일</td>
									<td class="memberCols2">
										<div class="birthday" id="mBir">	
										<!-- birth_year/birth_mon/birth_day의 value값 post로 넘기기 -->
											<input type="text" name="birth_year" id="birth_year" size="4" maxlength="4" placeholder="YYYY">
											<span class="bar">/</span>
											<input type="text" name="birth_mon" id="birth_mon" size="2" maxlength="2" placeholder="MM">
											<span class="bar">/</span>
											<input type="text" name="birth_day" id="birth_day" size="2" maxlength="2" placeholder="DD">
											
										</div>
										<p id="s9"></p>
									</td>
								</tr>
								
<!-- 								<tr class="route">
									<td class="memberCols1">추가입력 사항</td>
									<td class="memberCols2">
										<div class="group_radio">	
											<label class="label_radio">
												<input type="radio" name="recommendId" label="추천인아이디">
												<span class="text_position">추천인 아이디</span>
											</label>
											<label class="label_radio">
												<input type="radio" name="eventName" label="참여 이벤트명">
												<span class="text_position">참여 이벤트명</span>
											</label>
										</div>
									
									</td>
								</tr> -->
								
							</table>
						</div>
						
					<div id="avoidDbl">
						<input type="submit" class="btn_sm" id="btn_submit" value="가입하기">
						<br><br><br>
					</div>
					</form>
				
				</div>
				
			</div>
		</section>


<!-- 도로명 주소 검색  -->
<!-- 	<form name="form" id="form" method="post">

		<div id="callBackDiv">id 없애거나 변경가능
			<table>
				<tr>
					<td>도로명주소 전체(포멧)</td>
					<td><input type="hidden" style="width: 300px;" id="roadFullAddr"
						name="roadFullAddr" /></td>
				</tr>
				
				<tr>
					<td>지번</td>
					<td><input type="text" style="width: 300px;" id="jibunAddr"
						name="jibunAddr" /></td>
				</tr>
				
				<tr>
					<td>고객입력 상세주소</td>
					<td><input type="text" style="width: 300px;" id="addrDetail"
						name="addrDetail" /></td>
				</tr>

			</table>
		</div>

	</form> -->


	<c:import url="../template/footer.jsp"></c:import>
		

		
		<script type="text/javascript">
			var mId = document.getElementById("mId");
			var mPw = document.getElementById("mPw"); 
			var mPw2 = document.getElementById("mPw2"); 
			var mName = document.getElementById("mName"); 
			var mEmail = document.getElementById("mEmail"); 
			var mPhone = document.getElementById("mPhone"); 
			
		
			var ch = document.getElementsByClassName("ch");
			var s1 = document.getElementById("s1");	//아이디
			var s1_1 = document.getElementById("s1_1");	//아이디
			var s2 = document.getElementById("s2");	//비번
			var s3 = document.getElementById("s3");	//비번2
			var s4 = document.getElementById("s4");	//이름
			var s5 = document.getElementById("s5");	//이메일
			var s5_0 = document.getElementById("s5_0");	//이메일
			var s5_1 = document.getElementById("s5_1");	//인증번호 확인
			var s6 = document.getElementById("s6");	//폰
			var s7 = document.getElementById("s7");	//주소
			var s8 = document.getElementById("s8");	//성별
			var s9 = document.getElementById("s9");	//생년
			

			var frm = document.getElementById("frm");
			
			
			/* ...................중복확인 시작........................ */
			/* 버튼형 아이디 중복확인 */
			var mIdResult=false;
			function overlap_id() {
				
				if(mId.value.length<6){
				//6글자가 넘지않는경우(alert)	
					alert("6자이상 입력해주세요.")
					
				}else{
				
					$.ajax({
				     type:"POST",
				     url:"./checkId",
				     data:{
				            id:$('#mId').val()
				     },
				     success:function(data){
				    	 data=data.trim();//공백이 들어있을 수 있기때문에 trim 해준다.
				    	 
							if(data==1){//한글은 깨질수있기때문에 숫자가 영어로 넘겨준다.
								//사용가능한경우(alert, 사용가능한 아이디입니다.(innerHTML))	
								alert("사용가능한 아이디입니다.")
								s1_1.innerHTML="사용가능한 아이디입니다.";
								s1_1.style.color="skyblue";
								mIdResult=true;
							}else{
								//중복되는경우(alert, 이미 등록된 아이디입니다.(innerHTML))
								alert("이미 등록된 아이디입니다.")
								s1_1.innerHTML="이미 등록된 아이디입니다.";
								s1_1.style.color="red";	
							}
				   	 },
					 error:function(){
							alert("에러발생");
					 }
					})
				
				
				}	

			}
			
			/* 이메일 인증메일 보내기 */
			function email_injeung() {
				$.ajax({
				     type:"POST",
				     url:"./injeungEmail.do",
				     data:{
				          email:$('#mEmail').val()
				     },
				     success:function(data){
				    	 alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');
				     },
					 error:function(){
							alert("에러발생");
					 }				     
				})
				
			}
				
			/* 인증번호 확인 */
			function email_hwagin() {
				$.ajax({
				     type:"POST", 
				     url:"./hwaginEmail.do${dice}",
				     data:{
				            emailNum:$('#mEmailNum').val()
				     },
				     success:function(data){
				    	 
				     },
					 error:function(){
							alert("에러발생");
					 }	
				})
			}
			
			


			/* 버튼형 이메일 중복확인 */
		/* 	
 			function overlap_email() {
				var regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

				if(regEmail.test(mEmail.value)){//test > true, false //진행순서를 잘 보아야한다.
					//중복되는 경우
					
					//사용가능한 경우
					
					$.ajax({
				     type:"POST",
				     url:"./checkEmail",
				     data:{
				            email:$('#mEmail').val()
				     },
				     success:function(data){
				    	 data=data.trim();//공백이 들어있을 수 있기때문에 trim 해준다.
				    	 
							if(data==1){//한글은 깨질수있기때문에 숫자가 영어로 넘겨준다.
								//사용가능한경우
								alert("사용가능한 이메일 입니다.")
								s5.innerHTML="사용가능한 이메일 입니다.";
								s5.style.color="skyblue";	
							}else{
								//중복되는경우
								alert("이미 등록된 이메일입니다. 다시 작성하여 주세요.")
								s5.innerHTML="이미 등록된 이메일입니다.";
								s5.style.color="red";	
							}
				   	 },
					 error:function(){
							alert("에러발생");
					 }
					})

				}else{
				//email 잘못된 이메일 형식인 경우
					alert("올바른 이메일 형식이 아닙니다.")
					s5.innerHTML="올바른 이메일 형식이 아닙니다.";
					s5.style.color="red";	
				}
			}  */
			
			/* ......................중복확인 끝........................ */
			
			/* innerhtml 아이디 중복확인 */
			
			mId.addEventListener("keyup",function(){
				//s1.innerHTML="6글자 이상 입력하세요";
				if(mId.value.length>=6){
					s1.innerHTML="6자 이상 입력하였습니다.";
					s1.style.color="skyblue";
					
				}else{
					s1.innerHTML="6자 이상 입력하세요.";
					s1.style.color="RED";
					
				}
			});
			
			mId.addEventListener("blur",function(){
				if(mId.value==""){
					s1.innerHTML = "필수 정보입니다."
					s1.style.color="RED";
				}
			});
			
			
			/* innerhtml 이메일 중복확인 */
			var mEmailResult=false;
			mEmail.addEventListener("keyup",function(){
				var regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;

				if(regEmail.test(mEmail.value)){//test > true, false //진행순서를 잘 보아야한다.
					//중복되는 경우
					
					//사용가능한 경우
					
					$.ajax({
				     type:"POST",
				     url:"./checkEmail",
				     data:{
				            email:$('#mEmail').val()
				     },
				     success:function(data){
				    	 data=data.trim();//공백이 들어있을 수 있기때문에 trim 해준다.
				    	 
							if(data==1){//한글은 깨질수있기때문에 숫자가 영어로 넘겨준다.
								//사용가능한경우
								s5.innerHTML="사용가능한 이메일 입니다.";
								s5.style.color="skyblue";	
								mEmailResult=true;
							}else{
								//중복되는경우
								s5.innerHTML="이미 등록된 이메일입니다.";
								s5.style.color="red";	
								mEmailResult=false;
							}
				   	 },
					 error:function(){
							alert("에러발생");
					 }
					})

				}else{
				//email 잘못된 이메일 형식인 경우
					s5.innerHTML="올바른 이메일 형식이 아닙니다.";
					s5.style.color="red";	mEmailResult=false;
				}
			});
			
			
			/* innerhtml 비밀번호 확인 */
			var mPwResult=false;
			
			mPw.addEventListener("change",function(){//비밀번호의 값이 변경되었을 때
				//alert("음음") 	//질문 : 첫번째 입력하고 나갔을 때.. 떠도 상관 없음!
				mPw2.value="";
				mPwResult=false;	//
				s3.innerHTML="비밀번호가 일치하지 않습니다.";
				s3.style.color="RED";
				s3.setAttribute("class","fail");
			});
			
			mPw.addEventListener("blur",function(){
				if(mPw.value.length>=6){
					s2.innerHTML="사용 가능한 비밀번호입니다.";
					s2.style.color="skyblue";
					mPwResult=true;
				}else if(mPw.value.length<6 && mPw.value.length>=1){
					s2.innerHTML="비밀번호를 6글자 이상 다시 입력해주세요.";
					s2.style.color="RED";
					mPwResult=false;
				}else if(mPw.value==""){
					s2.innerHTML = "필수 정보입니다."
					s2.style.color="RED";
					mPw2.value="";
					//s3.innerHTML = "비밀번호가 일치하지 않습니다.";
				}
			 
			});
			
			
			/* innerhtml 2차비밀번호 확인 */
			var mPw2Result=false;
			mPw2.addEventListener("blur",function(){
				if(mPw2.value==mPw.value && mPw2.value.length>=1){
					s3.innerHTML="비밀번호가 일치합니다.";
					s3.style.color="skyblue";
					s3.setAttribute("class","success");
					mPw2Result=true;
				}else if(mPw2.value!=mPw.value){
					s3.innerHTML="비밀번호가 일치하지 않습니다.";
					s3.style.color="RED";
					mPw2.value="";
					s3.setAttribute("class","fail");
					mPw2Result=false;
				}else if(mPw2.value==""){
					s3.innerHTML = "필수 정보입니다."
					s3.style.color="RED";
				}
			});
			
			
			
			
			/* 이름 */
			mName.addEventListener("blur",function(){
				if(mName.value==""){
					s4.innerHTML = "필수 정보입니다."
					s4.style.color="RED";
				}else{
					s4.innerHTML = ""
				}
			});
			
			/* 이메일 */
			mEmail.addEventListener("blur",function(){
				if(mEmail.value==""){
					s5_0.innerHTML = "필수 정보입니다."
					s5_0.style.color="RED";
				}else{
					s5_0.innerHTML = ""
				}
			});
			
			/* 폰 */
 			mPhone.addEventListener("blur",function(){
				if(mPhone.value==""){
					s6.innerHTML = "필수 정보입니다.";
					s6.style.color="RED";
				}else{
					s6.innerHTML = ""
				}
			}); 
			
			
	/* -------------------------------------------------------------*/
		var sex = document.getElementsByClassName("sex");
 		
			for(i=0; i<sex.length; i++){
				if(sex[i].value==null){
				sex[i].value=="";
			}
		} 

		
		
	
			/* 가입전 필수정보 입력확인 */
			//넘어가기 전에 확인하려면 input타입의 submit을 button으로 바꿔서 실행해본다
		var btn_submit = document.getElementById("btn_submit");
	
		var check=true;
		btn_submit.addEventListener("click",function(e){

				for(i=0; i<ch.length; i++){
					if(ch[i].value==""/*==0*/){
						check=false;
						console.log("브레이크");
						break;
					}
				}
			
				//if가 true일때만 실행
				if(mIdResult && mPwResult && mPw2Result && check){
					console.log("가입성공");
				}else{
					alert("중복확인 및 필수요소들을 입력해주세요");
					e.preventDefault();//form안의 전송 막기
					console.log(mIdResult);
					console.log(mPwResult);
					console.log(mPw2Result);
					console.log(check);

					
					if(mIdResult==false){
						s1_1.innerHTML = "아이디 중복확인을 눌러주세요";
						s1_1.style.color="RED";
						
					}
				}
				
			
			}); 
			
			
/* 			$("#test").click(function() {
				
			}); */
			
		
		</script>

</body>
</html>