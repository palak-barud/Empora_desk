<link href="assets/css/style.css" rel="stylesheet">
<%@page import="com.service.* "%>


<%@page import="com.dto.* "%>

<%
int id = (Integer.parseInt(request.getParameter("id") == null ? "0" : request.getParameter("id")));

String name = (request.getParameter("name") == null ? "" : request.getParameter("name"));
String item_code = (request.getParameter("item_code") == null ? "" : request.getParameter("item_code"));
String flag = (request.getParameter("flag") == null ? "" : request.getParameter("flag"));
String class_name = (request.getParameter("class_name") == null ? "" : request.getParameter("class_name"));
String last_line = (request.getParameter("last_line") == null ? "" : request.getParameter("last_line"));
String icon_name = (request.getParameter("icon_name") == null ? "" : request.getParameter("icon_name"));

boolean check_status = false;

CheckNameAvailService ser = new CheckNameAvailService();

if (flag.equalsIgnoreCase("City")) {
	check_status = ser.checkCityAvail(name, id, request, config);
}

if (flag.equalsIgnoreCase("Company")) {
	check_status = ser.checkCompanyAvail(name, id, request, config);
}
if (flag.equalsIgnoreCase("Transpoter")) {
	check_status = ser.checkTranspoterAvail(name, id, request, config);
}
if (flag.equalsIgnoreCase("Pvp")) {
	check_status = ser.checkPersonalVechilePartyAvail(name, id, request, config);
}
if (flag.equalsIgnoreCase("Vehicle")) {
	check_status = ser.checkVehicleAvail(name, id, request, config);
}
if (flag.equalsIgnoreCase("District")) {
	check_status = ser.checkDistrictAvail(name, id, request, config);
}

if (flag.equalsIgnoreCase("Bank")) {
	check_status = ser.checkBankHeadAvail(name, id, request, config);
}

if (flag.equalsIgnoreCase("Dealer")) {
	check_status = ser.checkDealerAvail(name, id, request, config);
}

if (flag.equalsIgnoreCase("Other Dealer")) {
	check_status = ser.checkOtherDealerAvail(name, id, request, config);
}

if (flag.equalsIgnoreCase("Customer")) {
	check_status = ser.checkCustomerAvail(name, id, request, config);
}

if (flag.equalsIgnoreCase("Mobile No.")) {
	check_status = ser.checkUserHeadAvail(name, id, request, config);
}
if (flag.equalsIgnoreCase("Invoice_no")) {
	check_status = ser.checkCompanyBilltyinvoiceAvail(id, name, request, config);
%>
<input id="check_name" type="hidden" value="<%=check_status%>" />
<%
}

if (check_status) {
%>
<div class="d-flex justify-content-center">
	<div class="msg_alert d-flex justify-content-center row col-8">
		<div class="col-lg-6">
			<div class="alert alert-warning alert-dismissible  fade show"
				role="alert">
				<i class="bi bi-check-circle me-1"></i><strong>Warning!</strong>
				This
				<%=flag%>
				Already Exist.
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</div>
	</div>
</div>
<input id="check_name" type="hidden" value="<%=check_status%>" />
<%
}
if (!class_name.equals("") && !last_line.equals("")) {
check_status = false;
%>
<div class="d-flex justify-content-center">
	<div class="msg_alert d-flex justify-content-center row col-8">
		<div class="col-lg-4">
			<div class="alert <%=class_name%> alert-dismissible  fade show"
				role="alert">
				<i class="bi <%=icon_name%> me-1"></i><strong><%=name%> !</strong>
				<%=flag%>
				<%=last_line%>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</div>
	</div>
</div>
<input id="check_name" type="hidden" value="<%=check_status%>" />
<%
}
%>
