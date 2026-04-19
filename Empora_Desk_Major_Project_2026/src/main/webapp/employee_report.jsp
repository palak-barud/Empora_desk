<%@page import="com.dto.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.service.*"%>

<!-- Head Start -->
<%@include file="include/head.jsp"%>
<!-- head End -->
</head>

<body>
	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->

	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->
	<main id="main" class="main">

		<!-- ======= Breadcrumbs ======= -->
		<%-- <%@include file="breadcrumbs/sell.jsp" %> --%>
		<!--  Breadcrumbs End-->
		<div class="pagetitle text-center">
			<%@include file="include/add_pages.jsp"%>
			<h1 id=page_title>Employee Report</h1>
		</div>
		<section class="section">
			<div class="row">
				<div class="card">
					<div class="card-body table-responsive">
						<br />
						<%
						String department = request.getParameter("Dept_name") == null ? "" : request.getParameter("Dept_name");
						String employee = request.getParameter("emp_name") == null ? "" : request.getParameter("emp_name");
						%>

						<div class="row " id="table_search">
							<form class="row g-3 d-flex justify-content-center"
								style="margin-top: 0px; margin-bottom: 0px;">

								<div class="col-lg-3 refresh-container" data-add="add_dept.jsp"
									data-list="party">
									<div class="control form-floating  refresh-input">
										<input type="text" class="form-control" id="Dept_name"
											name="Dept_name" placeholder="Contract No."> <input
											type="hidden" id="dept_id_fk" name="dept_id_fk" value=""
											data-party-id /> <label for="dl_no">Department Name</label>
										<div class="invalid-feedback">Please, Enter Name !</div>
									</div>
								</div>

								<div class="col-lg-3 refresh-container"
									data-add="add_employee.jsp" data-list="good">
									<div class="control form-floating  refresh-input">
										<input type="text" class="form-control" id="emp_name"
											name="emp_name" placeholder="Contract No."> <input
											type="hidden" id="emp_id_fk" name="emp_id_fk" value=""
											data-party-id /> <label for="dl_no">Employee Name</label>
										<div class="invalid-feedback">Please, Enter Name !</div>
									</div>
								</div>






								<div class="col-md-2 col-4">
									<div class="form-floating">
										<button type="submit" class="submit-btn">Submit</button>
									</div>
								</div>
							</form>
						</div>
						<br>
						<!-- Wrap the table in a container to enable horizontal scrolling -->
						<div style="overflow-x: auto;">
							<table id="example" class="table hover">
								<thead class="text-center" id="thead">
									<tr>
										<th style="text-align: center;" width="1%">S.No.</th>
										<th style="text-align: center;" width="1%">Generate
											Salary</th>
										<th style="text-align: center;" width="1%">Department
											Name</th>
										<th style="text-align: center;" width="1%">Employee Name</th>
										<th style="text-align: center;" width="1%">Mobile No.</th>
										<th style="text-align: center;" width="1%">Address</th>
										<th style="text-align: center;" width="1%">Email</th>
										<th style="text-align: center;" width="1%">Gender</th>
										<th style="text-align: center;" width="1%">Age</th>
										<th style="text-align: center;" width="6%">Education</th>
										<th style="text-align: center;" width="1%">Experience</th>
										<th style="text-align: center;" width="1%">Designation</th>
										<th style="text-align: center;" width="5%">Joining Date</th>
										<th style="text-align: center;" width="1%">Salary</th>
										<th style="text-align: center;" width="1%">Status</th>

										<th style="text-align: center;" width="1%">Edit</th>
										<th style="text-align: center;" width="1%">Delete</th>
									</tr>
								</thead>
								<tbody id="tbody">
									<%
									Employeeservice ser = new Employeeservice();
									ArrayList<Employeedto> list = ser.getemployeeInfoByName(department, employee, request);
									for (Employeedto dto : list) {
									%>
									<tr align="center">
										<td><%=list.indexOf(dto) + 1%></td>
										<td><a class="main-color"
											href="generate_salary.jsp?id=<%=dto.getId()%>"><i
												class="bi bi-pencil-square"></i></a></td>

										<td id=""><%=dto.getDept_name()%></td>
										<td id=""><%=dto.getNAME()%></td>
										<td id=""><%=dto.getMobile_no()%></td>
										
										<td id=""><%=dto.getAddress()%></td>
										<td id=""><%=dto.getEmail()%></td>
										<td id=""><%=dto.getGender()%></td>
										<td id=""><%=dto.getAge()%></td>
										<td id=""><%=dto.getEducation()%></td>
										<td id=""><%=dto.getExperience()%></td>
										<td id=""><%=dto.getDesignation()%></td>
										<td><%=LogFileService.changeFormate(dto.getJoining_date(), "yyyy-MM-dd", "dd-MM-yyyy")%></td>

										<td id=""><%=dto.getSalary()%></td>
										<td><%=dto.getSTATUS()%></td>

										<td><a class="main-color"
											href="update_employee.jsp?id=<%=dto.getId()%>"><i
												class="bi bi-pencil-square"></i></a></td>
										<td><a class="main-color"
											onclick="Delete_Emp(<%=dto.getId()%>)" href=""><i
												class="bi bi-trash"></i></a></td>
									</tr>
									<%
									}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->

	<script type="text/javascript">
		function Delete_Emp(id) {
			//alert("Hello");
			
			alert(id);
			if (id != "") {

				$.ajax({

					url : 'AjaxEmpDelete.jsp',
					data : 'Delete_emp=' + id,
					type : 'post',
					success : function(msg) {

						$('#rev').html(msg);

						var check_i = document.getElementById("check").value;

						if (check_i == "done") {

							window.location.href = "department_report.jsp?Yes"

						}
					}
				});
			}
		}
	</script>

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->

	<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->

</body>

</html>