<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
	String id=request.getParameter("id");
	PreparedStatement pstmt=null;
	try{
		String sql="delete from member1011 where id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		%>
		<script>
			alert("삭제 성공");
			location.href="memberSelect.jsp";
		</script>
		<%
	}catch(SQLException e){
		System.out.println("삭제 실패 : "+e.getMessage());
	}
%>
</body>
</html>