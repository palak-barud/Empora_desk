<%@include file="include/head.jsp"%>
</head>
<body>

	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->

	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->

	<main id="main" class="main">

		<%-- 	<%@include file="breadcrumbs/bank.jsp" %> --%>


		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Update Department Details</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">

				<div class="col-lg-5">

					<div class="card" style="border-radius: 25px;">


						<div class="card-body">
							<br />

							<!-- Floating Labels Form -->
							<form autocomplete="off" action="Departmentservlet" method="post"
								class="row g-3 needs-validation" novalidate>

								<%
								int id = Integer.parseInt(request.getParameter("id"));

								DepartmentService service = new DepartmentService();

								DepartmentDto dto = service.getdepartmentInfoById(id, config, request);
								%>

								<input type="hidden" name="Id" id="id" value="<%=id%>">



								<div class="col-md-12">
									<div class="control form-floating">

										<input type="text" class="form-control" id="dept_name"
											name="Dept_Name" placeholder="Branch" required value="<%=dto.getNAME()%>"> <label
											for="branch">Department Name</label>
										<div class="invalid-feedback">Please, enter Name!</div>
									</div>
								</div>
								
								<div class="col-lg-12 balesElement">
									
											<div class="control form-floating">
												<select class="form-select" id="status" name="Status">
													<option value="Active"
														<%if (dto.getSTATUS().equalsIgnoreCase("Active")) {%>
														selected <%}%>>Active</option>
													<option value="Block"
														<%if (dto.getSTATUS().equalsIgnoreCase("Block")) {%>
														selected <%}%>>Block</option>

												</select> <label for="status">Status</label>
											</div>
										
									</div>




								<!-- <div class="col-md-6">
									<div class="control form-floating">

										<input type="number" step="0.01" min="0" class="form-control"
											id="account_no" name="Account_no" placeholder="Account No"
											required> <label for="account_no">Account No</label>
										<div class="invalid-feedback">Please, enter "Account
											No"!</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="control form-floating">

										<input type="text" class="form-control" id="ifsc_code"
											name="Ifsc_code" placeholder="Ifsc code" required> <label
											for="ifsc_code">Ifsc Code</label>
										<div class="invalid-feedback">Please, enter Ifsc Code!</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="control form-floating">
										<input type="number" step="0.01" min="0" class="form-control"
											id="opening_bal" name="Opening_bal" placeholder="Opening Balance"
											required> <label for="opening_bal">Opening
											Balance</label>
										<div class="invalid-feedback">Please, enter Opening
											Balance!</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="control form-floating">

										<input type="date" class="form-control" id="opening_date"
											name="Opening_date" placeholder="Opening Date" required>
										<label for="opening_date">Opening Date</label>
										<div class="invalid-feedback">Please, enter Opening
											Date!</div>
									</div>
								</div> -->


								<div class="text-center">
									<button type="submit" class="submit-btn">Submit</button>

								</div>


							</form>
							<!-- End floating Labels Form -->

						</div>
					</div>
				</div>


			</div>
		</section>

	</main>
	<!-- End main -->

	<br />
	<br />

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>

</html>