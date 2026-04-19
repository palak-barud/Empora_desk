<!DOCTYPE html>
<%@page import="com.dto.ProjectDto"%>
<%@page import="com.service.ProjectService"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<%
ProjectService project_head_ser = new ProjectService();
ProjectDto project_head_dto = project_head_ser.getProjectInfoById(1, config, request);
%>

<title><%=project_head_dto.getNAME()%></title>

<link href="ProjectImage/<%=project_head_dto.getId()%>.jpg" rel="icon">
<link href="assets/vendor/fontawesome-free/css/all.css" rel="stylesheet">
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Add this in <head> -->
<link
	href="https://fonts.googleapis.com/css2?family=Great+Vibes&display=swap"
	rel="stylesheet">


<style>
body {
	margin: 0;
	font-family: Arial, sans-serif;
	background-color: #f6f6f6;
}

/* Header area */
.header {
	background-color: #236b85; /* teal shade */
	padding: 40px 0;
	text-align: center;
	color: white;
	font-size: 34px;
	font-family: 'Allura', cursive;
	font-weight: bold; /* remove bold */
}

/* Login card */
.login-box {
	background: #fff;
	max-width: 400px;
	margin: -60px auto 0; /* overlaps header */
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
}

.login-box h4 {
	text-align: center;
	margin-bottom: 25px;
	font-weight: 700;
	color: #236b85;
}

.input-group-text {
	background-color: #f1f1f1;
	border: none;
}

.form-control {
	border-left: none;
	box-shadow: none;
}

.form-control:focus {
	border-color: #236b85;
	box-shadow: 0 0 5px rgba(35, 107, 133, 0.3);
}

a {
	color: #236b85;
	font-size: 14px;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.btn-login {
	background-color: #236b85;
	border: none;
	width: 100%;
	padding: 10px;
	color: white;
	border-radius: 5px;
	font-size: 16px;
}

.btn-login:hover {
	background-color: #1c6e79;
}
</style>
</head>

<body>

	<!-- Header -->
	<div class="header">
		<br>
		<%=project_head_dto.getNAME()%>
		<br>
		<br>
		<!-- <span style="font-size: 18px; font-weight: 400;">Employee
			+ Aura Desk</span> -->
	</div>
	<br>
	<!-- Login Box -->
	<div class="login-box">
		<h4>
			<i class="fa fa-user"></i> Sign In
		</h4>
		<form action="LoginServlet" method="post">

			<!-- Username -->

			<div class="input-group mb-3">
				<span class="input-group-text"><i class="fas fa-mobile-alt"></i></span>
				<input type="text" class="form-control" name="Mobile_no"
					placeholder="Mobile No." required>
			</div>


			<!-- Password -->
			<div class="input-group mb-2">
				<span class="input-group-text"><i class="fa fa-lock"></i></span> <input
					type="password" class="form-control" name="Password"
					placeholder="Password" required>
			</div>
			<br>
			<!-- Forgot password -->
			<!-- 	<div class="mb-3 text-end">
				<a href="#">Forgot Password ?</a>
			</div> -->

			<!-- Buttons -->
			<button type="submit" class="btn btn-login">SIGN IN</button>
			<!-- <div class="text-center mt-3">
				<a href="index.jsp" class="btn btn-outline-secondary btn-sm">Home
					Page</a>
			</div> -->
		</form>
	</div>

	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
