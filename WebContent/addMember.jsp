<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check() {
	if(document.frm.id.value=="") {
		alert("아이디를 입력하세요");
		document.frm.id.focus();
		return false;
	}
	if(document.frm.name.value=="") {
		alert("이름을 입력하세요");
		document.frm.name.focus();
		return false;
	}
	if(document.frm.pass.value=="") {
		alert("비밀번호를 입력하세요");
		document.form.pass.focus();
		return false;
	}
	if(document.frm.repass.value=="") {
		alert("확인 비밀번호를 입력하세요");
		document.frm.repass.focus();
		return false;
	}
	if(document.frm.pass.value != document.frm.repass.value) {
		alert("비밀번호와 확인비밀번호가 일치하지 않습니다.");
		document.frm.repass.focus();
		return false;
	}
	document.frm.submit();
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h2 id="h2">회원 가입 등록 화면</h2>
<hr>
<form name="frm" method="post" action="memberProcess.jsp">
<table id="tab2" border=1>

<tr>
	<th>학번</th>
	<td><input type="text" name="studno" id="in1"></td>
</tr>

<tr>
	<th>성명</th>
	<td><input type="text" name="name" id="in1"></td>
</tr>

<tr>
	<th>학과</th>
	<td>
		<input type="text" name="dept" value="학과" id="r1"> @
	<select name="dept" id="r1">
		<option value="naver.com" selected>naver.com</option>
		<option value="daum.net" >daum.net</option>
		<option value="nate.com" >nate.com</option>
		<option value="hotmail.com" >hotmail.com</option>
		<option value="gmail.com" >gmail.com</option>
	</select>
	</td>
 </tr>

<tr>
	<th>학년</th>
	<td><input type="password" name="position" id="in1"></td>
</tr>

<tr>
<th>취미</th>
<td>
    <input type="radio" value="남" name="gender" checked>남성
    <input type="radio" value="여" name="gender" >여성
</td>
</tr>

<tr>
<th>주소</th>
<td>
	<input type="text" name="emial1" value="이메일" id="r1"> @
	<select name="emial2" id="r1">
		<option value="naver.com" selected>naver.com</option>
		<option value="daum.net" >daum.net</option>
		<option value="nate.com" >nate.com</option>
		<option value="hotmail.com" >hotmail.com</option>
		<option value="gmail.com" >gmail.com</option>
	</select>
</td>
</tr>

<tr>
<th>연락처</th>
<td>
	<input type="text" name="phone1" id="r1">-
	<input type="text" name="phone2" id="r1">-
	<input type="text" name="phone3" id="r1">
</td>

</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>