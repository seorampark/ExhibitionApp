<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<br/><br/>
<h3 class="text-center text-primary">관람권 예약 페이지</h3>
<section class="row">
<%	 

String sql = "select * from exhibition";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
if(rs.next()){
	do{
		String extitle = rs.getString("extitle");
		String placename = rs.getString("placename");
		String exprice = rs.getString("exprice");
		String sdate = rs.getString("sdate").substring(0,10);
		String edate = rs.getString("edate").substring(0,10);
		%>
<div class="col-md-3">
<div class="form_wrap">
	<form action="ReservationInsertProc.jsp" method="get" name="" id="">
		<h4 class="text-primary"><%=extitle %></h4>
		<p class="text-success">전시 장소 : <%=placename %></p>
		<p class="text-success">관람료 : <%=exprice %></p>
		<p class="text-success">전시 일자 : <%=sdate %> ~ <%=edate %></p>
		<p> 관람 인원 : </p>
		<select name="tcnt" class="form-control">
			<option value="1">1 명</option>
			<option value="2">2 명</option>
			<option value="3">3 명</option>
			<option value="4">4 명</option>
			<option value="5">5 명</option>
		</select><br/>
		<p> 결제수단 : </p>
		<select name="payment" class="form-control">
			<option value="신용카드">신용카드</option>
			<option value="무통장입금">무통장입금</option>
			<option value="계좌이체">계좌이체</option>
		</select><br/>
		<p> 관람 일자 : </p>
		<input type="date" value="<%=sdate%>" name="dates" class="form-control" /><br/>
		<input type="hidden" value="<%=exprice%>" name="exprice" class="form-control" /><br/>
		<input type="submit" class="btn btn-success btn-block"  value="관람권 예약"/>
	</form>	
	<br/>
</div>
</div>		
		<%
	}while(rs.next());
}

else{out.println("조회실패");}	
%>
</section>
<%@ include file="./include/Footer.jsp" %>