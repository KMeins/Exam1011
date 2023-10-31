<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
    String productid=request.getParameter("productid");
    String name=request.getParameter("name");
    String unitprice=request.getParameter("unitprice");
    String description=request.getParameter("description");
    String manufacturer=request.getParameter("manufacturer");
    String category=request.getParameter("category");
    String unitslnstock=request.getParameter("unitslnstock");
    String condition=request.getParameter("condition");
    try {
    	String sql="update product1011 set name=?,unitprice=?,description=?,manufacturer=?,category=?,unitslnstock=?,condition=? where productid=?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, unitprice);
        pstmt.setString(3, description);
        pstmt.setString(4, manufacturer);
        pstmt.setString(5, category);
        pstmt.setString(6, unitslnstock);
        pstmt.setString(7, condition);
        pstmt.setString(8, productid);
        pstmt.executeUpdate();
        %>
        <script>
        alert("수정 완료");
        location.href="productSelect.jsp";
        </script>
        <%
    }catch(SQLException e) {
    	System.out.println("수정 오류 : "+e.getMessage());
    }
%>