<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="master/header.jsp"></jsp:include>

<section>
<div class="container">
	<p class="title">점수입력</p>
	<form action="/poInsert" method="post" name="frm">
		<table width="600px">
				<tr>
						<td>학생코드</td>
						<td><select id="studentid" name="studentid">
								<option value="0">학생선택</option>
						
								<option value="20220001">김길동</option>
			
								<option value="20220002">이길동</option>
		
								<option value="20220003">박길동</option>
								
								<option value="20220004">정길동</option>
								
								<option value="20220005">최길동</option>
								
								<option value="20220006">황길동</option>
							</select>
						</td>				
				</tr>
				
				<tr>
						<td>담당강사</td>
						<td><select id="subjectcode" name="subjectcode">
								<option value="0">과목선택</option>
						
								<option value="S001">메타버스의이해</option>
			
								<option value="S002">게임엔진기초</option>
		
								<option value="S003">게임엔진심화</option>
								
								<option value="S004">인문학개론</option>
							</select>
						</td>				
				</tr>
				
				<tr>
					<td>중간고사</td>
					<td><input type="number" id="mid" name="mid"></td>
				</tr>
				
				<tr>
					<td>기말고사</td>
					<td><input type="number" id="finals" name="finals"></td>
				</tr>
				
				<tr>
					<td>출석점수</td>
					<td><input type="number" id="attend" name="attend"></td>
				</tr>
				
				<tr>
					<td>과제</td>
					<td><input type="number" id="report" name="report"></td>
				</tr>
				
				<tr>
					<td>기타</td>
					<td><input type="number" id="etc" name="etc"></td>
				</tr>
				
												
		
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="추가" onclick="return checkForm()">
					<input type="button" value="목록" onclick="location.href ='/courseList'">
				</tr>
				
			</table>	
	</form>
</div>
</section>

<script>
	function checkForm() {
		if(document.frm.studentid.value.trim() == ""){
			alert('참가번호가 입력되지 않았습니다!');
			document.frm.studentid.focus();
			retuen false;
		}
		if(document.frm.subjectcode.value.trim() == ""){
			alert('참가자명가 입력되지 않았습니다!');
			document.frm.subjectcode.focus();
			retuen false;
		}
		if(document.frm.mid.value.trim() == ""){
			alert('생년월일이 입력되지 않았습니다!');
			document.frm.mid.focus();
			retuen false;
		}
		if(document.frm.finals.value == 0){
			alert('성별이 입력되지 않았습니다!');
			document.frm.finals.focus();
			retuen false;
		}
		if(document.frm.attend.value > 5){
			alert('요일이 입력되지 않았습니다!');
			document.frm.attend.focus();
			retuen false;
		}
		if(document.frm.report.value.trim() == ""){
			alert('소속사 입력되지 않았습니다!');
			document.frm.report.focus();
			retuen false;
		}
		if(document.frm.etc.value.trim() == ""){
			alert('소속사 입력되지 않았습니다!');
			document.frm.etc.focus();
			retuen false;
		}
		document.frm.submit();
		}
</script>
<jsp:include page="master/footer.jsp"></jsp:include>