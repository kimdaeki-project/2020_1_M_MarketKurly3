$("#btn").click(function() {
	//데이터 유뮤 확인
	var kind =$("#kind").prop("selected",true); //select종류 분류	//O
	var timg =$("#files").val();
	var p_name =$("#p_name").val();		//O
	var price =$("#price").val();  		//O
	var contents =$("#contents").val(); //O
	
	var ch = true;
	$("#files").each(function() {
		if($(this).val()==""){
			ch=false;
		}
	});
	
	var ch1 = kind !="";
	var ch2 = timg !="";
	var ch3 = p_name != "";
	var ch4 = price !="";
	var ch5 = contents !="";
	
	if(ch1 &&ch2 && ch3 && ch4 && ch5){
		$("#frm").submit();
	}else{
		alert("필수 요소는 모두 입력하세요.");
	}
	
	
	
});