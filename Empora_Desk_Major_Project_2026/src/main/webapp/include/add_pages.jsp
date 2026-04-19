
<div class="pagetitle" style="float: right; margin-right: 2%;">
	<%
	// Define the list of breadcrumb items and their corresponding href values
	String[][] addItemHrefs = { { "department_report.jsp" }, { "employee_report.jsp" },
			{ "attendence_report.jsp" } ,{ "manage_msg.jsp" }, { "manage_user.jsp" } };

	String[] addRichItemHrefs = { "add_dept.jsp", "add_employee.jsp", "add_attendence.jsp","add_msg.jsp",  "add_user.jsp" };// Get the current URL

	String[] addTitle = { "Add Department", "Add Employee", "Add Attendence", "Msg", "User" };
	String currentURL = request.getRequestURI(); // You may need to adjust this based on your servlet container

	for (int j = 0; j < addItemHrefs.length; j++) {
		String addRichsItemHref = addRichItemHrefs[j];
		String addTitles = addTitle[j];
		String[] currentAddItemHrefs = addItemHrefs[j];

		for (String addItemHref : currentAddItemHrefs) {
			if (currentURL.contains(addItemHref)) {
		String fullURL = request.getContextPath() + "/" + addRichsItemHref;
	%>
	<button style="font-weight: 1000;"
		onclick="window.location.href = '<%=fullURL%>';" type="submit"
		class="submit-btn btn4">
		<i class="fa-solid fa-circle-plus"></i>
		<%=addTitles%>
	</button>
	<%
	}
	}
	}
	%>


</div>

<style>
.btn4:hover {
	border: 1px solid #318093;
	background-color: #fff;
	color: #318093;
}

.btn4 {
	font-size: 12px;
	border: 1px solid #318093;
 }
</style>

