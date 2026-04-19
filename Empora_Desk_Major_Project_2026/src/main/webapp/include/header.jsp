<!-- ======= Header ======= -->
<%@page import="com.dto.ProjectDto"%>
<%@page import="com.service.*"%>
<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.*"%>
<%@page import="com.service.UserService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<header id="header" class="header fixed-top d-flex align-items-center shadow-sm">
	<%@include file="../UserTrack.jsp"%>
	<%
		String c_y_session = "2025-2026";
		String current_date = LogFileService.changeFormateOfCurrentDate("yyyy-MM-dd");

		UserService user_sidebar_ser = new UserService();
		UserDto user_sidebar_dto = user_sidebar_ser.getuserInfoById(user_id, config, request);

		MsgService msg_ser = new MsgService();
		MsgDto  msg_dto = msg_ser.getMsgInfoById(1, config, request);

		String activation_date = project_head_dto.getActivation_date();
		if (activation_date != null) {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = formatter.parse(activation_date);
			Date date2 = formatter.parse(current_date);
			Boolean expire = date1.before(date2);
			if (expire) {
				response.sendRedirect("login.jsp?msg=expired");
			}
		}
	%>

	<input type="hidden" id="current_date" value="<%=current_date%>">

	<div class="d-flex align-items-center justify-content-between w-100 px-3">
		<!-- Sidebar toggle -->
		<i class="bi bi-list toggle-sidebar-btn fs-4 me-3 text-light"></i>

		<!-- Logo -->
		<a href="index.jsp" class="logo d-flex align-items-center text-decoration-none">
			<span class="fw-bold fs-4 text-light"><%=project_head_dto.getNAME()%></span>
		</a>

		<!-- Navigation -->
		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center m-0">

				<!-- Profile Dropdown -->
				<li class="nav-item dropdown pe-3">
					<a class="nav-link nav-profile d-flex align-items-center text-light" href="#"
						data-bs-toggle="dropdown">
						<i class="fa fa-user-circle fs-5 me-2"></i>
						<span class="d-none d-md-block fw-semibold"><%=user_sidebar_dto.getName()%></span>
					</a>

					<ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile shadow">
						<li class="dropdown-header text-center">
							<h6 class="mb-0"><%=user_sidebar_dto.getName()%></h6>
							<small class="text-muted">User</small>
						</li>
						<li><hr class="dropdown-divider"></li>

						<li>
							<a class="dropdown-item d-flex align-items-center" href="user_profile.jsp">
								<i class="bi bi-person me-2"></i> <span>My Profile</span>
							</a>
						</li>

						<li><hr class="dropdown-divider"></li>

						<li>
							<a id="downloadButton" onclick="backup();" class="dropdown-item d-flex align-items-center">
								<i class="fa-solid fa-file-arrow-down me-2"></i> <span>Download Backup</span>
							</a>
						</li>

						<li><hr class="dropdown-divider"></li>

						<li>
							<a class="dropdown-item d-flex align-items-center"
								href="edit_project.jsp?id=<%=project_head_dto.getId()%>">
								<i class="fa-solid fa-diagram-project me-2"></i> <span>View Project</span>
							</a>
						</li>

						<li><hr class="dropdown-divider"></li>

						<li>
							<a class="dropdown-item d-flex align-items-center" href="logout.jsp">
								<i class="bi bi-box-arrow-right me-2"></i> <span>Sign Out</span>
							</a>
						</li>
					</ul>
				</li>
				<!-- End Profile Dropdown -->

			</ul>
		</nav>
	</div>
</header>
<!-- End Header -->

<!-- Custom CSS for Theme -->
<style>
	.header {
		background: linear-gradient(90deg, #236b85, #1d4f63);
		color: #fff;
		padding: 0.8rem 0;
	}
	.logo span {
		letter-spacing: 1px;
	}
	.nav-profile {
		cursor: pointer;
	}
	.dropdown-menu.profile {
		border-radius: 12px;
		min-width: 220px;
	}
	.dropdown-menu.profile li a {
		transition: background 0.3s;
	}
	.dropdown-menu.profile li a:hover {
		background: #f0f5f9;
	}
</style>
