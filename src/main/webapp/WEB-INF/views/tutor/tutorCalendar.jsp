<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/font.jsp"/>
<c:import url="../temp/header.jsp"/>
<link href='../resources/assets/css/fullcalendar.css' rel='stylesheet' />
<link href='../resources/assets/css/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='../resources/assets/js/jquery-1.10.2.js' type="text/javascript"></script>
<script src='../resources/assets/js/jquery-ui.custom.min.js' type="text/javascript"></script>
<script src='../resources/assets/js/fullcalendar.js' type="text/javascript"></script>
<script>

	$(document).ready(function() {
	    var date = new Date();
	    console.log(date);
		var d = date.getDate();
		var m = date.getMonth();
		var y = date.getFullYear();
		console.log(d);console.log(m);console.log(y);
		/*  className colors

		className: default(transparent), important(red), chill(pink), success(green), info(blue)

		*/


		/* initialize the external events
		-----------------------------------------------------------------*/

		$('#external-events div.external-event').each(function() {

			// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title: $.trim($(this).text()) // use the element's text as the event title
			};

			// store the Event Object in the DOM element so we can get to it later
			$(this).data('eventObject', eventObject);

			// make the event draggable using jQuery UI
			$(this).draggable({
				zIndex: 999,
				revert: true,      // will cause the event to go back to its
				revertDuration: 0  //  original position after the drag
			});

		});


		/* initialize the calendar
		-----------------------------------------------------------------*/

		var calendar =  $('#calendar').fullCalendar({
			header: {
				left: 'title',
				/* center: 'agendaDay,agendaWeek,month', */
				right: 'prev,next today'
			},
			editable: true,
			firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
			selectable: true,
			defaultView: 'month',

			axisFormat: 'h:mm',
			columnFormat: {
                month: 'ddd',    // Mon
                week: 'ddd d', // Mon 7
                day: 'dddd M/d',  // Monday 9/7
                agendaDay: 'dddd d'
            },
            titleFormat: {
                month: 'MMMM yyyy', // September 2009
                week: "MMMM yyyy", // September 2009
                day: 'MMMM yyyy'                  // Tuesday, Sep 8, 2009
            },
			allDaySlot: false,
			selectHelper: true,
			select: function(start, end, allDay) {
				var title = prompt('Event Title:');
				if (title) {
					calendar.fullCalendar('renderEvent',
						{
							title: title,
							start: start,
							end: end,
							allDay: allDay
						},
						true // make the event "stick"
					);
				}
				calendar.fullCalendar('unselect');
			},
			droppable: true, // this allows things to be dropped onto the calendar !!!
			drop: function(date, allDay) { // this function is called when something is dropped

				// retrieve the dropped element's stored Event Object
				var originalEventObject = $(this).data('eventObject');

				// we need to copy it, so that multiple events don't have a reference to the same object
				var copiedEventObject = $.extend({}, originalEventObject);

				// assign it the date that was reported
				copiedEventObject.start = date;
				copiedEventObject.allDay = allDay;

				// render the event on the calendar
				// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
				$('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

				// is the "remove after drop" checkbox checked?
				if ($('#drop-remove').is(':checked')) {
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				}

			},

			events: [
				<c:forEach items="${list}" var="l" varStatus="i">
				<c:forEach items="${l.timetable}" var="time">
					{
						title: '${l.title} ${time.startTime}~${time.endTime}',
						start: new Date('${time.class_date}'),
						className: 'important'
					}
					<c:if test="${fn:length(l.timetable) ne i.index+1}">,</c:if>
				</c:forEach>
				</c:forEach>
				
			],
		});


	});

</script>
<style>
	.fc-header-title h2{
		color:#f6755e;
		font-weight: bold;
		font-family: 'Youth';
	}
	.fc-button-today{
		color:#f6755e;
		font-family: 'Youth';
	}
	.fc-sun{
		color:#f6755e;
	}
	.fc-sat{
		color:#333;
	}
	.fc-border-separate tr.fc-last th{
		font-family: 'Youth';
		color:#333;
	}
	
	.fc-week .fc-day > div .fc-day-number{
		font-family: 'Youth';
	}
	table {
		margin:0;
	}

	#wrap {
		width: 100%;
		height:1100px;
		margin: 0 auto;
		padding-top: 110px;
		text-align: center;
		font-size: 14px;
		font-family: 'Youth';
		background-color: #fcdcd6;
		color:
		}

	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		text-align: left;
		}

	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
		}

	.external-event { /* try to mimick the look of a real event */
		margin: 10px 0;
		padding: 2px 4px;
		background: #3366CC;
		color: #fff;
		font-size: .85em;
		cursor: pointer;
		}

	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
		}

	#external-events p input {
		margin: 0;
		vertical-align: middle;
		}

	#calendar {
/* 		float: right; */
        margin: 0 auto;
		width: 900px;
		background-color: #FFFFFF;
		  border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
		}
	.fc-event{
		font-family: 'Youth';
		color:#333;
	}

</style>
</head>
<body>

<div id='wrap'>

<div id='calendar'></div>

<div style='clear:both'></div>
</div>
<c:import url="../temp/footer.jsp"></c:import>
</body>
</html>