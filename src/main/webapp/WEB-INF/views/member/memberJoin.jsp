<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="./css/layout.css">
	<link rel="stylesheet" type="text/css" href="./css/join.css">
	
    <c:import url="../template/boot.jsp"></c:import>
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
					
					<form id="frm" name="frmMember" method="post" action="./join_2.html">
						
						<div class="border_write">
							<table class="tbl_comm">
								<tr>
									<td class="memberCols1">아이디*</td>
									<td class="memberCols2">
										<input type="text" name="m_id" label="아이디"
										placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합" id="mId">
										
										&emsp;<a href="javascipt:void(0);" onclick="overlap_id(); return false;"><span class="bns_button">중복확인</span></a>
										<p id="s1"></p>
										<p id="s1_1"></p>
									</td>
								</tr>
								<tr>
									<td class="memberCols1">비밀번호*</td>
									<td class="memberCols2">
										<input type="password" name="m_pw" label="비밀번호"
										placeholder="비밀번호를 입력해주세요" id="mPw">
										<p id="s2"></p>
									</td>
								</tr>
								<tr>
									<td class="memberCols1">비밀번호확인*</td>
									<td class="memberCols2">
										<input type="password" name="m_pw_c" label="비밀번호체크"
										placeholder="비밀번호를 한번 더 입력해주세요" id="mPw2">
										<p id="s3"></p>
									</td>
								</tr>
								<tr>
									<td class="memberCols1">이름*</td>
									<td class="memberCols2">
										<input type="text" name="m_name" label="이름"
										placeholder="고객님의 이름을 입력해주세요" class="ch" id="mName">
										<p id="s4"></p>
									</td>
								</tr>
								<tr>
									<td class="memberCols1">이메일*</td>
									<td class="memberCols2">
										<input type="text" name="m_email" label="이메일"
										placeholder="예: marketkurly@kurly.com" class="ch" id="mEmail">
										&emsp;<a href="#"><span class="bns_button">이메일 중복확인</span></a>
										<p id="s5"></p>
									</td>
								</tr>
								<tr class="mobile">
									<td class="memberCols1">휴대폰*</td>
									<td class="memberCols2">
										<input type="text" name="m_phone" label="휴대폰"
										placeholder="숫자만 입력해주세요" class="ch">
										&emsp;<a href="#"><span class="bns_button disabled">인증번호받기</span></a>
						
										<input type="text" name="m_phone_c" label="휴대폰인증" id="mPhone">
										&emsp;<a href="javascipt:void(0);" onclick="overlap_email(); return false;"><span class="bns_button disabled">인증번호확인</span></a>
										<p id="s6"></p>
									</td>
								</tr>
								<tr class="add">
									<td class="memberCols1">배송주소</td>
									<td class="memberCols2">
					
										<a href="#">
											<span class="bns_button">
												<span class="ico"></span>
												<span class="txt">주소 검색</span>
											</span>
										</a>
										<p class="text_guide">
											<span>배송가능 여부를 확인할 수 있습니다.</span>
										</p>
										<p id="s7"></p>
									</td>
								</tr>
								<tr class="select_sex">
									<td class="memberCols1">성별</td>
									<td class="memberCols2">
										<div class="group_radio" id="mSex">	
											<label class="label_radio">
												<input type="radio" name="sex_option" label="성별" value="man">
												<span class="text_position">남자</span>
											</label>
											<label class="label_radio">
												<input type="radio" name="sex_option" label="성별" value="woman">
												<span class="text_position">여자</span>
											</label>
											<label class="label_radio">
												<input type="radio" name="sex_option" label="성별" value="nochoice">
												<span class="text_position">선택안함</span>
											</label>
				
										</div>
										<p id="s8"></p>
									</td>
								</tr>
								<br>
								<tr class="birth">
									<td class="memberCols1">생년월일</td>
									<td class="memberCols2">
										<div class="birthday" id="mBir">	
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
						<input type="submit" class="btn_sm" id="btn_submit" value="가입하기"><br><br><br>
					</div>
					</form>
				
				</div>
				
			</div>
		</section>

		
		<c:import url="../template/footer.jsp"></c:import>
		
		<script type="text/javascript">
			
		</script>
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
			var s6 = document.getElementById("s6");	//폰
			var s7 = document.getElementById("s7");	//주소
			var s8 = document.getElementById("s8");	//성별
			var s9 = document.getElementById("s9");	//생년
			
			var btn_submit = document.getElementById("btn_submit"); //가입버튼
			
			
			var frm = document.getElementById("frm");
			
			
			/* ...................중복확인........................ */
			
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
			
			function overlap_email() {
				
				//email 잘못된 이메일 형식인 경우
				
				//중복되는 경우
				
				//사용가능한 경우
				
				
			}
			
			/* .............................................. */
			
			var mIdResult=false;
			mId.addEventListener("keyup",function(){
				//s1.innerHTML="6글자 이상 입력하세요";
				if(mId.value.length>=6){
					s1.innerHTML="6자 이상 입력하였습니다.";
					s1.style.color="skyblue";
					mIdResult=true;
				}else{
					s1.innerHTML="6자 이상 입력하세요.";
					s1.style.color="RED";
					mIdResult=false;
				}
			});
			
			mId.addEventListener("blur",function(){
				if(mId.value==""){
					s1.innerHTML = "필수 정보입니다."
				}
			});
			
			
			
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
					s2.innerHTML="비밀번호를 다시 입력해주세요.";
					s2.style.color="RED";
					mPwResult=false;
				}else if(mPw.value==""){
					s2.innerHTML = "필수 정보입니다."
					s2.style.color="RED";
					mPw2.value="";
					//s3.innerHTML = "비밀번호가 일치하지 않습니다.";
				}
			 
			});
			
			
			
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
			
			
			
			
			
			mName.addEventListener("blur",function(){
				if(mName.value==""){
					s4.innerHTML = "필수 정보입니다."
					s4.style.color="RED";
				}else{
					s4.innerHTML = ""
				}
			});
			mEmail.addEventListener("blur",function(){
				if(mEmail.value==""){
					s5.innerHTML = "필수 정보입니다."
					s5.style.color="RED";
				}else{
					s5.innerHTML = ""
				}
			});
			mPhone.addEventListener("blur",function(){
				if(mPhone.value==""){
					s6.innerHTML = "필수 정보입니다."
					s6.style.color="RED";
				}else{
					s6.innerHTML = ""
				}
			});
			
			
			var ch = document.getElementsByClassName("ch");
			
			btn_submit.addEventListener("click",function(e){

				var check=true;
				for(i=0; i<ch.length; i++){
					if(ch[i].value==""/*==0*/){
						check=false;
						break;
					}
				}
				if((mIdResult && mPwResult && mPw2Result && check)==false){
			  //if(!(t1Result && t2Result && t3Result && check)){  //false
					alert("필수요소들을 입력해주세요")
			  		//t1.focus();
					e.preventDefault();
				}else{
					alert("성공")
				}
				
			},false);
			
			
			
		
		</script>

</body>
</html>