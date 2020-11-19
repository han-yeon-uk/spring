<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>상품목록</title>
	<style>
		#divList{width:920px;background:yellow;overflow:hidden;}
 		.box { width:200px;height:150px;padding:10px;margin:5px;background:gray;color:white;float:left; font-size:15px; }
		 a { color:pink;}
 	</style>
</head>
<body>
	<h1>[상품목록]</h1>
	
	<form action="list" name="frm" style="width:920px;">
		<input type="hidden" name="page" value="1">
		<select name="searchType">
			<option value="pname" <c:out value="${pm.cri.searchType=='pname'?'selected':''}"/> >Product Name</option>
			<option value="price1" <c:out value="${pm.cri.searchType=='price1'?'selected':''}"/> >low price</option>
			<option value="price2" <c:out value="${pm.cri.searchType=='price2'?'selected':''}"/> >high price</option>
		</select>
		<input type="text" name="keyword" value="${pm.cri.keyword}" size=10>
		<input type="submit" value="검색">
		<select name="perPageNum">
			<option value="4" <c:out value="${pm.cri.perPageNum=='4'?'selected':''}"/> >4행씩 출력</option>
			<option value="8" <c:out value="${pm.cri.perPageNum=='8'?'selected':''}"/> >8행씩 출력</option>
			<option value="12" <c:out value="${pm.cri.perPageNum=='12'?'selected':''}"/> >12행씩 출력</option>
		</select>
		<span>검색수:${pm.totalCount}</span>
		<input type="button" value="상품 등록" onClick="location.href='insert'" style="float:right;">
	</form>
	
	<div id="divList">
		<c:forEach items="${list}" var="vo">
			<div class="box">
				<c:if test="${vo.image!=null}">
				<a href="read?pcode=${vo.pcode}">
				<img src="display?fileName=${vo.image}" width=150>
				</a>
				</c:if>
				<c:if test="${vo.image==null}">
				<a href="read?pcode=${vo.pcode}">
				<img src="http://placehold.it/150x120" width=150>
				</a>
				</c:if>
				<div>${vo.pname}</div>
				<div>${vo.price}원</div>
			</div>
		</c:forEach>
	</div>
	<div id="pagination">
		<c:if test="${pm.prev}">
				<a href="${pm.startPage-1}">◀</a>
			</c:if>
		<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
			<c:if test="${pm.cri.page==i}">
				[<a href="${i}" class="active">${i}</a>]
			</c:if>
			<c:if test="${pm.cri.page!=i}">
				[<a href="${i}">${i}</a>]
			</c:if>
		</c:forEach>
		<c:if test="${pm.next}">
			<a href="${pm.endPage+1}">▶</a>
		</c:if>
	</div>
</body>
<script>
	$("#pagination a").click(function(e){
		e.preventDefault();
		$(frm.page).val($(this).attr("href"));
		frm.submit();
	});
	
	$(frm.perPageNum).on("change",function(){
		frm.submit();
	});
</script>
</html>