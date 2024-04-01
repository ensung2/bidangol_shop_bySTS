<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/bidangol/css/notice.css">
<script type="text/javascript">
</script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- content -->
	<div class="noticeWrite">
		<div class="wrap">
			<section class="writeTitle">
				<h3>공지사항</h3>
			</section>
			<section class="writeInfo">
					<table style="border-collapse: collapse">
						<tbody>
							<tr>
								<th>글번호</th>
								<td><c:out value="${noticeInfo.noticeNum}"/></td>
							</tr>
 							<tr>
								<th>카테고리</th>
								<td><c:out value="${noticeInfo.noticeOption}"/></td>
							</tr>
							<tr>
								<th>글제목</th>
								<td><c:out value="${noticeInfo.noticeName}"/></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><spring:escapeBody>${noticeInfo.noticeContent}</spring:escapeBody></td>
							</tr>
						</tbody>
					</table>
					<!-- 관리자 로그인 -->
					<div class="write_btn">
						<input type="button" id="noticeCancle" name="noticeCancle" value="리스트로"
						onClick="location.href='/bidangol/notice'">
						<input type="button" id="noticeWrite" name="noticeWrite" value="공지수정"
						onClick="location.href='/bidangol/notice/noticeUpdate?noticeNum=<c:out value="${noticeInfo.noticeNum}"/>'">
					</div>
					<!-- 고객 로그인시-->
<!-- 					<div class="write_btn">
						<input type="button" id="noticeCancle" name="noticeCancle" value="리스트로"
						onClick="location.href='/bidangol/notice'">
					</div> -->
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	
</body>
</html>