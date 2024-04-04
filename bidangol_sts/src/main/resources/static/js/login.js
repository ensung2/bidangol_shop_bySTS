$(document).ready(function() {
	$("#signUp_btn").click(function() {
		var formData = $("form").serialize();

		$.ajax({
			type: "POST",
			url: "/bidangol/signUp/joinUser",
			data: formData,
			beforeSend: reg, // 등록 전 유효성 검사
			success: function(res) {
				/*location.href = "./freeBoardDetail.ino?num=" + data;*/
				alert("회원가입이 완료되었습니다.");
				location.href = "/bidangol/home";
			},
			error: function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	});

	// 회원 가입 정보 유효성검사
	function reg() {
		var id = $("#id").val();
		var email = $("#email").val();
		var password = $("#password").val();
		var password2 = $("#password2").val();
		var name = $("#name").val();
		var postCode = $("#postcode").val();
		var address1 = $("#address1").val();
		var phone = $("#phone").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();

		if (!id) {
			alert("아이디를 입력해 주세요.");
			return false;
		} else if (!/^(?=.*[a-z])(?=.*[\d\W]).{4,15}$/.test(id)) {
			alert("아이디는 영문소문자/숫자, 4~15자여야 합니다.");
			return false;
		}
		if (!email) {
			alert("이메일을 입력해 주세요.");
			return false;
		} else if (!/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/.test(email)) {
			alert("이메일 양식에 맞게 작성해주세요.");
			return false;
		}
		if (!password) {
			alert("비밀번호를 입력해 주세요.");
			return false;
		} else if (!/^(?=.*[a-z])(?=.*[A-Z])(?=.*[\d\W]).{8,15}$/.test(password)) {
			alert("비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합이며, 8자~15자여야 합니다.");
			return false;
		}
		if (!password2) {
			alert("비밀번호를 한번 더 작성해 주세요.");
			return false;
		} else if (password !== password2) {
			alert("비밀번호가 동일하지 않습니다.");
			return false;
		}
		if (!name) {
			alert("이름을 입력해 주세요.");
			return false;
		}
		if (!postCode) {
			alert("주소를 입력해 주세요.");
			return false;
		}
		if (!phone2) {
			alert("휴대전화 중간번호를 입력해주세요.");
			return false;
		}
		if (!phone3) {
			alert("휴대전화 끝번호를 입력해주세요.");
			return false;
		}
		return true;
	};

	// loginBtn click
	$("#sign_in_btn").click(function() {
		var formData = $("form").serialize();
		$.ajax({
			type: "POST",
			url: "/bidangol/login/action",
			data: formData,
			beforeSend: reg,
			success: function() {
				alert("로그인이 완료되었습니다.");
				location.href = "/bidangol/home";
			},
			error: function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
			}
		});
	});

	// 유효성검사
	function reg() {
		var id = $("#id").val();
		var password = $("#password").val();

		if (!id) {
			alert("아이디를 입력해 주세요.");
			return false;
		}
		if (!password) {
			alert("비밀번호를 입력해 주세요.");
			return false;
		}
		return true;
	};
});
