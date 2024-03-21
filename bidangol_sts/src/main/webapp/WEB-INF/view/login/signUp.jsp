<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/login.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
/* 우편주소 검색 */
function checkPost() {
	console.log("우편번호")
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("address1").value = extraAddr;
                
                } else {
                    document.getElementById("address2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("address1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("address2").focus();
            }
        }).open();
    }
</script>
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />


	<!-- contents -->
	<div class="signUp">
		<div class="wrap">
			<section class="lgTitle">
				<h3>회원가입</h3>
			</section>
			<section class="suInfo">
				<form name="singUp_form" action="#" method="post">
					<table>
						<tbody>
							<tr>
								<th>아이디</th>
								<td><input type="text" name="id" id="userId" min="3" maxlength="15" style="width:150px"><span>(영문소문자/숫자, 4~15자)</span></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" name="email" id="userEmail" style="width:150px"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="password" id="password" style="width:150px"><span>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~15자)</span></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" name="password2" id="password2" style="width:150px"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="userName" id="userName" style="width:100px"></td>
							</tr>
							<tr class="address">
								<th>주소</th>
								<td style="padding:5px">
									<input type="text" name="postCode" id="postCode" style="width:60px">
									<input type="button" value="우편번호검색" onclick="checkPost()" style="font-size:13px"><br>
									<input type="text" name="address1" id="address1" style="width:300px"><span>기본주소</span><br>
									<input type="text" name="address2" id="address2" style="width:300px"><span>나머지주소(선택)</span><br>
								</td>
							</tr>
							<tr class="phone">
								<th>휴대전화</th>
								<td >
									<select id="phone1" name="phone[]" style="padding:5px">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select>
									-
									<input type="text" name="phone2" id="phone2" maxlength="4" style="width:50px">
									-
									<input type="text" name="phone3" id="phone3" maxlength="4" style="width:50px">
								</td>
							</tr>
						</tbody>
					</table>

					<div class="login_btn" style="padding-top:30px">
						<input type="button" class="signUp_btn" value="회원가입">
					</div>
				</form>
			</section>
		</div>
	</div>




	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>