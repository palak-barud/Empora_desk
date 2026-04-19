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
				<h1>Enter Attendence</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">
				<div class="col-lg-8">
					<div class="card">
						<div class="card-body" style="padding-top: 15px;">
							<br />

							<!-- Floating Labels Form -->
							<form action="attendenceservlet" method="post" id="frmMr">
								<div class="row g-3 needs-validation" >


									<input type="hidden" id="user_id_fk" name="User_id_fk"
										value="<%=user_id%>"> <input type="hidden"
										id="c_y_session" name="C_y_session" value="<%=c_y_session%>">


									<!-- In Date Start -->

									


									<div class="col-lg-6 refresh-container" data-add="add_employee.jsp"
										data-list="good">
										<div class="control form-floating  refresh-input">
											<input type="text" class="form-control" id="emp_name"
												name="emp_name" placeholder="Contract No."> <input
												type="hidden" id="emp_id_fk" name="emp_id_fk" value=""
												data-party-id /> <label for="dl_no">Employee Name</label>
											<div class="invalid-feedback">Please, Enter Name !</div>
										</div>
									</div>
									
									<div class="col-lg-6 balesElement">
										<div class="control form-floating">
											<input required type="date" class="form-control" id="date"
												name="Date" placeholder="Bargain Bales" value=""> <label
												for="bargain_bales">Current Date </label>
											<div class="invalid-feedback">Please, Enter Current
												Date!</div>
										</div>
									</div>

									

									<div class="col-md-3 d-flex align-items-center">
									<label class="form-label me-2">Attendence Status:</label><br>
									<div class="form-check me-2">
										<input class="form-check-input" type="radio" name="Radio"
											id="radio" value="Full_Day" required> <label
											class="form-check-label" for="Full_Day">Full_Day</label>
									</div><br>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="Radio"
											id="radio" value="Half_Day" required> <label
											class="form-check-label" for="Half_Day">Half_Day</label>
									</div><br>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="Radio"
											id="radio" value="Absent" required> <label
											class="form-check-label" for="Absent">Absent</label>
									</div><br>
									<div class="form-check">
										<input class="form-check-input" type="radio" name="Radio"
											id="radio" value="Leave" required> <label
											class="form-check-label" for="Leave">Leave</label>
									</div><br>
									<div class="invalid-feedback">Please select a Gender</div>
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
			document.getElementById("date").value = formattedDate;
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