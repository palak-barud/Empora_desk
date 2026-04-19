package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.UserDto;

public class UserService {

	// ---- insert User -----//

	public boolean insertUser(UserDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);

		try {

			PreparedStatement ps = db.connection.prepareStatement("\r\n"
					+ "INSERT INTO user_personal_info_tb ( NAME, mobile_no, PASSWORD, address ) VALUES( ?, ?, ?, ?);\r\n"
					+ "");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getMobile_no());

			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getAddress());

			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {

				return true;

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return false;

	}

	// ---- End Inser User ----- //

	// ----- Select User Array list -------//

	public ArrayList<UserDto> getuserInfo(ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		ArrayList<UserDto> list = new ArrayList<UserDto>();

		try {
			PreparedStatement preparedStatement = db.connection.prepareStatement("\r\n"
					+ "SELECT 	id, NAME, mobile_no, PASSWORD, address, STATUS, current_in_date FROM user_personal_info_tb ;\r\n"
					+ "");

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				UserDto dto = new UserDto();

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setMobile_no(resultSet.getString(3));
				dto.setPassword(resultSet.getString(4));
				dto.setAddress(resultSet.getString(5));
				dto.setStatus(resultSet.getString(6));
				dto.setCurrent_in_date(resultSet.getString(7));

				list.add(dto);

			}
		} catch (Exception e) {

		} finally {
			if (db.connection != null)
				try {
					db.connection.close();
				} catch (Exception e) {

				}
		}
		return list;
	}

	// ----- End User Array list -------//

	// ----- Select User by Id for Feature -------//

	public UserDto getuserInfoById(int id, ServletConfig config, HttpServletRequest request) throws IOException {
		DataDb db = new DataDb(request);

		UserDto dto = new UserDto();

		try {
			PreparedStatement preparedStatement = db.connection.prepareStatement(
					"\r\n"
					+ "SELECT 	id, NAME,mobile_no,PASSWORD,address,STATUS,current_in_date,user_module,delete_module,update_module,master_module,\r\n"
					+ "bank_module,payment_module,billty_module,billty_report,customer_module,customer_report,vehicle_party_module,\r\n"
					+ "vehicle_party_report,other_purchase_module,other_purchase_report FROM user_personal_info_tb WHERE id = ?;\r\n"
					+ "");

			preparedStatement.setInt(1, id);
			/* System.out.println(preparedStatement); */

			ResultSet resultSet = preparedStatement.executeQuery();
			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setName(resultSet.getString(2));
				dto.setMobile_no(resultSet.getString(3));
				dto.setPassword(resultSet.getString(4));
				dto.setAddress(resultSet.getString(5));
				dto.setStatus(resultSet.getString(6));
				dto.setCurrent_in_date(resultSet.getString(7));
				dto.setUser_module(resultSet.getString(8));
				dto.setDelete_module(resultSet.getString(9));
				dto.setUpdate_module(resultSet.getString(10));
				dto.setMaster_module(resultSet.getString(11));
				dto.setBank_module(resultSet.getString(12));
				dto.setPayment_module(resultSet.getString(13));
				dto.setBillty_module(resultSet.getString(14));
				dto.setBillty_report(resultSet.getString(15));
				dto.setCustomer_module(resultSet.getString(16));
				dto.setCustomer_report(resultSet.getString(17));
				dto.setVehicle_party_module(resultSet.getString(18));
				dto.setVehicle_party_report(resultSet.getString(19));
				dto.setOther_purchase_module(resultSet.getString(20));
				dto.setOther_purchase_report(resultSet.getString(21));
			}
		} catch (Exception e) {

		} finally {
			if (db.connection != null)
				try {
					db.connection.close();
				} catch (Exception e) {
				}
		}
		return dto;
	}

	// ----- End User by Id for Feature -------//

	// ----- Update User -------//

	public boolean UpdateUser(UserDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("\r\n"
					+ "UPDATE user_personal_info_tb SET NAME = ? , mobile_no = ? , PASSWORD = ? , address = ? , STATUS = ?   WHERE id = ? ;\r\n");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getMobile_no());
			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getStatus());
			ps.setInt(6, dto.getId());
			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {

				return true;

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;

	}

	// ----- End Update User -------//

	// ----- Update User by Id for Feature -------//

	public boolean UpdateUserById(UserDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement(
					"UPDATE user_personal_info_tb SET NAME = ? ,mobile_no = ? ,PASSWORD = ? ,address = ? ,STATUS = ? , \r\n"
					+ "user_module = ? ,delete_module = ? ,update_module = ? , master_module = ? ,bank_module = ?,payment_module = ?,billty_module = ?\r\n"
					+ ",billty_report = ?,customer_module = ? , customer_report = ? , vehicle_party_module = ? ,vehicle_party_report = ? ,\r\n"
					+ "other_purchase_module = ?,other_purchase_report = ? WHERE id = ? ;");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getMobile_no());
			ps.setString(3, dto.getPassword());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getStatus());
			ps.setString(6, dto.getUser_module());
			ps.setString(7, dto.getDelete_module());
			ps.setString(8, dto.getUpdate_module());
			ps.setString(9, dto.getMaster_module());
			ps.setString(10, dto.getBank_module());
			ps.setString(11, dto.getPayment_module());
			ps.setString(12, dto.getBillty_module ());
			ps.setString(13, dto.getBillty_report());
			ps.setString(14, dto.getCustomer_module());
			ps.setString(15, dto.getCustomer_report());
			ps.setString(16, dto.getVehicle_party_module());
			ps.setString(17, dto.getVehicle_party_report());
			ps.setString(18, dto.getOther_purchase_module());
			ps.setString(19, dto.getOther_purchase_report());
			ps.setInt(20, dto.getId());

			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {

				return true;

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;

	}

	// ----- End Update User by Id for Feature -------//
	
	
	// ----- Update User info Id for profile -------//

	public boolean updateUserInfoById(UserDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		try {

			PreparedStatement ps = db.connection.prepareStatement("UPDATE user_personal_info_tb SET name = ?, mobile_no = ?, address = ? WHERE id = ?;");

			ps.setString(1, dto.getName());
			ps.setString(2, dto.getMobile_no());
			ps.setString(3, dto.getAddress());
			ps.setInt(4, dto.getId());

			System.out.println(ps);

			int i = ps.executeUpdate();

			if (i != 0) {

				return true;

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;

	}

	// ----- End Update User info Id for profile -------//
	
	
	// ----- Update User info Id for profile -------//

	public boolean updateUserPasswordById(UserDto dto, HttpServletRequest request, ServletConfig config) throws IOException {

		DataDb db = new DataDb(request);
		String password = "";
		int i=0;
		try {
			
			PreparedStatement ps1 = db.connection.prepareStatement("SELECT 	PASSWORD FROM user_personal_info_tb WHERE id = ?;");

			ps1.setInt(1, dto.getId());
			
			ResultSet resultSet = ps1.executeQuery();
			System.out.println(ps1);
			
			while (resultSet.next()) {

			password = (resultSet.getString(1));
				
			}
			
			if(dto.getPassword().equals(password)) {

			PreparedStatement ps = db.connection.prepareStatement("UPDATE user_personal_info_tb SET password = ? WHERE id = ?;");

			ps.setString(1, dto.getPassword());
			ps.setInt(2, dto.getId());

			System.out.println(ps);

			i = ps.executeUpdate();
			} 
			else {
			i=0;
			}

			if (i != 0) {

				return true;

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return false;

	}

	// ----- End Update User info Id for profile -------//

	// ------ Check login method ------//

	public int checkLogin(UserDto dto, ServletConfig config, HttpServletRequest request) throws IOException {
		try {

			DataDb db = new DataDb(request);
			String sql = "SELECT id FROM user_personal_info_tb WHERE mobile_no= ? && PASSWORD= ?";

			PreparedStatement preparedStatement = db.connection.prepareStatement(sql);

			preparedStatement.setString(1, dto.getMobile_no());
			preparedStatement.setString(2, dto.getPassword());
			//System.out.print(preparedStatement);

			ResultSet rs = preparedStatement.executeQuery();

			if (rs.next()) {
				return rs.getInt(1);
			} else {
				return 0;
			}

		} catch (Exception e) {
			// LogFileService.catchLogFile(e, config);
			return 0;
		}
	}

	// ------ End Check login method ------//
	
	

}
