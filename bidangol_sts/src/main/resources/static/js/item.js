$(document).ready(function() {
    // 구매 수량 변경 시 총 결제금액 업데이트 함수
    function updateTotalPrice() {
        var itemPrice = parseInt($('#itemPrice').text().replace(/,/g, ''), 10); // 문자열에서 콤마 제거 후 숫자 변환
        var quantity = parseInt($('#itemSize').val(), 10); // 현재 수량 가져오기
        var totalPrice = itemPrice * quantity; // 총 금액 계산
        $('#totalPrice').text("총 결제금액 : " + totalPrice.toLocaleString() + "원"); // 화면에 표시
    }

    // 수량 감소 버튼 클릭 이벤트
    $('.minus').click(function() {
        var quantity = parseInt($('#itemSize').val(), 10) - 1;
        quantity = Math.max(quantity, 1); // 최소 수량 1 제한
        $('#itemSize').val(quantity);
        updateTotalPrice(); // 총 금액 업데이트
    });

    // 수량 증가 버튼 클릭 이벤트
    $('.plus').click(function() {
        var maxQuantity = parseInt($('#itemSize').attr('maxlength'), 10); // 최대 수량 가져오기
        var quantity = parseInt($('#itemSize').val(), 10) + 1;
        if(quantity > maxQuantity) {
            alert("최대 구매수량은 " + maxQuantity + "개 입니다.");
            quantity = maxQuantity; // 최대 수량 제한
        }
        $('#itemSize').val(quantity);
        updateTotalPrice(); // 총 금액 업데이트
    });

    // 페이지 로드 시 총 결제금액 초기화
    updateTotalPrice();
});
