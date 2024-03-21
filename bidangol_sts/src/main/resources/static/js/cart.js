$(document).ready(function(){
	$("#allCheck").click(function(){
		if($("#allCheck").is(":checked")) {
			$('input[name=selectCheck]').prop("checked",true);
		}else {
			$('input[name=selectCheck]').prop("checked", false);
		}
	});
	
	$('input[name=selectCheck]').click(function(){
		var total = $('input[name=selectCheck]').length;
		var cnt = $("input[name=selectCheck]:checked").length;
		
		if(total !=cnt){
			$("#allCheck").prop("checked", false);
		}else {
			$("#allCheck").prop("checked", true);
		}
	});
	
	$('#selectDelete').click(function(){
		var cnt = $('input[name=selectCheck]:checked').length;
		
		if(cnt==0){
	 		 alert("삭제할 상품을 선택해 주세요.");
	 		 return;
	 	}
	 	
	 	if(confirm("상품을 삭제하시겠습니까?")) {
			alert("상품이 삭제되었습니다.");
		}return false;
	});

	
/*	$("#selectDelete").click(function(){
	 	var arr = [];
	 	var cnt = $('input[name=selectCheck]:checked').length;
	 	var num = $('input[name=selectCheck]:checked').val();
	 	
	    // 1. 선택값이 없을 때
	 	if(cnt==0){
	 		 alert("선택된 글이 없습니다.");
	 		 return;
	 	}
	 		
	    // 2. 체크박스 값 담기 (배열에 push)
	 	$('input[name=selectCheck]:checked').each(function(){
	 	 	arr.push($(this).val());
	 	 	console.log(arr);
	 	});  
		
	    // 3. 글 삭제
		if(confirm("글을 삭제하시겠습니까?")) {
			$.ajax({
				traditional : true,
				type: "POST",
				url : "/boardDelete.do",
				data : {num:arr},
				success : function() {
					alert("글이 삭제되었습니다.");
					location.replace("/main.do")
					},
				error : function() {
					alert("글 삭제에 실패하였습니다.");
					}
				});
			};
	 });*/
	
})