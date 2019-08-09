<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/qnaSelect.css" />
<c:import url="../temp/header.jsp" />
</head>
<body>

	<div class="container">
		<div id="qna">FAQ</div>

	<div id="title">
	<table style="margin-bottom: 0px;">
		<tr>
			<td width="70%" style="padding-left: 0px;">${dto.title}</td>
			<td width="30%" id="date">${dto.reg_date}</td>
		</tr>
	</table>
	</div>
	<br>
		<div class="buttons">
			<a href="./qnaUpdate?num=${dto.num}" class="btn btn-outline-dark">수정</a>
			<a href="./qnaDelete?num=${dto.num}" class="btn btn-outline-danger">삭제</a>
		
		
			<%-- <a href="./qnaUpdate?num=${dto.num}"><button type="button" class="btn btn-outline-dark">수정</button></a>
			<a href="./qnaDelete?num=${dto.num}"><button type="button" class="btn btn-outline-danger">삭제</button></a> --%>
		</div>
		<div id="contents">${dto.contents}</div>
		
		<!-- 파일보여주기 -->
		<div>	
		
		</div>
		
	<br><br>
		<div id="line"></div>
	<br>	
		<div id="reply">
			<a href="./qnaReply?num=${dto.num}" class="btn btn-outline-dark">답글 작성</a>
		</div>
		<div id="btn" OnClick="location.href='./qnaList';">목록</div>


<!-- 
		<h1>제목 : ${dto.title}</h1>
		<h1>작성자 : ${dto.writer}</h1>
		<h1>내용 : ${dto.contents}</h1>
		
		<c:forEach items="${dto.files}" var="file">
			<input type="button" title="${file.fname}" value="${file.oname}">
		</c:forEach>
 -->	
	
	</div> <!-- container end -->

<script type="text/javascript">
	/* function deleteCheck() {
		var msg = confirm("정말 삭제하시겠습니까?");
		if(msg == true) {
			alert("삭제되었습니다.");
		}else {
			return false;
		}
	} */

</script>
<c:import url="../temp/footer.jsp"/>
</body>
</html>