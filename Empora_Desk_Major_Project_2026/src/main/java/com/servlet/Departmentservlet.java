package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.DepartmentDto;
import com.service.DepartmentService;

/**
 * Servlet implementation class Departmentservlet
 */
@WebServlet("/Departmentservlet")
public class Departmentservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Departmentservlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

		DepartmentDto dto = new DepartmentDto();
		DepartmentService service = new DepartmentService();
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		dto.setNAME(request.getParameter("Dept_Name") == null ? "" : request.getParameter("Dept_Name"));
		dto.setSTATUS(request.getParameter("Status") == null ? "" : request.getParameter("Status"));
		boolean b = false;

		if (dto.getId() == 0) {

			b = service.insertdepartmentinfo(dto, request);
			if (b) {
				response.sendRedirect("add_dept.jsp?msg=Yes");
			} else {
				response.sendRedirect("add_dept.jsp?msg=No");
			}
		} else {

			b = service.updatedepartment(dto, request);

			if (b) {
				response.sendRedirect("department_report.jsp?msg=YesUp");
			} else {
				response.sendRedirect("department_report.jsp?msg=NoUp");
			}
		}
	}

}
