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
			<h1 id=page_title>Department Report</h1>
		</div>
		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">
						<br />
						<table id="example-small" class="table hover table-responsive"
							style="min-width: 90%;">
							<thead class="text-center" id="thead">
								<tr>
									<th style="text-align: center;" width="10%">S.No.</th>
									<th style="text-align: center;" width="20%">Name</th>
										<th style="width: 10%; text-align: center;">Status</th>
								
									<th style="text-align: center;" width="10%">Edit</th>
									
								
									<th style="text-align: center;" width="10%">Delete</th>
								
								</tr>
							</thead>
							<tbody id="tbody">
								<%
								DepartmentService ser = new DepartmentService();
								ArrayList<DepartmentDto> list = ser.getdepartmentInfo(config, request);
								for (DepartmentDto dto : list) {
								%>
								<tr align="center">
									<td><%=list.indexOf(dto) + 1%></td>
									<td id=""><%=dto.getNAME()%></td>
									<td><%=dto.getSTATUS()%></td>
									
									<td><a class="main-color"
										href="update_dept.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
											
									<td><a class="main-color"
										onclick="Delete_Dept(<%=dto.getId() %>)"
										href="">
											<i class="bi bi-trash"></i>
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
		function Delete_Dept(id) {
			//alert("Hello");
			
			alert(id);
			if (id != "") {

				$.ajax({

					url : 'AjaxDeptDelete.jsp',
					data : 'Delete_Dept=' + id,
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