$(document).ready(function() {
	$('#noticeWrite').on('click', function() {
		var formData = $("form").serialize();

		// 실행은 호출시 되기 때문에 confirm 사용하려면 호출전에 먼저 시도하기
		if (confirm("공지사항을 등록하시겠습니까?")) {
			$.ajax({
				type: "POST",
				url: "/bidangol/notice/write/new",
				data: formData,
				beforeSend: reg, // 등록 전 유효성 검사
				success: function() {
					/*location.href = "./freeBoardDetail.ino?num=" + data;*/
					alert("글이 등록되었습니다.");
					location.href = "/bidangol/notice";
				},
				error: function(request, status, error) {
					alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
				}
			});
		};

	});

	// 유효성검사
	function reg() {
		var name = $("#noticeName").val();
		var content = $("#noticeContent").val();

		if (!name) {
			alert("제목을 입력해주세요.");
			return false;
		}
		if (!content) {
			alert("내용을 작성해주세요.");
			return false;
		}
		return true;
	};

})


$(window).on("load", function() {
        
        // 공지사항 글 수정 버튼 클릭 시
        $("#noticeUpdate").click(function() {
            // 폼을 서버로 제출
            $("#modify_form").attr("action", "/bidangol/notice/noticeUpdate").submit();
            alert("수정이 완료되었습니다.");
        });

        // 공지사항 글 삭제 버튼 클릭 시
        $("#noticeDelete").click(function() {
            // 폼을 서버로 제출
            $("#modify_form").attr("action", "/bidangol/notice/noticeDelete").submit();
            alert("삭제가 완료되었습니다.");
        });
});