<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="./css/layout.css">
	<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	
	<!-- 출력페이지 -->
	<section class="joinConfirm">
			<div class="content">
				<div class="page_location">
					<a class="link" href="${pageContext.request.contextPath}">홈</a> >
					<strong class="currnet">약관동의</strong>
				</div>
					
				<div class="tit_join">
					<p>약관동의</p>
				</div>
				
				<div class="member_join frm1" >
				<h3>*선택항목에 동의하지 않은 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다.</h3>
					
					<!-- <form id="frm0" name="frmMember0" method="get" action="./memberLogin">   -->
					<div class="frm2">
					
					<div class="border_write1" >
					<h4><input id="d1" type="checkbox"><strong> 전체동의</strong></h4>
					
					<input class="c1" type="checkbox">
					이용약관 (필수)
					</div><br>
					
					<!-- 약관1 -->
					<div class="border_write2">
					<div style="overflow:scroll; width:450px; height:150px; padding:10px; background-color:#f2f2f2;">
						
					총칙<br>
					제1조(목적)<br>
					이 약관은 주식회사 컬리 회사(전자상거래 사업자)가 운영하는 인터넷사이트 마켓컬리(이하 "컬리"라 한다)에서 제공하는 전자상거래 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 컬리와 이용자의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.<br>
					*PC통신, 스마트폰 앱, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 준용합니다.<br>
					<br>
					제2조(정의)<br>
					① "컬리"란 회사가 재화 또는 용역(이하 "재화 등"이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 서비스를 운영하는 사업자의 의미로도 사용합니다.<br>
					② "이용자"란 "컬리"에 접속하여 이 약관에 따라 "컬리"가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>
					③ ‘회원’이라 함은 "컬리"에 회원등록을 한 자로서, 계속적으로 "컬리"가 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>
					④ ‘비회원’이라 함은 회원에 가입하지 않고 "컬리"가 제공하는 서비스를 이용하는 자를 말합니다.<br>
					⑤ "휴면회원"이라 함은 "컬리"의 ‘회원’중 1년 이상 서비스 이용 기록이 없는 자를 말합니다. 휴면 회원은 "컬리"의 정책에 따라 서비스 이용이 제한 될 수 있으며, 다시 서비스를 이용하기 위하여는 거래 안전 등을 위하여 "컬리"가 정하는 본인확인 절차 등을 이행하여야 올바른 ‘회원’의 서비스를 이용할 수 있습니다.<br>
					<br>
					제3조 (약관 등의 명시와 설명 및 개정)<br>
					① "컬리"는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호/모사전송번호/전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 컬리의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>
					② "컬리"는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회/배송책임/환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.<br>
					③ "컬리"는「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>
					④ "컬리"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "컬리"는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.<br>
					⑤ "컬리"가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에 "컬리"에 송신하여 "컬리"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>
					⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.<br>
					회사의 서비스<br>

					</div>
					</div>
					
					<!-- 약관2 --><br>
					<div class="border_write2">
					<input class="c1" type="checkbox">
					개인정보처리방침1 (필수)<br><br>
					<div style="overflow:scroll; width:450px; height:150px; padding:10px; background-color:#f2f2f2;">
					<img src="${pageContext.request.contextPath}/resources/images/personal information.PNG">
					</div>
					</div>
					
					<!-- 약관3 --><br>
					<div class="border_write2">
					<input class="c1" type="checkbox">
					개인정보처리방침2 (필수)<br><br>
					<div style="overflow:scroll; width:450px; height:150px; padding:10px; background-color:#f2f2f2;">
					<img src="${pageContext.request.contextPath}/resources/images/personal information2.PNG">
					</div>
					</div>
					
					<!-- 약관4 --><br>
					<div class="border_write2">
					<input class=" c2" type="checkbox">
					무료배송, 할인쿠폰 등 혜택/정보 수신 (선택)<br><br>
					&emsp;<input class=" c3" type="checkbox">SMS  
					&emsp;&emsp;&emsp;
					<input class=" c3" type="checkbox">이메일
					<img src="${pageContext.request.contextPath}/resources/images/agree sms.PNG" height="35px">
					</div>
					
					<!-- 약관5 --><br>
					<div class="border_write2">
					<input class="c1" type="checkbox"> 본인은 만 14세 이상입니다. (필수)<br>
					</div>
					
					
					<!-- 제출버튼 -->
					<div id="avoidDbl">
						<button type="submit" class="btn_sm b1" id="btn_submit" >다음단계</button><br><br><br>
					</div>
				<!-- </form>   -->
				</div>
				
				</div>
				
			</div>
	</section>
	
	
	
	<!-- 설정값 / 2.jquery로 바꾸기 /1.class 배열-->
	<script type="text/javascript">
		
 	 //전체선택 체크 
  		$("#d1").click(function() {
			
 			$(".c1").prop("checked", $("#d1").prop("checked"));	
 			//$("#chkBox").prop('checked', true) ;
 			//prop 속성값을 가져오거나 추가한다.(checked의 속성값 > true, false) //
		});

 		
  	//부분선택 체크(클릭 이벤트로 감싸기)
		$(".c1").on("click", function() { //each > 배열을 관리할 수 있다.
			var result = true;
		
			$(".c1").each(function() {
				
				if(!$(this).prop("checked")){//get
					
					result=false;
				}
			});
			
			$("#d1").prop("checked", result); 
		
		});  
 	
		 /*-------------------------------------------- */ 	
  	//무료배송, 할인쿠폰 전체선택
  		$(".c2").click(function(){
  			$(".c3").prop("checked", $(".c2").prop("checked"));
  		});
		 
  	//무료배송, 할인쿠폰 부분선택	 
		$(".c3").on("click", function() { //each > 배열을 관리할 수 있다.
			var result = true;
		
			$(".c3").each(function() {
				
				if(!$(this).prop("checked")){//get
					
					result=false;
				}
			});
			
			$(".c2").prop("checked", result); 
		
		});	
		 
		 
  		 /*-------------------------------------------- */ 
		//버튼
		$(".b1").click(function() {
			if($("#d1").prop("checked")){//전체동의
				alert("성공");
				location.href="./memberJoin";
			}else {
				alert("약관에 모두 동의해주세요.");
				
			}
		});
		
		
		
		 /*-------------------------------------------- */ 
		
 	/* 	var d1 = document.getElementById("d1");
		var c1 = document.getElementsByClassName("c1");
		var b1 = document.getElementById("b1");
		
		//전체체크
		d1.addEventListener("click", function() {
			for (i = 0; i < c1.length; i++) {
				c1[i].checked = d1.checked;
			}
		})
		
		
		//부분체크

		for (i = 0; i < c1.length; i++) {
			c1[i].addEventListener("click", function() {
				//전체 검증 결과를 담을 변수
				var result = true; //c1[i]이 모두선택되어있을때 d1이 자동체크

				for (j = 0; j < c1.length; j++) {
					if (!c1[j].checked) {
						result = false;
						break;
					}
				}
				
				d1.checked=result;
			});

		}
		
		//버튼
		b1.addEventListener("click", function(){
			if(d1.checked){
				location.href="./memberJoin";
			}else {
				alert("약관에 모두 동의해주세요.");
			}
		}); 
		 */
	</script> 
	
	
	
	
	<c:import url="../template/footer.jsp"></c:import>
</body>
</html>