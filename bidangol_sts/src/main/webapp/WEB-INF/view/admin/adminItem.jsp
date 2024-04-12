<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />

	<!-- admin menu -->
	<jsp:include page="/WEB-INF/view/include/admin.jsp" />

	<!-- contents -->
	<div class="adminItem">
		<div class="wrap">
			<section class="auTitle">
				<h3>상품관리</h3>
			</section>
			<section class="CheckSearch">
				<div class="CheckSelect">
					<select>
						<option value="01">베스트상품</option>
						<option value="02">찹쌀떡</option>
						<option value="03">멥쌀떡</option>
						<option value="04">떡케이크</option>
					</select>
				</div>
				<div class="searchItem">
					<input type="text" id="itemSearch" name="itemSearch"> <input
						type="button" id="search" name="search" value="조회">
				</div>
			</section>
			<section class="auInfo">
				<table>
					<thead>
						<tr>
							<td>상품번호</td>
							<td>카테고리</td>
							<td>상품명</td>
							<td>판매가</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="auList">
			<input type="hidden" name="itemNum" id="itenNum" value="<c:out value="${items.itemNum}"/>">
				<table style="border-collapse: collapse;">
					<tbody>
					<c:choose>
					 <c:when test="${empty list}">
                		<p class="empty">현재 상품이 없습니다.</p>
            		</c:when>
            		<c:otherwise>
						<c:forEach items="${list}" var="items">
							<tr onclick="location.href='/bidangol/admin/itemInfo?itemNum=<c:out value="${items.itemNum}"/>'">
								<td class="itemNo"><c:out value="${items.itemNo}"></c:out></td>
								<td class="itemCategory"><c:out value="${items.itemCategory}"></c:out></td>
								<td class="itemName"><c:out value="${items.itemName}"></c:out></td>
								<td class="itemPrice"><fmt:formatNumber value="${items.itemPrice}" pattern="###,###" />원</td>
							</tr>
						</c:forEach>
						</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				<div class="itemInfo_btn">
					<input type="button" id="noticeUpload" name="noticeUpload"
						value="상품추가"
						onClick="location.href='/bidangol/admin/adminItem/itemAdd'">
				</div>
			</section>
			<section class="adminPaging">
				<ul>
					  <c:if test="${pageMaker.prev}">
					   <li><a href="/bidangol/admin/adminItem${pageMaker.makeQuery(pageMaker.startPage - 1)}" class="page_prev">이전</a></li>
					  </c:if> 
					  
					  <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					   <li><a href="/bidangol/admin/adminItem${pageMaker.makeQuery(idx)}" class="page_idx">${idx}</a></li>
					  </c:forEach>
					    
					  <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					   <li><a href="/bidangol/admin/adminItem${pageMaker.makeQuery(pageMaker.endPage + 1)}" class="page_next">다음</a></li>
					  </c:if> 
				</ul>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>