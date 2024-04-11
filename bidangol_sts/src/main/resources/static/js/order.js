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
$(document).ready(function(){
	$('#passbook').click(function() {
        $('.passbookInfo').css('display', 'block');
    });
    
    $('#kakaoPay').click(function() {
        $('.passbookInfo').css('display', 'none');
    });
})