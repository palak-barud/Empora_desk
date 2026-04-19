<!-- ======= Head ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= Head end======= -->

<script src="js/billty.js" type="text/javascript"></script>

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
		<%-- <%@include file="breadcrumbs/sell.jsp"%> --%>
		<!--  Breadcrumbs End-->

		<div class="row justify-content-center">
			<div class="pagetitle col-lg-8 text-center">
				<h1>Enter Information of Employee</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body" style="padding-top: 15px;">
							<br />

							<!-- Floating Labels Form -->
							<form action="Employeeservlet" method="post" id="frmMr">
								<div class="row g-3 needs-validation" novalidate>


									<input type="hidden" id="user_id_fk" name="User_id_fk"
										value="<%=user_id%>"> <input type="hidden"
										id="c_y_session" name="C_y_session" value="<%=c_y_session%>">
									<!-- In Date Start -->

									<h1 style="font-size: 18px; color: #ef1010;"
										class="text-center">Basic Information of Employee</h1>
									<div class="col-lg-4 refresh-container" data-add="add_dept.jsp"
										data-list="party">
										<div class="control form-floating  refresh-input">
											<input type="text" class="form-control" id="dept_name"
												name="dept_name" placeholder="Contract No."> <input
												type="hidden" id="dept_id_fk" name="dept_id_fk" value=""
												data-party-id /> <label for="dl_no">Department Name</label>
											<div class="invalid-feedback">Please, Enter Name !</div>
										</div>
									</div>

									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control" id="name"
												name="Name" placeholder="Indend No." value=""> <label
												for="indend_no">Employee Name</label>
											<div class="invalid-feedback">Please, Enter Name!</div>
										</div>
									</div>
									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control" id="mobile"
												name="Mobile" placeholder="Contract Firm"> <label
												for="contract_firm_name"> Mobile Number</label>
											<div class="invalid-feedback">Please, Enter Contact
												No.!</div>
										</div>
									</div>
									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control" id="address"
												name="Address" placeholder="Our Firm Address" value=""
												data-contract-address> <label for="our_firm_address">Employee
												Address</label>
											<div class="invalid-feedback">Please, Enter Address!</div>
										</div>
									</div>
									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control" id="email"
												name="Email" placeholder="Our Firm GST No." value=""
												data-contract-gst> <label for="our_firm_gst_no">Employee
												Email</label>
											<div class="invalid-feedback">Please, Enter Email !</div>
										</div>
									</div>


									<div class="col-md-3 d-flex align-items-center">
									<label class="form-label me-2">Gender:</label>
									<div class="form-check me-2">
										<input class="form-check-input" type="radio" name="Radio"
											id="radio" value="Male" required> <label
											class="form-check-label" for="male">Male</label>
									</div>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="Radio"
											id="radio" value="Female" required> <label
											class="form-check-label" for="female">Female</label>
									</div>
									<div class="invalid-feedback">Please select a Gender</div>
								</div>




									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control" id="age"
												name="Age" placeholder="Seller Party Name" value=""
												data-party-name> <label for="seller_party_name">Employee
												Age</label>
											<div class="invalid-feedback">Please, Enter Correct
												age!</div>
										</div>
									</div>



									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control"
												id="education" name="Education"
												placeholder="Seller Party GST No." value="" data-party-gst>
											<label for="seller_party_gst_no">Employee Education</label>
											<div class="invalid-feedback">Please, Enter Education</div>
										</div>
									</div>

									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control"
												id="experience" name="Experience" placeholder="Crop Year"
												value=""> <label for="crop_year">Employee
												Experience</label>
											<div class="invalid-feedback">Please, Enter Year!</div>
										</div>
									</div>

									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control"
												id="designation" name="Designation" placeholder="Variety"
												value=""> <label for="variety">Designation</label>
											<div class="invalid-feedback">Please, Enter Position!</div>
										</div>
									</div>

									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="date" class="form-control" id="join"
												name="Join" placeholder="Bargain Bales" value=""> <label
												for="bargain_bales">Joining Date </label>
											<div class="invalid-feedback">Please, Enter Joining
												Date!</div>
										</div>
									</div>






									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="number" class="form-control"
												id="salary" name="Salary" placeholder="Length" value="">
											<label for="length">Salary</label>
											<div class="invalid-feedback">Please, Enter salary!</div>
										</div>
									</div>






									<div id="name_avail_resposnse1"></div>
									<div class="text-center">
										<button type="submit" id="submitButton" class="submit-btn">Submit</button>
									</div>
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
	<div id="info"></div>

	<script type="text/javascript">
		// Function to set the current date
		function setCurrentDate() {
			let today = new Date();
			let formattedDate = today.toISOString().split('T')[0]; // Format YYYY-MM-DD
			document.getElementById("join").value = formattedDate;
		}

		// Set the date when the page loads
		window.onload = function() {
			setCurrentDate();
		};
	</script>

	<!-- <script type="text/javascript">
		document
				.getElementById('submitButton')
				.addEventListener(
						'click',
						function(event) {
							// Prevent the default form submission behavior
							event.preventDefault();

							var name = document.getElementById('company_id_fk').value;
							var invoice_no = document
									.getElementById('invoice_no').value;

							if (name != '') {
								$
										.ajax({
											url : 'AjaxService/AjaxCheckCompanyNameAvail.jsp',
											data : 'name=' + name
													+ '&invoice_no='
													+ invoice_no,
											type : 'post',
											success : function(msg) {
												// alert(msg);
												$('#name_avail_resposnse1')
														.html(msg);

												if (document
														.getElementById('check_name').value == "true") {
													alert("Please Insert Right Invoice No.");
													// Don't need to return false here, just exit the function
													return;
												}
												// If the condition is not met, submit the form
												document
														.getElementById('frmMr')
														.submit();
											}
										});
							}
						});
	</script>

	<script>
		function calculateValue() {

			let checkedBilty = document
					.querySelector('input[name="Billty_type"]:checked');
			let biltyType = checkedBilty.id;

			if (biltyType === 'hlrtBilty' || biltyType === 'lrtBilty') {
				calFinalMTWeight();

			} else {
				calMTWeightBillty();
			}

		}
	</script> -->
	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->
	<!-- .............Future Working Code............. -->






</body>
</html>