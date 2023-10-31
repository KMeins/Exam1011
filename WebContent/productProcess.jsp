<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;

    try {
    	String sql="insert into product1011 values(?,?,?,?,?,?,?,?)";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, request.getParameter("productid"));
    	pstmt.setString(2, request.getParameter("name"));
    	pstmt.setString(3, request.getParameter("unitprice"));
    	pstmt.setString(4, request.getParameter("description"));
    	pstmt.setString(5, request.getParameter("category"));
    	pstmt.setString(6, request.getParameter("manufacturer"));
    	pstmt.setString(7, request.getParameter("unitslnstock"));
    	pstmt.setString(8, request.getParameter("condition"));
    	pstmt.executeUpdate();
    	%>
    	<script>
    	    alert("저장 완료");
    	    location.href="productSelect.jsp";
    	</script>
    	<%
    }catch(SQLException e) {
    	System.out.println("저장실패 : "+e.getMessage());
    }

%>