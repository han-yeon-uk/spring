<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>게시글 수정</title>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
</head>
<body>
	<h1>[게시글 수정]</h1>
	<form action="update" method="post" name="frm">
	<input type="hidden" name="bno" value="${vo.bno}">
		<table border=1>
			<tr>	
				<td width=100><b>Title</b></td>
				<td width=300><input type="text" name="title" value="${vo.title}"></td>
			</tr>
			<tr>
				<td width=100><b>Content</b></td>
				<td width=300><textarea rows="10" cols="50" name="content">${vo.content}</textarea></td>
			</tr>
			<tr>
				<td width=100><b>Writer</b></td>
				<td width=300><input type="text" name="Writer" value="guest"></td>
			</tr>
		</table>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
		<input type="button" value="삭제" id="btnDelete">
		<input type="button" value="목록" onClick="location.href='list'">
	</form>
</body>
<script>
	$(frm).submit(function(e){
		e.preventDefault();
		if($(frm.title).val()==""){
			alert("제목을 입력하세요!");
			$(frm.title).focus();
		}else if($(frm.contnet).val()==""){
			alert("내용를 입력하세요!");
			$(frm.content).focus();
		}else{
			if(!confirm("게시글을 수정하시겠어요?")) return;
			alert("수정되었습니다.");
			frm.submit();
		}
	});
	$("#btnDelete").on("click",function(){
		if(!confirm("삭제하실래요?")) return;
		location.href="delete?bno=${vo.bno}";
	});
</script>
</html>