<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
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
				<h3>멥쌀떡</h3>
				<p>가래떡, 꿀떡, 백설기 등 한끼 식사로도 가볍게 섭취할 수 있는 떡을 만나보세요</p>
			</section>
			<section class="cgItem">
				<div class="itemInfo">
					<div class="itemCount">총 <c:out value="${totalCount}"/>개</div>
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
					<input type="hidden" name="itemNum" id="itenNum" value="<c:out value="${tteok02.itemNum}"/>">
				<table style="border-collapse: collapse;">
					<tbody>
					<c:choose>
					 <c:when test="${empty list}">
                		<p class="empty">상품이 없습니다.</p>
            		</c:when>
            		<c:otherwise>
						<c:forEach items="${list}" var="tteok02">
						<c:if test="${loop.index % 4 == 0}">
                        	<tr>
                    	</c:if>
								<td onclick="location.href='/bidangol/category/03/itemDetail?itemNum=<c:out value="${tteok02.itemNum}"/>'">
									<div class="itemImgWrap">
										<img src="http://localhost:8088/bidangol/resources/${tteok02.itemImg}" class="itemImg"/>
									</div>
									<div class="itemText">
										<span class="itemName"><c:out value="${tteok02.itemName}"/></span><br>
										<span class="itemPrice"><fmt:formatNumber value="${tteok02.itemPrice}" pattern="###,###" />원</span>
									</div>
								</td>
						<c:if test="${loop.index % 4 == 3 or loop.last}">
                        	</tr>
                    	</c:if>
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