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
<h2 id="h2">상품 조회 목록</h2>
<%@include file="dbconn.jsp" %>
<table border=1 id="tab6">
<tr>
    <th>상품코드</th>
    <th>상품명</th>
    <th>단가</th>
    <th>상세정보</th>
    <th>제조사</th>
    <th>분류</th>
    <th>재고수</th>
    <th>상태</th>
    <th>구분</th>
</tr>
<%
    ResultSet rs=null;
    PreparedStatement pstmt=null;
    try{
    	String sql="select * from product1011";
    	pstmt=conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	while(rs.next()) {
    		String productid=rs.getString("productid");
    		String name=rs.getString("name");
    		String unitprice=rs.getString("unitprice");
    		String description=rs.getString("description");
    		String manufacturer=rs.getString("manufacturer");
    		String category=rs.getString("category");
    		String unitslnstock=rs.getString("unitslnstock");
			String condition=rs.getString("condition");
%>
<tr>
	<td><%=productid %></td>
    <td><%=name %></td>
    <td><%=unitprice %></td>
    <td><%=description %></td>
    <td><%=manufacturer %></td>
    <td><%=category %></td>
    <td><%=unitslnstock %></td>
    <td><%=condition %></td>
    <td>
    <a href="updateProduct.jsp?productid=<%=productid %>">수정</a>/
    <a href="deleteProduct.jsp?productid=<%=productid %>"
    	onclick="if(!confirm('정말로 삭제하시겠습니까?'))return false;">삭제</a>
    </td>
</tr>
<%
	}
		}catch(SQLException e) {
    		System.out.println("읽기 실패 : "+e.getMessage());
        }	
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>