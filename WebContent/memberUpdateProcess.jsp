<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
    request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    String pass=request.getParameter("pass");
    String gender=request.getParameter("gender");
    String emial=request.getParameter("emial1")+"@"+request.getParameter("emial2");
	String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
    String address=request.getParameter("address");
    try {
    	String sql="update member1011 set name=?,password=?,gender=?,emial=?,phone=?,address=? where id=?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(7, id);
        pstmt.setString(1, name);
        pstmt.setString(2, pass);
        pstmt.setString(3, gender);
        pstmt.setString(4, emial);
        pstmt.setString(5, phone);
        pstmt.setString(6, address);
        pstmt.executeUpdate();
        %>
        <script>
        alert("수정 완료");
        location.href="memberSelect.jsp";
        </script>
        <%
    }catch(SQLException e) {
    	System.out.println("수정 오류 : "+e.getMessage());
    }
%>