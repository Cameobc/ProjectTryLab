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
	h1 {
		color : black;
	}
	body {
		color : black;
	}

</style>
</head>
<body>

<h1> tutor Select Page </h1>


	프로필사진 : <img src = "../resources/member/${approvalVO.memberFileVO.fname }"> <br>
	ID : ${approvalVO.id } <br>
	닉네임 : ${approvalVO.nickName }<br>
	신분 / 학력 인증 : ${approvalVO.confirmType } <br>
	대학 / 학과 : ${approvalVO.college } / ${approvalVO.major } <br>
	학력 상태 : ${approvalVO.colStatus } <br>
	인증 파일 : <img src = "../resources/certificate/${approvalVO.certificateVO.fname }"> <br>
	자격증 : ${approvalVO.kind } <br>
	자격증 파일 : <img src = "../resources/license/${approvalVO.licenseVO.fname }"> <br>
	









<c:import url="../temp/footer.jsp" />
</body>
</html>