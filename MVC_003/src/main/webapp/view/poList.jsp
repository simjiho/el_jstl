<%@page import="java.util.ArrayList"%>
<%@ page import="vo.StudentVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="master/header.jsp"></jsp:include>
<section>
	<div class="container">
		<p class="title">성적화면 조회</p>
<%
	ArrayList<StudentVO> polist = (ArrayList<StudentVO>)request.getAttribute("polist");
	if(!polist.isEmpty()){
%>
	<table>
		<tr>
			<td>학생코드</td>
			<td>학생이름</td>
			<td>주민번호</td>
			<td>과목명</td>
			<td>유형</td>
			<td>교수명</td>
			<td>중간고사</td>
			<td>기말고사</td>
			<td>수행평가</td>
			<td>과제</td>
			<td>기타</td>
		</tr>
<%
	for(StudentVO grade : polist){
		request.setAttribute("grade", grade);
%>
		<tr>
			<td>${grade.studentid}</td>
			<td>${grade.studentname}</td>
			<td>${grade.jumin}</td>
			<td>${grade.subjectname}</td>
			<td>${grade.classification}</td>
			<td>${grade.professorname}</td>
			<td>${grade.mid}</td>
			<td>${grade.finals}</td>
			<td>${grade.attend}</td>
			<td>${grade.report}</td>
			<td>${grade.etc}</td>
		</tr>
<%
	}
%>
	</table>
<%
	}else{
%>
	<p style="text-align: center">등록된 회원 정보가 없습니다.</p>
<%
	}
%>
	</div>
</section>
<jsp:include page="master/footer.jsp"></jsp:include>