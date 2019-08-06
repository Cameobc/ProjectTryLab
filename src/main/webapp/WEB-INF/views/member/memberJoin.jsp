<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	
</style>
</head>
<body>

	<div class="container">
		<h1>Member Join Form</h1>
		
		<div class="join_all">
			<form:form commandName="memberVO" id="frm" enctype="multipart/form-data">
				<div class="member_thumbnail">
					<img src="../resources/images/profile.png" width="100" height="100">
					<span class="mask"></span>
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


<c:import url="../temp/footer.jsp" />
</body>
</html>