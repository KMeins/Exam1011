<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
     PreparedStatement pstmt = null;
     ResultSet rs = null;
     conn.setAutoCommit(false);
     String productId=request.getParameter("productId");
     try{
        String sql   = "INSERT INTO order1011 values(?,?,?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, request.getParameter("orderDate"));
        pstmt.setString(2, request.getParameter("orderName"));
        pstmt.setString(3, request.getParameter("productId"));
        pstmt.setString(4, request.getParameter("unitPrice"));
        System.out.println("qty : "+request.getParameter("orderQty"));
        pstmt.setString(5, request.getParameter("orderQty"));
        pstmt.setString(6, request.getParameter("address"));
        pstmt.executeUpdate();
        //재고 마이너스
        int stock=0;
        sql = "select unitsInstock from product1011 where productid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,productId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				stock=rs.getInt(1);
			}
        sql   = "update product1011 set unitsInstock=unitsInstock-? where productid=?";
        pstmt = conn.prepareStatement(sql);
        stock=Integer.parseInt(request.getParameter("orderQty"));
        pstmt.setInt(1, stock);
        pstmt.setString(2, request.getParameter("productId"));
        pstmt.executeUpdate();
        conn.commit();
        //
        %><script type="text/javascript">
			alert("등록되었습니다.")
			history.back(-1);
		</script>
		<%
     } catch (Exception e) {
    	 if(conn != null){
    		 try{
    			 conn.rollback();
    		 }catch(SQLException e1){
    			 
    		 }
    	 }
    	 %><script type="text/javascript">
			alert("등록실패")
			history.back(-1);
		</script>
		<%
			e.printStackTrace();
	}finally{
		conn.setAutoCommit(true);
	}
		%>