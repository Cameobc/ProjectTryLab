<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"/>
<link rel="stylesheet" href="../resources/css/qnaWrite.css">
<c:import url="../temp/header.jsp" />
</head>
<body>
	
	<div class="header"></div>
	
	<div class="container">
	  <div id="qna">1:1 문의</div>
	  <br>
	  
	<form:form commandName="qnaVO" enctype="multipart/form-data">
	
		<label for="title" style="color:#9c836a;">제목</label>
		<div>
			<form:input path="title" id="title" class="form-control" />
			<form:errors path="title" />
		</div><br>
		
		<label for="contents" style="color:#9c836a;">내용</label>
		<div>
			<form:textarea path="contents" rows="5" cols="" id="contents" class="form-control" />
			<form:errors path="contents" />
		</div><br>

		<div style="float: left">
			<label for="writer" style="color:#9c836a;">이름</label>
			<div>
				<form:input path="writer" id="writer" class="form-control" />
				<form:errors path="writer" />
			</div>
		</div>
		
		<div style="float: right; margin-right: 30%">
			<label for="email" style="color:#9c836a;">이메일</label>
			<div>
				<form:input path="email" id="email" class="form-control" />
				<form:errors path="email" />
			</div>
		</div><br><br><br>
		
		<div>
			<input type="file" id="add" name="f1" value="파일 추가">
		</div>

		<div id="line"></div>
	  
	  	<div id="c1">
	  		<div id="agree">필수적 개인정보 수집 및 이용에 대한 동의 <span>(필수)</span></div>
	  	</div>
	  	
	  	<div id="c2">
	  		<input type="checkbox" id="a1" name="chk"> 동의함
	  		<label for="a1"></label>
	  	</div>
		<br><br><br>	
		
		<div id="agree_text">
			<textarea rows="10" cols="111" style="padding-left: 10px; width: 780px;">

파라다이스시티는 귀하의 개인정보를 소중하게 생각하며, 서비스제공을 위해 개인정보보호법 제 15조 및 제22조에 따라 귀하의 동의를 받고자 합니다.

[개인정보 수집 및 이용 동의]
1. 수집 및 이용 목적 : 회원제 서비스에 따른 본인 확인 절차, 고객 공지 사항 전달 및 불만 처리 등
2. 수집 항목
- 필수항목 : 아이디, 비밀번호, 이름, 생년월일, 휴대폰번호, Email
- 선택항목 : 주소, 직업, 결혼기념일, 관심 시설, 관심 분야

3. 개인정보 휴면처리 회원의 개인정보 이용 기준에 대한 유효기간을 아래와 같이 정하며, 최종 이용 시점을 기산일로 하여 유효기간 경과 이후 회원의 개인정보를 분리 저장/관리 또는 파기합니다.
1) 유효기간: 1년
2) 서비스 이용 기준: 멤버십 서비스 이용(회원인증, 홈페이지 로그인, 포인트 조회, 포인트 적립, 포인트 사용, 포인트 조정, 포인트 전환 등), 카드 발급, 호텔 상품 및 서비스 구매, 정보 변경 등
3) 유효기간 경과 이후: 분리 저장 및 관리
가. 분리 저장 및 관리: 파기에 준하는 조치의 일환으로, 장기 미 이용자의 개인정보를 일반회원의 개인정보 DB와 분리하여 별도 저장/관리하고, 일반 직원의 접근 권한을 제한합니다.
나. 유효기간 도래 통지: 유효기간 만료 30일 전까지 e-mail, SMS 등으로 개인정보가 파기 또는 분리 및 보관되는 사실 및 일시, 개인정보 항목을 해당 회원에게 통지합니다.
다. 유효기간 경과 이후 회원이 멤버십 서비스를 이용할 경우, 이를 재이용 요청으로 간주하여 분리 저장/관리 상태에서 정상 이용 상태로 원복합니다.

4. 개인정보 보유 기간 및 파기시점 회원의 개인정보는 개인정보처리방침 제 2조 개인정보 수집 및 이용 목적의 보유기간이 달성되거나, 고객이 별도 요청할 경우 파기하는 것을 원칙으로 합니다. 다만 아래의 경우 관련 근거에 의해 개인 정보를 보존합니다.
- 보유&bull;이용 기간: 상거래이력
- 보존 근거: 상법, 전자상거래 등에서의 소비자보호에 관한 법률
- 보존기간
ㆍ소송이나 법적 분쟁 관련 사항의 근거 자료에 관한 기록: 10년
ㆍ계약 또는 청약 철회 등에 관한 기록 : 5년
ㆍ소비자의 불만 또는 분쟁처리에 관한 기록: 3년(전자상거래 등의 소비자 보호에 관한 법률)
ㆍ신용정보의 수집처리 및 이용 등에 관한 기록: 3년(신용정보의 이용 및 보호에 관한 법률)
요금의 과납 또는 미납이 있을 경우와 분쟁이 있을 경우 해결시 까지 보유합니다.

5. 귀하께서는 본 개인정보 수집 및 이용 동의에 대해 거부할 권리가 있으며, 동의 거부 시 회원가입에 제한이 있을 수 있음을 알려드립니다.
			</textarea>
		</div>
		
			<div>
				<button type="submit" id="btn">등록</button>
			</div>
		
		</form:form>
	
	</div> <!-- container end -->	
		
<script type="text/javascript">
	$(document).ready(function() {
		$("#btn").click(function() {
			var title = $("#title").val();
			var contents = $("#contents").val();
			var writer = $("#writer").val();
			var email = $("#email").val();
			
			if(title == "") {
				alert("제목을 입력하세요.");
				$("#title").focus();
				return false;
			}
			if(contents == "") {
				alert("내용을 입력하세요.");
				$("#contents").focus();
				return false;
			}
			if(writer == "") {
				alert("이름을 입력하세요.");
				$("#writer").focus();
				return false;
			}
			if(email == "") {
				alert("이메일을 입력하세요.");
				$("#email").focus();
				return false;
			}
			if(!($("#a1").is(":checked"))) {
				alert("약관에 동의해주세요.");
				$("#a1").focus();
				return false;
			}
			return true;
		});
	});	
	
/* 	$("#btn").click(function() {
		if(confirm("글 작성 하시겠습니까?") == true) {
			alert("등록되었습니다.")
		}else {
			return ;
		}
	}); */
	
	
</script>		
		
<c:import url="../temp/footer.jsp"/>		
</body>
</html>