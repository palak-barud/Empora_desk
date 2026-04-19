package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.attendencedto;
import com.service.attendenceservice;

/**
 * Servlet implementation class attendenceservlet
 */
@WebServlet("/attendenceservlet")
public class attendenceservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public attendenceservlet() {
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
		
		attendencedto dto = new attendencedto();
		attendenceservice service = new attendenceservice();
		
		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));
		dto.setEmp_id_fk(Integer.parseInt(request.getParameter("emp_id_fk") == null ? "0" : request.getParameter("emp_id_fk")));
		dto.setDATE(request.getParameter("Date") == null ? "" : request.getParameter("Date"));
		dto.setAttendence_status(request.getParameter("Radio") == null ? "" : request.getParameter("Radio"));
		dto.setSTATUS(request.getParameter("Status") == null ? "" : request.getParameter("Status"));
	    
	    
	    boolean b = false;

		if (dto.getId() == 0) {

			b = service.insertattendenceinfo(dto, request);
			if (b) {
				response.sendRedirect("add_attendence.jsp?msg=Yes");
			} else {
				response.sendRedirect("add_attendence.jsp?msg=No");
			}
		} else {

			b = service.updateattendence(dto, request);

			if (b) {
				response.sendRedirect("attendence_report.jsp?msg=YesUp");
			} else {
				response.sendRedirect("attendence_report.jsp?msg=NoUp");
			}
		}
	}

}
