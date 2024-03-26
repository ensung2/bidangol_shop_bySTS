<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비단골떡방앗간 온라인몰</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ka6wkg5omj"></script>

</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- contents -->
	<div class="indexContent">
		<div class="wrap">
			<section class="index01"></section>
			<section class="index02">
				<div class="indexNotice">
					<div class="indexTitle">
						<i class="fa-solid fa-volume-high"></i> <span>공지사항</span> <input
							type="button" value="전체보기"
							onClick="location.href='/bidangol/notice'">
					</div>
					<table style="border-collapse: collapse;">
					<tbody>
						<tr onclick="location.href='/bidangol/notice/noticeId'">
							<td class="noticeNum">1</td>
							<td class="noticeOption">기획전</td>
							<td class="noticeName">03.17~03.20...</td>
							<td class="noticeDate">2024-03-22</td>
						</tr>
						<tr onclick="location.href='/bidangol/notice/noticeId'">
							<td class="noticeNum">1</td>
							<td class="noticeOption">기획전</td>
							<td class="noticeName">03.17~03.20...</td>
							<td class="noticeDate">2024-03-22</td>
						</tr>
						<tr onclick="location.href='/bidangol/notice/noticeId'">
							<td class="noticeNum">1</td>
							<td class="noticeOption">기획전</td>
							<td class="noticeName">03.17~03.20...</td>
							<td class="noticeDate">2024-03-22</td>
						</tr>
						<tr onclick="location.href='/bidangol/notice/noticeId'">
							<td class="noticeNum">1</td>
							<td class="noticeOption">기획전</td>
							<td class="noticeName">03.17~03.20...</td>
							<td class="noticeDate">2024-03-22</td>
						</tr>
						<tr onclick="location.href='/bidangol/notice/noticeId'">
							<td class="noticeNum">1</td>
							<td class="noticeOption">기획전</td>
							<td class="noticeName">03.17~03.20...</td>
							<td class="noticeDate">2024-03-22</td>
						</tr>
						<tr onclick="location.href='/bidangol/notice/noticeId'">
							<td class="noticeNum">1</td>
							<td class="noticeOption">기획전</td>
							<td class="noticeName">03.17~03.20...</td>
							<td class="noticeDate">2024-03-22</td>
						</tr>
						<tr onclick="location.href='/bidangol/notice/noticeId'">
							<td class="noticeNum">1</td>
							<td class="noticeOption">기획전</td>
							<td class="noticeName">03.17~03.20...</td>
							<td class="noticeDate">2024-03-22</td>
						</tr>
					</tbody>
				</table>
				</div>
				<div class="indexMap">
					<div class="indexTitle">
						<i class="fa-solid fa-location-dot"></i> <span>오시는길</span>
					</div>
					<div id="map" style="width: 100%; height: 198px"></div>
					<script>
						var mapOptions = {
							center : new naver.maps.LatLng(35.035205,
									126.720453),
							zoom : 17
						};

						var map = new naver.maps.Map('map', mapOptions);
						var marker = new naver.maps.Marker({
						    position: new naver.maps.LatLng(35.035205,
									126.720453),
						    map: map
						  });
						naver.maps.Event.addListener(marker, 'click', function(e) {
							   var overlay = e.overlay, // marker
							        position = overlay.getPosition(),
							        url = 'http://map.naver.com/index.nhn?enc=utf8&level=2&lng='+ position.lng() +'&lat='+ position.lat() +'&pinTitle=비단골떡방앗간&pinType=SITE';

							    window.open(url);
							});
					</script>
				</div>
				<div class="indexInsta">
					<div class="indexTitle">
						<span>@bidangol_shop</span>
					</div>
					<ul>
						<li><a href="#"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta"/></a></li>
						<li><a href="#"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta"/></a></li>
						<li><a href="#"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta"/></a></li>
						<li><a href="#"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta"/></a></li>
						<li><a href="#"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta"/></a></li>
						<li><a href="#"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta"/></a></li>
						<li><a href="#"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta"/></a></li>
						<li><a href="#"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta"/></a></li>
					</ul>
				</div>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>