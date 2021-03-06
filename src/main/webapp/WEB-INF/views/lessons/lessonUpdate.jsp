<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<title>수업수정</title>

<link rel="stylesheet" href="../resources/css/style.css">
<c:import url="../temp/boot.jsp" />
<c:import url="../temp/header.jsp" />
<c:import url="../temp/summernote.jsp" />
<c:import url="../temp/font.jsp"/>

<style type="text/css">
@font-face {
	font-family: 'BMHANNAPro';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.0/BMHANNAPro.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

td{
	background-color: white;
}
button {
	color :black !important;
}

body {
	background-color: #ffeeeb;
}
.container{
	padding-top: 50px;
	height:2000px;
}
.main {
	width: 100%;
	padding-top: 20px;
	padding-bottom: 50px;
	font-family: 'Youth';
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
	width: 100%;
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
	font-size: 17px;
	font-family: BMHANNAPro;
	font-weight: 500;
	display: block;
}
.step{
	font-family: BMHANNAPro;
	color: #f6755e;
}
.tdWidth{
	width: 10%;
	background-color: #ffd6cf; 
	text-align: center;
	
}

.note-editable{
	height:920px;
}
.note-editor.note-frame {
	border: 1px solid #d1d1d1;
	height:920px;
}

.datepicker-title {
	font-family: 'BMHANNAPro';
	font-weight: 500;
}
.btnField{
	clear:both;
	text-align: center;
	vertical-align: middle;
	font-family: BMHANNAPro;
	font-weight: 500;
	padding-bottom: 100px;
	padding-top: 50px;
}
.btn_style{
	display: inline-block;
    width:15%;
    height: 50px;
    font-size: 16px;
    background-color: #f6755e;
    line-height: 50px;
    color:white;
    font-family: 'Youth';
    color:white;
}
.fieldd{
	background-color: yellow;
	width:50px;
	height:30px;
}
.addTimetable{
	float:right;
	background-color: white;
	width:400px;
	height:450px;
	border-radius: 4px;
	font-size: 14px;
}
#timeField{
	padding:15px;
	height:335px;
	font-family: 'Youth';
	color: #333;
	font-size:16px;
}
.fontstyle{
	color: #f6755e;
	text-align: center;
}
.table{
	margin: 0px;
}
.trstyle{
	height:20px;
	text-align: center;
}
.xstyle{
	border: none;
	background-color: white;
}

</style>
<script language="javascript">
	// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
	//document.domain = "abc.go.kr";

	function goPopup() {
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("./jusoPopup", "pop",
				"width=570,height=420, scrollbars=yes, resizable=yes");

		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
		//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	}

	function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail,
			roadAddrPart2, engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,
			detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn,
			buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo) {
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.location2.value = roadFullAddr;
		document.form.location.value = sggNm;
	}
