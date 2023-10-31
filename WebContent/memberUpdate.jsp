<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.frm.id.value=="") {
		alert("아이디를 입력하세요.");
		document.frm.id.focus(); //사번에 커서를 두는것//
		return false;
	}
	if(document.frm.name.value=="") {
		alert("이름을 입력하세요.");
		document.frm.name.focus();
		return false;
	}
	if(document.frm.pass.value=="") {
		alert("비밀번호를 입력하세요.");
		document.frm.pass.focus();
		return false;
    }
	if(document.frm.repass.value=="") {
		alert("확인 비밀번호를 입력하세요.");
		document.frm.repass.focus();
		return false;
	}
	if(document.frm.pass.value != document.frm.repass.value) {
		alert("비밀번호와 확인 비밀번호가 일치하지 않습니다.");
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
<%@ include file="dbconn.jsp" %>
<%
    ResultSet rs=null;
    PreparedStatement pstmt=null;
    String id=request.getParameter("id");
    try {
    	String sql="select * from member1011 where id=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, id);
    	rs=pstmt.executeQuery();
    	if(rs.next()) {
    	String name=rs.getString("name");
    	String pass=rs.getString("password");
        String gender=rs.getString("gender");
        String address=rs.getString("address");
        String emial=rs.getString("emial");
        String []emi=emial.split("@");
    	String phone=rs.getString("phone");
    	String ph[]=phone.split("-");

%>
<form name="frm" method="post" action="memberUpdateProcess.jsp">
<table id="tab2" border=1>

<tr>
<th>아이디</th>
    <td><input type="text" name="id" id="in1" value="<%=id %>"></td>
</tr>

<tr>
<th>이름</th>
    <td><input type="text" name="name" id="in1" value="<%=name %>"></td>
</tr>

<tr>
<th>비밀번호</th>
<td>
    <input type="password" name="pass" id="in1" value="<%=pass %>">
</td>
</tr>

<tr>
<th>확인비밀번호</th>
<td>
    <input type="password" name="repass" id="in1" value="<%=pass %>">
</td>
</tr>

<tr>
<th>성별</th>
	<td><input type="radio" value="남" name="gender" <%=gender.equals("남") ? "checked":"" %> >남성
		<input type="radio" value="여" name="gender" <%=gender.equals("여") ? "checked":"" %> >여성
</tr>

<tr>
<th>이메일</th>
<td>
	<input type="text" name="emial1" value="<%=emi[0] %>" id="r1"> @
	<select name="emial2"  id="r1">
		<option value="naver.com" <%=emi[1].equals("naver.com")? " selected":"" %>>naver.com</option>
		<option value="daum.net" <%=emi[1].equals("daum.net")? " selected":"" %>>daum.net</option>
		<option value="nate.com" <%=emi[1].equals("nate.com")? " selected":"" %>>nate.com</option>
		<option value="hotmail.com" <%=emi[1].equals("hotmail.com")? " selected":"" %>>hotmail.com</option>
		<option value="gmail.com" <%=emi[1].equals("gmail.com")? " selected":"" %>>gmail.com</option>
	</select>
</tr>

<tr>
<th>연락처</th>
	<td>
		<input type="text" name="phone1" id=r1 value="<%=ph[0] %>">-
		<input type="text" name="phone2" id=r1 value="<%=ph[1] %>">-
		<input type="text" name="phone3" id=r1 value="<%=ph[2] %>">
	</td>
</tr>

<tr>
<th>주소</th>
    <td><input type="text" name="address" id="in1" value="<%=address %>">
</td>
</tr>

<tr>
	<td colspan=2 align="center">
		<input id="btn1" type="button" value="등록" onclick="check()">
		<input id="btn1" type="reset" value="취소">
	</td>
</tr>
<%
}
    }catch(SQLException e) {
		System.out.println("읽기 에러 : "+e.getMessage());
	}
%>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>