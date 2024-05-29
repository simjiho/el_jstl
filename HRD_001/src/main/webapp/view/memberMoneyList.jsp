<%@page import="vo.MemberMoneyVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.MemberVo"%>
<%@ page import="dao.MemberDao"%>
<%@ page import="java.util.ArrayList"%>    
<head>
	<style type="text/css">
			*{
		padding: 0;
		margin: 0 auto;
		text-decoration: none;
	}
	header{
		width: 100%;
		height: 60px;
		line-height: 60px;
		font-size: 30px;
		background-color: #03A9F4;
		text-align: center;
		color: white;
		
	}
	nav{
		width: 100%;
		height: 40px;
		background: skyblue;
		line-height: 40px;
		color: white;
	}
	nav > a{
	padding-left: 10px;
	color: #333;
	}
	nav > ul{
		width: 90%;
	}
	nav > ul > li{
		width: 25%;
		float: left;
	}
	section{
		width: 100%;
	}
	section > .container{
		padding: 20px;
		margin: 0 auto;
	}
	section > .container .title{
		font-size: 30px;
		text-align: center;
		margin-bottom: 20px;
	}
	table, th, td{
		border: 1px solid black;
		text-align: center;
	}
	footer{
		width: 100%;
		height: 50px;
		line-height: 50px;
		text-align: center;
		background: skyblue;
		color: white;
		position: absolute;
		bottom: 0;
	}
	</style>
</head>
    
<%
	MemberDao dao = new MemberDao();
	ArrayList<MemberMoneyVo> list = dao.memberMoneyList();
%>   
   
<jsp:include page="master/header.jsp"/>    
    
<section>
	<div class="container">
		<p class="title">회원매출조회</p>

<%
	if(!list.isEmpty()) {
%>			
	<table>
		<tr>
			<td>회원번호</td>
			<td>회원성명</td>
			<td>회원전화</td>
			<td>회원주소</td>
		</tr>
<%
	for(MemberMoneyVo member:list) { %>
		<tr>
			<td><%=member.getCustno() %></td>
			<td><%=member.getCustname() %></td>
			<td><%=member.getGrade() %></td>
			<td><%=member.getPrice() %></td>
			
		</tr>
<% }
%>	
	</table>
<%}
	else{ %>

	<p style="text-align: center">등록된 매출 정보가 없습니다</p>	
<% 
	}
%>	
	
	</div>
</section> 
    
<jsp:include page="master/footer.jsp"/>