</script>
</head>
<body>

	<div class="container">
		<h2 class="step">Step1. 수업 정보 입력</h2>
		<div class="main">
			<div>
				<form name="form" id="form" method="post" enctype="multipart/form-data">
					<table id="frmTable" class="table" style="background-color: #ffffff; padding:5px;">
					<tr>
						<td class="tdWidth"><label>수업명</label></td>
						<td colspan="7"><input type="text" name="title" class="form-control" value="${lesson.title }"/></td>
					</tr>
					<tr>
						<td class="tdWidth"><label>튜터ID</label></td>
						<td><input type="text" name="tid" class="form-control" value="${lesson.tid }" readonly="readonly"/></td>
						<td class="tdWidth"><label>가격</label></td>
						<td><input type="text" name="price" class="form-control" value="${lesson.price }"/></td>
						<td class="tdWidth"><label>수업 시간(분)</label></td>
						<td><input type="text" name="time" id="time" class="form-control" value="${lesson.time }"/></td>
						<td class="tdWidth"><label>Category</label></td>
						<td>
							<select name="category_id" class="form-control" >
							<c:forEach items="${category }" var="c">
								<c:choose>
								<c:when test="${c.category_id eq lesson.category_id}">
									<option value="${c.category_id }" selected="selected">${c.category }</option>
								</c:when>
								<c:otherwise>
									<option value="${c.category_id }">${c.category }</option>							
								</c:otherwise>
								</c:choose>
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="tdWidth"><label>수업 장소</label></td> 
						<td colspan="5">
							<input type="text" id="location2" name="location2" onclick="goPopup();" class="form-control" value="${lesson.location }"/>
							<input type="hidden" id="location" name="location" class="form-control"/>
						</td>
						<td class="tdWidth"><label>정원</label></td>
						<td><input type="text" id="limit" name="limit" class="form-control" value="${lesson.limit }"></td>
					</tr>
					<tr>
						<td class="tdWidth"><label>설명</label></td>
						<td colspan="7" style="height:1000px; vertical-align: top;"><textarea id="contents" name="contents"></textarea></td>
					</tr>		
					<tr>
						<td class="tdWidth"><label>썸네일</label></td>
						<td colspan="7">
							<div id="thumbField">
							<div class="input-group col-lg-9">
								<c:forEach items="${lesson.file }" var="f">
								<c:if test="${f.thumbnail eq 1 }">
								<input type="text" name="thumbnail1" class="form-control" title="${f.fnum }" readonly="readonly" value="${f.oname }">
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-remove del"></i>
								</span>
								</c:if>
								</c:forEach>
							</div>
							</div>
						</td>
					</tr>
					<tr>
						<td class="tdWidth"><label>사진</label></td>
						<td colspan="7">
							<div id="fileField">
							<c:forEach items="${lesson.file }" var="f">
							<c:if test="${f.thumbnail eq 0 }">
							<div class="input-group col-lg-9 fField">
								<input type="text" name="f11" class="form-control" readonly="readonly" title="${f.fnum }" value="${f.oname }">
								<span class="input-group-addon"><i class="glyphicon glyphicon-remove del" ></i></span>
								<span class="input-group-addon" style="background-color: #f0ad4e;  height:30px;"><i class="glyphicon glyphicon-plus add" style="color:white;"></i></span>
							</div>	
							</c:if>
							</c:forEach>
							</div>
						</td>
					</tr>	
					</table>
					
					<div id="hiddenField">
					
					</div>
				</form>
				
			</div>
			<!-- end of lcontainer -->
		</div>
		<script type="text/javascript" src="../resources/js/summernote.js" ></script>
		<!--  end of main -->
		
		<!-- <br><br><br> -->
		<!-- 날짜선택 -->
		<h2 class="step">Step2. 날짜선택</h2>
		<div class="main">
			<c:import url="../utils/dateTimePicker.jsp" />
			<div class="addTimetable">
				<div class="datepicker-header" style="background-color: #f6755e;border-radius: 4px;">
					<div class="datepicker-title">수업 스케줄</div>
					<div class="datepicker-subheader">최대 7개까지 등록 가능</div>
				</div>
				<div id="timeField">
					<table class="table" id="timetb">
						<tr class="fontstyle">
							<td>수업일</td>
							<td>시작시간</td>
							<td>종료시간</td>
							<td></td>
						</tr>
						<c:forEach items="${lesson.timetable }" var="time">
						<tr class="trstyle">
								<td>${time.class_date }</td>
								<td>${time.startTime }</td>
								<td>${time.endTime }</td>
								<td><span class="input-group-addon xstyle"><i class="glyphicon glyphicon-remove xdel" title="${time.idx }"></i></span></td>
						</tr>
						</c:forEach>
					</table>
				</div>
				<div class="save-button" id="addbutton" style="float: right; ">스케줄 추가</div>
				
			</div>
		</div>
		<div class="btnField"><input type="button" id="LessonBtn" class="btn_style" value="수정"/></div>
		
	</div>
	<!-- end of container -->
 
	<script type="text/javascript">
		var idx=0;
		$("#addbutton").click(function() {
			change();	
		});
		
		$("#contents").summernote('code','${lesson.contents}');
		
		$("#LessonBtn").click(function() {
			//다른 input들 검증
			if($("#contents").summernote("isEmpty")){
				alert("수업 설명을 입력해주세요.");
			}else{
				$("#form").submit();
			}
			
		});
		
		function change() {
			var txt = $(".s2").text().split(' ');
			var time = $("#gettime").text().split(' '); // 10:30 am 
			var time2 = time[0].split(":"); // 10 30
			var endtime = $("#time").val()*1;
			
			var day=["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];
			var kday=["월요일","화요일","수요일","목요일","금요일","토요일","일요일"];
			var month=["January","February","March","April","May","June","July","August","September",
					"October","November","December"];
			var kmonth=["01","02","03","04","05","06","07","08","09","10","11","12"];
			var date=["01","02","03","04","05","06","07","08","09"];
			
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
			
			for(var i=0;i<9;i++){
				if(txt[2]==i+1){
					txt[2]=date[i]; 
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
			
			if(idx<7){
				$("#timetb").append('<tr class="trstyle">'+
						'<td>'+txt+'</td>'+
						'<td>'+time+'</td>'+
						'<td>'+endtime+'</td></tr>');
				$("#hiddenField").append(
					'<input type="hidden" class="class_date" name="class_date" value='+txt+'>'+
					'<input type="hidden" class="startTime" name="startTime" value='+time+'>'+
					'<input type="hidden" name="endTime" class="endTime" value='+endtime+'>'
				);
				idx++;
			}else{
				alert("스케줄은 7개까지만 등록 가능합니다.");
			}
			
			
		}
		var count=0;
		var fnum=0;
	
		$("#thumbField").on("click",".del",function(){
			fnum = $(this).parent().prev().attr("title")*1;
			console.log("thumbnail:"+fnum);
			deleteFiles(fnum);
			$(this).parent().parent().remove();
			$("#thumbField").append('<div class="input-group col-lg-9">'
					+'<input type="file" name="thumbnail" class="form-control">'
					+'<span class="input-group-addon"><i class="glyphicon glyphicon-remove del" ></i></span>'
				+'</div>');
		});
		
		$("#fileField").on("click",".add",function() {
			if(count<4){
				$("#fileField").append('<div class="input-group col-lg-9 fField">'
						+'<input type="file" name="f1" class="form-control">'
						+'<span class="input-group-addon"><i class="glyphicon glyphicon-remove ddel" ></i></span>'
					+'<span class="input-group-addon" style="background-color: #f0ad4e;  height:30px;"><i class="glyphicon glyphicon-plus add" style="color:white;"></i></span></div>');
			 	
				count++;
			}else if(count==4){
				alert("첨부파일은 최대 5개까지 가능합니다.");
			}
		});
		
		$("#fileField").on("click", ".del", function() {
			
			fnum = $(this).parent().prev().attr("title")*1;
			console.log("fnum:"+fnum);
			deleteFiles(fnum);
			
			$(this).parent().parent().remove();
			$("#fileField").append('<div class="input-group col-lg-9 fField">'
					+'<input type="file" name="f1" class="form-control">'
					+'<span class="input-group-addon"><i class="glyphicon glyphicon-remove ddel" ></i></span>'
				+'<span class="input-group-addon" style="background-color: #f0ad4e;  height:30px;"><i class="glyphicon glyphicon-plus add" style="color:white;"></i></span></div>');
		 	});
		
		$("#fileField").on("click", ".ddel", function() {
			$(this).parent().parent().remove();
			count--;
		});
		
		/* $("#timetb").on("click",".xdel", function() {
			 $(this).parent().parent().remove; 
			alert("click");
		}); */
		$(".xdel").click(function() {
			var idx=$(this).attr("title");
			$(this).parent().parent().parent().remove();
			
			$.ajax({
				url:"./lessonDeleteTime",
				method:"get",
				data:{
					class_id:"${lesson.class_id}",
					idx:idx
				},
				success:function(res){
					res=res.trim();
					if(res!='1'){
						alert("fail");
					}
				}
			});
			
			
		});
		
		function deleteFiles(fnum) {
			$.ajax({
				url:"../ajax/lessonFileDelete",
				method:"post",
				data:{
					fnum:fnum
				},
				success:function(res){
					res=res.trim();
					if(res=='1'){
						console.log("첨부파일 삭제 성공");
					}else{
						console.log("첨부파일 삭제 실패");
					}
				}
			});
		}
	</script>

	<script src='https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular.min.js'></script>
	<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>

</body>
</html>