function checkPost() {
	new daum.Postcode({
		oncomplete: function(data) {
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수

			if (data.userSelectedType === 'R') { // 도로명 주소 선택
				addr = data.roadAddress;
			} else { // 지번 주소 선택
				addr = data.jibunAddress;
			}

			// 도로명 주소일 경우 참고항목 조합
			if (data.userSelectedType === 'R') {
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraAddr += data.bname;
				}
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				if (extraAddr !== '') {
					extraAddr = ' (' + extraAddr + ')';
				}
			}

			// 우편번호 필드 ID 수정 (주의: ID 일관성 확인 필요)
			document.getElementById('postcode').value = data.zonecode;

			// 기본 주소 설정
			document.getElementById("address1").value = addr;
			// 참고항목이 있을 경우 나머지 주소에 추가, 없으면 나머지 주소 초기화
			document.getElementById("address2").value = extraAddr;

			// 상세주소로 포커스 이동
			document.getElementById("address2").focus();
		}
	}).open();
}

/* 회원탈퇴 팝업창 open, close*/
function openPopup() {
	var popup = document.getElementById("userDelete");
	if (popup) {
		popup.style.display = "block";
	}
};

function closePopup() {
	var popup = document.getElementById("userDelete");
	if (popup) {
		popup.style.display = "none";
	}
};


$(document).ready(function() {
	
	// 회원정보 수정
	$("#updateUser").click(function(event) {
		event.preventDefault(); // 기본 제출 동작을 막음

		// 비밀번호 입력란 값 확인
		var currentPassword = $("#password").val();

		$.ajax({
			type: "POST",
			url: "/bidangol/myPage/checkPassword",
			data: { password: currentPassword },
			success: function(response) {
				// 비밀번호가 일치하는 경우
				if (response.success) {
					// 비밀번호 일치 시 서버로 폼 제출
					$("#user_form").attr("action", "/bidangol/myPage/modifyUser");
					$("#user_form").submit();
					alert("회원 정보 수정이 완료되었습니다.");
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			}
		});
	});
	
	// 회원 탈퇴(삭제)
	$("#deleteEnd").click(function() {
		var deletePassword = $("#deletePw").val(); // 입력된 비밀번호 가져오기

		// AJAX를 이용하여 비밀번호 일치 여부 확인
		$.ajax({
			type: "POST",
			url: "/bidangol/myPage/checkPassword",
			data: { password: deletePassword },
			success: function(response) {
				if (response.success) {
					// 비밀번호가 일치하면 회원 탈퇴 진행
					deleteUser();
				} else {
					alert("비밀번호가 일치하지 않습니다.");
				}
			}
		});
	});

	// 회원 탈퇴 함수
	function deleteUser() {
		$.ajax({
			type: "POST",
			url: "/bidangol/myPage/deleteUser",
			success: function(response) {
				alert("회원 탈퇴가 완료되었습니다.");
				window.location.href = "/bidangol/login";
			}
		});
	}


});


/*// 비밀번호 확인 입력란 값 변경 시 호출되는 함수
   $("#password2").on("input", function() {
	   var password = $(this).val(); // 비밀번호 확인 입력란 값 가져오기
	   var errorMessageElement = $("#passwordErrorMessage"); // 오류 메시지를 표시할 span 요소

	   // 비밀번호와 비밀번호 확인이 일치하지 않을 경우 오류 메시지 표시
	   if (password1 !== password2) {
		   errorMessageElement.text("비밀번호가 일치하지 않습니다.");
	   } else {
		   errorMessageElement.text(""); // 일치할 경우 오류 메시지 지우기
	   }
   });*/