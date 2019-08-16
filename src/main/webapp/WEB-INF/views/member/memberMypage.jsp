<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<c:import url="../temp/header.jsp" />
<c:import url="../temp/font.jsp"/>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}

@font-face { 
	font-family: 'BMJUA'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff'); 
	font-weight: normal; 
	font-style: normal; 
}

.container{
	width: 80%;
	margin: 0 auto;
	margin-top: 50px;
	height: 1000px;
}

.member_navi{
	float:right;
	width: 50%;
	margin : 0 auto;
	height: 500px;
	border: 2px solid #fcdcd6;
	margin-right: 10%;
}

.member_top{
	width: 100%;
	margin: 0 auto;
	height: 800px;
}

.welcome{
	font-family: BMJUA;
	font-size: 1.5em;
	padding-top: 15px;
	width: 100%;
	margin-left: 15px;
	text-align: left;
}

.member_thumbnail{
	position: relative;
	width: 100px;
	height: 100px;
	margin-left: 150px;
	margin-top: 50px;
	float: left;
}
	
.member_thumbnail .mask{
	position: absolute;
	z-index: 10;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: url(../resources/images/profilesub.png) 0 0;
	background-repeat: no-repeat;
}

.btn_div{
	text-align: center;
}

.btn_update{
	font-family: Youth;
	background-color: #548AF0;
}

.btn_pw{
	font-family: Youth;
}
</style>
</head>
<body>
<div class="container">
	<div class="member_navi">
		<div class="welcome">
			<span>${member.id}님의 마이 페이지</span>
		</div>
		<div class="member_thumbnail">
			<img id="thumbnail" src="../resources/member/${member.memberFileVO.fname}" width="100" height="100">
			<span class="mask"></span>
		</div>
		<div class="member_info">
			<table>
				<tr>
					<td class="td_info">ID</td>
					<td>${member.id}</td>
				</tr>
				<tr>
					<td class="td_info">NAME</td>
					<td>${member.name}</td>
				</tr>
				<tr>
					<td class="td_info">EMAIL</td>
					<td>${member.email}</td>
				</tr>
				<tr>
					<td class="td_info">PHONE</td>
					<td>${member.phone}</td>
				</tr>
				<tr>
					<td class="td_info">GRADE</td>
					<td>
						<c:if test="${member.grade eq 2}">
							일반회원
						</c:if>
					</td>
				</tr>
			</table>
		</div>
		<div class="btn_div">
			<a href="memberUpdate"><button class="btn_update">회원 정보 수정</button></a>
			<a href="memberPwUpdate"><button class="btn_pw">비밀번호 변경</button></a>
		</div>
	</div>
<c:import url="../temp/mheader.jsp" />	
</div>

<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>