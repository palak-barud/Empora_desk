package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;

import com.dto.attendencedto;

public class attendenceservice {
	
	public boolean insertattendenceinfo(attendencedto dto, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);

		try {

			// Insert Query of Bank

			PreparedStatement ps = db.connection.prepareStatement(
					"\r\n"
					+ "INSERT INTO attendence_tb (emp_id_fk, DATE, attendence_status )VALUES(?,?,?);\r\n"
					+ "");

			ps.setInt(1, dto.getEmp_id_fk());
			ps.setString(2, dto.getDATE());
			ps.setString(3, dto.getAttendence_status());
			

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

	public boolean deleteattendenceinfo(String id, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);

		try {

			// Insert Query of Bank

			PreparedStatement ps = db.connection
					.prepareStatement("DELETE FROM attendence_tb WHERE id = ?;");

			ps.setString(1, id);

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

	// Method for Show data on Manage page
	public ArrayList<attendencedto> getattendenceInfo(ServletConfig config, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<attendencedto> list = new ArrayList<attendencedto>();

		try {

			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(
					"\r\n"
					+ "SELECT 	att.id, emp_id_fk, DATE, attendence_status, att.status, att.current_in_date, et.name FROM attendence_tb att INNER JOIN employee_tb et ON et.id = emp_id_fk;\r\n"
					+ "");

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				attendencedto dto = new attendencedto();

				dto.setId(resultSet.getInt(1));
				dto.setEmp_id_fk(resultSet.getInt(2));
				dto.setDATE(resultSet.getString(3));
				dto.setAttendence_status(resultSet.getString(4));
				dto.setSTATUS(resultSet.getString(5));
				dto.setCurrent_in_date(resultSet.getString(6));
				dto.setEmp_name(resultSet.getString(7));

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
	
	
	public ArrayList<attendencedto> getattendenceInfoByName(String employee,ServletConfig config, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<attendencedto> list = new ArrayList<attendencedto>();

		try {

			// Select query for showing data on manage table
			
			String sql=(
					"\r\n"
					+ "SELECT 	att.id, emp_id_fk, DATE, attendence_status, att.status, att.current_in_date, et.name FROM attendence_tb att INNER JOIN employee_tb et ON et.id = emp_id_fk"
					+ "");
			preparedStatement = db.connection.prepareStatement(sql);
			
			if (!employee.equalsIgnoreCase("")) {
				preparedStatement = db.connection.prepareStatement(sql +" WHERE et.name=?");

				preparedStatement.setString(1, employee);
			} else {
				preparedStatement = db.connection.prepareStatement(sql);
			}
			
			System.out.println(preparedStatement);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				attendencedto dto = new attendencedto();

				dto.setId(resultSet.getInt(1));
				dto.setEmp_id_fk(resultSet.getInt(2));
				dto.setDATE(resultSet.getString(3));
				dto.setAttendence_status(resultSet.getString(4));
				dto.setSTATUS(resultSet.getString(5));
				dto.setCurrent_in_date(resultSet.getString(6));
				dto.setEmp_name(resultSet.getString(7));

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


	// Show data on edit page according to id
	public attendencedto getattendenceInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		attendencedto dto = new attendencedto();

		try {

			// Select query for showing data on Edit page
			preparedStatement = db.connection.prepareStatement(
					"SELECT id, emp_id_fk, DATE, attendence_status, status, current_in_date FROM attendence_tb WHERE id = ?;");

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				dto.setId(resultSet.getInt(1));
				dto.setEmp_id_fk(resultSet.getInt(2));
				dto.setDATE(resultSet.getString(3));
				dto.setAttendence_status(resultSet.getString(4));
				dto.setSTATUS(resultSet.getString(5));
				dto.setCurrent_in_date(resultSet.getString(6));
				

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

	// Method For Updating data on edit page
	public boolean updateattendence(attendencedto dto, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;

		try {

			// Update Query for update data
			ps = db.connection.prepareStatement( "UPDATE attendence_tb SET emp_id_fk = ? , DATE = ?, attendence_status = ? , STATUS = ? WHERE id = ? ;");

			ps.setInt(1, dto.getEmp_id_fk());
			ps.setString(2, dto.getDATE());
			ps.setString(3, dto.getAttendence_status());
			ps.setString(4, dto.getSTATUS());
			
			ps.setInt(5, dto.getId());

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

}
