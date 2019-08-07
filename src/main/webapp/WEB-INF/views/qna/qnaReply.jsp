<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"/>
</head>
<body>
	<div class="container">
	<form action="./qnaReply" id="frm" method="post">
		<input type="hidden" name="num" value="${num}">
	
			<div class="from-group">
				<label for="writer">Writer:</label>
		      	<input type="text" class="form-control" id="writer" name="writer">
			</div>
	
			<div class="from-group">
				<label for="title">Title:</label>
		    	<input type="text" class="form-control" id="title" name="title">
			</div>

		     <div class="form-group">
		     	<label for="contents">Contents:</label>
		     	<textarea class="form-control" id="contents" rows="15" cols="" name="contents"></textarea>
		    </div>
		    
		    <input type="button" class="btn btn-default" id="write" value="댓글작성">
	
	</form>
	
	
	</div> <!-- container end -->
	
<script type="text/javascript">
	$("#write").click(function() {
		$("#frm").submit();
	});
</script>	

</body>
</html>