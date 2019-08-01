<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/header.jsp" />
<style type="text/css">
	.container > h1 {
		color: black;
		}
	.container > p > a {
		color : black;
	
	}

</style>
</head>
<body>
	<div class="container">
		<h1>Admin Main Page</h1>
		<p><a href="${pageContext.request.contextPath}/admin/memberList">멤버 리스트(튜터 승인 / 회원 탈퇴)</a></p>
		<p><a href="">정산 페이지</a></p>
		<p><a href="${pageContext.request.contextPath}/admin/tutorApproval">튜터 승인 인증페이지</a>

	</div>
<c:import url="../temp/footer.jsp" />
</body>
</html>