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
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String orderDate=request.getParameter("orderDate");
	String orderName=request.getParameter("orderName");
	String orderQty=request.getParameter("orderQty");
	String orderAddress=request.getParameter("orderAddress");
	int oQty=Integer.parseInt(orderQty);
	int stockQty=0;
	String productid="";
	try {
		String sql="select orderQty,productid from order1011 where orderDate=? and orderName=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, orderDate);
		pstmt.setString(2, orderName);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			stockQty=rs.getInt(1);
			productid=rs.getString(2);
		}
		sql="update order1011 set orderQty=?,orderAddress=? where=orderDate=? and orderName=?";
		pstmt=conn.prepareStatement(sql);
		
		int Qty=stockQty - oQty;
		sql="update product1011 set unitslnstock=unitslnstock - ? where productid?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1, Qty);
		pstmt.setString(2, orderDate);
		pstmt.setString(3, orderName);
		pstmt.executeUpdate();
		%>
		<script>
		alert("수정 성공");
	    location.href="orderSelect.jsp";
		</script>
		<%
	}catch(SQLException e) {
		System.out.println("수정 실패 : "+e.getMessage());
	}
%>
</body>
</html>