<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header_css.css" />
<style type="text/css">


	
</style>

</head>
<body>
<div class ="wrap">
	<div class="header_wrap">
		<div class="header_gray">
			<div class="gray_wrap">
			<form class="form-inline" action="./class/classList" style="width: 1000px; height:48px; margin: 0px; display: inline-block;">
				<div class="form-group search_wrap">
					<select class="form-control" id="option" name = "kind">
						<option class="k" value="0">전체</option>
						<option class="k" value="1">카테고리</option>
						<option class="k" value="2">클래스명</option>
						<option class="k" value="3">닉네임</option>
					</select>
				</div>
				<div class="form-group search_wrap">
					<input type="text" id="search" class="form-control" value="${pager.search }" name="search" placeholder="검색할 단어를 입력하세요.">
				</div>
				<button class="search_btn">검색</button>


			</form>
			
				<ul class="top_list">
					<c:if test="${empty member }">
					<li class="top_menu"><a href="${pageContext.request.contextPath}/member/memberLogin">로그인  </a></li>
					</c:if>
					<c:if test="${not empty member }">
					<li class="top_menu"><a href="${pageContext.request.contextPath }/member/memberLogout">로그아웃</a></li>
					</c:if>
					
					<c:choose>
						<c:when test="${member.grade eq 0 }">
							<li class="top_menu"><a href="${ pageContext.request.contextPath}/admin/adminMain">관리자 페이지</a></li>
						</c:when>
						<c:otherwise>
							<li class="top_menu"><a>마이페이지</a></li>	
						</c:otherwise>
					</c:choose>
					<li class="top_menu"><a href="${pageContext.request.contextPath}/member/memberJoin">회원가입 </a></li>
					<li class="top_menu"><a>고객센터 </a></li>
				</ul>
			</div>
		</div>		

		<div class="menu_wrap">
			<div class="menu_con">
			<div class="logo_wrap">
			<a href="/trylab"><img id="logo" src = "/trylab/resources/images/header_logo.png"></a>
			</div>
					<ul class="menu_list">
						<li class="menu"><a class="black">공지사항</a>
						<li class="menu"><a href="${pageContext.request.contextPath }/class/classList" class="black">클래스</a>
						<li class="menu"><a class="black">VOD 강의</a>
						<c:if test="${empty approval.id }">
							<li class="menu"><a href="${pageContext.request.contextPath }/member/tutorRequest" class="black">튜터 등록</a>			
						</c:if>
						<c:if test="${not empty approval.id }">
							<li class="menu"><a href="${pageContext.request.contextPath }/member/tutorUpdate" class="black">튜터 수정</a></li>
						</c:if>
						
					</ul>

			</div>
			
		</div>
	
	</div>
</div>










</body>
</html>