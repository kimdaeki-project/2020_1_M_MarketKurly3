<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/productAdmin.css">
	<c:import url="../template/boot.jsp"></c:import>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<div class="page_article">

<div id="lnbMenu">
	
				<div class="inner_listgoods">
				 <h1>관리자 페이지
					 <div class="btn">
						<a href="./productWrite" class="btn btn-default">Write</a>
					 </div>
					
				</h1>
				 
				</div>
</div>

<div class="goodsList">
	
			<!-- img list -->	
			<div class="list_goodss">
				
				<input type="checkbox" class="allCheck" name="allCheck" id="allCheck" ><p>전체선택</p>
				<input type="checkbox" name="allCheck" id="allCheck" >
				<button type="button" class="btn_delete" id="btn_delete">선택 삭제</button>
				
				<!-- list 반복 -->
			
			<ul class="list">
				
					<c:forEach items="${list}" var="vo" varStatus="status">
						<input type="hidden" id="${vo.p_num}" class="pn${status.index}">
						<li class="list_li">
							<a href="../product/productAdminSelect?p_num=${vo.p_num}" class="thumb_goods">
							<input type="checkbox" name="checkbox" class="c1" id="ch${status.index}">
								<img src="../resources/uploadproduct/${vo.productFileVOs['0'].fileName}">
							</a>
								<div class="info_goods">
									<span class="name"><a href="../product/productSelect?p_num=${vo.p_num}">${vo.p_name}</a></span>
									<span class="cost">${vo.price}원</span>
								</div>
								<button type="button" class="btn btn_delete" id="btn_del" onclick="btnDel(${vo.p_num});">
								</button>
							</li>
							
					 </c:forEach>
				
			 </ul>
				
			</div> <!-- innerlistgoods end -->	
					
</div>

	
	
						
	<!-- 페이지 이동 -->		
	<div class="page1">
		<ul class="pagination">
			<c:if test="${pager.curBlock gt 1}">
				<li><a href="./productList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}">이전</a></li>
			</c:if>
			<c:forEach begin="${pager.startNum }" end="${pager.lastNum}" var="i">
				<li><a href="./productList?curPage=${i}&kind=${pager.kind}&search=${pager.search}">${i}</a></li>
			</c:forEach>
			<c:if test="${pager.curBlock lt pager.totalBlock}">
				<li><a href="./productList?curPage=${pager.lastNum+1}&kind=${pager.kind}&search=${pager.search}">다음</a> </li>
			</c:if>
		</ul>
	</div>	
	
	
	<script type="text/javascript">
	var allCheck = document.getElementsByClassName("allCheck");
	var c1 = document.getElementsByClassName("c1");
	console.log("c1.length : " + c1.length);
	console.log(allCheck);
	
	function count() {
		var c1 =document.getElementsByClassName("c1");
		console.log("c1.length :" +c1.length);
		//c1 길이
		//check되어있으면 ar에 index 번호 넣어주기
		
		var ar =[];
		for(var i=0;i<c1.length;i++){
			if(c1.checked){
				ar.push(c1);
				console.log("---");
				console.log(ar[i]);
			}
		}
	};
	
	
	
	$(function() {
		/* $(".allchecked").prop("checked",true); */
		
		//allcheck false일 경우 c1 모두 flase
		$(".allCheck").on("click",function(){
			$(".c1").prop("checked",$(this).prop("checked"));
			$("allCheck").prop("checked",$(this).prop("checked"));
			count();
		});
		
		//c1 하나라도 false일 경우 allcheck false
		$(".c1").on("click",function(){
			var result = true;
			
			if(!$(this).prop("checked")){
				result = false;
			}
			
			$(".allCheck").prop("checked",result);
			
			var re = true;
			for(var i=0;i<c1.length;i++){
				if(!c1[i].checked){
					re=false;
					break;
				}
			}
			$(".allCheck").prop("checked",re);
			
			count();
			
		});
	});
	
	//admin delete
	function btnDel(num) {
		$.post("../product/productAdminDelete",{p_num:num},function(data){
			if(data>0){
				loacation.reload();
			}else{
				alert("삭제 실패");
			}
			console.log("here");
			console.log("data : "+data);
		});
	}
	
	//개별 삭제
	$("btn_del").click(function(){
		$.post("../product/productAdminDelete",{p_num:$(".pn").attr("id")},function(data){
			
			console.log("pn data : "+data);
		}
		)
	});
	
	//선택삭제
	$("#btn_delete").click(function() {
		//체크된것 확인 후 이것들을  post로 전송
		var check = "";
		
		for(var i=0;i<c1.length;i++){
			var cid="ch"+i;
			ckid = document.getElementById(cid);
			
			var pn =".pn"+i;
			
			if(ckid.checked){
				var b = $(pn).attr("id")+"-";
				
				check += b;
				console.log("test"+i);
			}
		}
		console.log(check);
		
		//배열 check 보내기
		$.post("../product/selectDelete",{pn:check},function(data){
			console.log(data);
			
			console.log("data : " + data);
			if(data>0){
				location.reload();
			}
			
		
		
		});
		
	});
	</script>
	
	
	
	
	
	
	
	
<c:import url="../template/footer.jsp"></c:import>
</body>
</html>
		
</div>	<!-- page_article end -->	


			
		
		
			
			
			
