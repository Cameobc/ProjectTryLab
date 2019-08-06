<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../resources/assets/css/main.css" />
<c:import url="../temp/header.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
@import 
url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{
	margin: 0;
	padding: 0;
}
	body{
		background-color: white;
	}
	.container{
		margin-top: 50px;
		width: 100%;
		background-color: white;
		font-family: 'Hanna', fantasy;
		color:black;
	}
	
	.subject{
		text-align:center;
		font-size: 2.5em;
		font-weight: lighter;
		color:black;
	}
	
	.order{
		margin: 0 auto;
		margin-top:50px;
		width:70%;
	}
	
	.order_info{
		height: 400px;
	}
	
	.info_text{
		font-size: 1.8em;
		border-bottom: 5px solid #f6755e;
	}
	
	.order_info li{
		list-style: none;
	}	
	
	.member_info{
		height: 600px;
		color:black;
	}
	
	.member-form{
		margin-top:15px;
		margin-left:30px;
	}
	
	.m_input{
		width: 300px !important;
		height: 50px !important;
		background-color: white !important;
		font-weight:400;
		font-size:1em;
		padding: 3px;
	}
	
	.m_label{
		color: black;
		font-size: 1.2em;
	}
	
	.memo-span{
		font-size: 1em;
		font-weight: 150 !important;
	}
	
	.m_textarea{
		resize: none;
		background-color: white;
		font-size:0.8em;
		width: 95% !important;
		font-weight: 400;
		font-size: 1em;
		
	}

	.purchase_info{
		height: 300px;
	}
	
	.purchase-select{
		font-size: 1.2em;
		margin-top: 15px;
	}
	
	
	input[type="radio"] { 
		-webkit-appearance: radio;
		opacity: inherit;
		display: inline-block;
		float: none;
		margin-right: 0;
		width: 1em;
	}
	
	.btn_div{
		height : 200px;
	}
	
	.btn_div{
		text-align: center;
	}
	
	.pay{
		font-family: 'Hanna', fantasy !important;
		font-size: 1.3em;
	}
	
</style>
</head>
<body>
<div class="container">
	<div class="subject"> 클래스 신청서 </div>
	<form action="">
		<div class="order">
			<div class="order_info">
				<div class="info_text"> 클래스 정보</div>
				<ul>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="member_info">
				<div class="info_text">신청자 정보</div>
				<div class="member-form">
					<label for="name" class="m_label">이름</label>
					<input type="text" id="name" name="name" class="m_input">
				</div>
				<div class="member-form">
					<label for="phone" class="m_label">전화번호</label>
					<input type="text" id="phone" name="phone" class="m_input">
				</div>
				<div class="member-form">
					<label for="memo" class="m_label">메모</label><span class="memo-span">300자 이내로 강사님께 남길 말을 적어주세요:)</span>
					<textarea name="memo" id="memo" class="m_textarea"></textarea>
				</div>
			</div>
			<div class="purchase_info">
				<div class="info_text">결제 방식</div>
				<div class="purchase-select">
					<input type="radio" class="checks" id="payment1" name="payment" value="1"> 무통장 입금 &nbsp; &nbsp; &nbsp; &nbsp;
					<input type="radio" class="checks" id="payment2" name="payment" value="2"> 카드 결제
				</div>
				<h1><spring:eval expression="@purchase.getProperty('iamprot.code')"></spring:eval></h1>
			</div>
			<div class="btn_div">
				<input type="button" value="결제하기" class="pay">
			</div>	
		</div>
	</form>
</div>	
<script type="text/javascript">
	$('.pay').click(function() {
		var payment = $('input[name="payment"]:checked').val();
		if(payment==1){
			
		}else if(payment==2){
			$.ajax({
				url:"../pay/payment",
				type:"POST",
				
			});
		}else{
			
		}
	});
</script>
</body>
</html>