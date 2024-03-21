<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/bidangol/css/login.css">
<script type="text/javascript">
$(document).ready(function(){
	/* 쿠키로 아이디저장기능 구현 */
	var key = getCookie("idChk"); //user1
	if(key!=""){
		$("#userId").val(key); 
	}
	 
	if($("#userId").val() != ""){ 
		$("#idSaveCheck").attr("checked", true); 
	}
	 
	$("#idSaveCheck").change(function(){ 
		if($("#idSaveCheck").is(":checked")){ 
			setCookie("idChk", $("#userId").val(), 7); 
		}else{ 
			deleteCookie("idChk");
		}
	});
	 
	$("#userId").keyup(function(){ 
		if($("#idSaveCheck").is(":checked")){
			setCookie("idChk", $("#userId").val(), 7); 
		}
	});

function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
	 
function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if(start != -1){
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if(end == -1)end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}

});
</script>
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/view/include/header.jsp" />


	<!-- contents -->
	<div class="loginPage">
		<div class="wrap">
			<section class="lgTitle">
				<h3>로그인</h3>
			</section>
			<section class="lgInfo">
				<form name="login_form" action="#" method="post">
					<div class="idPw">
						<input type="text" name="id" id="userId" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'" required><br>
						<input type="password" name="password" id="password" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'" required>
					</div>
					<div class="idSave">
					  <input type="checkbox" id="idSaveCheck"><label for="remember">아이디 저장</label>
					</div>
					<div class="login_btn">
						<input type="button" class="sign_in_btn" value="로그인"><br>
						<input type="button" class="sign_up_btn" value="회원가입">
					</div>
				</form>
			</section>
		</div>
	</div>




	<!-- footer -->
	<jsp:include page="/WEB-INF/view/include/footer.jsp" />

</body>
</html>