<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h2 id="h2">회원 정보 조회</h2>
<table border=1 id="tab6">
<tr>
    <th>id</th>
    <th>성명</th>
    <th>비밀번호</th>
    <th>성별</th>
    <th>이메일</th>
    <th>연락처</th>
    <th>주소</th>
    <th>구분</th>
</tr>
<%@include file="dbconn.jsp" %>
<%
    ResultSet rs=null;
    PreparedStatement pstmt=null;
    try{
    	String sql="select * from member1011";
    	pstmt=conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	while(rs.next()) {
    		String id=rs.getString("id");
    		String name=rs.getString("name");
    		String pass=rs.getString("password");
    		String gender=rs.getString("gender");
    		String emial=rs.getString("emial");
    		String phone=rs.getString("phone");
			String address=rs.getString("address");
			
%>
    <tr>
   		<td><%=id %></td>
		<td><%=name %></td>
    	<td><%=pass %></td>
    	<td><%=gender %></td>
    	<td><%=emial %></td>
    	<td><%=phone %></td>
    	<td><%=address %></td>
    	<td>
    		<a href="memberUpdate.jsp?id=<%=id %>">수정</a>/
    		<a href="memberDelete.jsp?id=<%=id %>" 
    			onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false;">삭제</a>
 		</td>
	</tr>	
      <% 	 }
    	}catch(SQLException e) {
    	System.out.println("읽기 에러 : "+e.getMessage());
        }
      %>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>