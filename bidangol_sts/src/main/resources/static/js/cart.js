$(document).ready(function() {
	$("#allCheck").click(function() {
		if ($("#allCheck").is(":checked")) {
			$('input[name=selectCheck]').prop("checked", true);
		} else {
			$('input[name=selectCheck]').prop("checked", false);
		}
	});

	$('input[name=selectCheck]').click(function() {
		var total = $('input[name=selectCheck]').length;
		var cnt = $("input[name=selectCheck]:checked").length;

		if (total != cnt) {
			$("#allCheck").prop("checked", false);
		} else {
			$("#allCheck").prop("checked", true);
		}
	});

	$('#selectDelete').click(function() {
		var cnt = $("input[name=selectCheck]:checked").length;

		if (cnt == 0) {
			alert("삭제할 상품을 선택해 주세요.");
			return;
		}

		if (confirm("상품을 삭제하시겠습니까?")) {
			var arr = [];
			$('input[name=selectCheck]:checked').each(function() {
				arr.push($(this).attr("data-cartNum"));
				console.log(arr);
			})
			$.ajax({
				type: "POST",
				url: "/bidangol/cart/deleteCart",
				data: { selectCheck: arr }, //
				success: function(result) {
					if (result == 1) {
						alert("상품이 삭제되었습니다.");
						location.replace("/bidangol/cart/cartPage");
					}
				},
				error: function() {
					alert("상품 삭제에 실패하였습니다.");
				}
			});
		}
	});


	$('#selectOrder').click(function() {
		var cnt = $('input[name=selectCheck]:checked').length;

		if (cnt == 0) {
			alert("주문할 상품을 선택해 주세요.");
			return;
		}
	});

	// 장바구니 추가
	$("#inCart").click(function() {
		var itemNum = $("#itemNum").val();
		var cartCount = $("#itemSize").val();

		var data = {
			itemNum: itemNum,
			cartCount: cartCount
		};

		$.ajax({
			type: "post",
			url: "/bidangol/cart/addCart",
			data: data,
			success: function(result) {
				if (result == 1) {
					alert("카트 담기 성공");
					$(".itemNum").val("1");
					location.href = "/bidangol/cart/cartPage";
				} else {
					alert("로그인 후 사용할 수 있습니다.");
					$(".itemNum").val("1");
					location.href = "/bidangol/login";
				}

			},
			error: function(request, status, error) {
				alert("카트 담기 실패" + "\n" + request + "\n" + status + "\n" + error);
			}
		});
	})



})