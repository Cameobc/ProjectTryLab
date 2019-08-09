<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="../../resources/css/style.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">

<link rel="stylesheet" href="../resources/css/style.css">
<c:import url="../temp/boot.jsp"/>
<c:import url="../temp/header.jsp" />
<c:import url="../temp/summernote.jsp" />

<style type="text/css">
@font-face {
	font-family: 'BMHANNAPro';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.main {
	width: 100%;
	padding-top: 50px;
}

body {
	background-color: #ffeeeb;
}

.lcontainer {
	width: 50%;
	float: left;
}
.rcontainer {
	width: 50%;
	float: right;
}

.form-control2 {
	display: block;
	width: 90%;
	height: 30px;
	border: 0;
	outline: 0;
	background: #ffeeeb;
	border-bottom: 2px solid #f6755e;
	color: #f6755e;
}

label {
	color: #f6755e;
	size: 23px;
	font-size: 20px;
	font-family: BMHANNAPro;
	font-weight: 500;
	display:block;
}
.container {
	height: 800px;
}
.note-editing-area{
	height:600px;
}
.note-editor.note-frame{
	border: 1px solid #d1d1d1;
}
.datepicker-title{
	font-family: 'BMHANNAPro';
	font-weight: 500;
}
</style>
<script type="text/javascript">

function goPopup(){

// 주소검색을 수행할 팝업 페이지를 호출합니다.

// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.

var pop = window.open("./jusoPopup","pop","width=590,height=420, scrollbars=yes, resizable=yes"); 



// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.

//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 

}



function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){

    // 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.

	document.frm.roadAddrPart1.value = roadFullAddr; // 도로명주소
	
	//$("#roadAddrPart1").val(decodeURI(encodeURI(roadFullAddr)));
//	$("#roadAddrPart1").val(roadAddrPart1);
	alert($("#roadAddrPart1").val());
	//	pop.close();

}
</script>
</head>

<body>
	<div class="container">
		<div class="main">
			<div class="lcontainer">
				<!-- 폼 입력 -->
				<form:form commandName="lessonVO" id="frm" name="frm" enctype="multipart/form-data">
					<div class="form-group">
						<label class="form-grop">수업명</label>
						<form:input path="title" cssClass="form-control2"/>
						<form:errors path="title"></form:errors>
					</div>
					<div class="form-group">
						<label class="form-grop">튜터ID</label>
						<form:input path="tid" cssClass="form-control2" />
						<form:errors path="tid"></form:errors>
					</div>
					<div class="form-group" style="float: left; width: 50%;">
						<label class="form-grop">가격</label>
						<form:input path="price" cssClass="form-control2"/>
						<form:errors path="price"></form:errors>
					</div>
					<div class="form-group" style="float: left; width: 50%;">
						<label class="form-grop">Category</label><br>
						<form:select path="category" class="selectpicker">
							<c:forEach items="${category }" var="c">
								<form:option value="${c.category }"></form:option>
							</c:forEach>
						</form:select>
						<form:errors path="category"></form:errors>
					</div>
					<div class="form-group">
							<label class="form-grop">수업 시간(분)</label>
							<form:input path="endTime" cssClass="form-control2" style="width:45%"/>
							<form:errors path="endTime"></form:errors>
					</div>
					<div class="form-group">
						<label class="form-grop">강의 설명</label>
						<form:textarea path="contents" cssClass="form-control" id="contents"/>
						<form:errors path="contents"></form:errors>
					</div>
					<div class="form-group">
						<form:hidden path="class_date" id="class_date"/>
						<form:errors path="class_date"></form:errors>
					</div>
					<div class="form-group">
						<form:hidden path="startTime" id="startTime"/>
						<form:errors path="startTime"></form:errors>
					</div>
					
			
			<script type="text/javascript" src="../resources/js/summernote.js" ></script>
			</div>
			<!--  lcontainer -->

			<div class="rcontainer">
				<div class="form-group">
						<label class="form-grop">장소</label>
						<input class="form-control2" readonly="readonly" name="roadAddrPart1" id="roadAddrPart1" onclick="goPopup();"/>
						
				</div>
				</form:form>
			</div>
				<!-- 날짜선택 -->
				<c:import url="../utils/dateTimePicker.jsp" />
				<div>
					<input type="button" id="LessonBtn" class="btn btn-default" value="test"/>			
				</div>
		</div>
		<!-- main -->
	</div>
	<!-- container -->

	
	<script type="text/javascript">
	
	
		$("#LessonBtn").click(function() {
			
			change();
			//다른 input들 검증
			if($("#contents").summernote("isEmpty")){
				alert("Empty");
			}else{
				$("#frm").submit();
			}
			
		});
		
		function change() {
			var txt = $(".datepicker-subheader").text().split(' ');
			var time = $("#gettime").text().split(' '); // 10:30 am 
			var time2 = time[0].split(":"); // 10 30
			var endtime = $("#endTime").val()*1;
			
			var day=["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];
			var kday=["월요일","화요일","수요일","목요일","금요일","토요일","일요일"];
			var month=["January","February","March","April","May","June","July","August","September",
					"October","November","December"];
			var kmonth=["01","02","03","04","05","06","07","08","09","10","11","12"];
			
			for(var i=0;i<12;i++){
				if(txt[1]==month[i]){
					txt[1]=kmonth[i];//영어를 숫자로 변환
				}
			}
			
			for(var i=0;i<7;i++){
				if(txt[0]==day[i]){
					txt[0]=kday[i]; //영어요일 한국어요일로 변환
				}
			}
			
			if(time[1]=="pm"){
				time2[0] = time2[0]*1+12;
			}
			
			time=time2[0]+":"+time2[1];
			txt=txt[3]+"-"+txt[1]+"-"+txt[2];
			
			var minutes =time2[1]*1+(endtime%60);
			if(minutes==0){
				minutes="00";
			}
			endtime=(time2[0]*1+parseInt(endtime/60))+":"+minutes;
			$("#class_date").val(txt);
			$("#startTime").val(time);
			$("#endTime").val(endtime);
			alert(txt); alert(time); alert(endtime);
			
		}
	</script>
	<!-- footer -->
	
	<script src='https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular.min.js'></script>
	<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>


</body>
</html>