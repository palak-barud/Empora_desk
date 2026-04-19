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
	
	<%-- <%@include file="breadcrumbs/master_breadrumbs.jsp"%> --%>


		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Department Details</h1>
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

							

								<div class="col-md-12">
									<div class="control form-floating">

										<input type="text" class="form-control" id="dept_name"
											name="Dept_Name" placeholder="Branch" required> <label
											for="branch">Department Name</label>
										<div class="invalid-feedback">Please, enter Name!</div>
									</div>
								</div>
								
								
								
								
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