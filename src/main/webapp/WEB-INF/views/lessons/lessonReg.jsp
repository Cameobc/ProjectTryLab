<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<title>수업등록</title>

<link rel="stylesheet" href="../resources/css/style.css">
<c:import url="../temp/boot.jsp" />
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
	text-align: center;
	vertical-align: middle;
	font-family: BMHANNAPro;
	font-weight: 500;
	padding-bottom: 100px;
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
}
.fieldd{
	background-color: yellow;
	width:50px;
	height:30px;
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
						<td colspan="7"><input type="text" name="title" class="form-control" placeholder="강의명을 입력하세요."/></td>
					</tr>
					<tr>
						<td class="tdWidth"><label>튜터ID</label></td>
						<td><input type="text" name="tid" class="form-control"/></td>
						<td class="tdWidth"><label>가격</label></td>
						<td><input type="text" name="price" class="form-control"/></td>
						<td class="tdWidth"><label>수업 시간(분)</label></td>
						<td><input type="text" name="time" id="time" class="form-control" /></td>
						<!-- <td><input type="text" name="endTime" id="endTime" class="form-control" /></td> -->
						<td class="tdWidth"><label>Category</label></td>
						<td>
							<select name="category_id" class="form-control" >
							<c:forEach items="${category }" var="c">
								<option value="${c.category_id }">${c.category }</option>
							</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td class="tdWidth"><label>수업 장소</label></td> 
						<td colspan="7">
							<input type="text" id="location2" name="location2" onclick="goPopup();" class="form-control"/>
							<input type="hidden" id="location" name="location" class="form-control"/>
						</td>
						
					</tr>
					<tr>
						<td class="tdWidth"><label>설명</label></td>
						<td colspan="7" style="height:1000px; vertical-align: top;"><textarea id="contents" name="contents"></textarea></td>
					</tr>		
					<tr>
						<td class="tdWidth"><label>썸네일</label></td>
						<td colspan="7"><div class="input-group col-lg-9"><input type="file" name="thumbnail" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-remove del"></i></span></div></td>
					</tr>
					<tr>
						<td class="tdWidth"><label>사진</label></td>
						<td colspan="7">
							<div id="fileField">
								<div class="input-group col-lg-9" id="fField">
									<input type="file" name="f1" class="form-control">
									<span class="input-group-addon"><i class="glyphicon glyphicon-remove del" ></i></span>
									<span class="input-group-addon" style="background-color: #f0ad4e;  height:30px;"><i class="glyphicon glyphicon-plus add" style="color:white;"></i></span>
								</div>		
							</div>
						</td>
					</tr>	
					</table>
					
					<!-- <div class="btnField"><button class="btn btn-primary">등록</button></div> -->
					<input type="hidden" id="class_date" name="class_date"/>
					<input type="hidden" id="startTime" name="startTime"/>
					<input type="hidden" name="endTime" id="endTime"/>
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
		</div>
		<!-- <div class="fieldd">
			<div class="cancel-button" id="cancelbutton">CANCEL</div>
			<div class="save-button" id="savebutton">SAVE</div>
		</div>  -->
		<div class="btnField"><button id="LessonBtn" class="btn_style">등록</button></div>
		
	</div>
	<!-- end of container -->
 
	<script type="text/javascript">
 	/* $("#cancelbutton").click(function() {
		alert("click cancel");
	}); */
	/* $("#savebutton").click(function() {
		alert("click cancel");
	});  */
	
		$("#LessonBtn").click(function() {
			
			change();
			//다른 input들 검증
			if($("#contents").summernote("isEmpty")){
				alert("수업 설명을 입력해주세요.");
			}else{
				$("#form").submit();
			}
			
		});
		
		function change() {
			var txt = $(".datepicker-subheader").text().split(' ');
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
			$("#class_date").val(txt);
			$("#startTime").val(time);
			$("#endTime").val(endtime);
			
			
		}
		var count=0;
		$("#fileField").on("click",".add",function() {
			
			if(count<4){
				$("#fileField").append('<div class="input-group col-lg-9" id="fField">'
						+'<input type="file" name="f1" class="form-control">'
						+'<span class="input-group-addon"><i class="glyphicon glyphicon-remove del" ></i></span>'
						+'<span class="input-group-addon" style="background-color: #f0ad4e;  height:30px;"><i class="glyphicon glyphicon-plus add" style="color:white;"></i></span>'
					+'</div>');
				count++;
			}else if(count==4){
				alert("첨부파일은 최대 5개까지 가능합니다.");
			}
		});
		
		$("#fileField").on("click", ".del", function() {
			$(this).parent().parent().remove();
			//$(this).remove();
			count--;
		});
		
		
	</script>

	<script src='https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.2/angular.min.js'></script>
	<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>

</body>
</html>