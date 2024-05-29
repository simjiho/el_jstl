<%@page import="dao.MemberDAO"%>
<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberVO> list = dao.getList();
%>
<jsp:include page="/master/header.jsp"/>
<section>
	<h2>회원목록조회/수정</h2>
	<table>
		<tr style="background-color:beige;">
			<td>회원ID</td>
			<td>회원명</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>직업</td>
			<td>메일수신여부</td>
			<td>자기소개</td>
			<td>삭제</td>
		</tr>
<%
	for(MemberVO member : list){
%>
	<tr>
		<td><a href="/view/update.jsp?userid=<%=member.getUserid() %>"><%=member.getUserid() %></a></td>
		<td><%=member.getUsername() %></td>
		<td><%=member.getJumin() %></td>
		<td><%=member.getGender() %></td>
		<td><%=member.getJobcd() %></td>
		<td><%=member.getMailrcv() %></td>
		<td><%=member.getIntro() %></td>
		<td><a href="/view/delete.jsp?userid=<%=member.getUserid()%>">삭제</a></td>
	</tr>
<%
	}
%>
	</table>
</section>
<jsp:include page="/master/footer.jsp"/>