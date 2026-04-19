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
				<h1>Update Attendence</h1>
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
								<div class="row g-3 needs-validation">

									<%
									int id = Integer.parseInt(request.getParameter("id"));

									attendenceservice service = new attendenceservice();

									attendencedto dto = service.getattendenceInfoById(id, config, request);
									%>

									<input type="hidden" name="Id" id="id" value="<%=id%>">


									<input type="hidden" id="user_id_fk" name="User_id_fk"
										value="<%=user_id%>"> <input type="hidden"
										id="c_y_session" name="C_y_session" value="<%=c_y_session%>">


									<!-- In Date Start -->




									<div class="col-lg-4 refresh-container"
										data-add="add_employee.jsp" data-list="good">
										<div class="control form-floating  refresh-input">
											<input type="text" class="form-control" id="emp_name"
												name="emp_name" placeholder="Contract No."> <input
												type="hidden" id="emp_id_fk" name="emp_id_fk"
												value="<%=dto.getEmp_id_fk()%>" data-party-id /> <label
												for="dl_no">Employee Name</label>
											<div class="invalid-feedback">Please, Enter Name !</div>
										</div>
									</div>

									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="date" class="form-control" id="date"
												name="Date" placeholder="Bargain Bales"
												value="<%=dto.getDATE()%>"> <label
												for="bargain_bales">Current Date </label>
											<div class="invalid-feedback">Please, Enter Current
												Date!</div>
										</div>
									</div>
									
									<div class="col-lg-4 balesElement">

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


<br/>
									<div class="col-md-12 d-flex align-items-center">
										<label class="form-label me-2">Attendence Status:</label>
										<div class="form-check me-2">
											<input class="form-check-input" type="radio" name="Radio"
												id="radio" value="Full_Day" required <%if (dto.getAttendence_status().equalsIgnoreCase("Full_Day")) {%>
													checked <%}%>> <label
												class="form-check-label" for="Full_Day">Full_Day</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="Radio"
												id="radio" value="Half_Day" required <%if (dto.getAttendence_status().equalsIgnoreCase("Half_Day")) {%>
													checked <%}%>> <label
												class="form-check-label" for="Half_Day">Half_Day</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="Radio"
												id="radio" value="Absent" required <%if (dto.getAttendence_status().equalsIgnoreCase("Absent")) {%>
													checked <%}%>> <label
												class="form-check-label" for="Absent">Absent</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="Radio"
												id="radio" value="Leave" required <%if (dto.getAttendence_status().equalsIgnoreCase("Leave")) {%>
													checked <%}%>> <label
												class="form-check-label" for="Leave">Leave</label>
										</div>
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