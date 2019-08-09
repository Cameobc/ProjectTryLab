<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	h1 {
		color : black;
	}
	body {
		width: 100%;
		color : black;
	}
	.pwrap {
		 width:100%; height: 120px; display: inline-block;
	}
	.pwrap > label {
		vertical-align: bottom; font-size: 23px; font-weight: 600; display: inline-block; margin-bottom: 5px; 
	}
	#profie{
		display: inline-block;
	}
	.container {
		width: 1000px; margin: 0 auto;
	}

	.thead {
		vertical-align: middle !important; width: 20%;
	}
	.con {
		width: 65%; vertical-align: middle !important;
	}
	.thead >p {
		font-weight: 700; font-size: large;  text-align: center; margin: 0 auto;
	}
	.btn_wrap {
		width : 50%; height: 130px;
	}

</style>
</head>
<body>
<div class="container">
	<div class="pwrap">
		<img id="profile" src = "../resources/member/${approvalVO.memberFileVO.fname }" style="width:100px; height: 100px" >
		<label class="label">님의 승인 요청입니다.</label>
	</div>


	<div>
	<table class="table table-bordered">
    	<tr>
      		<td class="thead"><p>ID</p></td>
      		<td class="con" id="id">${approvalVO.id }</td>
		<tr>
			<td class="thead"><p>닉네임</p></td>
			<td class="con">${approvalVO.nickName }</td>
    	</tr>
     	<tr>
        	<td class="thead"><p>${approvalVO.confirmType }</p></td>
        	<td class="con"><img src = "../resources/certificate/${approvalVO.certificateVO.fname }" style="width:450px; height: 700px;"></td>
        </tr>
       <c:if test="${approvalVO.college ne null }">
        <tr>
        	<td class="thead"><p>대학 / 학과</p></td>
        	<td class="con">${approvalVO.college } / ${approvalVO.major }</td>
        </tr>
		</c:if>
       <c:if test="${approvalVO.college ne null }">
        <tr>
        	<td class="thead"><p>학적 상태</p></td>
        	<td class="con">${approvalVO.colStatus }</td>
        </tr>
		</c:if>		
		
		<c:if test="${approvalVO.kind ne null }">
		<tr>
        	<td class="thead"><p>자격증</p></td>
        	<td class="con"><p>${approvalVO.kind }</p>
        		<p><img src = "../resources/license/${approvalVO.licenseVO.fname }" style="width: 450px; height: 700px"></p>
        	</td>
        </tr>
        </c:if>
	</table>
	<div class="btn_wrap">
		<button id="reg_btn"> 튜터 등록 </button>
	
	</div>
	
	</div>
</div>

<c:import url="../temp/footer.jsp" />

<script type="text/javascript">


	$('#reg_btn').click(function() {
		var check = confirm("등록하시겠습니까?");
		var id='${approvalVO.id}';
		alert(id);
		
		if(check) {
			$.ajax({
				url:"./gradeUpdate",
				type:"POST",
				data:{
					id:id
				},
				success:function(data) {
					alert("튜터로 등록되었습니다.");
					location.href("./adminMain");
				}
				
			});
		}
	});





</script>

















</body>
</html>