<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/header.jsp" />
<style type="text/css">
	input[type="checkbox"] {
		opacity: inherit;
		display: inline-block;
    	float: none;
    	margin-right: 0;
    	width: 1em;
    	-webkit-appearance:checkbox;
	}
	 input[type="radio"] {
	 	-webkit-appearance:radio;
	 	opacity: inherit;
		display: inline-block;
    	float: none;
    	margin-right: 0;
    	width: 1em;
	 }
	 input[type="text"] {
	 	width: 20%; color:black; display: inline-block;
	 }
	
	 input {
	 	color:black;
	 }
	 .file {
	 	display: block;
	 }
	 .input{
	 	width: 100px;
	 }
	::-webkit-input-placeholder {
		color:gray !important;
		opacity: 1.0;
	}
	.label { 
		width:80px; margin-right: 30px; display:inline-block; 
	}

</style>
</head>
<body>
<div class="container">
		<div class="form-group">
			<label> 프로필 사진</label>
			<input type="image" src="../resources/member/">
		</div>
	<form:form commandName="approvalVO" id="frm">
	
		<div class="form-group">
			<label for="id" class="label">ID : </label>
			<form:input path="id" value="${member.id }" readonly="true" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label for="nickName" class="label">별명 : </label>
			<form:input path="nickName" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<label>신분/학력 인증</label>
			<label> 소속된 대학이나 졸업한 대학을 인증해주세요. 없으시면 신분증인증을 해주시면 됩니다(필수) </label>
			<form:radiobutton path="confirmType" value="대학 인증"/> 대학 인증 
			<form:radiobutton path="confirmType" value="대학원 인증"/> 대학원 인증 
			<form:radiobutton path="confirmType" value="신분증 인증"/> 신분증 인증
		</div>
		<div class="form-group">
			<form:input path="college" cssClass="form-control input" placeholder="학교(대학)" />
			<form:input path="major" cssClass="form-control input" placeholder="학과"/>
		</div>
		<div class="form-group">
			<label> 학력 인증(필수) - 학생증, 재학증명서, 졸업증명서 </label>
			<input type="file" class="file" id="certificate" name="certificate">
		</div>
		<div class="form-group">
			<form:radiobutton path="colStatus" value="재학" /> 재학
			<form:radiobutton path="colStatus" value="졸업"/> 졸업
			<form:radiobutton path="colStatus" value="수료"/> 수료
		</div>
		<div class="form-group">
			<input type="text" name="kind" class="form-control input" placeholder="예) 토플, 입상 경력, GTQ 1급 ,..."/>
			<input type="file" class="file" id="license" name="license">
		</div>	
		<form:button> 승인 요청 </form:button>
	
	
	</form:form>

</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	















</div>




<c:import url="../temp/footer.jsp"/>

</body>
</html>