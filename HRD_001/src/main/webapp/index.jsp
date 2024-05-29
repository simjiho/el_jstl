<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="view/master/header.jsp"/>
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
<section>
<div class="container">
		<p class="title">쇼핑몰 회원관리 프로그램</p>
		<p>
		쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을
작성하는 프로그램이다. <br>
		 프로그램 작성순서 <br>
		1. 회원정보 테이블을 생성한다. <br> 
		2. 매출정보 테이블을 작성한다. <br>
		3. 회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다. <br>
		4. 회원정보 입력 화면 프로그램을 작성한다. <br>
		5. 회원정보 조회 프로그램을 작성한다. <br>
		6. 회원배출정보 조회프로그램을 작성한다. <br>
		</p>
</div>
</section>


<jsp:include page="view/master/footer.jsp"/>