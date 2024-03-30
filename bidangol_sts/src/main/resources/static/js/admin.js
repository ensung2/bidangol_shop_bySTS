$(document).ready(function() {
	$('#itemUpload').on('click',function() {
		var formData = $("form").serialize();
/*		
		// 옵션값은 텍스트로 보내주기
		var formData = {
			
		}*/
		$.ajax({
			type: "POST",
			url: "/bidangol/admin/adminItem/new",
			data: formData,
			beforeSend: reg, // 등록 전 유효성 검사
			success: function() {
				/*location.href = "./freeBoardDetail.ino?num=" + data;*/
				if (confirm("상품을 등록하시겠습니까?")) {
					alert("상품이 등록되었습니다.");
					location.href = "/bidangol/admin/adminItem";
				}},
				error: function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
		});
	});

	//  유효성검사
	function reg() {
		var name = $("#itemName").val();
		var info = $("#itemInfo").val();
		var meterial = $("#itemMeterial").val();
		var usedate = $("#itemUsedate").val();
		var price = $("#itemPrice").val();

		if (!name) {
			alert("상품명을 입력해주세요.");
			return false;
		}
		if (!info) {
			alert("상품정보를 작성해주세요.");
			return false;
		}
		if (!meterial) {
			alert("상품재료를 작성해주세요.");
			return false;
		}
		if (!usedate) {
			alert("상품 소비기한을 작성해주세요.");
			return false;
		}
		if (!price) {
			alert("상품가를 작성해주세요.");
			return false;
		}
		return true;
	};
})