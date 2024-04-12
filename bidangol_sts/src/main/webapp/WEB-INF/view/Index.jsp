<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>비단골떡방앗간 온라인몰</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ka6wkg5omj"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
	$('.slide_img li').last().prependTo('.slide_img');
    $('.slide_img').css('top',-400);
    setInterval(function(){
       $('.slide_img').animate({top:'-='+400},'slow',function(){
           $('.slide_img li') .first().appendTo('.slide_img');
           $('.slide_img').css('top',-400);
       });
    },4000);
});
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- contents -->
	<div class="indexContent">
		<div class="wrap">
			<section class="index01">
				<div class="slide_wrap">
					<ul class="slide_img">
						<li><a href="/bidangol/notice/noticeId?noticeNum=6">
							<img alt="온라인몰 개편이벤트" src="/bidangol/img/slide/slide01.png">
						</a></li>
						<li><a href="/bidangol/category/01">
							<img alt="베스트상품" src="/bidangol/img/slide/slide02.png">
						</a></li>
						<li><a href="/bidangol/notice/noticeId?noticeNum=7">
							<img alt="떡케이크 주문이벤트" src="/bidangol/img/slide/slide03.png">
						</a></li>
					</ul>
				</div>
			</section>
			<section class="index02">
				<div class="indexNotice">
					<div class="indexTitle">
						<i class="fa-solid fa-volume-high"></i> <span>공지사항</span> <input
							type="button" value="전체보기"
							onClick="location.href='/bidangol/notice'">
					</div>

					<table style="border-collapse: collapse;">
						<tbody>
							<c:forEach items="${list}" var="notice" varStatus="loop">
								<c:if test="${loop.index < 7}">
									<tr onclick="location.href='/bidangol/notice/noticeId?noticeNum=<c:out value='${notice.noticeNum}'/>'">
										<td class="noticeNum"><c:out value="${notice.noticeNum}"></c:out></td>
										<td class="noticeOption"><c:out
												value="${notice.noticeOption}"></c:out></td>
										<td class="noticeName"><c:out
												value="${notice.noticeName}"></c:out></td>
										<td class="noticeDate"><fmt:formatDate
												pattern="yyyy-MM-dd" value="${notice.noticeDate}" /></td>
									</tr>
								</c:if>
							</c:forEach>
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
							position : new naver.maps.LatLng(35.035205,
									126.720453),
							map : map
						});
						naver.maps.Event
								.addListener(
										marker,
										'click',
										function(e) {
											var overlay = e.overlay, // marker
											position = overlay.getPosition(), url = 'http://map.naver.com/index.nhn?enc=utf8&level=2&lng='
													+ position.lng()
													+ '&lat='
													+ position.lat()
													+ '&pinTitle=비단골떡방앗간&pinType=SITE';

											window.open(url);
										});
					</script>
				</div>
				<div class="indexInsta">
					<div class="indexTitle">
						<span>@bidangol_shop</span>
					</div>
					<ul>
						<li><a href="https://www.instagram.com/bidangol_shop/" target="_blank"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta" /></a></li>
						<li><a href="https://www.instagram.com/bidangol_shop/" target="_blank"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta" /></a></li>
						<li><a href="https://www.instagram.com/bidangol_shop/" target="_blank"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta" /></a></li>
						<li><a href="https://www.instagram.com/bidangol_shop/" target="_blank"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta" /></a></li>
						<li><a href="https://www.instagram.com/bidangol_shop/" target="_blank"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta" /></a></li>
						<li><a href="https://www.instagram.com/bidangol_shop/" target="_blank"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta" /></a></li>
						<li><a href="https://www.instagram.com/bidangol_shop/" target="_blank"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta" /></a></li>
						<li><a href="https://www.instagram.com/bidangol_shop/" target="_blank"><img
								src="/bidangol/img/instagram/123.jpg" alt="insta" /></a></li>
					</ul>
				</div>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>