$(document).ready(function(){
	$('#noticeWrite').click(function(){
			if(confirm("공지사항을 등록하시겠습니까?")) {
				alert("글이 등록되었습니다.");
			}return false;
		 });
		 
	// ajax로 등록 호출시, 글제목, 내용을 필수 작성으로 넣기
})