<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.member_info{
	float:left;
	margin-left:40px;
	margin-top: 50px;
	font-family: Youth;
}

.member_info table, .member_info tr, .member_info td{
	border: hidden;
}

.member_info td{
	text-align: left;
}

.td_info{
	width: 150px;
}

.member_header{
	float: left;
	width: 340px;
	height: 300px;
}

.m_heaer{
	font-family: BMJUA;
	font-size: 30px;
	width: 200px;
	float: right;
}

.check{
	color:black;
	text-decoration: none;
}

</style>
</head>
<body>
<div class="member_header">
		<table class="m_heaer">
			<tr>
				<td><a class="check1 check" href="./memberMypage">My page</a></td>
			</tr>
			<tr>
				<td><a class="check2 check" href="./memberSchedule">스케줄 확인</a></td>
			</tr>
			<tr>
				<td><a class="check3 check" href="./memberPayment">결제 내역</a></td>
			</tr>
			<tr>
				<td><a class="check4 check" href="./memberQna">문의 내역</a></td>
			</tr>
		</table>
	</div>

<script type="text/javascript">
	$(function() {
		var check = '${headset}'*1;
		console.log(check);
		if(check==1){
			$('.check1').css("color", "#f6755e");
		}else if(check==2){
			$('.check2').css("color", "#f6755e");
		}else if(check==3){
			$('.check3').css("color", "#f6755e");
		}else if(check==4){
			$('.check4').css("color", "#f6755e");
		}
	});
</script>
</body>
</html>