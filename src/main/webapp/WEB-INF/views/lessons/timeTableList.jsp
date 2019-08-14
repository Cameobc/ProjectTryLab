<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="box">
	<select class="browser-default custom-select">
		<c:forEach items="${times}" var="t">
			<option value="${t.idx }">${t.startTime } ~ ${t.endTime }</option>
		</c:forEach>
	</select>
	</div>
