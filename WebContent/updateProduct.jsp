<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function submit() {
	if(document.form.productid.value=="") {
		alert("상품코드를 입력하세요");
		document.form.productid.focus();
		return false;
	}
	if(document.form.name.value=="") {
		alert("상품명을 입력하세요");
		document.form.name.focus();
		return false;
	}
	if(document.form.name.value.length<4 || document.form.name.value>50) {
		alert("[상품명]\n최소 4자에서 최대 50자까지 입력하세요.");
		document.form.name.focus();
		return false;
	}
	if(document.form.unitprice.value=="") {
		alert("가격을 입력하세요");
		document.form.name.focus();
		return false;
	}
	if(document.form.unitprice.value.length==0 || isNaN(document.form.unitprice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		return false;
	}
	if(document.form.unitprice.value<0) {
		alert("[가격]\n음수를 입력할 수 없습니다.");
		return false;
	}
	if(document.form.unitslnstock.value.length==0 ||isNaN(document.form.unitsInstock.value)) {
		alert("[재고]\n숫자만 입력하세요");
		document.form.unitsInstock.focus();
		return false;
	}
	if(document.form.unitslnstock.value <0) {
		alert("[재고]\n음수를 입력할 수 없습니다.");
		document.form.unitslnstock.focus();
		return false;
	}
	document.form.submit();
}
</script>

</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
	<h2 id="h2">상품 수정 화면</h2>
<hr>
<%@ include file="dbconn.jsp" %>
<%
    ResultSet rs=null;
    PreparedStatement pstmt=null;
    String productid=request.getParameter("productid");
    try {
    	String sql="select * from product1011 where productid=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, productid);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			String name=rs.getString("name");
		    String unitprice=rs.getString("unitprice");
		    String description=rs.getString("description");
		    String manufacturer=rs.getString("manufacturer");
		    String category=rs.getString("category");
		    String unitslnstock=rs.getString("unitslnstock");
		    String condition=rs.getString("condition");

%>
<form name="form" method="post" action="updateProductProcess.jsp">
<table id="tab2" border=1>

<tr>
	<th>상품코드</th>
	<td><input type="text" name="productid" id="in1" value="<%=productid %>"></td>
</tr>
 
<tr>
	<th>상품명</th>
	<td><input type="text" name="name" id="in1" value="<%=name %>"></td>
</tr>

<tr>
	<th>가격</th>
	<td><input type="text" name="unitprice" id="in1" value="<%=unitprice %>"></td>
</tr>

<tr>
	<th>상세정보</th>
	<td><input type="text" name="description" id="in1" value="<%=description %>"></td>
</tr>

<tr>
	<th>제조사</th>
	<td><input type="text" name="manufacturer" id="in1" value="<%=manufacturer %>"></td>
</tr>

<tr>
	<th>분류</th>
	<td>
    	<select name="category" id="in2">
    	<option value="10" <%if(category.equals("10")){%> selected <%} %>>it제품</option>
    	<option value="20" <%if(category.equals("20")){%> selected <%} %>>주방제품</option>
    	<option value="30" <%if(category.equals("30")){%> selected <%} %>>전자제품</option>
    	<option value="40" <%if(category.equals("40")){%> selected <%} %>>일반잡화</option>
    	</select>
	</td>
</tr>

<tr>
	<th>재고수량</th>
	<td><input type="text" name="unitslnstock" id="in1" value="<%=unitslnstock %>"></td>
</tr>

<tr>
	<th>상태</th>
	<td> 
		<input type="radio" value="신규제품" name="condition"
		<%=condition.equals("신규제품") ? "checked":"" %>>신규제품
		<input type="radio" value="중고제품" name="condition"
		<%=condition.equals("중고제품") ? "checked":"" %> >중고제품
		<input type="radio" value="재생제품" name="condition"
		<%=condition.equals("재생제품") ? "checked":"" %> >재생제품
	</td>
</tr>

<tr>
<td colspan=2 align="center">
    <button type="submit" id="btn1" value="등록" onclick="check()">등록</button>
    <button type="reset" id="btn1" onclick="history.back(); return false;">취소</button>
</td>
</tr>


<%
		}
    }catch(SQLException e) {
    	System.out.println("읽기 실패 : "+e.getMessage());
    }    
%>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>