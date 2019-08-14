<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
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
@import 
url(//fonts.googleapis.com/earlyaccess/notosanskr.css); .notosanskr * 

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
		width: 100%;
		vertical-align:middle;
		margin-top: 50px;	
	}	
	
	.member-form{
		font-family: BMJUA;
		text-align: center;
		margin-bottom: 20px;
		
	}
	
	.member-check{
		font-family: BMJUA;
	    font-weight: 500;
	    margin-left: 42.5%;
	}
	input::placeholder {
  		font-family: BMJUA;
  		font-size: 0.8em;
	}
	
	input[type="text"], input[type="password"], input[type="email"], input[type="tel"], select, textarea {
	    appearance: none;
	    border-radius: 4px;
	    background-color: white;
	    border: none;
	    border: solid 1px rgba(144, 144, 144, 0.25);
	    color: inherit;
	    display: inline-block;
	    outline: 0;
	    padding: 0 1em;
	    text-decoration: none;
	    width: 15%;
	    border-radius: 4px;
	}
	
	 input[type="checkbox"] {
	 /* 실제 체크박스는 화면에서 숨김 */ 
		 position: absolute; 
		 width: 1px; 
		 height: 1px;
		 padding: 0; 
		 margin: -1px; 
		 overflow: hidden; 
		 clip:rect(0,0,0,0); 
		 border: 0 
	 } 
	 
	 input[type="checkbox"] + label { 
		 display: inline-block; 
		 position: relative; 
		 padding-left: 23px; /* 글자와 체크박스 사이의 간격을 변경 */ 
		 cursor: pointer; 
		 -webkit-user-select: none; 
		 -moz-user-select: none; 
		 -ms-user-select: none; 
	 } 
	 
	 input[type="checkbox"] + label:before { /* 가짜 체크박스 */ 
		 content: ''; 
		 position: absolute; 
		 left: 0; 
		 top: 5px; /* 이 값을 변경해서 글자와의 정렬 */ 
		 width: 20px; /* 체크박스의 너비를 지정 */ 
		 height: 20px; /* 체크박스의 높이를 지정 */ 
		 line-height: 20px; /* 세로정렬을 위해 높이값과 일치 */ 
		 text-align: center; 
		 background: #fafafa; 
		 border: 1px solid #cacece; 
		 border-radius : 3px; 
		 box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05); 
	 } 
	 
	input[type="checkbox"] + label:active:before, .checks input[type="checkbox"]:checked + label:active:before { 
	 	box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1); 
	 } 
	 
	input[type="checkbox"]:checked + label:before { /* 체크박스를 체크했을때 */ 
		content: '\2714'; /* 체크표시 유니코드 사용 */
		color: #99a1a7; 
		text-shadow: 1px 1px #fff; 
		background: #e9ecee; 
		border-color: #adb8c0; 
		box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1); 
	}
	
	#login{
		width: 15%;
	    height: 50px;
	    line-height: 50px;
	    font-size: 1.5em;
	    font-family: BMJUA;
	}
	
	.member-etc{
		width: 17%;
		height: 50px;
		border-top: 1px solid #868e96;
		margin: 0 auto;
		text-align: center;
		font-family: 'Youth';
		font-size: 0.85em;
		padding-top:15px;
		color: #868e96;
		font-weight: 400;
	}
	
	.member-etc a{
		color: #868e96;
		text-decoration: none;
	}
	
	#member-logo{
		width: 200px;
		margin-bottom: 20px;
	}
</style>	
</head>
<body>
	<div class="container">
		<div class="member-form">
			<img id="member-logo" src="../resources/images/header_logo.png">
		</div>
		<form action="./memberLogin" id="frm" method="post">
		  <div class="member-form">
		    <input type="text" class="member-input" id="id" value="${cookie.id.value}" name="id" placeholder="아이디">
		  </div>
		  <div class="member-form">
		    <input type="password" class="member-input" id="pw" name="pw" placeholder="비밀번호">
		  </div>
		  <div class="member-form">
		  	<input type="button" value="Login" id="login">
		  </div>
		  <div class="member-check">
		  	<input type="checkbox" id="remember" name="remember"> <label for="remember">로그인 상태 유지</label>
		  </div>
		  <div class="member-etc">
		  	<a href="./findId"><span>아이디 찾기&nbsp;</span></a> | <a href="./findPw"><span>&nbsp;비밀번호 찾기</span></a>
		  </div>
		</form>
	</div>
<script type="text/javascript">
$(function () {
	var re = '${cookie.remember.value}';
	if(re==1){
		$('#remember').prop('checked', true);
	}else{
		$('#remember').prop('checked', false);
	}
});

	$('#login').click(function() {
		var check = true;
		$('.member-input').each(function() {
			if($(this).val()==''){
				check=false;
			}
		});
		
		if(check){
			$('#frm').submit();
		}else{
			alert('아이디와 패스워드를 모두 입력해주세요.');
		}
	});
</script>
<c:import url="../temp/footer.jsp" />
</body>
</html>