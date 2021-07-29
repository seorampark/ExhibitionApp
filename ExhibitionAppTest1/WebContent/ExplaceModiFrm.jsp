<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<br/>
<br/>
<h3 class="text-info text-center">전시관 정보 수정</h3>
<%
	String codes = request.getParameter("CodeChk");
	String placename = "";
	location = "";
	String contactno = "";
	String times = "";
	String holiday = "";
	
	String sql = "select * from explace where codes = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, codes);
	rs = pstmt.executeQuery();
	
	
	if(rs.next()){
		do{
			placename = rs.getString("placename");
			location = rs.getString("location");
			contactno = rs.getString("contactno");
			times = rs.getString("times");
			holiday = rs.getString("holiday");		
			
		%>
<section class="row">
<div class="col-md-12">
<form action="ExplaceModiProc.jsp">
	<table class="table table-response table-stripe">
		<tr>
			<th>전시관 코드(수정불가)</th>
			<td><input type="text" class="form-control" value="<%=codes %>" disabled/></td>
			<td><input type="hidden" class="form-control" value="<%=codes %>" name="codes"/></td>
		</tr>
		<tr>
			<th>전시관 이름</th>
			<td><input type="text" class="form-control" value="<%=placename %>" name="placename" /></td>
		</tr>
		<tr>
			<th>위치(수정불가)</th>
			<td><input type="text" class="form-control" value="<%=location %>" disabled/></td>
			<td><input type="hidden" class="form-control" value="<%=location %>" name="location" /></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="text" class="form-control" value="<%=contactno %>" name="contactno" /></td>
		</tr>
		<tr>
			<th>개관시간</th>
			<td>
			<input type="text" class="form-control" value="<%=times.substring(1,3)%>" name="times" /> 		시 부터
			<input type="text" class="form-control" value="<%=times.substring(4,6)%>" name="times" /> 		시 까지
			</td>
		</tr>
		<tr>
			<th>휴관일</th>
			<td><input type="text" class="form-control" value="<%=holiday %>" name="holiday" /></td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="수 정" class="btn btn-success btn-block" />
			</th>
		</tr>
	</table>
</form>
</div>
</section>
		<%}while(rs.next());
	}else{out.println("조회 실패");}
%>
<%@ include file="./include/Footer.jsp" %>