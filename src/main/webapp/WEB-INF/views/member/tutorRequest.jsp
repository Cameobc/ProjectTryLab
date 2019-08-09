<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
	 	width: 20%; color:black; display: inline-block; margin-right: 30px;
	 }
	 input[type=file] {
	 	display: inline-block; 
	 }
	
	 input {
	 	color:black;
	 }
	 label {
	 	color : black;
	 }

	 .container {
	 	margin-top: 50px;
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
		width:100px; color:black; margin-bottom: 30px;
	}
	.form-group {
		margin-bottom: 30px;
	}
	.ihead {
		width: 340px; margin-right: 30px;  display: inline-block;
	}
	.field {
		margin: 30px 0 30px 370px; 
	}
	.file_wrap {
		margin: 20px 30px 20px 0; display: inline-block;
	} 
	.btn_wrap {
		width: 50%; height: 100px; margin: 0 auto;
	}	

	#btn {
		width : 120px; height: 50px; margin:0 auto;
	 	background-color: #f6755e;	 display: block;
	 	
	}
	#btn_label {
		font-family: "Helvetica Neue",Helvetica,Arial,sans-serif; text-align: center;
		font-size: 30px;
	}

</style>
</head>
<body>
<div class="container">
		<!-- 
		<div>
			<input type="hidden" value="${member.id }">
			<label for="profile" class="label" >프로필 사진</label>
			
			<img id="profile" src="../resources/member/${member.memberFileVO.fname}" style="width:100px; height:100px;">
			<input type="file" name="photo" id="photo">
		</div>
		
		-->
		<form:form commandName="approvalVO" id="frm" enctype="multipart/form-data">
	
		<div class="form-group">
			<div class="ihead">
			<label for="id" class="label">ID : </label>
			</div>
			<form:input path="id" value="${member.id }" readonly="true" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<div class="ihead">
			<label for="nickName" class="label">별명 : </label>
			</div>
			<form:input path="nickName" cssClass="form-control"/>
		</div>
		<div class="form-group">
			<div class="ihead">
			<label class="label">신분/학력 인증</label>
			</div>
			<label class="label"> 소속된 대학이나 졸업한 대학을 인증해주세요. 없으시면 신분증인증을 해주시면 됩니다. (필수) </label>
			<div class="field">
					<label class="label"><form:radiobutton path="confirmType" value="대학 인증"/>대학 인증</label>
					<label class="label"><form:radiobutton path="confirmType" value="대학원 인증"/>대학원 인증 </label>
					<label class="label"><form:radiobutton path="confirmType" value="신분증 인증"/>신분증 인증</label>
			</div>
		
		</div>
		<div class="form-group">
			<div class="ihead">
				<label class="label">대학 / 학과 : </label>
			</div>
			<form:input path="college" cssClass="form-control input" placeholder="학교(대학)" />
			<form:input path="major" cssClass="form-control input" placeholder="학과"/>
		</div>
		<div class="form-group">
			<div class="ihead">
				<label class="label"> 학력 인증(필수) - 학생증, 재학증명서, 졸업증명서 </label>
				<label class="label"> 인증할 파일을 업로드해주세요.</label>
			</div>
			<div class="file_wrap">
				<input type="file" class="file" id="certificate" name="certificate">
			</div>
		</div>
		<div class="form-group">
			<div class="ihead">
				<label class="label">학적 상태</label>
			</div>
				<label class="label"><form:radiobutton path="colStatus" value="재학" /> 재학</label>
				<label class="label"><form:radiobutton path="colStatus" value="졸업"/> 졸업</label>
				<label class="label"><form:radiobutton path="colStatus" value="수료"/> 수료</label>
				<label class="label"><form:radiobutton path="colStatus" value="기타"/> 기타 (신분증)</label>

		</div>
		<div class="form-group">
			<div class="ihead">
				<label class="label">자격증</label>
			</div>
				<input type="text" name="kind" class="form-control input" placeholder="예) 토플, 입상 경력, GTQ 1급 ,..."/>
			<div class="file_wrap">
				<input type="file" class="file" id="license" name="license">
			</div>
		</div>	
		<div class="btn_wrap">
			<label class="btn_label"><form:button id="btn">승인 요청</form:button></label>
		</div>
		
	</form:form>

</div>


<script type="text/javascript">



</script>
	
	
	
	






<c:import url="../temp/footer.jsp"/>

</body>
</html>