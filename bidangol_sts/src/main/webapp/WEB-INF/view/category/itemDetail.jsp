<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/itemDetail.css">
<script type="text/javascript">
	function handleOnChange(e) {
		  // 선택된 데이터의 텍스트값 가져오기
		  const text = e.options[e.selectedIndex].text;
		  const value = e.value;

		  // 선택한 텍스트 출력
		  document.getElementById('result').innerText
		    = text;
		  
		  document.getElementById('detailPrice').innerText=value;
	}
	
/* 	 function handleOnChange(selectElement) {
		// 선택된 옵션 값 가져오기
        var selectedOption = selectElement.options[selectElement.selectedIndex];
        var optionValue = selectedOption.value;
        var optionText = selectedOption.text;

        // 상세 정보 업데이트
        var detailList = document.getElementById("detailList");

        // 새로운 항목 추가
        var newItemHTML = "<div>" + optionText + optionValue + "</div>";

        // detailList에 새로운 항목 추가
        detailList.insertAdjacentHTML('beforeend', newItemHTML);
    }  */
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- content -->
	<div class="detailPage">
		<div class="wrap">
			<section class="detailImg">
				<div class="imgWrap">
					<img alt="상세이미지" src="/bidangol/img/instagram/123.jpg">
				</div>
			</section>
			<section class="detailInfo">
				<div class="detailTitle">
					<h3>콩고물인절미</h3>
					<p>고소한 콩고물이 듬뿍 묻어있어 고소하고 한 입에 쏙! 쫄깃쫄깃한 콩고물 인절미</p>
					<ul style="margin-left: 15px;">
						<li>원재료명 및 함량 : 인절미[찹쌀 99%(국산), 천일염], 콩고물[대두 84.7%(중국산), 설탕
							8%, 천일염]</li>
						<li>소비기한 : 상온 1일 또는 냉동 보관 시 3개월 이내 섭취</li>
					</ul>
				</div>
				<div class="detailOrder">
					<table style="border-collapse: collapse;">
						<tbody>
							<tr>
								<th class="itemPrice">판매가</th>
								<td><b>{dto.itemPrice}원</b></td>
							</tr>
							<tr>
								<th class="itemOption">사이즈</th>
								<td>
									<select id="itemSize" name="itemSize" onchange="handleOnChange(this)">
										<option value="15000원">콩고물 인절미-소 (기본, 1kg)</option>
										<option value="25000원">콩고물 인절미-중 (+ 10,000원, 2kg)</option>
										<option value="35000원">콩고물 인절미-대 (+ 20,000원, 3kg)</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="delivery">배송비</th>
								<td><b>무료</b></td>
							</tr>
						</tbody>
					</table>
					<div class="detailList" id="detailList">
						<div id="result"></div>
						<div id="detailPrice"></div>
					</div>
					
				</div>
				<div class="detailTotal">
						<div>총 결제금액 : <span>{item.total}</span>원</div>
					</div>
				<div class="detail_btn">
					<input type="button" id="inCart" name="inCart" value="장바구니에 담기" onClick="location.href='/bidangol/cart'">
					<input type="button" id="goOrder" name="goOrder" value="바로구매">
				</div>

			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>