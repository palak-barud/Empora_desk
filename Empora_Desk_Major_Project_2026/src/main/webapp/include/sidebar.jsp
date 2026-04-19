<%@page import="com.dto.UserDto"%>
<%@page import="com.service.UserService"%>

<%
UserService user_sidebar_ser1 = new UserService();
UserDto user_sidebar_dto1 = user_sidebar_ser1.getuserInfoById(user_id, config, request);
%>

<%
if (user_id > 0) {
%>

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">
	<ul class="sidebar-nav" id="sidebar-nav">

		<li class="nav-item"><a class="nav-link collapsed"
			href="index.jsp"> <i class="fa fa-home" aria-hidden="true"></i> <span>HOME</span>
		</a></li>
		
		<li class="nav-item"><a class="nav-link collapsed"
			href="add_employee.jsp"> <i class="fa fa-user-plus"
				aria-hidden="true"></i> <span>Add Employee</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="employee_report.jsp"> <i class="fa fa-users"
				aria-hidden="true"></i> <span>Employee Report</span>
		</a></li>
		

		
		
		<li class="nav-item"><a class="nav-link collapsed"
			href="add_attendence.jsp"> <i class="fa fa-calendar-check-o"
				aria-hidden="true"></i> <span>Add Attendance</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="attendence_report.jsp"> <i class="fa fa-calendar-alt"
				aria-hidden="true"></i> <span>Attendance Report</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="salary_report.jsp"> <i class="fa fa-money"
				aria-hidden="true"></i> <span>Salary Details</span>
		</a></li>
		
		<li class="nav-item"><a class="nav-link collapsed"
			href="add_dept.jsp"> <i class="fa fa-building" aria-hidden="true"></i>
				<span>Add Department</span>
		</a></li>

		<li class="nav-item"><a class="nav-link collapsed"
			href="department_report.jsp"> <i class="fa fa-list-alt"
				aria-hidden="true"></i> <span>Department Report</span>
		</a></li>
		

		<%
		if (user_sidebar_dto1.getUser_module().equalsIgnoreCase("Yes")) {
		%>
		<li class="nav-item" style="margin-top: 5px;"><a
			class="nav-link collapsed" href="manage_user.jsp"> <i
				class="fa fa-user-cog" aria-hidden="true"></i> <span>USER</span>
		</a></li>
		<%
		}}
		%>

		<li class="nav-item" style="margin-top: 5px;"><a
			class="nav-link collapsed" href="logout.jsp"> <i
				class="fa fa-sign-out" aria-hidden="true"></i> <span>LOGOUT</span>
		</a></li>
	</ul>
</aside>
<!-- End Sidebar-->

<!-- End Sidebar-->


<div id="name_avail_resposnse" class="col-12" style="display: none;"></div>