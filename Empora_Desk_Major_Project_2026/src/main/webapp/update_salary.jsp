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
				<h1>Update Employee Salary Information</h1>
			</div>
		</div>

		<section class="section dashboard">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body" style="padding-top: 15px;">
							<br />

							<!-- Floating Labels Form -->
							<form action="Salaryservlet" method="post" id="">
								<div class="row g-3 needs-validation">

									<%
									int employee_id_fk = Integer.parseInt(request.getParameter("id"));

									Employeeservice service = new Employeeservice();

									Employeedto dto = service.getemployeeInfoById(employee_id_fk, config, request);
									%>

									<input type="hidden" name="employee_id_fk" id="employee_id_fk"
										value="<%=employee_id_fk%>"> <input type="hidden"
										id="user_id_fk" name="User_id_fk" value="<%=user_id%>">
									<input type="hidden" id="c_y_session" name="C_y_session"
										value="<%=c_y_session%>">


									<!-- In Date Start -->




									<div class="col-lg-4 refresh-container" data-add="add_dept.jsp"
										data-list="party">
										<div class="control form-floating  refresh-input">
											<input type="text" class="form-control" id="dept_name"
												name="dept_name" placeholder="Contract No." value="">
											<input type="hidden" id="dept_id_fk" name="dept_id_fk"
												value="<%=dto.getDept_id_fk()%>" /> <label for="dl_no">Department
												Name</label>
											<div class="invalid-feedback">Please, Enter Name !</div>
										</div>
									</div>


									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control" id="name"
												name="Name" placeholder="Indend No."
												value="<%=dto.getNAME()%>"> <label for="indend_no">Employee
												Name</label>
											<div class="invalid-feedback">Please, Enter Name!</div>
										</div>
									</div>





									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control" id="mobile"
												name="Mobile" placeholder="Contract Firm"
												value="<%=dto.getMobile_no()%>"> <label
												for="contract_firm_name"> Mobile Number</label>
											<div class="invalid-feedback">Please, Enter Contact
												No.!</div>
										</div>
									</div>

									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control" id="address"
												name="Address" placeholder="Our Firm Address"
												value="<%=dto.getAddress()%>" data-contract-address>
											<label for="our_firm_address">Employee Address</label>
											<div class="invalid-feedback">Please, Enter Address!</div>
										</div>
									</div>

									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control" id="email"
												name="Email" placeholder="Our Firm GST No."
												value="<%=dto.getEmail()%>" data-contract-gst> <label
												for="our_firm_gst_no">Employee Email</label>
											<div class="invalid-feedback">Please, Enter Email !</div>
										</div>
									</div>



									<div class="col-md-3 d-flex align-items-center">
										<label class="form-label me-2">Gender:</label>
										<div class="form-check me-2">
											<input class="form-check-input" type="radio" name="Radio"
												id="radio" value="Male" required
												<%if (dto.getGender().equalsIgnoreCase("Male")) {%> checked
												<%}%>> <label class="form-check-label" for="male">Male</label>
										</div>
										<div class="form-check">
											<input class="form-check-input" type="radio" name="Radio"
												id="radio" value="Female" required
												<%if (dto.getGender().equalsIgnoreCase("Female")) {%>
												checked <%}%>> <label class="form-check-label"
												for="female">Female</label>
										</div>
										<div class="invalid-feedback">Please select a Gender</div>
									</div>




									<div class="col-lg-2 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control" id="age"
												name="Age" placeholder="Seller Party Name"
												value="<%=dto.getAge()%>" data-party-name> <label
												for="seller_party_name">Employee Age</label>
											<div class="invalid-feedback">Please, Enter Correct
												age!</div>
										</div>
									</div>



									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control"
												id="education" name="Education"
												placeholder="Seller Party GST No."
												value="<%=dto.getEducation()%>" data-party-gst> <label
												for="seller_party_gst_no">Employee Education</label>
											<div class="invalid-feedback">Please, Enter Education</div>
										</div>
									</div>

									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control"
												id="experience" name="Experience" placeholder="Crop Year"
												value="<%=dto.getExperience()%>"> <label
												for="crop_year">Employee Experience</label>
											<div class="invalid-feedback">Please, Enter Year!</div>
										</div>
									</div>

									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="text" class="form-control"
												id="designation" name="Designation" placeholder="Variety"
												value="<%=dto.getDesignation()%>"> <label
												for="variety">Designation</label>
											<div class="invalid-feedback">Please, Enter Position!</div>
										</div>
									</div>

									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="date" class="form-control" id="join"
												name="Join" placeholder="Bargain Bales"
												value="<%=dto.getJoining_date()%>"> <label
												for="bargain_bales">Joining Date </label>
											<div class="invalid-feedback">Please, Enter Joining
												Date!</div>
										</div>
									</div>






									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="number" class="form-control"
												id="salary" name="Salary" placeholder="Length"
												value="<%=dto.getSalary()%>"> <label for="length">Monthly
												Salary</label>
											<div class="invalid-feedback">Please, Enter salary!</div>
										</div>
									</div>



									<div class=" text-center">
										<h4>Salary Information</h4>
									</div>
									<%
									int id = Integer.parseInt(request.getParameter("id"));

									Salaryservice service1 = new Salaryservice();

									Salarydto dto1 = service1.getSalaryinfoById(id, request);
									%>

									<input type="hidden" name="Id" id="id" value="<%=id%>">

									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input type="date" class="form-control" id="salary_date"
												value=<%=dto1.getSalary_date()%> name="Salary_date"
												placeholder="Bargain Bales"
												value="<%=java.time.LocalDate.now()%>"> <label
												for="bargain_bales">Salary Date </label>
											<div class="invalid-feedback">Please, Enter Leaving
												Date!</div>
										</div>
									</div>


									<div class="col-lg-3 balesElement">

										<div class="control form-floating">
											<select class="form-select" id="salary_year"
												name="Salary_year">
												<option value="2025"
													<%if (dto1.getSalary_year() == 2025) {%> selected <%}%>>2025</option>
												<option value="2026"
													<%if (dto1.getSalary_year() == 2026) {%> selected <%}%>>2026</option>
												<option value="2027"
													<%if (dto1.getSalary_year() == 2027) {%> selected <%}%>>2027</option>
											</select> <label for="status">Salary Year</label>
										</div>

									</div>

									<div class="col-lg-3 balesElement">

										<div class="control form-floating">
											<select class="form-select" id="salary_month"
												name="Salary_month" onchange="updateDays()">
												<option value="1" <%if (dto1.getSalary_month() == 1) {%>
													selected <%}%>>January</option>
												<option value="2" <%if (dto1.getSalary_month() == 2) {%>
													selected <%}%>>February</option>
												<option value="3" <%if (dto1.getSalary_month() == 3) {%>
													selected <%}%>>March</option>
												<option value="4" <%if (dto1.getSalary_month() == 4) {%>
													selected <%}%>>April</option>
												<option value="5" <%if (dto1.getSalary_month() == 5) {%>
													selected <%}%>>May</option>
												<option value="6" <%if (dto1.getSalary_month() == 6) {%>
													selected <%}%>>June</option>
												<option value="7" <%if (dto1.getSalary_month() == 7) {%>
													selected <%}%>>July</option>
												<option value="8" <%if (dto1.getSalary_month() == 8) {%>
													selected <%}%>>August</option>
												<option value="9" <%if (dto1.getSalary_month() == 9) {%>
													selected <%}%>>September</option>
												<option value="10" <%if (dto1.getSalary_month() == 10) {%>
													selected <%}%>>October</option>
												<option value="11" <%if (dto1.getSalary_month() == 11) {%>
													selected <%}%>>November</option>
												<option value="12" <%if (dto1.getSalary_month() == 12) {%>
													selected <%}%>>December</option>
											</select> <label for="months">Salary month:</label>
										</div>

									</div>

									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="Number" class="form-control"
												id="total_days" name="Total_days" placeholder="Variety"
												value=<%=dto1.getTotal_days()%>> <label
												for="variety">Total Days</label>
											<div class="invalid-feedback">Please, Enter Days!</div>
										</div>
									</div>

									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="Number" class="form-control"
												id="full_days" name="Full_days" placeholder="Variety"
												value=<%=dto1.getFull_days()%>> <label for="variety">Full
												Days</label>
											<div class="invalid-feedback">Please, Enter Days!</div>
										</div>
									</div>

									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="Number" class="form-control"
												id="half_days" name="Half_days" placeholder="Variety"
												value=<%=dto1.getHalf_days()%>> <label for="variety">Half
												Days</label>
											<div class="invalid-feedback">Please, Enter Days!</div>
										</div>
									</div>

									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="Number" class="form-control"
												id="absent" name="Absent" placeholder="Variety"
												value=<%=dto1.getAbsent()%>> <label for="variety">Absent</label>
											<div class="invalid-feedback">Please, Enter Position!</div>
										</div>
									</div>

									<div class="col-lg-3 balesElement">
										<div class="control form-floating">
											<input required type="Number" class="form-control"
												id="leave_days" name="Leave_days" placeholder="Variety"
												value=<%=dto1.getLeave_day()%>> <label for="variety">Leave</label>
											<div class="invalid-feedback">Please, Enter Position!</div>
										</div>
									</div>

									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="Number" class="form-control"
												id="extra_days" name="Extra_days" placeholder="Variety"
												value=<%=dto1.getExtra_days()%>> <label
												for="variety">Extra Days</label>
											<div class="invalid-feedback">Please, Enter Position!</div>
										</div>
									</div>

									<div class="col-lg-4 balesElement">
										<div class="control form-floating">
											<input required type="Number" class="form-control"
												id="final_salary" name="Final_salary" placeholder="Variety"
												value=<%=dto1.getFinal_salary()%>> <label
												for="variety">Final Salary</label>
											<div class="invalid-feedback">Please, Enter Position!</div>
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
	<script>
		function updateDays() {
			const month = document.getElementById("salary_month").value;
			const daysInMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30,
					31 ];
			document.getElementById("total_days").value = daysInMonth[month - 1]; // Set days
		}
	</script>

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