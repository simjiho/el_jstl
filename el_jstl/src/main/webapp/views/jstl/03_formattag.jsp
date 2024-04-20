<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formattag</title>
</head>
<body>
	<!-- 주석 처리 ctrl + shift + /  -->
	<c:set var ="numbertest" value="12345678"/>
	
	<h3>기본숫자 출력 : <c:out value="${numbertest }"/></h3>
	<h3>fmt로 숫자 출력 : <fmt:formatNumber value="${numbertest }"/></h3>
	<fmt:setLocale value="ko_KR"/>
	<h3>화폐단위를 표시하기 : <fmt:formatNumber value="${numbertest }" type="currency"/></h3>
	
	<h3>패턴으로 숫자표시하기</h3>
	<h3><fmt:formatNumber value="${numbertest }" pattern="###,###,###"/></h3>
	<h3><fmt:formatNumber value="${numbertest }" pattern="000,000,000"/></h3>
	
	<h3><fmt:formatNumber value="15.5" pattern="###,###.00"/></h3>
	
	<h3>날짜형식 출력하기</h3>
	<c:set var="today" value="<%= new java.util.Date() %>"/>
	<h3><c:out value="${today }"/></h3>
	<p>
		fmt:formatDate태그
			type
				date : 년, 월, 일만 출력하기 <br>
				time : 시간만 출력할 때 <br>
				both : 년월일 시분초를 출력하기 <br>
			dateStyle : 날짜를 출력할 때 패턴설정 (default, short, long, full)<br>
			timeStyle : 시간을 출력할 때 패턴설정 (medium, short, long, full)<br>
	</p>
	
	<h3><fmt:formatDate value="${today }"/></h3>
	<h3><fmt:formatDate value="${today }" type="date"/></h3>
	<h3><fmt:formatDate value="${today }" type="time"/></h3>
	<h3><fmt:formatDate value="${today }" type="both"/></h3>
	
	<h3><fmt:formatDate value="${today }" type="date" dateStyle="short"/></h3>
	<h3><fmt:formatDate value="${today }" type="time" timeStyle="short"/></h3>

	<h3><fmt:formatDate value="${today }" type="date" dateStyle="long"/></h3>
	<h3><fmt:formatDate value="${today }" type="time" timeStyle="long"/></h3>	
	
	<h3><fmt:formatDate value="${today }" type="date" dateStyle="full"/></h3>
	<h3><fmt:formatDate value="${today }" type="time" timeStyle="full"/></h3>
	
</body>
</html>


















