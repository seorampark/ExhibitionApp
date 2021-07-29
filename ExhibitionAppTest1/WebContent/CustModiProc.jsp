<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%
	String mocustid = request.getParameter("custid");
	String mocustname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	
	String sql = "update customers set custname = ?, phone = ?, email = ?  where custid = ? ";
	
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,mocustname);
	pstmt.setString(2,phone);
	pstmt.setString(3,email);
	pstmt.setString(4,mocustid);

	int rs1 = pstmt.executeUpdate();

	if(rs1 > 0){
		out.println("<script>alert('수정 완료!');location.replace('Customers.jsp');</script>");
	}
	

%>