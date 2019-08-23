<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"/>
<link rel="stylesheet" href="../resources/css/qnaList.css" />
<c:import url="../temp/header.jsp" />
</head>
<body>

	<div class="container">
		<div id="FAQ">FAQ</div>
		<div id="FAQ_sub">
		자주 문의하는 질문에 대한 답변을 
		<br>
		확인하실 수 있습니다.</div>
		<br><br>

		<div class="search">
			<form action="./qnaList" class="form-inline">
				<div class="form-group col-sm-4">
					<select class="form-control" name="kind" id="kind">
						<option class="k" value="1">제목</option>
						<option class="k" value="2">작성자</option>
						<option class="k" value="3">내용</option>
					</select>
				</div>

			    <div class="form-group col-sm-8">
			        <div class="input-group">
			            <input type="text" class="form-control" name="keyword" id="keyword" value="${pager.search}" placeholder="Search">
			            <span class="input-group-btn">
			                <button type="button" class="btn btn-danger btn-flat" id="searchBtn">
			                    <i class="fa fa-search"></i> 검색
			                </button>
			            </span>
			        </div>
			    </div>
			    
			</form>
		</div>	<!-- search end -->

	
	
	<div>
	  <table class="table table-hover">
	    <thead>
	      <tr class="title" style="border-top: 1px solid #9c836a;">
	        <th style="padding-top: 15px; padding-bottom: 15px;">No</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">제목</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">작성자</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">작성시간</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">조회수</th>
	      </tr>
	    </thead>
	    
	  	<c:forEach items="${list}" var="dto">
		    <tbody>
		      <tr>
		        <td style="padding-top: 20px; width:120px;">${dto.num}</td>
		        <td style="padding-top: 20px; padding-left:50px; cursor: pointer;" onclick="location.href='./qnaSelect?num=${dto.num}'">
		        	<c:forEach begin="1" end="${dto.depth}">&nbsp;&nbsp;&nbsp;[RE] </c:forEach>${dto.title}
		        </td>
		        <td style="padding-top: 20px; width:120px; text-align: center; color: #999;">${dto.writer}</td>
		        <td style="padding-top: 20px; width:120px; text-align: center; color: #999;">${dto.reg_date}</td>
		        <td style="padding-top: 20px; width:120px;">${dto.hit}</td>
		      </tr>
		    </tbody>
	  	</c:forEach> 	    
	   </table>
	   
	   	<div id="btn" OnClick="location.href='./qnaWrite';">1:1문의 하기</div>
	   	
	</div>
	</div> <!-- container end -->
	
	<div>
		<ul class="pager">
			<c:if test="${pager.curBlock>1}">
		    	<li><a href="./qnaList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" style="color: black;">뒤로</a></li>
			</c:if>
			
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li><a href="./qnaList?curPage=${i}&kind=${pager.kind}&search=${pager.search}" style="color: black;">${i}</a></li>
			</c:forEach>
			
			<c:if test="${pager.curBlock < pager.totalBlock}">
				<li><a href="./qnaList?curPage=${pager.startNum+1}&kind=${pager.kind}&search=${pager.search}" style="color: black;">다음</a></li>
			</c:if>
  		</ul>
	</div>
	
		
<script type="text/javascript">
	
	//검색창에 기록남기
	$(function() { 
		var kind = '${pager.kind}';
		$(".k").each(function() {
			if($(this).val() == kind) {
				$(this).prop("selected", true);
			}
		});
	});

	$(document).on('click', '#searchBtn', function(e){
		e.preventDefault();
		var url = "./qnaList";
		url = url + "?kind=" + $('#kind').val();
		url = url + "&search=" + $('#keyword').val();
		location.href = url;
		console.log(url);
	});

	
</script>	
	
	
<c:import url="../temp/footer.jsp"/>	
</body>
</html>