<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>상품정보</title>
	<style>
		#listFile img{width:150px;margin:5px;}
	</style>
</head>
<body>
	<h1>[상품정보]</h1>
	<form name="frm" action="update" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pcode" value="${vo.pcode}">
		<input type="hidden" name="image" value="${vo.image }">
		<table border=1>
			<tr>
				<th width=100 style="background:gray;color:white;">Product Name</th>
				<td width=500><input type="text" size=50 name="pname" value="${vo.pname}"></td>
			</tr>
			<tr>
				<th width=100 style="background:gray;color:white;">Product Price</th>
				<td width=500><input type="text" size=10 name="price" value="${vo.price}">원</td>
			</tr>
			<tr>
				<th width=100 style="background:gray;color:white;">Representative image</th>
				<td width=500>
					<img src="display?fileName=${vo.image}" id="image" width=150>
					<input type="file" name="file"> <!-- 한 개의 대표 이미지 업로드 -->
				</td>
			</tr>
			<tr>
				<th width=100 style="background:gray;color:white;height:180px;">
					<input type="button" id="btnImage" value="Attached image">
				</th>
				<td width=500>
					<input type="file" name="files" multiple> <!-- 다중 상품 이미지 업로드 -->
					<div id="listFile">
						<c:forEach items="${images}" var="image">
							<img src="display?fileName=attach/${image}" width=150>
						</c:forEach>
					</div>
				</td>
			</tr>
		</table>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
		<input type="button" id="btnDelete" value="삭제">
		<input type="button" value="상품목록" onClick="location.href='list'">
	</form>
</body>
<script>
	$(frm.file).hide();
	$(frm.files).hide();
	$("#btnImage").on("click",function(){
		$(frm.files).click();
	});
	$("#image").on("click",function(){
		$(frm.file).click();
	});
	
	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src",URL.createObjectURL(file));
	});
	
	$(frm.files).on("change",function(){
		var files=$(frm.files)[0].files;
		var str="";
		$.each(files,function(index,file){
			str +="<img src='"+URL.createObjectURL(file)+"'>";
		})
		$("#listFile").html(str);
	});
	
	$(frm).on("submit",function(e){
		e.preventDefault();
		if(!confirm("수정하실래요?")) return;
		frm.submit();
	});
	
	$("#btnDelete").on("click",function(){
		if(!confirm("삭제하실래요?")) return;
		frm.action="delete";
		frm.submit();
	});
</script>
</html>