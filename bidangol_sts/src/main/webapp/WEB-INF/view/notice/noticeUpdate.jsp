<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- include summernote css/js -->
<link href="/bidangol/css/summernote/summernote-lite.css" rel="stylesheet">
<script src="/bidangol/js/summernote/summernote-lite.js"></script>
<script src="/bidango/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/bidangol/css/notice.css">
<script src="/bidangol/js/notice.js"></script>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- content -->
	<div class="noticeUpdate">
		<div class="wrap noticeWrap">
			<section class="nuTitle">
				<h3>[관리자] 공지사항 수정</h3>
			</section>
			<section class="nuInfo">
				<form name="modify_form" id="modify_form" method="post">
					<table style="border-collapse: collapse">
						<tbody>
							<tr>
								<th>글번호</th>
								<td><input type="text" name="noticeNum" id="noticeNum" value="<c:out value="${noticeInfo.noticeNum}"/>" readonly="readonly"></td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td><select id="noticeOption" name="noticeOption">
										<option value="01">공지사항</option>
										<option value="02">배송안내</option>
										<option value="03">기획전</option>
								</select></td>
							</tr>
							<tr>
								<th>글제목</th>
								<td><input type="text" name="noticeName" id="noticeName" value="<c:out value="${noticeInfo.noticeName}"/>"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="noticeContent" id="noticeContent"><c:out value="${noticeInfo.noticeContent}"/></textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="write_btn">
						<input type="button" id="noticeDelete" name="noticeDelete" value="삭제">
						<input type="button" id="noticeUpdate" name="noticeUpdate" value="수정">
						<input type="button" id="cancle" name="cancle" value="취소"
						onClick="location.href='/bidangol/notice'">
					</div>
				</form>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
	
	<script>
	$(document).ready(function() {
		 $('#noticeContent').summernote({
			 height:300,
			 placeholder: '공지사항 내용을 작성하세요.',
			 minHeight:300,
			 maxHeight:500,
			 lang: 'ko-KR',
			 toolbar: [
	                // 스타일 관련 기능
	                ['style', ['style']],
	                // 글자 크기 설정
	                ['fontsize', ['fontsize']],
	                // 글꼴 스타일
	                ['font', ['bold', 'underline', 'clear']],
	                // 글자 색상
	                ['color', ['color']],
	                // 테이블 삽입
	                ['table', ['table']],
	                // 문단 스타일
	                ['para', ['paragraph']],
	                // 에디터 높이 설정
	                ['height', ['height']],
	                // 이미지, 링크, 동영상 삽입
	                ['insert', ['picture', 'link', 'video']],
	                // 코드 보기, 전체화면(fullscreen), 도움말
	                ['view', ['codeview', 'help']],
	            ],
		 });
	});
	 
</script>
	
</body>
</html>