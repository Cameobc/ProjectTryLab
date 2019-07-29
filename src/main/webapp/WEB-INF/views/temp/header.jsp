<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	body { margin:  0px;}
	a { 
		text-decoration: none; border-bottom: none;
	}
	.black { color: black;}
	
	.wrap{
		width: 100%; height: 100%; margin : 0; padding: 0; 
	}

	.header_wrap { 
		width:100%; height: 155px;      box-shadow: inset 0 -1px 0px 0 #EAEAEA;
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
		text-decoration: none; list-style: none; margin:0; line-height: 2.7em; 
	} 
	.top_menu {
		float: right; margin-right: 20px; font-size: 14px; font-weight: bold;
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
					<li class="top_menu menu4"><a>고객센터 </a></li>
					<li class="top_menu menu3"><a>마이페이지</a></li>
					<c:if test="${member.id eq admin}">
					<li class="top_menu"><a>관리자페이지</a></li>
					</c:if>
					<li class="top_menu menu2"><a href="${pageContext.request.contextPath}/member/memberJoin">회원가입 </a></li>
					<li class="top_menu menu1"><a>로그인  </a></li>
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
						<li class="menu"><a class="black">서비스 소개</a>
						<li class="menu"><a class="black">VOD 강의</a>
						<li class="menu"><a class="black">튜터 등록</a>
					</ul>

			</div>
			
		</div>
	
	</div>
</div>
</body>
</html>