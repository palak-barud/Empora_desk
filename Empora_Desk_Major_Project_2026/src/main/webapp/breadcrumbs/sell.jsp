<%@page import="com.dto.UserDto"%>
<%@page import="com.service.UserService"%>
<link href="assets/css/style.css" rel="stylesheet">

<div class="horizontal">
	<div class="verticals ten offset-by-one">
		<ol class="breadcrumb breadcrumb-fill2 style4">
			<%
			UserService user_sidebar_service = new UserService();
			UserDto user_sidebar_dto_nav = user_sidebar_service.getuserInfoById(user_id, config, request);
			%>
			<li><a href="index.jsp"><i class="fa fa-home"></i></a></li>

			<li><a target="" href="department_report.jsp">Department
			</a></li>
			<li><a target="" href="employee_report.jsp"> Employee
			</a></li>
			<li><a target="" href="attendence_report.jsp">Attendence
			</a></li>
			<li><a target="" href="salary_report.jsp">Salary
			</a></li>
		</ol>
	</div>

</div>
