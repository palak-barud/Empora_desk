package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.Employeedto;
import com.service.Employeeservice;

/**
 * Servlet implementation class Employeeservlet
 */
@WebServlet("/Employeeservlet")
public class Employeeservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Employeeservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		Employeedto dto = new Employeedto();
		Employeeservice service = new Employeeservice();
		
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		dto.setDept_id_fk(Integer.parseInt(request.getParameter("dept_id_fk") == null ? "0" : request.getParameter("dept_id_fk")));
		dto.setNAME(request.getParameter("Name") == null ? "" : request.getParameter("Name"));
		dto.setMobile_no(request.getParameter("Mobile") == null ? "" : request.getParameter("Mobile"));
		dto.setAddress(request.getParameter("Address") == null ? "" : request.getParameter("Address"));
		dto.setEmail(request.getParameter("Email") == null ? "" : request.getParameter("Email"));
		dto.setGender(request.getParameter("Radio") == null ? "" : request.getParameter("Radio"));
		dto.setAge(Integer.parseInt(request.getParameter("Age") == null ? "0" : request.getParameter("Age")));
		dto.setEducation(request.getParameter("Education") == null ? "" : request.getParameter("Education"));
		dto.setExperience(Float.parseFloat(request.getParameter("Experience") == null ? "0.00" : request.getParameter("Experience")));
		dto.setDesignation(request.getParameter("Designation") == null ? "" : request.getParameter("Designation"));
	    dto.setJoining_date(request.getParameter("Join") == null ? "" : request.getParameter("Join"));
	    dto.setLeaving_date(request.getParameter("Leave") == null ? "" : request.getParameter("Leave"));
	    dto.setSalary(Float.parseFloat(request.getParameter("Salary") == null ? "0.00" : request.getParameter("Salary")));
	    dto.setSTATUS(request.getParameter("Status") == null ? "" : request.getParameter("Status"));

	    
	    boolean b = false;

		if (dto.getId() == 0) {

			b = service.insertemployeeinfo(dto, request);
			if (b) {
				response.sendRedirect("add_employee.jsp?msg=Yes");
			} else {
				response.sendRedirect("add_employee.jsp?msg=No");
			}
		} else {

			b = service.updateemployee(dto, request);

			if (b) {
				response.sendRedirect("employee_report.jsp?msg=YesUp");
			} else {
				response.sendRedirect("employee_report.jsp?msg=NoUp");
			}
		}
	
	
		
	}

}
