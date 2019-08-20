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
		height: 400px;
	}	
	
	.member-form{
		font-family: BMJUA;
		text-align: center;
		margin-bottom: 20px;
		
	}
	
	.member-label{
		width: 150px;
	    margin-right: 10px;
	    display: inline-block;
	    font-weight: 500;
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
	
	#update{
	    font-size: 1.2em;
	    font-family: BMJUA;
	    background-color: #548AF0;
	    margin-right: 5px;
	}
	
	#cancle{
	    font-size: 1.2em;
	    font-family: BMJUA;
	}
	
	.input_rex{
		margin-left:47%;
		font-size: 0.9em;
		text-align: left;
		font-weight: lighter;
	}
</style>	
</head>
<body>
	<div class="container">
		<form action="./memberPwUpdate" id="frm" method="post">
		  <div class="member-form">
		  	<span class="member-label">현재 비밀번호</span>
		    <input type="password" class="member-input" id="curpw" name="curpw">
		    <div class="input_rex curpw_text"></div>
		  </div>
		  <div class="member-form">
		  	<span class="member-label">변경 할 비밀번호</span>
		    <input type="password" class="member-input" id="pw" name="pw">
		    <div class="input_rex pw_text">영어 대소문자, 숫자, 특수문자 포함 8~20글자</div>
		  </div>
		  	 <div class="member-form">
		  	 <span class="member-label">비밀번호 재확인</span>
		    <input type="password" class="member-input" id="pw2" name="pw2">
		  </div>
		  <div class="member-form">
		  	<input type="button" value="UPDATE" id="update">
		  	<input type="button" value="MyPage" id="cancle">
		  </div>
		</form>
	</div>
<script type="text/javascript">
	$('#curpw').change(function() {
		var pw = $(this).val();
		$.ajax({
			url:"./checkPW",
			type:"POST",
			data:{pw:pw},
			success:function(data){
				if(data=='1'){
					$('.curpw_text').html('비밀번호 확인');
					$('.curpw_text').css('color', '#f6755e');
				}else{
					$('#curpw').val('');
					$('.curpw_text').html('비밀번호 불일치');
					$('.curpw_text').css('color', 'red');
				}
			}
		});
	});
	
	//pw 유효성검사+ pw&pw2 일치 여부 검사	
	$('#pw2').change(function() {
		var pw=$('#pw').val();
		var pw2=$('#pw2').val();
		var pwRex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W])[a-zA-Z0-9\W]{8,20}$/;
		if(pw==pw2){
			if(!pwRex.test($('#pw2').val())){
				$('#pw').val('');
				$('#pw2').val('');
				$('.pw_text').html('영어 대소문자, 숫자, 특수문자 포함 8~16글자');
				$('.pw_text').css('color', '#f6755e');
			}else{
				$('.pw_text').html('사용할 수 있는 비밀번호 입니다.');
				$('.pw_text').css('color', '#f6755e');
			}
		}else{
			$('#pw').val('');
			$('#pw2').val('');
			$('.pw_text').html('비밀번호가 일치하지 않습니다.');
			$('.pw_text').css('color', '#f6755e');
		}
		
	});
	$('#pw').change(function() {
		var pw=$('#pw').val();
		var pw2=$('#pw2').val();
		if(pw2.length>0 && pw!=pw2){
			$('#pw').val('');
			$('#pw2').val('');
			$('.pw_text').html('비밀번호가 일치하지 않습니다.');
			$('.pw_text').css('color', '#f6755e');
		}
	});	
	
	$('#cancle').click(function() {
		location.href="./memberMypage";
	});
	
	$('#update').click(function() {
		var check = true;
		$('.member-input').each(function() {
			if($(this).val()==''){
				check = false;
			}
		});
		
		if(check){
			$('#frm').submit();
		}
	});
</script>
<c:import url="../temp/footer.jsp" />	
</body>
</html>