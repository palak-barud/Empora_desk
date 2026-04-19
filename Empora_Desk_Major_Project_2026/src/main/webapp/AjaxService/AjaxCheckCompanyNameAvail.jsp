<link href="assets/css/style.css" rel="stylesheet">
<%@page import="com.service.* "%>

<%@page import="com.dto.* "%>

<%
int name = (Integer.parseInt(request.getParameter("name") == null ? "0" : request.getParameter("name")));

String invoice_no = (request.getParameter("invoice_no") == null ? "" : request.getParameter("invoice_no"));

boolean check_status = false;

CheckNameAvailService ser = new CheckNameAvailService();


	check_status = ser.checkCompanyinvoiceAvail(name,invoice_no, request, config);



%>
<input id="check_name" type="hidden" value="<%=check_status%>" />

<%

%>
