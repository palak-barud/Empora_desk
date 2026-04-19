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
			<h1 id=page_title>Attendence Report</h1>
		</div>
		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">
						<br />
						<%
					
						String employee = request.getParameter("emp_name") == null ? "" : request.getParameter("emp_name");
						%>

						<div class="row " id="table_search">
							<form class="row g-3 d-flex justify-content-center"
								style="margin-top: 0px; margin-bottom: 0px;">

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
						<table id="example-small" class="table hover table-responsive"
							style="min-width: 90%;">
							<thead class="text-center" id="thead">
								<tr>
									<th style="text-align: center;" width="10%">S.No.</th>
									<th style="text-align: center;" width="20%">Employee Name</th>
									<th style="text-align: center;" width="20%">Current Date</th>
									<th style="text-align: center;" width="20%">Attendence Status</th>
									<th style="width: 10%; text-align: center;">Status</th>
									<th style="text-align: center;" width="10%">Edit</th>
									<th style="text-align: center;" width="10%">Delete</th>

								</tr>
							</thead>
							<tbody id="tbody">
								<%
								attendenceservice ser = new attendenceservice();
								ArrayList<attendencedto> list = ser.getattendenceInfoByName(employee, config, request);
								for (attendencedto dto : list) {
								%>
								<tr align="center">
									<td><%=list.indexOf(dto) + 1%></td>
									<td id=""><%=dto.getEmp_name()%></td>
									<td id=""><%=dto.getDATE()%></td>
									<td id=""><%=dto.getAttendence_status()%></td>
									<td><%=dto.getSTATUS() %></td>

									<td><a class="main-color"
										href="update_attendence.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>

									<td><a class="main-color"
										onclick="Delete_Attend(<%=dto.getId()%>)" href=""> <i
											class="bi bi-trash"></i>
									</a></td>

								</tr>

								<%
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- End #main -->

	<script type="text/javascript">
		function Delete_Attend(id) {
			//alert("Hello");
			
			alert(id);
			if (id != "") {

				$.ajax({

					url : 'AjaxAttendDelete.jsp',
					data : 'Delete_attend=' + id,
					type : 'post',
					success : function(msg) {

						$('#rev').html(msg);

						var check_i = document.getElementById("check").value;

						if (check_i == "done") {

							window.location.href = "attendence_report.jsp?Yes"

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