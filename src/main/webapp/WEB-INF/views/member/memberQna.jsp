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
	width: 80%;
	margin: 0 auto;
	margin-top: 50px;
	height: 1000px;
}

.member_navi{
	float:right;
	width: 57%;
	margin : 0 auto;
	margin-right: 10%;
	border-bottom: 2px solid #fcdcd6;
}

.member_top{
	width: 100%;
	margin: 0 auto;
	height: 800px;
}

.welcome{
	font-family: BMJUA;
	font-size: 1.5em;
	padding-top: 15px;
	width: 100%;
	text-align: left;
	margin-top:50px;
}

.welcome span{
	padding-left:30px;
}

.member_thumbnail{
	position: relative;
	width: 100px;
	height: 100px;
	margin-top: 50px;
	float: left;
	margin-bottom: 30px;
}
	
.member_thumbnail .mask{
	position: absolute;
	z-index: 10;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	background: url(../resources/images/profilesub.png) 0 0;
	background-repeat: no-repeat;
}

.qna_info{
	float:right;
	width: 57%;
	margin : 0 auto;
	margin-right: 10%;
}

.pager {
	padding-left: 0;
    margin: 20px 0;
    text-align: center;
    list-style: none;
}

.pager li{
	text-align:center;
	display: inline-block;
    padding: 5px 14px;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 15px;
}

.qna_talbe{
	text-align: center;
	
}

td a{
	color: black;
	text-decoration: none;
}

.td_top{
	font-weight: bolder;
	color : #9c836a;
	border-bottom: 2px solid #ddd;
	border-top: 2px solid #9c836a;
}
</style>
</head>
<body>
<div class="container">
	<div class="member_navi">
		<div class="member_thumbnail">
			<img id="thumbnail" src="../resources/member/${member.memberFileVO.fname}" width="100" height="100">
			<span class="mask"></span>
		</div>
		<div class="welcome">
			<span>${member.id}님의 문의내역</span>
		</div>
	</div>
<c:import url="../temp/mheader.jsp" />	
	<div class="qna_info">
		<table class="qna_talbe">
			<tr >
				<td class="td_top">No</td><td class="td_top">제목</td><td class="td_top">글쓴이</td><td class="td_top">작성일</td>
			</tr>
			<c:forEach items="${qnalist}" var="qna">
				<tr>
					<td><a href="../qna/qnaSelect?num=${qna.num}">${qna.num}</a></td>
					<td><c:forEach begin="1" end="${qna.depth}">[RE] </c:forEach>${qna.title}</td>
					<td>${qna.writer }</td>
					<td>${qna.reg_date }</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<ul class="pager">
				<c:if test="${pager.curBlock>1}">
			    	<li><a href="../qna/qnaList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" style="color: black;">뒤로</a></li>
				</c:if>
				
				<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<c:if test="${i}>0">
					<li><a href="../qna/qnaList?curPage=${i}&kind=${pager.kind}&search=${pager.search}" style="color: black;">${i}</a></li>
				</c:if>
				</c:forEach>
				
				<c:if test="${pager.curBlock < pager.totalBlock}">
					<li><a href="../qna/qnaList?curPage=${pager.startNum+1}&kind=${pager.kind}&search=${pager.search}" style="color: black;">다음</a></li>
				</c:if>
	  		</ul>
		</div>
	</div>
</div>

<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>