<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<h3>회원상세정보</h3>
			</section>
			<section class="userInfo">
					<table style="border-collapse: collapse; margin: 0 auto; width: 500px">
						<tbody>
							<tr>
								<th>아이디</th>
								<td><c:out value="${userInfo.id}"/></td>
							</tr>
							<tr style="color:#FF984F; font-weight:600">
								<th>등급</th>
								<td>회원</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><c:out value="${userInfo.email}"/></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><c:out value="${userInfo.name}"/></td>
							</tr>
							<tr>
								<th>주소</th>
								<td style="padding: 5px 0">
									<span><c:out value="${userInfo.postcode}"/></span>
									<span><c:out value="${userInfo.address1}"/></span><br>
									<span><c:out value="${userInfo.address2}"/></span></td>
							</tr>
							<tr>
								<th>휴대전화</th>
								<td><c:out value="${userInfo.phone}"/>-<c:out value="${userInfo.phone2}"/>-<c:out value="${userInfo.phone3}"/></td>
							</tr>
							<tr>
								<th>가입일</th>
								<td><fmt:formatDate pattern = "yyyy-MM-dd" value="${userInfo.signdate}"/></td>
							</tr>
						</tbody>
					</table>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>