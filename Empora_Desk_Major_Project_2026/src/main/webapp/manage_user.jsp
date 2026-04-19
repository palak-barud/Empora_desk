<!-- ======= Head ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= Head End======= -->

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
		<%@include file="breadcrumbs/user.jsp"%>
		<!--  Breadcrumbs End-->

		<div class="pagetitle text-center">
			<%@include file="include/add_pages.jsp"%>
			<h1 id=page_title>User Report</h1>
		</div>

		<section class="section">
			<div class="row">
				<div class="card ">
					<div class="card-body table-responsive">
						<br>
						<table id="small_table"
							class="table hover table-responsive nowrap" style="min-width: 100%;">

							<thead class="text-center" id="thead">
								<tr>
									<th style="width: 5%;">S.No.</th>
									<th style="width: 21%;">Name</th>
									<th style="width: 12%;">Mobile No.</th>
									<th style="width: 12%;">Password</th>
									<th style="width: 25%;">Address</th>
									<th style="width: 10%;">Status</th>
									<%
									if (user_sidebar_dto1.getUpdate_module().equals("Yes")) {
									%>
									<th style="width: 5%; display: none;">Features</th>
									<%
									}
									%>
									<%
									if (user_sidebar_dto1.getUpdate_module().equals("Yes")) {
									%>
									<th style="text-align: center;" width="5%">Edit</th>
									<%
									}
									%>
									<%
									if (user_sidebar_dto1.getDelete_module().equals("Yes")) {
									%>
									<th style="text-align: center;" width="5%">Delete</th>
									<%
									}
									%>
								</tr>
							</thead>
							<tbody class="text-center" id="tbody">
								<%
								UserService service = new UserService();
								ArrayList<UserDto> list = service.getuserInfo(config, request);
								for (UserDto dto : list) {
								%>
								<tr>
									<td id="name-td"><%=list.indexOf(dto) + 1%></td>
									<td class="main-color"><%=dto.getName()%></td>
									<td><%=dto.getMobile_no()%></td>
									<td><%=dto.getPassword()%></td>
									<td><%=dto.getAddress()%></td>
									<td><%=dto.getStatus()%></td>
									<%
									if (user_sidebar_dto1.getUpdate_module().equals("Yes")) {
									%>
									<td style="display: none;"><a class="main-color"
										href="feature.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-display"></i></a></td>
									<%
									}
									if (user_sidebar_dto1.getUpdate_module().equals("Yes")) {
									%>
									<td><a class="main-color"
										href="edit_user.jsp?id=<%=dto.getId()%>"><i
											class="bi bi-pencil-square"></i></a></td>
									<%
									}
									%>
									<%
									if (user_sidebar_dto1.getDelete_module().equals("Yes")) {
									%>
									<td><a class="main-color"
										onclick="return confirm('Are you sure? You want to delete')"
										href="AjaxService/AjaxDelete.jsp?user_id=<%=dto.getId()%>">
											<i class="bi bi-trash"></i>
									</a></td>
									<%
									}
									%>
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
		<div id="ser"></div>
	</main>
	<!-- End #main -->

	<div id="result_delete"></div>

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->
	<!-- ======= Footer ======= -->
	<%@include file="include/datatable_script_footer.jsp"%>
	<!-- End Footer -->

</body>

</html>