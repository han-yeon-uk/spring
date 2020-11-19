<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>통장목록</title>
	<style>
		.title{background:gray;color:white;text-align:center;}
		.row{text-align:center;}
		.row:hover{background:gray;color:white;}
	</style>
</head>
<body>
	<h1>[통장목록]</h1>
	<table border=1>
		<tr class="title">
			<th width=100>계좌번호</th>
			<th width=100>성명</th>
			<th width=250>계좌 개설일</th>
			<th width=100>계좌 잔액</th>
			<th width=100>통장내역</th>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr class="row">
				<td>${vo.ano}</td>
				<td>${vo.name}</td>
				<td><fmt:formatDate value="${vo.openDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>	
				<td><fmt:formatNumber value="${vo.balance}" pattern="#,###"/></td>		
				<td><button onClick="location.href='read?ano=${vo.ano}'">통장내역</button></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>