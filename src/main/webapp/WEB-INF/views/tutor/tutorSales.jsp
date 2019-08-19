<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<!-- <td>클래스ID</td> -->
			<td>클래스 이름</td>
			<td>수업일자</td>
			<td>수강인원/정원</td>
			<td>매출액</td>
			<td>수수료(20%)</td>
			<td>정산액</td>
		</tr>
		<c:set var= "ptotal" value="0"/>
		<c:set var= "fee" value="0"/>
		<c:set var= "total" value="0"/>
		<c:forEach items="${list}" var="l">
			<c:forEach items="${l.timetable }" var="time">
				<tr>
					<%-- <td>${les.class_id }</td> --%>
					<td>${l.title }</td>
					<td>${time.class_date } ${time.startTime } ~ ${time.endTime }</td>
					<td><span>${time.curPerson}</span> / <span>${l.limit}</span></td>
					<td><fmt:formatNumber value="${l.price*time.curPerson}" type="number"/>원</td>
					<td><fmt:formatNumber value="${l.price * time.curPerson*0.2}" type="number"/>원</td>
					<td><fmt:formatNumber value="${l.price * time.curPerson*0.8}" type="number"/>원</td>
					<c:set var= "ptotal" value="${ptotal + l.price*time.curPerson}"/>
					<c:set var= "fee" value="${fee + l.price * time.curPerson*0.2}"/>
					<c:set var= "total" value="${total + l.price * time.curPerson*0.8}"/>
				</tr>
			</c:forEach>
		</c:forEach>
		<input type="hidden" value="${total}" id="total"/>
	</table>
	<table class="table" style="text-align: center; color:#f6755e; font-size: 18px; font-weight: bold">
		<tr style="color:#333; border-bottom: 2px solid #292c34; border-top: 2px solid #292c34 ">
			<td>총 매출액</td>
			<td>총 수수료</td>
			<td>최종 정산액</td>
		</tr>
		<tr>
			<td><fmt:formatNumber value="${ptotal }" type="number"/>원</td>
			<td><fmt:formatNumber value="${fee }" type="number"/>원</td>
			<td><fmt:formatNumber value="${total }" type="number"/>원</td>
		</tr>
	</table>
</body>
</html>