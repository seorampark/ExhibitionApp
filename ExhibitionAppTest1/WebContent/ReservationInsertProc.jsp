<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%
String dates = request.getParameter("dates");
String tprice = request.getParameter("exprice");
String tcnt = request.getParameter("tcnt");
String payment = request.getParameter("payment");

String sql1 = "insert into tickets value(null, ?, ?, now(), ?, ?, ?)";
pstmt = conn.prepareStatement(sql1);
pstmt.setString(1,custname);
pstmt.setString(2,dates);
pstmt.setString(3,tprice);
pstmt.setString(4,tcnt);
pstmt.setString(5,payment);

int rs2 = pstmt.executeUpdate();
if(rs2 >0 ){
		out.println("<script>alert('예매를 완료하였습니다.'); location.replace('Ticket.jsp');</script>");
	}
	
%>