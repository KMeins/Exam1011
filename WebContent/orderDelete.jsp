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
	request.setCharacterEncoding("utf-8");
	String orderDate=request.getParameter("orderDate");
	String orderName=request.getParameter("orderName");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int orderQty=0;
	String productid="";
	try {
		String sql="select productid,orderQty from order1011 where orderDate=? and orderName=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, orderDate);
		pstmt.setString(2, orderName);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			productid=rs.getString(1);
			orderQty=rs.getInt(2);
		}else {
			orderQty=0;
		}
		sql="delete from order1011 where orderDate=? and orderName=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, orderDate);
		pstmt.setString(2, orderName);
		pstmt.executeUpdate();
		sql="update product1011 set unitslnstock=unitslnstock + ? where productid=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, orderQty);
		pstmt.setString(2, productid);
		pstmt.executeUpdate();
		%>
		<script>
		alert("삭제 완료");
		location.href="orderSelect.jsp";
		</script>
		<%
	}catch(SQLException e) {
		System.out.println("삭제 실패 : "+e.getMessage());
	}
%>
</body>
</html>