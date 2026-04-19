package com.servlet;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.UserDto;
import com.service.UserService;

/**
 * Servlet implementation class userservlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ServletConfig config;

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}

	/**
	 * Default constructor.
	 */
	public UserServlet() {
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

		UserDto dto = new UserDto();
		UserService ser = new UserService();

		dto.setId(Integer.parseInt(request.getParameter("Id") == null ? "0" : request.getParameter("Id")));

		dto.setName(request.getParameter("Name") == null ? "" : request.getParameter("Name"));
		dto.setMobile_no(request.getParameter("Mobile_no") == null ? "" : request.getParameter("Mobile_no"));

		dto.setPassword(request.getParameter("Password") == null ? "" : request.getParameter("Password"));
		
		dto.setAddress(request.getParameter("Address") == null ? "" : request.getParameter("Address"));

		dto.setStatus(request.getParameter("Status") == null ? "" : request.getParameter("Status"));

		dto.setDelete_module(
				request.getParameter("Delete_module") == null ? "" : request.getParameter("Delete_module"));
		dto.setUser_module(request.getParameter("User_module") == null ? "" : request.getParameter("User_module"));
		dto.setUpdate_module(
				request.getParameter("Update_module") == null ? "" : request.getParameter("Update_module"));

		dto.setMaster_module(
				request.getParameter("Master_module") == null ? "" : request.getParameter("Master_module"));
		
		dto.setBank_module(
				request.getParameter("Bank_module") == null ? "" : request.getParameter("Bank_module"));
		dto.setPayment_module(
				request.getParameter("Payment_module") == null ? "" : request.getParameter("Payment_module"));
		dto.setBillty_module(
				request.getParameter("Billty_module") == null ? "" : request.getParameter("Billty_module"));
		dto.setBillty_report(
				request.getParameter("Billty_report") == null ? "" : request.getParameter("Billty_report"));
		dto.setCustomer_module(
				request.getParameter("Customer_module") == null ? "" : request.getParameter("Customer_module"));
		dto.setCustomer_report(
				request.getParameter("Customer_report") == null ? "" : request.getParameter("Customer_report"));
		dto.setVehicle_party_module(
				request.getParameter("Vehicle_party_module") == null ? "" : request.getParameter("Vehicle_party_module"));
		dto.setVehicle_party_report(
				request.getParameter("Vehicle_party_report") == null ? "" : request.getParameter("Vehicle_party_report"));
		dto.setOther_purchase_module(
				request.getParameter("Other_purchase_module") == null ? "" : request.getParameter("Other_purchase_module"));
		dto.setOther_purchase_report(
				request.getParameter("Other_purchase_report") == null ? "" : request.getParameter("Other_purchase_report"));

		int flag = (Integer.parseInt(request.getParameter("flag") == null ? "0" : request.getParameter("flag")));

		boolean b = false;

		if (dto.getId() == 0) {

			b = ser.insertUser(dto, request, config);

			if (b) {

				response.sendRedirect("add_user.jsp?msg=Yes");
			} else {

				response.sendRedirect("add_user.jsp?msg=No");

			}
		}

		else {

			if (flag == 2) {

				b = ser.UpdateUserById(dto, request, config);

			} 
			else if (flag == 1) {

				b = ser.updateUserInfoById(dto, request, config);

			} else if (flag == 3) {

				b = ser.updateUserPasswordById(dto, request, config);

			} else  {
				b = ser.UpdateUser(dto, request, config);
			}

			if (b) {
				
				if(flag==1 || flag==3) {
					response.sendRedirect("user_profile.jsp?msg=YesUp");
				}
				else {
				response.sendRedirect("manage_user.jsp?msg=YesUp");
				}

			} else { if(flag==1 || flag==3) {
				response.sendRedirect("user_profile.jsp?msg=NoUp");
			}
			else {

				response.sendRedirect("manage_user.jsp?msg=NoUp");

				}

			}

		}
	}
}
