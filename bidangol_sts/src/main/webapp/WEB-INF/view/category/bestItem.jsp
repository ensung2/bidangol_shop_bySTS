<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/category.css">
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />


	<!-- contents -->
	<div class="category">
		<div class="wrap">
			<section class="cgTitle">
				<h3>베스트상품</h3>
				<p>비단골떡집에서만 맛볼 수 있는 맛.도.리 인기떡을 확인해보세요</p>
			</section>
			<section class="cgItem">
				<div class="itemInfo">
					<div class="totalCount">총 ${totalCount}개</div>
					<div class="itemArray">
						<ul>
							<li><a href="#">신상품</a></li>
							<li>│</li>
							<li><a href="#">조회순</a></li>
							<li>│</li>
							<li><a href="#">낮은가격순</a></li>
						</ul>
					</div>
				</div>
				<div class="itemList">
				<input type="hidden" name="itemNum" id="itenNum" value="<c:out value="${bestItem.itemNum}"/>">
				<table style="border-collapse: collapse;">
					<tbody>
					<c:choose>
					 <c:when test="${empty list}">
                		<p class="empty">상품이 없습니다.</p>
            		</c:when>
            		<c:otherwise>
						<c:forEach items="${list}" var="bestItem">
								<td onclick="location.href='/bidangol/category/01/itemDetail?itemNum=<c:out value="${bestItem.itemNum}"/>'">
									<img src="http://localhost:8088/bidangol/resources/${bestItem.itemImg}" class="itemImg"/>
									<div class="itemText">
										<span class="itemName"><c:out value="${bestItem.itemName}"/></span><br>
										<span class="itemPrice"><c:out value="${bestItem.itemPrice}"/>원</span>
									</div>
								</td>
						</c:forEach>
					</c:otherwise>
					</c:choose>
					</tbody>
				</table>
				</div>
			</section>
		</div>
	</div>




	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>