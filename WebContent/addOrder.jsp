<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보등록</title>
<script>
function changesubmit() {
	document.form.submit();
}
function check(){
	
	if (!document.form.orderDate.value || document.form.orderDate.value=="" ) {
		alert("주문일자를 입력하세요.");
		document.form.orderDate.focus();
		return false;
	}
	if (!document.form.orderName.value || document.form.orderName.value=="") {
		alert("주문자이름을  입력하세요.");
		document.form.orderName.focus();
		return false;
	}
	if (!document.form.productid.value || document.form.productid.value=="") {
		alert("상품코드를 입력하세요.");
		document.form.productId.focus();
		return false;
	}
	if (!document.form.orderQty.value || document.form.orderQty.value=="") {
		alert("주문수량을 입력하세요.");
		document.form.orderQty.focus();
		return false;
	}
	if (!document.form.orderAddress.value || document.form.orderAddress.value=="") {
		alert("주문자 주소를 입력하세요.");
		document.form.address.focus();
		return false;
	}
	form.action="orderProcess.jsp";
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h2 id="h2">주문정보 등록</h2>

	<%@include file="dbconn.jsp" %>
	<%
		request.setCharacterEncoding("utf-8");
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		String productid=request.getParameter("productid");
		String unit=request.getParameter("unitprice");
		String orderQty=request.getParameter("orderQty");
		String orderDate=request.getParameter("orderDate");
		String orderName=request.getParameter("orderName");
		String orderAddress=request.getParameter("orderAddress");
		if(orderDate==null) {
			orderDate="";
		}
		if(orderName==null) {
			orderName="";
		}
		if(orderAddress==null) {
			orderAddress="";
		}
		int oQty=0;
		if(orderQty == null) {
			orderQty="0";
		}
		oQty=Integer.parseInt(orderQty);
		String name="";
		int unitprice=0;
		int total=0;
		int stock=0;
		if(productid != null) {
		try {
			String sql="select name,unitprice,unitslnstock from product1011 where productid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, productid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				name=rs.getString("name");
				unitprice=rs.getInt(2);
				total=oQty*unitprice;
				stock=rs.getInt(3);
				if(oQty>stock) {
					%>
					<script>
					alert("주문 수량이 재고 수량보다 많습니다");
					history.back(-1);
					</script>
					<%
				}
			}else {
				%>
				<script>
				alert("등록되지 않은 상품코드입니다.");
				history.back(-1);
				</script>
				<%
			}
		}catch(SQLException e) {
			System.out.println("읽기 실패 :"+e.getMessage());
		}
		}else{
			productid="";
		}
	%>

<form name="form" method="post" action="addOrder.jsp">

<table id="tab4" border=1>

<tr>
	<th width="12%">주문일자</th>
	<td width="25%"><input type="text" name="orderDate" value="<%=orderDate %>" id="in4"></td>

	<th width="12%">주문자 이름</th>
	<td><input type="text" name="orderName" value="<%=orderName %>" id="in5">
	</td>
</tr>

<tr>
	<th width="12%">상품코드</th>
	<td width="25%"><input type="text" name="productid" value="<%=productid %>" id="in4" onchange="changesubmit()"></td>

	<th width="12%">상품명</th>
	<td><input type="text" name="productName" id="in5" value="<%=name %>">
	</td>
</tr>

<tr>
	<th width="12%">단가</th>
	<td width="25%"><input type="text" name="unitprice" id="in4" value="<%=unitprice %>">
	</td>

	<th width="12%">주문수량</th>
	<td><input type="text" name="orderQty" id="in5" value="<%=orderQty %>" onchange="changesubmit();">
	</td>
 </tr>

<tr>
	<th width="12%">주문금액</th>
	<td width="25%"><input type="text" name="orderprice" id="in4" value="<%=total %>">
	</td>

	<th width="12%">주문주소</th>
	<td><input type="text" name="orderAddress" id="in5" value="<%=orderAddress %>"></td>
</tr>

<tr>
	<td colspan=4 align=center>
		<button type="button" id="btn1" onclick="history.back(); return false;">목록</button>
		<button type="submit" id="btn1" value="저장" onclick='check();'>저장</button>
	</td>
</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>