<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <!-- Kakao Script -->
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1><spring:message code="test" text="DefaultMasseage"></spring:message>  Login Form</h1>
		<h1><spring:message code="test2" text="No Code"></spring:message> </h1>
		<form action="./memberLogin" method="post">
		  <div class="form-group">
		    <label for="id">ID:</label>
		    <input type="text" value="admin" class="form-control" id="id" name="id">
		  </div>
		  <div class="form-group">
		    <label for="password">PASSWORD:</label>
		    <input type="password" value="admin" class="form-control" id="pw" name="pw">
		  </div>
		  
		  
		  <button type="submit" class="btn btn-default">Login</button>
		</form>
		
	</div>
	
	<!-- Kakao Login Button -->
	
	
	<!-- <div class="container">
		<div>
			<a id="kakao-login-btn"></a>
   			<button class="btn btn-danger" id="kalogout">LogOut</button>
		</div>
	</div>
	 -->
	
	<!-- Kakao Button Script -->
	
	
	
	<script type="text/javascript">
		
	
	/* var to="Bearer ";
	     //<![CDATA[
	       // 사용할 앱의 JavaScript 키를 설정해 주세요.
	       Kakao.init('ba0b1f34ab5f65aee9c2a5f8a254b5d8');
	       // 카카오 로그인 버튼을 생성합니다.
	       Kakao.Auth.createLoginButton({
	         container: '#kakao-login-btn',
	         success: function(authObj) {
	           		console.log(authObj);
	           		to=to+authObj.access_token;
	        	 alert(JSON.stringify(authObj));
	         },
	         fail: function(err) {
	            alert(JSON.stringify(err));
	         }
	       });
	       
	       $("#kalogout").click(function() {
				$.ajax({
					url:"../sns/logout_kakao",
					type:"post",
					data:{
						to:to
					},
					success:function(data){
						alert(data);
					}
					
				})
			}); */
	      
	      
	       
	       
	       
	      /*  $("#kalogout").click(function() {
	    	   $.ajax({
	    		    url: 'https://kapi.kakao.com/v1/user/logout',
	    		    headers: {
	    		        "Authorization": to,
	    		        "Access-Control-Allow-Origin":"*"
	    		    },
	    		    contentType: "application/json; charset=utf-8",
	    		    method: 'POST',
	    		    success: function(data){
	    		      console.log('succes: '+data);
	    		    }
	    		  });

			}); */
	       
	     //]]>
	</script>

</body>
</html>