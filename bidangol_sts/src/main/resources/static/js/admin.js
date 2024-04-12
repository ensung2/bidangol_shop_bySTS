$(document).ready(function() {
	$('#itemUpload').on('click',function() {
		/*var formData = $("form").serialize();*/
		var formData = new FormData($('form')[0]);
		if (confirm("상품을 등록하시겠습니까?")) {
		$.ajax({
			type: "POST",
			url: "/bidangol/admin/adminItem/new",
			data: formData,
			processData: false, // FormData 객체를 처리하지 않도록 설정
            contentType: false,
			beforeSend: reg, // 등록 전 유효성 검사
			success: function() {
					alert("상품이 등록되었습니다.");
					location.href = "/bidangol/admin/adminItem";
				},
				error: function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
		};

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
	
	// 관리자페이지 주문상태 수정
        $("#orderUpdate").click(function() {
            $("#order_statusUpdate").attr("action", "/bidangol/admin/orderStatusUpdate").submit();
            alert("주문상태가 수정되었습니다.");
        });
})

$(window).on("load", function() {
		
		// 관리자페이지 상품수정
        $("#itemModify").click(function() {
            // 폼을 서버로 제출
            $("#item_Modiyform").attr("action", "/bidangol/admin/itemModify").submit();
            alert("수정이 완료되었습니다.");
        });
		
		// 관리자페이지 상품삭제
        $("#itemDelete").click(function() {
            $("#item_Modiyform").attr("action", "/bidangol/admin/itemDelete").submit();
            alert("삭제가 완료되었습니다.");
        });
});