<%@page import="java.util.ArrayList"%>
<%@ page import="vo.SubjectVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="master/header.jsp"></jsp:include>
<section>
	<div class="container">
		<p class="title">성적화면 조회</p>
<%
	ArrayList<SubjectVO> slist = (ArrayList<SubjectVO>)request.getAttribute("slist");
	if(!slist.isEmpty()){
%>
	<table>
		<tr>
			<td>전공</td>
			<td>학생아이디</td>
			<td>학생이름</td>
			<td>총점수</td>
			<td>과목 수</td>
			<td>평균점수</td>
		</tr>
<%
	for(SubjectVO grade : slist){
		request.setAttribute("grade", grade);
%>
		<tr>
			<td>${grade.course}</td>
			<td>${grade.studentid}</td>
			<td>${grade.studentname}</td>
			<td>${grade.score}</td>
			<td>${grade.count}</td>
			<td>${grade.score2}</td>
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