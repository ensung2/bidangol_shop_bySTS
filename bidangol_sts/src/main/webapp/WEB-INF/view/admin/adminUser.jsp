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
	<div class="adminUser">
		<div class="wrap">
			<section class="auTitle">
				<h3>회원관리</h3>
			</section>
			<section class="auInfo">
				<table>
					<thead>
						<tr>
							<td>회원번호</td>
							<td>아이디</td>
							<td>이름</td>
							<td>가입일자</td>
						</tr>
					</thead>
				</table>
			</section>
			<section class="auList">
				<table style="border-collapse: collapse;">
					<tbody>
					<c:forEach items="${list}" var="user">
						<tr onclick="location.href='/bidangol/admin/userInfo?id=<c:out value="${user.id}"/>'">
							<td class="num"><c:out value="${user.num}"></c:out></td>
							<td class="id"><c:out value="${user.id}"></c:out></td>
							<td class="name"><c:out value="${user.name}"></c:out></td>
							<td class="signdate"><fmt:formatDate pattern = "yyyy-MM-dd" value="${user.signdate}"/></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</section>
			<section class="adminPaging">
				<div>-- 1 2 3 4 5 6 --</div>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>