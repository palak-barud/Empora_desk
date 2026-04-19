<%@page import="java.util.ArrayList"%>
<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.*"%>
<%@page import="com.service.*"%>
<!-- Head Start -->
<%@include file="include/head.jsp"%>
<!-- Head End -->
</head>
<body>
	<div id="ser"></div>
	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->

	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->

	<main id="main" class="main">
		<!-- ======= Breadcrumbs ======= -->
	<%-- 	<%@include file="breadcrumbs/sell.jsp"%> --%>
		<!--  Breadcrumbs End-->
		<div class="pagetitle text-center">
			<%@include file="include/add_pages.jsp"%>
			<h1 id=page_title>Salary Details</h1>
		</div>
		<section class="section dashboard">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card ">
						<div class="card-body table-responsive">
							<br>
							<!-- Searching Start -->

							<div id="rev"></div>
							<%
							String departmentName = request.getParameter("Department_name") == null ? "" : request.getParameter("Department_name");
							String employeeName = request.getParameter("Employee_name") == null ? "" : request.getParameter("Employee_name");
							String salaryYear = request.getParameter("Salary_year") == null ? "" : request.getParameter("Salary_year");
							String salaryMonth = request.getParameter("Salary_month") == null ? "" : request.getParameter("Salary_month");
							%>
							<div class="row " id="table_search">
								<form class="row g-3 d-flex justify-content-center"
									style="margin-top: 0px; margin-bottom: 0px;">

									<!-- <div class="col-lg-3 refresh-container" data-add="add_dept.jsp"
									data-list="party">
									<div class="control form-floating  refresh-input">
										<input type="text" class="form-control" id="departmentName"
											name="Dept_name" placeholder="Contract No."> <input
											type="hidden" id="dept_id_fk" name="dept_id_fk" value=""
											data-party-id /> <label for="dl_no">Department Name</label>
										<div class="invalid-feedback">Please, Enter Name !</div>
									</div>
								</div> -->

								<!-- <div class="col-lg-3 refresh-container"
									data-add="add_employee.jsp" data-list="good">
									<div class="control form-floating  refresh-input">
										<input type="text" class="form-control" id="employeeName"
											name="emp_name" placeholder="Contract No."> <input
											type="hidden" id="emp_id_fk" name="emp_id_fk" value=""
											data-party-id /> <label for="dl_no">Employee Name</label>
										<div class="invalid-feedback">Please, Enter Name !</div>
									</div>
								</div> -->

									<div class="col-md-2">
										<div class="control form-floating">
											<select class="form-select" id="salary_year"
												name="Salary_year">
												<option value="" selected>Salary Year</option>
												<option value="2025"
													<%="2025".equals(salaryYear) ? "selected" : ""%>>2025</option>
												<option value="2026"
													<%="2026".equals(salaryYear) ? "selected" : ""%>>2026</option>
												<option value="2027"
													<%="2027".equals(salaryYear) ? "selected" : ""%>>2027</option>
											</select> <label for="salary_year">Salary Year</label>
										</div>
									</div>
									<div class="col-md-2">
										<div class="control form-floating">
											<select class="form-select" id="salary_month"
												name="Salary_month">
												<option value="" selected>Salary Month</option>
												<option value="1"
													<%="1".equals(salaryMonth) ? "selected" : ""%>>January</option>
												<option value="2"
													<%="2".equals(salaryMonth) ? "selected" : ""%>>February</option>
												<option value="3"
													<%="3".equals(salaryMonth) ? "selected" : ""%>>March</option>
												<option value="4"
													<%="4".equals(salaryMonth) ? "selected" : ""%>>April</option>
												<option value="5"
													<%="5".equals(salaryMonth) ? "selected" : ""%>>May</option>
												<option value="6"
													<%="6".equals(salaryMonth) ? "selected" : ""%>>June</option>
												<option value="7"
													<%="7".equals(salaryMonth) ? "selected" : ""%>>July</option>
												<option value="8"
													<%="8".equals(salaryMonth) ? "selected" : ""%>>August</option>
												<option value="9"
													<%="9".equals(salaryMonth) ? "selected" : ""%>>September</option>
												<option value="10"
													<%="10".equals(salaryMonth) ? "selected" : ""%>>October</option>
												<option value="11"
													<%="11".equals(salaryMonth) ? "selected" : ""%>>November</option>
												<option value="12"
													<%="12".equals(salaryMonth) ? "selected" : ""%>>December</option>
											</select> <label for="salary_month">Salary Month</label>
										</div>
									</div>
									<div class="col-md-2 col-4">
										<div class="form-floating">
											<button type="submit" class="submit-btn">Submit</button>
										</div>
									</div>
								</form>
							</div>
							<br> <br>
							<!-- Table Start -->
							<table id="large_table"
								class="table hover nowrap table-responsive">
								<thead id="thead">
									<tr>
										<th style="width: 1%; text-align: center;">S.No</th>
										<!-- 	<th style="width: 1%; text-align: center;">Print</th> -->
										<th style="width: 1%; text-align: center;">Employee Name</th>
										<!-- <th style="width: 1%; text-align: center;">Department
											Name</th> -->
										<th style="width: 1%; text-align: center;">Salary Date</th>
										<th style="width: 1%; text-align: center;">Salary Year</th>
										<th style="width: 1%; text-align: center;">Salary Month</th>
										<th style="width: 1%; text-align: center;">Total Days</th>
										<th style="width: 1%; text-align: center;">Full Days</th>
										<th style="width: 1%; text-align: center;">Half Days</th>
										<th style="width: 1%; text-align: center;">Absent</th>
										<th style="width: 1%; text-align: center;">Leave</th>
										<th style="width: 1%; text-align: center;">Extra Days</th>
										<th style="width: 1%; text-align: center;">Final Salary</th>
										<th style="width: 1%; text-align: center;">Status</th>
										<th style="text-align: center;" width="1%">Edit</th>
										<th style="text-align: center;" width="1%">Delete</th>
									</tr>
								</thead>
								<tbody id="tbody" class="text-center"
									style="overflow-y: auto; max-height: 100px;">
									<%
									Salaryservice ser = new Salaryservice();
									ArrayList<Salarydto> sal_list = ser.getSalaryInfoByName(departmentName, employeeName, salaryYear, salaryMonth, request);
									for (Salarydto dto : sal_list) {
									%>
									<tr>
										<td><%=sal_list.indexOf(dto) + 1%></td>
										<%-- <td><a class="main-color" href=".jsp?id=<%=dto.getId()%>">
												<i class="fa-solid fa-print"></i>
										</a></td> --%>
										<td><%=dto.getEmployee_name()%></td>
										<%-- <td><%=dto.getDept_name()%></td> --%>
										<td><%=LogFileService.changeFormate(dto.getSalary_date(), "yyyy-mm-dd", "dd-mm-yyyy")%></td>
										<td><%=dto.getSalary_year()%></td>
										<td><%=dto.getSalary_month()%></td>

										<td><%=dto.getTotal_days()%></td>
										<td><%=dto.getFull_days()%></td>
										<td><%=dto.getHalf_days()%></td>
										<td><%=dto.getAbsent()%></td>
										<td><%=dto.getLeave_day()%></td>
										<td><%=dto.getExtra_days()%></td>
										<td><%=dto.getFinal_salary()%></td>
										<td><%=dto.getSTATUS()%></td>

										<td><a class="main-color"
											href="update_salary.jsp?id=<%=dto.getId()%>"><i
												class="bi bi-pencil-square"></i></a></td>
										<td id="delete_Salary"><a href=""
											onclick="delete_Salary(<%=dto.getId()%>)"> <i
												class="bi bi-trash main-color"></i>
										</a></td>
									</tr>

									<%
									}
									%>
								
								<tfoot id="tfoot">
									<%
									float totalSalary = 0;
									for (Salarydto dto : sal_list) {
										totalSalary += dto.getFinal_salary();
									}
									%>
									<tr>
										<td colspan="11"></td>
										<td><strong>(Total Salary) <%=totalSalary%>
										</strong></td>
										<td colspan="3"></td>
									</tr>
								</tfoot>

								</tbody>


								<tfoot id="tfoot">
									<!-- <tr>
										<td colspan="16"></td>
									</tr> -->
								</tfoot>
							</table>
							<!-- Table End -->
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->
	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->
	<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->

	<!-- Customize Script Start  -->
	<script type="text/javascript">
		function delete_Salary(id) {
			//alert("Hello");
			
			alert(id);
			if (id != "") {

				$.ajax({

					url : 'AjaxSalaryDelete.jsp',
					data : 'delete_Employee_Salary=' + id,
					type : 'post',
					success : function(msg) {

						$('#rev').html(msg);

						var check_i = document.getElementById("check").value;

						if (check_i == "done") {

							window.location.href = "report_Salary.jsp?Yes"

						}
					}
				});
			}
		}
	</script>
	<!-- Customize Script End -->

</body>
</html>