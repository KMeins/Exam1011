<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문정보수정</title>
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
	form.action="orderUpdateProcess.jsp";
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h2 id="h2">주문정보 수정</h2>

	<%@include file="dbconn.jsp" %>
<%
		request.setCharacterEncoding("utf-8");
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		String orderDate=request.getParameter("orderDate");
		String orderName=request.getParameter("orderName");
		int Qty=0;
		if(request.getParameter("orderQty")==null) {
			Qty=0;
		}else {
			Qty=Integer.parseInt(request.getParameter("orderQty"));
		}
		
		int total=0;
		
		try {
			String sql="select to_char(orderDate,'yyyy-mm-dd'),orderName,a.productid,a.unitprice,orderQty,orderAddress,b.name from order1011 a,product1011 b where orderDate=? and orderName=? and a.productid=b.productid";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, orderDate);
			pstmt.setString(2, orderName);
			rs=pstmt.executeQuery();
			if(rs.next());{
				String oDate=rs.getString(1);
				String productid=rs.getString(3);
				int unitprice=rs.getInt(4);
				int orderQty=rs.getInt("orderQty");
				int bQty=0;
				if(Qty==0) {
					bQty=orderQty;
				}else {
					if(Qty==orderQty) {
						bQty=orderQty;
					}else {
						bQty=Qty;
					}
				}
			System.out.println("Qty : "+Qty+" orderQty : "+orderQty+ "bQty: "+bQty);
			String orderAddress=rs.getString("orderAddress");
			String name=rs.getString(7);
			total=unitprice * bQty;
		
%>

<form name="form" method="post" action="orderUpdate.jsp">

<table id="tab4" border=1>

<tr>
	<th width="12%">주문일자</th>
	<td width="25%"><input type="text" name="orderDate" value="<%=oDate %>" id="in4"></td>

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
	<td><input type="text" name="orderQty" id="in5" value="<%=bQty %>" onchange="changesubmit();">
	</td>
 </tr>

<tr>
	<th width="12%">주문금액</th>
	<td width="25%"><input type="text" name="orderprice" id="in4" value="<%=total %>" >
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
<%
	}
		}catch(SQLException e) {
			System.out.println("읽기 실패 : "+e.getMessage());
		}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>