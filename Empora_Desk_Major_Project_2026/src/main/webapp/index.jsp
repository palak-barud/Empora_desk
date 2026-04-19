<%@page import="com.dto.UserDto"%>
<%@page import="com.service.UserService"%>
<!-- ======= Head ======= -->
<%@include file="include/head.jsp"%>
<!-- ======= Head end======= -->

<style>
.hero-section {
	position: relative;
	padding: 80px 20px;
	background: url('assets/img/Mine_img_emp.png') no-repeat;
	/* correct path + overlay */
	color: #fff;
	border-radius: 25px;
	margin-bottom: 50px;
	text-align: center;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
}

.hero-section:hover {
	box-shadow: 0 12px 35px rgba(0, 0, 0, 0.25);
}

.hero-title {
	font-size: 46px;
	font-weight: 700;
	margin-bottom: 15px;
}

.hero-title span {
	color: #fbbf24; /* gold highlight */
}

.hero-subtitle {
	font-size: 20px;
	font-weight: 500;
	margin-bottom: 30px;
	color: #e0e0e0;
}

.hero-actions .btn-main {
	background: #fbbf24;
	color: #000;
	padding: 12px 28px;
	border-radius: 10px;
	font-weight: 600;
	margin: 5px;
	text-decoration: none;
	transition: background 0.3s, transform 0.2s;
}

.hero-actions .btn-main:hover {
	background: #e0a800;
	transform: translateY(-2px);
}

.hero-actions .btn-outline {
	border: 2px solid #fbbf24;
	color: #fff;
	padding: 12px 28px;
	border-radius: 10px;
	font-weight: 600;
	margin: 5px;
	text-decoration: none;
	transition: background 0.3s, color 0.3s, transform 0.2s;
}

.hero-actions .btn-outline:hover {
	background: #fbbf24;
	color: #000;
	transform: translateY(-2px);
}

/* Features Section Enhancements */
.feature-card {
	background: #fff;
	padding: 25px 20px;
	margin: 15px;
	border-radius: 20px;
	text-align: center;
	box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.12);
	transition: all 0.3s ease;
}

.feature-card:hover {
	transform: translateY(-5px);
	box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.18);
}

.feature-icon {
	font-size: 42px;
	color: #1e3a5f;
	margin-bottom: 15px;
}
</style>

<style>
.hero-section {
	padding: 80px 20px;
	background: linear-gradient(135deg, #236b85, #184b5c);
	color: #fff;
	border-radius: 20px;
	margin-bottom: 40px;
}

.hero-title {
	font-size: 42px;
	font-weight: bold;
}

.hero-title span {
	color: #fbbf24; /* gold highlight */
}

.hero-subtitle {
	margin: 10px 0 30px;
	font-size: 18px;
}

.hero-actions .btn-main {
	background: #fbbf24;
	color: #000;
	padding: 10px 20px;
	border-radius: 8px;
	font-weight: bold;
	margin: 5px;
	text-decoration: none;
}

.hero-actions .btn-outline {
	border: 2px solid #fbbf24;
	color: #fff;
	padding: 10px 20px;
	border-radius: 8px;
	font-weight: bold;
	margin: 5px;
	text-decoration: none;
}

.feature-card {
	background: #fff;
	padding: 30px;
	margin: 15px;
	border-radius: 15px;
	text-align: center;
	box-shadow: 0px 3px 10px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
}

.feature-card:hover {
	transform: translateY(-5px);
	box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
}

.feature-icon {
	font-size: 40px;
	color: #236b85;
	margin-bottom: 15px;
}

.stats {
	background: #f8f9fa;
	padding: 50px 20px;
	border-radius: 15px;
	margin-top: 40px;
}

.stats h2 {
	font-size: 36px;
	color: #236b85;
	font-weight: bold;
}

.stats p {
	font-size: 16px;
	color: #555;
}
</style>
</head>

<body>
	<!-- ======= Header ======= -->
	<%@include file="include/header.jsp"%>
	<!-- ======= Header end======= -->

	<!-- ======= Sidebar ======= -->
	<%@include file="include/sidebar.jsp"%>
	<!--  Sidebar End-->

	<main id="main" class="main">

		<!-- ======= Hero Section ======= -->
		<section class="hero-section text-center">
			<div class="container">
				<h1 class="hero-title">
					Welcome to <span>Empora Desk</span>
				</h1>
				<p class="hero-subtitle">Smart Employee Management Made Easy</p>
				<div class="hero-actions">
					<a href="employee_report.jsp" class="btn-main">View Employees</a> <a
						href="add_dept.jsp" class="btn-outline">Add Department</a>
				</div>
			</div>
		</section>
		<!-- End Hero Section -->

		<!-- ======= Features Section ======= -->
		<section class="features container">
			<div class="row">
				<div class="col-lg-4 col-md-6">
					<a href="employee_report.jsp"
						style="text-decoration: none; color: inherit;">
						<div class="feature-card">
							<i class="fa fa-users feature-icon"></i>
							<h4>Employee Records</h4>
							<p>Maintain employee records, reports, and details in one
								place.</p>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-md-6">
					<a href="attendence_report.jsp"
						style="text-decoration: none; color: inherit;">
						<div class="feature-card">
							<i class="fa fa-calendar-check feature-icon"></i>
							<h4>Attendance Tracking</h4>
							<p>Track daily attendance and generate reports with ease.</p>
						</div>
					</a>
				</div>
				<div class="col-lg-4 col-md-6">
					<a href="salary_report.jsp"
						style="text-decoration: none; color: inherit;">
						<div class="feature-card">
							<i class="fa fa-money-bill feature-icon"></i>
							<h4>Salary Details</h4>
							<p>Generate salary slips and payroll systematically.</p>
						</div>
					</a>
				</div>
			</div>
		</section>

		<!-- End Features Section -->


	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<%@include file="include/footer.jsp"%>
	<!-- End Footer -->


</body>
</html>
