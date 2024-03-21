<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/notice.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />
	
	<!-- content -->
	<div class="noticePage">
		<div class="wrap">
			<section class="noticeTitle">
				<h3>공지사항</h3>
			</section>
			<section class="noticeInfo">
				<table>
					<thead>
						<tr>
							<td>글번호</td>
							<td>카테고리</td>
							<td>글제목</td>
							<td>조회수</td>
							<td>게시일</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="noticeItem">
				<table style="border-collapse: collapse;">
					<tbody>
						<tr>
							<td class="noticeNum">1</td>
							<td class="noticeOption">기획전</td>
							<td class="noticeName"><a href="#">03.17~03.20 돌아온 찹쌀떡 특별전</a></td>
							<td class="noticeCount">10</td>
							<td class="noticeDate">2024-03-22</td>
						</tr>
						<tr>
							<td class="noticeNum">2</td>
							<td class="noticeOption">기획전</td>
							<td class="noticeName"><a href="#">03.17~03.20 돌아온 찹쌀떡 특별전</a></td>
							<td class="noticeCount">10</td>
							<td class="noticeDate">2024-03-22</td>
						</tr>
					</tbody>
				</table>
			<div class="notice_btn">
				<input type="button" id="noticeWrite" name="noticeUpload" value="글쓰기">
			</div>
			</section>
			<section class="noticePaging">
				<div>-- 1 2 3 4 5 6 --</div>
			</section>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
</body>
</html>