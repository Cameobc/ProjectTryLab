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
	<link rel="stylesheet" href="../resources/assets/css/main.css" />
	
	
<style type="text/css">
	body { 
		margin:  0px;
		background-color: white;
		
	}
	label {
		color:black;
	} 

	 a { 
		text-decoration: none; border-bottom: none;
		    transition: 0.2s ease-in-out;
	
	}
	ul {
		text-decoration: none; list-style: none;
	}
	
	.container {
		color: black;
	}
	
	.black { color: black;}
	
	.wrap{
		width: 100%; height: 100%; margin : 0; padding: 0; 
	}

	.header_wrap { 
		width:100%; height: 155px;  box-shadow: inset 0 -1px 0px 0 #EAEAEA;
	}
	.header_gray {
		width:100%; height: 48px; background-color : #ffdb4d; 
	}
	.gray_wrap {
		width:100%; height:48px; padding : 0 10%; 
		margin: 0 auto;
	}
	.menu_wrap {
		width: 100%; height: 107px; background: white;   
	}
	.menu_con{
		margin: 0 auto; height: 107px; padding: 0 10%; margin: 0 auto; 
	}
	.list_wrap {
		height: 108px;  margin: 0 30%; border-bottom: gray;
	}
	
	.top_list{
		text-decoration: none; list-style: none; margin:0; 
		float:right; line-height: 2.7em; 
	} 
	.top_menu {
		float: left; margin-right: 20px; font-size: 14px; font-weight: bold;
	}
	.menu_list {
		list-style: none; width:50%; height: 107px; line-height: 6em; margin:0 auto; padding: 0; text-align: center; 
	}
	.menu {
		 display: inline-block; text-align: center; margin: 0 auto; padding-right: 40px;
		 font-size: 18px; font-weight: bold; color: navy;
	}
	.logo_wrap {
		padding: 40px 0; width:130px; height: 107px; margin: 0; display: inline-block; float: left;
	}
	#logo {
		width: 120px; height: 30px; display: inline-block; float: left; vertical-align: middle;
	}
</style>

</head>
<body>
<div class ="wrap">
	<div class="header_wrap">
		<div class="header_gray">
			<div class="gray_wrap">
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
						<li class="menu"><a href="${pageContext.request.contextPath}/notice/noticeList" class="black">공지사항</a>
						<li class="menu"><a class="black">서비스 소개</a>
						<li class="menu"><a class="black">VOD 강의</a>
						<li class="menu"><a href="${pageContext.request.contextPath }/member/tutorRequest" class="black">튜터 등록</a>
						<li class="menu"><a href="${pageContext.request.contextPath }/qna/qnaList" class="black">Q&A</a>
					</ul>

			</div>
			
		</div>
	
	</div>
</div>
</body>
</html>