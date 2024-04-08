<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<c:choose>
					 <c:when test="${empty list}">
                		<p class="empty">공지사항이 없습니다.</p>
            		</c:when>
            		<c:otherwise>
						<c:forEach items="${list}" var="notice">
						<tr onclick="location.href='/bidangol/notice/noticeId?noticeNum=<c:out value="${notice.noticeNum}"/>'">
							<td class="noticeNum"><c:out value="${notice.noticeNum}"></c:out></td>
							<td class="noticeOption"><c:out value="${notice.noticeOption}"></c:out></td>
							<td class="noticeName"><c:out value="${notice.noticeName}"></c:out></td>
							<td class="noticeCount"><c:out value="${notice.noticeCount}"></c:out></td>
							<td class="noticeDate"><fmt:formatDate pattern = "yyyy-MM-dd" value="${notice.noticeDate}"/></td>
						</tr>
					</c:forEach>
					</c:otherwise>
					</c:choose>
					</tbody>
				</table>
			<div class="notice_btn">
				<input type="button" id="noticeUpload" name="noticeUpload" value="글쓰기"
				onClick="location.href='/bidangol/notice/write'">
			</div>
			</section>
			<section class="noticePaging">
					<ul>
					  <c:if test="${pageMaker.prev}">
					   <li><a href="/bidangol/notice${pageMaker.makeQuery(pageMaker.startPage - 1)}" class="page_prev">이전</a></li>
					  </c:if> 
					  
					  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					   <li><a href="/bidangol/notice${pageMaker.makeQuery(idx)}" class="page_idx">${idx}</a></li>
					  </c:forEach>
					    
					  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					   <li><a href="/bidangol/notice${pageMaker.makeQuery(pageMaker.endPage + 1)}" class="page_next">다음</a></li>
					  </c:if> 
					 </ul>
			</section>
		</div>
	</div>
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />
</body>
</html>