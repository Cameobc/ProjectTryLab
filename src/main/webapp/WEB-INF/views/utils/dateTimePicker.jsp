<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Date and Time Picker</title>
  <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
 
  <style type="text/css">
  	.app-container {
  		width:700px;
		position:static;
	}
	.datepicker.am{
		height: 450px;
	}
	.datepicker.pm{
		height:450px;
	}
	.datepicker-calendar{
		padding: 40px 20px 0px;
	}
	.timepicker-container-outer{
		padding: 70px 50px 0px 0px;
	}
	.buttons-container{
		position: absolute;
	}
  </style>
  
</head>

<body>

  <div class="app-container" ng-app="dateTimeApp" ng-controller="dateTimeCtrl as ctrl" ng-cloak>
		
	<div date-picker
		 datepicker-title="Select Date"
		 picktime="true"
		 pickdate="true"
		 pickpast="false"
		 mondayfirst="false"
		 custom-message="You have selected"
		 selecteddate="ctrl.selected_date"
		 updatefn="ctrl.updateDate(newdate)">
	
		<div class="datepicker"
			 ng-class="{
				'am': timeframe == 'am',
				'pm': timeframe == 'pm',
				'compact': compact
			}">
			<div class="datepicker-header">
				<div class="datepicker-title" ng-if="datepicker_title">수업일을 지정해주세요</div>
				<div class="datepicker-subheader">{{ selectedDay }} {{ monthNames[localdate.getMonth()] }} {{ localdate.getDate() }} {{ localdate.getFullYear() }}</div>
			</div>
			<div class="datepicker-calendar">
				<div class="calendar-header">
					<div class="goback" ng-click="moveBack()" ng-if="pickdate">
						<svg width="30" height="30">
							<path fill="none" stroke="#f6755e" stroke-width="3" d="M19,6 l-9,9 l9,9"/>
						</svg>
					</div>
					<div class="current-month-container">{{ currentViewDate.getFullYear() }} {{ currentMonthName() }}</div>
					<div class="goforward" ng-click="moveForward()" ng-if="pickdate">
						<svg width="30" height="30">
							<path fill="none" stroke="#f6755e" stroke-width="3" d="M11,6 l9,9 l-9,9" />
						</svg>
					</div>
				</div>
				<div class="calendar-day-header">
					<span ng-repeat="day in days" class="day-label">{{ day.short }}</span>
				</div>
				<div class="calendar-grid" ng-class="{false: 'no-hover'}[pickdate]">
					<div
						ng-class="{'no-hover': !day.showday}"
						ng-repeat="day in month"
						class="datecontainer"
						ng-style="{'margin-left': calcOffset(day, $index)}"
						track by $index>
						<div class="datenumber" ng-class="{'day-selected': day.selected }" ng-click="selectDate(day)">
							{{ day.daydate }}
						</div>
					</div>
				</div>
			</div>
			<div class="timepicker" ng-if="picktime == 'true'">
				<div ng-class="{'am': timeframe == 'am', 'pm': timeframe == 'pm' }">
					<div class="timepicker-container-outer" selectedtime="time" timetravel>
						<div class="timepicker-container-inner">
							<div class="timeline-container" ng-mousedown="timeSelectStart($event)" sm-touchstart="timeSelectStart($event)">
								<div class="current-time">
									<div class="actual-time">{{ time }}</div>
								</div>
								<div class="timeline">
								</div>
								<div class="hours-container">
									<div class="hour-mark" ng-repeat="hour in getHours() track by $index"></div>
								</div>
							</div>
							<div class="display-time">
								<div class="decrement-time" ng-click="adjustTime('decrease')">
									<svg width="24" height="24">
										<path stroke="white" stroke-width="2" d="M8,12 h8"/>
									</svg>
								</div>
								<div class="time" ng-class="{'time-active': edittime.active}">
									<input type="text" class="time-input" ng-model="edittime.input" ng-keydown="changeInputTime($event)" ng-focus="edittime.active = true; edittime.digits = [];" ng-blur="edittime.active = false"/>
									<div class="formatted-time" id="gettime">{{ edittime.formatted }}</div>
								</div>
								<div class="increment-time" ng-click="adjustTime('increase')">
									<svg width="24" height="24">
										<path stroke="white" stroke-width="2" d="M12,7 v10 M7,12 h10"/>
									</svg>
								</div>
							</div>
							<div class="am-pm-container">
								<div class="am-pm-button" ng-click="changetime('am');">am</div>
								<div class="am-pm-button" ng-click="changetime('pm');">pm</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
		 	<div class="buttons-container">
				<div class="cancel-button" id="savebutton" ng-click="mySave()">확인 </div>
				<div class="save-button" id="addbutton" ng-click="myAdd()">스케줄 추가</div>
			</div>  
			
		</div>
	</div>
</div>

</body>
</html>
