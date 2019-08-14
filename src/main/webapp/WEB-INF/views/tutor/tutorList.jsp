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
			<td>등록일</td>
			<td>정원</td>
		</tr>
		<c:forEach items="${lessons}" var="les" varStatus="i">
			
			<tr>
				<td>${i.index +1 }</td>
				<td>
					<a href="../lessons/lessonSelect?class_id=${les.class_id }">
						${les.title }
					</a>
				</td>
				<td>${les.reg_date}</td>
				<td>${les.limit}</td>
			</tr>
			
		</c:forEach>
		<input type="hidden" value="${fn:length(lessons)}" id="lessonLength"/>
	</table>
</body>
</html>