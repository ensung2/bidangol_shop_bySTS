<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/login.css">
<script type="text/javascript">

</script>
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />


	<!-- contents -->
	<div class="signSuccess">
		<div class="wrap">
			<section class="ssTitle">
				<h3>회원가입이 완료되었습니다.</h3>
				<p>비단골떡방앗간에서 맛있는 떡으로 보답하겠습니다.</p>
			</section>
			<section class="ssInfo">
				<table>
					<tbody>
						<tr>
							<th>▶ 아이디</th>
							<td>asd147852</td>
						</tr>
						<tr>
							<th>▶ 이름</th>
							<td>이은성</td>
						</tr>
					</tbody>
				</table>
			</section>
			<section class="ssBtn">
				<input type="button" id="goMain" name="goMain" onClick="location.href='/bidangol/Index.jsp'" value="메인으로 이동">
				<input type="button" id="goLogin" name="goLogin" onClick="location.href='loginPage.jsp'" value="로그인하기">
			</section>
		</div>
	</div>



	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>