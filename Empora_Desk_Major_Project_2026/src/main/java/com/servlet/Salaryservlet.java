package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.Salarydto;
import com.service.Salaryservice;

/**
 * Servlet implementation class Salaryservlet
 */
@WebServlet("/Salaryservlet")
public class Salaryservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Salaryservlet() {
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

		Salarydto dto = new Salarydto();
		Salaryservice service = new Salaryservice();

		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		dto.setEmployee_id_fk(Integer.parseInt(
				request.getParameter("employee_id_fk") == null ? "0" : request.getParameter("employee_id_fk")));
		dto.setSalary_date(request.getParameter("Salary_date") == null ? "" : request.getParameter("Salary_date"));
		dto.setSalary_month(Integer
				.parseInt(request.getParameter("Salary_month") == null ? "0" : request.getParameter("Salary_month")));
		dto.setSalary_year(Integer
				.parseInt(request.getParameter("Salary_year") == null ? "0" : request.getParameter("Salary_year")));
		dto.setTotal_days(Integer
				.parseInt(request.getParameter("Total_days") == null ? "0" : request.getParameter("Total_days")));
		dto.setFull_days(Float
				.parseFloat(request.getParameter("Full_days") == null ? "0.00" : request.getParameter("Full_days")));
		dto.setHalf_days(Float
				.parseFloat(request.getParameter("Half_days") == null ? "0.00" : request.getParameter("Half_days")));
		dto.setAbsent(
				Float.parseFloat(request.getParameter("Absent") == null ? "0.00" : request.getParameter("Absent")));
		dto.setLeave_day(Float
				.parseFloat(request.getParameter("Leave_days") == null ? "0.00" : request.getParameter("Leave_days")));
		dto.setExtra_days(Float
				.parseFloat(request.getParameter("Extra_days") == null ? "0.00" : request.getParameter("Extra_days")));
		dto.setFinal_salary(Float.parseFloat(
				request.getParameter("Final_salary") == null ? "0.00" : request.getParameter("Final_salary")));

		dto.setSTATUS(request.getParameter("Status") == null ? "Active" : request.getParameter("Status"));

		boolean b = false;

		if (dto.getId() == 0) {

			b = service.insertSalaryinfo(dto, request);
			if (b) {
				response.sendRedirect("employee_report.jsp?msg=Yes");
			} else {
				response.sendRedirect("employee_report.jsp?msg=No");
			}
		} else {

			b = service.updateSalaryInfo(dto, request);

			if (b) {
				response.sendRedirect("salary_report.jsp?msg=YesUp");
			} else {
				response.sendRedirect("salary_report.jsp?msg=NoUp");
			}
		}

	}

}
