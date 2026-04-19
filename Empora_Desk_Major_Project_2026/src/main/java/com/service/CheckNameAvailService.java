package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;

public class CheckNameAvailService {
	
		// Method For Updating data on edit page
		public boolean checkBankHeadAvail(String name,int id, HttpServletRequest request, ServletConfig config)
				throws IOException {

			DataDb db = new DataDb(request);
			PreparedStatement ps = null;

			try {
				
				// Insert Query of PathologyItem

				ps = db.connection.prepareStatement("Select name FROM bank_tb where name = ? AND id != ?;");
				ps.setString(1, name);
				ps.setInt(2, id);
				ResultSet resultSet = ps.executeQuery();
				System.out.println(ps);
				
				 
				 	
				 	while (resultSet.next()) {
						 if (name.equalsIgnoreCase(resultSet.getString(1))) {
							 return true; 
						 }
					}

			} catch (Exception e) {

				e.printStackTrace();
			}
			return false;
		}
		
		public boolean checkCompanyinvoiceAvail(int name,String invoice_no, HttpServletRequest request, ServletConfig config)
				throws IOException {

			DataDb db = new DataDb(request);
			PreparedStatement ps = null;

			try {
				
				// Insert Query of PathologyItem

				ps = db.connection.prepareStatement("SELECT company_id_fk,invoice_no FROM bilty_info_tb WHERE company_id_fk = ? AND invoice_no = ?;");
				ps.setInt(1, name);
				ps.setString(2, invoice_no);
				ResultSet resultSet = ps.executeQuery();
				System.out.println(ps);
				
				 	while (resultSet.next()) {
				 		System.out.println(resultSet.getInt(1));
						 if (name ==(resultSet.getInt(1))) {
							 return true; 
						 }
					}

			} catch (Exception e) {

				e.printStackTrace();
			}
			return false;
		}
		
		public boolean checkCompanyBilltyinvoiceAvail(int id,String invoice_no, HttpServletRequest request, ServletConfig config)
				throws IOException {
			
			DataDb db = new DataDb(request);
			PreparedStatement ps = null;
			
			try {
				
				// Insert Query of PathologyItem
				
				ps = db.connection.prepareStatement("SELECT company_id_fk,invoice_no FROM company_bilty_info_tb WHERE company_id_fk = ? AND invoice_no = ?;");
				ps.setInt(1, id);
				ps.setString(2, invoice_no);
				ResultSet resultSet = ps.executeQuery();
				System.out.println(ps);
				
				while (resultSet.next()) {
					if (id ==(resultSet.getInt(1))) {
						return true; 
					}
				}
				
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			return false;
		}
		
		
		// Method For Updating data on edit page
				public boolean checkUserHeadAvail(String mobile,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select mobile_no FROM user_personal_info_tb where mobile_no = ? AND id != ?;");
						ps.setString(1, mobile);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
												 	
						 	while (resultSet.next()) {
								 if (mobile.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				// Method For Updating data on edit page
				
				public boolean checkCityAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM city_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				
				public boolean checkCompanyAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM company_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				public boolean checkTranspoterAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {
					
					DataDb db = new DataDb(request);
					PreparedStatement ps = null;
					
					try {
						
						
						
						ps = db.connection.prepareStatement("Select name FROM transporter_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						
						
						while (resultSet.next()) {
							if (name.equalsIgnoreCase(resultSet.getString(1))) {
								return true; 
							}
						}
						
					} catch (Exception e) {
						
						e.printStackTrace();
					}
					return false;
				}
				
				public boolean checkPersonalVechilePartyAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {
					
					DataDb db = new DataDb(request);
					PreparedStatement ps = null;
					
					try {
						
						
						
						ps = db.connection.prepareStatement("Select name FROM personal_vehicle_party_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						
						
						while (resultSet.next()) {
							if (name.equalsIgnoreCase(resultSet.getString(1))) {
								return true; 
							}
						}
						
					} catch (Exception e) {
						
						e.printStackTrace();
					}
					return false;
				}
				
				
				public boolean checkDistrictAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM district_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				
				public boolean checkVehicleAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM vehicle_info_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
			
				public boolean checkDealerAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM dealer_info_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				public boolean checkOtherDealerAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM dealer_other_info_tb where name = ? AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						ResultSet resultSet = ps.executeQuery();
						System.out.println(ps);
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				
				public boolean checkCustomerAvail(String name,int id, HttpServletRequest request, ServletConfig config)
						throws IOException {

					DataDb db = new DataDb(request);
					PreparedStatement ps = null;

					try {
						
						

						ps = db.connection.prepareStatement("Select name FROM customer_info_tb where name = ? AND STATUS = 'Active' AND id != ?;");
						ps.setString(1, name);
						ps.setInt(2, id);
						System.out.println(ps);
						ResultSet resultSet = ps.executeQuery();
						
						 
						 	
						 	while (resultSet.next()) {
								 if (name.equalsIgnoreCase(resultSet.getString(1))) {
									 return true; 
								 }
							}

					} catch (Exception e) {

						e.printStackTrace();
					}
					return false;
				}
				
				
				
				
				
				
		
	
}