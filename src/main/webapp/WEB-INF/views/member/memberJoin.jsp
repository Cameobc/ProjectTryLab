<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<c:import url="../temp/header.jsp" />
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
	
	.join_all{
		width: 70%;
		margin: 0 auto;
	}
	
	.member_thumbnail{
	    position: relative;
	    width: 100px;
	    height: 100px;
	    margin: 0 auto;
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
	    cursor:pointer;
	}
	
		input[type="radio"] { 
		-webkit-appearance: radio;
		opacity: inherit;
		display: inline-block;
		float: none;
		margin-right: 0;
		width: 1em;
	}
	
	.member-form{
		width: 100%;
		text-align:center;
		margin-top:30px;
		font-family: BMJUA;			
	}
	
	.member-label{
		width: 70px;
	    margin-right: 30px;
	    display: inline-block;
	    font-weight: 500;
	}
	
	.member-label2{
		width: 70px;
		margin-right: 30px;
		display: inline-block;
		font-weight: 500;
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
	    width: 35%;
	}
	
	
	input::placeholder {
	  color: #d2d2d2;
	  font-style: italic;
	  font-family: 'Noto Sans KR', sans-serif;
	}
	
	.member-input2{
		width: 28% !important;
		float: right;
		height: 50px;
	}
	
	input[type="submit"], input[type="reset"], input[type="button"], button, .button {
	    -moz-appearance: none;
	    -webkit-appearance: none;
	    -ms-appearance: none;
	    appearance: none;
	    -moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	    -webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	    -ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	    transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	    background-color: #f6755e;
	    border-radius: 4px;
	    border: 0;
	    color: #ffffff !important;
	    cursor: pointer;
	    display: inline-block;
	    font-weight: 500;
	    width: 150px;
	    height: 60px;
	    line-height: 50px;
	    padding: 0 1.5em;
	    text-align: center;
	    text-decoration: none;
	    white-space: nowrap;
	    font-family: BMJUA;
	    font-size: 1.5em;
	}
	.form-info{
		margin-left:37%;
		font-size: 0.8em;
		text-align: left;
	}
	
	#photo{
		position: absolute;
	    overflow: hidden;
	    clip: rect(0,0,0,0);
	    width: 1px;
	    height: 1px;
	    margin: -1px;
	    padding: 0;
	    border: 0;
	}
	
	
</style>
</head>
<body>
	<div class="container">
		<h1>Member Join Form</h1>
		
		<div class="join_all">
			<form:form commandName="memberVO" id="frm" enctype="multipart/form-data">
				<div class="member_thumbnail">
					<img id="thumbnail" src="../resources/images/profile.png" width="100" height="100">
					<span class="mask"></span>
					<input type="file" id="photo" name="photo">
				</div>		  		
				<div class="member-form">
			    	<span class="member-label">ID </span>
					<form:input path="id" cssClass="member-input"/>
					<form:errors path="id"></form:errors>
				</div>
				<div class="member-form">
			    	<span class="member-label">PASSWORD</span>
			    	<form:password path="pw" cssClass="member-input"/><br>
			    	<div class="form-info">'영어 대소문자, 숫자, 특수문자 포함 8~16글자'</div>
			  	</div> 
				<div class="member-form">
			    	<span class="member-label">PASSWORD CONFIRM</span>
			    	<form:password path="pw2" cssClass="member-input"/>
			    	<form:errors path="pw2"></form:errors>
			  	</div> 
				<div class="member-form">
				    <span class="member-label">NAME</span>
				    <form:input path="name" cssClass="member-input"/>
				    <form:errors path="name"></form:errors>
				</div>		
				<div class="member-form">
			    	<span class="member-label">PHONE</span>
			    	<form:input path="phone" cssClass="member-input"/>
			    	<div class="form-info">'010-1234-5678 형식을 지켜주세요'</div>
			  	</div> 
				<div class="member-form">
				    <span class="member-label">EMAIL</span>
				    <form:input path="email" cssClass="member-input"/><br>
				    <form:errors path="email"></form:errors>
				</div>
				<div class="member-form">
			    	<span class="member-label2">GENDER</span>
			    	<form:radiobutton path="gender" value="f" id="gender1"/> F &nbsp;&nbsp;&nbsp;&nbsp;
			    	<form:radiobutton path="gender" value="m" id="gender2"/> M
			    	<div class="member-input2" ></div>
			  	</div> 
				<div class="member-form">
					<form:button cssClass="btn"> JOIN </form:button>
				</div>  
			</form:form>
		</div>	
	</div>
<script type="text/javascript">
	//동그란 형식으로 파일 바꾸는 것
	$('.mask').click(function() {
		$('#photo').click();
	});
	//파일 바뀔 때마다 미리보기 변경
	$('#photo').change(function() {
		//files -> photo에 업로드 된 파일의 모음. 여기는 한개만 업로드 가능하여 한개만 뜬다.
		//this.files->인덱스, 파일, 길이 순으로 뜨는 것 같음.
		//this.files[0]-> 0번 인덱스에 저장된 파일의 정보가 나타난다.
		//FileReader -> 비동기적으로 데이터를읽기 위하여 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 함.
		//FileReader.onload -> 읽기 동작이 성공적으로 발생했을 경우 발생된다.
		if(this.files && this.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				$('#thumbnail').attr('src', e.target.result);
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
</script>
<c:import url="../temp/footer.jsp" />
</body>
</html>