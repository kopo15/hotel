<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.kopo.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Lora:400,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Cabin:400,500,600,700&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaticon.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css"
	type="text/css">
<title>예약현황</title>

<!--  fullcalendar css-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/fullcalendar/main.css">
<script
	src="${pageContext.request.contextPath}/resources/fullcalendar/dist/index.global.js"></script>

<!--  fullcalendar 언어 설정관련 script-->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
</head>

<body>
	<!-- Header -->
	<%@include file="./inc/Header.jsp"%>
	<!-- Calendar -->
	<section class="contact-section spad">
	<div class="container">
	
	<div style="margin:30px;">
		<div id='calendar'></div>
	</div>
	</div>
	</section>
	<!-- Javascript -->
	<!--지난날짜는 표시가 되지 않게 하기  -->
	<!-- ----------------예약자 달력리스트 출력 스크립트  ----------------------->
	<c:set var="eventList" value="${BookingList}" />
	<script>

	var events = [];		
		<c:forEach items="${eventList}" var="bookinglist">		
		<c:choose>
		<c:when test="${bookinglist.room1 ne '0'}">
			events.push({
				sortIdx: 0,
				title :'Room 1: <c:out value="${bookinglist.room1}" />',
				start : '<c:out value="${bookinglist.conf_resvdate}" />',
				end : '<c:out value="${bookinglist.conf_resvdate}" />' // Set end to the same date
				
			});
		</c:when>
		<c:otherwise>
			events.push({
				sortIdx: 0,
				title : '예약가능',
				start : '<c:out value="${bookinglist.conf_resvdate}" />',
				end : '<c:out value="${bookinglist.conf_resvdate}" />',
				url : '<c:url value='/new?roomtype=1&date=${bookinglist.conf_resvdate}'/>'
		});
		</c:otherwise>
		</c:choose>
		
		<c:choose>
		<c:when test="${bookinglist.room2 ne '0'}">
			events.push({
				sortIdx: 1,
				title :'Room 2: <c:out value="${bookinglist.room2}" />',
				start : '<c:out value="${bookinglist.conf_resvdate}" />',
				end : '<c:out value="${bookinglist.conf_resvdate}" />' // Set end to the same date
		});
		</c:when>
		<c:otherwise>
			events.push({
				sortIdx: 1,
			title : '예약가능',
			start : '<c:out value="${bookinglist.conf_resvdate}" />',
			end : '<c:out value="${bookinglist.conf_resvdate}" />',
			url : '<c:url value='/new?roomtype=2&date=${bookinglist.conf_resvdate}'/>'
			});
		</c:otherwise>
		</c:choose>
		
		<c:choose>
		<c:when test="${bookinglist.room3 ne '0'}">
			events.push({
				sortIdx: 2,
				title :'Room 3: <c:out value="${bookinglist.room3}" />',
				start : '<c:out value="${bookinglist.conf_resvdate}" />',
				end : '<c:out value="${bookinglist.conf_resvdate}" />' // Set end to the same date
		});
		</c:when>
		<c:otherwise>
			events.push({
				sortIdx: 2,		
			title : '예약가능',
			start : '<c:out value="${bookinglist.conf_resvdate}" />',
			end : '<c:out value="${bookinglist.conf_resvdate}" />',
			url : '<c:url value='/new?roomtype=3&date=${bookinglist.conf_resvdate}'/>'
			});
		</c:otherwise>
		</c:choose>		
		</c:forEach>	
	</script>
<!-- ----------------예약자리스트 달력 출력 스크립트 종료 ----------------------->
	
	<!--  title: '<c:out value="Room${bookinglist.room_type}${bookinglist.name}" />',-->
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');

			var calendar = new FullCalendar.Calendar(calendarEl, {
				height: '700px', // calendar 높이 설정
				expandRows : false, // 화면에 맞게 높이 재설정
				initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
				headerToolbar : { // 헤더에 표시할 툴 바
					start : 'prev next today',
					center : 'title',
					end : ''
				},
				titleFormat : function(date) {
					return date.date.year + '년 '
							+ (parseInt(date.date.month) + 1) + '월';
				},
				//initialDate: '2023-08-25', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
				selectable : true, // 달력 일자 드래그 설정가능
				droppable : true,
				editable : true,
				nowIndicator : true, // 현재 시간 마크
				locale : 'ko', // 한국어 설정
				events : events, // 날짜별 항목 출력 
				eventClick: function(info){
				window.location.href(ino.event.url);	
				}
				,eventOrder:'sortIdx'
				
			});
			calendar.render();
		});
	</script>
	<!-- Footer -->
	<%@include file="./inc/Footer.jsp"%>
	
	<!-- Js Plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slicknav.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
		
</body>
</html>