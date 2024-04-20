<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 이용할 jstl 태그를 선언해야함 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/views/common/header.jsp">
	<jsp:param name="title" value="Main"/>
	<jsp:param name="style" value="color:skyblue; background-color:brown;"/>
</jsp:include>
	
	<%-- <h3><%=name %></h3> --%>
	<h2>jstl적용하기</h2>
	<a href="views/content.jsp">내용으로 이동</a>
	<p>외부에서 제공하는 jar파일을 가쟈와서 사용</p>
	
	<h2>표준액션태그</h2>
	<p>
		그냥 태그형식으로 사용할 수 있는 태그 <br>
		jsp:태그명 속성="속성값"
	</p>
	<ul>
		<li>
			다른페이지를 불러와 출력해주는 태그 : jsp:include page="" 태그이용
		</li>
		<li>
			파라미터 데이터를 전송해주는 태그 : <br>
			jsp:param name="" value=""
		</li>
	</ul>
</body>
</html>