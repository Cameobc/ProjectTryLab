<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<tr>
			<td>NO</td>
			<td>클래스 이름</td>
			<td>수강인원/정원</td>
			<td>매출액</td>
			<td>수수료</td>
			<td>정산액</td>
		</tr>
		<c:forEach items="${lessons}" var="les" varStatus="i">
			
			<tr>
				<td>${i.index +1 }</td>
				<td>${les.title }</td>
				<td>${les.reg_date}</td>
				<td>${les.limit}</td>
			</tr>
			
		</c:forEach>
		<input type="hidden" value="${fn:length(lessons)}" id="lessonLength"/>
	</table>
</body>
</html>