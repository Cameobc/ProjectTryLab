<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	margin-top:100px;
	width: 100%;
	height: 500px;
}

.member-form{
	width: 80%;
	margin: 0 auto;
	text-align: center;
	margin-bottom: 50px;
	font-family: 'Youth';
}

.member-label{
	width: 70px;
	margin-right: 30px;
	display: inline-block;
	font-weight: 500;
}

input[type="text"], input[type="password"], input[type="email"], input[type="tel"], select, textarea{
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

#member-logo{
	width: 200px;
	margin-bottom: 20px;
}

#btn{
	width: 15%;
	height: 50px;
	line-height: 50px;
	font-size: 1.5em;
	font-family: BMJUA;
	text-align: center;
}
</style>
</head>
<body>
<div class="container">
	<div class="member-form">
		<img id="member-logo" src="../resources/images/header_logo.png">
	</div>
	<form action="./findPw" id="frm" method="post">
		<div class="member-form">
			<span class="member-label">ID</span>
		    <input type="text" class="member-input" id="id" name="id"><br>
		</div>
		<div class="member-form">
			<span class="member-label">EMAIL</span>
		    <input type="text" class="member-input" id="email" name="email"><br>
		</div>
		<div class="member-form">
		    <input type="button" value="비밀번호 찾기" id="btn">
		</div>
	</form>	
</div>
<script type="text/javascript">
	$('#btn').click(function() {
		var check = true;
		$('.member-input').each(function() {
			if($(this).val()==''){
				check = false;
			}
		});
		
		if(check){
			$('#frm').submit();
		}else{
			alert('아이디와 이메일을 모두 입력해주세요.');
		}
	});
</script>
<c:import url="../temp/footer.jsp" />
</body>
</html>