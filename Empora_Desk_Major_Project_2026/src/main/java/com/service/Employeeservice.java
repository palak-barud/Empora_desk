package com.service;

import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.Employeedto;


public class Employeeservice {

	public boolean insertemployeeinfo(Employeedto dto, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);

		try {

			// Insert Query of Bank

			PreparedStatement ps = db.connection.prepareStatement(
					"INSERT INTO employee_tb (dept_id_fk, NAME, mobile_no, address, email, gender, age, education, experience, designation, joining_date, leaving_date, salary)\r\n"
							+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?);");

			ps.setInt(1, dto.getDept_id_fk());
			ps.setString(2, dto.getNAME());
			ps.setString(3, dto.getMobile_no());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getEmail());
			ps.setString(6, dto.getGender());
			ps.setInt(7, dto.getAge());
			ps.setString(8, dto.getEducation());
			ps.setFloat(9, dto.getExperience());
			ps.setString(10, dto.getDesignation());
			ps.setString(11, dto.getJoining_date());
			ps.setString(12, dto.getLeaving_date());
			ps.setFloat(13, dto.getSalary());

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

	public boolean deleteemployeeinfo(String id, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);

		try {

			// Insert Query of Bank

			PreparedStatement ps = db.connection
					.prepareStatement("\r\n" + "DELETE FROM employee_tb WHERE id = ?;\r\n" + "");

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
	public ArrayList<Employeedto> getemployeeInfo(ServletConfig config, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<Employeedto> list = new ArrayList<Employeedto>();

		try {

			// Select query for showing data on manage table
			preparedStatement = db.connection.prepareStatement(
					"SELECT 	et.id, dept_id_fk, et.NAME, mobile_no, address, email, gender, age, education, experience, designation, joining_date, leaving_date, salary, et.STATUS, et.current_in_date,dt.name FROM employee_tb et INNER JOIN department_tb dt ON dt.id=dept_id_fk ;");

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				Employeedto dto = new Employeedto();

				dto.setId(resultSet.getInt(1));
				dto.setDept_id_fk(resultSet.getInt(2));
				dto.setNAME(resultSet.getString(3));
				dto.setMobile_no(resultSet.getString(4));
				dto.setAddress(resultSet.getString(5));
				dto.setEmail(resultSet.getString(6));
				dto.setGender(resultSet.getString(7));
				dto.setAge(resultSet.getInt(8));
				dto.setEducation(resultSet.getString(9));
				dto.setExperience(resultSet.getFloat(10));
				dto.setDesignation(resultSet.getString(11));
				dto.setJoining_date(resultSet.getString(12));
				dto.setLeaving_date(resultSet.getString(13));
				dto.setSalary(resultSet.getFloat(14));
				dto.setSTATUS(resultSet.getString(15));
				dto.setCurrent_in_date(resultSet.getString(16));
				dto.setDept_name(resultSet.getString(17));

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
	
	
	public ArrayList<Employeedto> getemployeeInfoByName(String department, String employee, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);

		PreparedStatement ps = null;

		ArrayList<Employeedto> list = new ArrayList<Employeedto>();

		try {

			String sql = "\r\n"
					+ "SELECT 	et.id, dept_id_fk, et.NAME, mobile_no, address, email, gender, age, education, experience, designation, joining_date, leaving_date, salary, et.STATUS, et.current_in_date,dt.name FROM employee_tb et INNER JOIN department_tb dt ON dt.id=dept_id_fk ";

			if (!department.equalsIgnoreCase("")) {

				ps = db.connection.prepareStatement(sql + " WHERE dt.name=?");

				ps.setString(1, department);

			} else if (!employee.equalsIgnoreCase("")) {
				ps = db.connection.prepareStatement(sql + " WHERE et.name=?");

				ps.setString(1, employee);
			} else if (!department.equalsIgnoreCase("") && !employee.equalsIgnoreCase("")) {

				ps = db.connection.prepareStatement(sql + " WHERE dt.name=? and et.name=?");
				ps.setString(1, department);
				ps.setString(2, employee);

			} else {
				ps = db.connection.prepareStatement(sql);
			}

			// Select query for showing data on manage table

			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {

				Employeedto dto = new Employeedto();

				dto.setId(resultSet.getInt(1));
				dto.setDept_id_fk(resultSet.getInt(2));
				dto.setNAME(resultSet.getString(3));
				dto.setMobile_no(resultSet.getString(4));
				dto.setAddress(resultSet.getString(5));
				dto.setEmail(resultSet.getString(6));
				dto.setGender(resultSet.getString(7));
				dto.setAge(resultSet.getInt(8));
				dto.setEducation(resultSet.getString(9));
				dto.setExperience(resultSet.getFloat(10));
				dto.setDesignation(resultSet.getString(11));
				dto.setJoining_date(resultSet.getString(12));
				dto.setLeaving_date(resultSet.getString(13));
				dto.setSalary(resultSet.getFloat(14));
				dto.setSTATUS(resultSet.getString(15));
				dto.setCurrent_in_date(resultSet.getString(16));
				dto.setDept_name(resultSet.getString(17));

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
	public Employeedto getemployeeInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		Employeedto dto = new Employeedto();

		try {

			// Select query for showing data on Edit page
			preparedStatement = db.connection.prepareStatement(
					"SELECT 	id, dept_id_fk, NAME, mobile_no, address, email, gender, age, education, experience, designation, joining_date, leaving_date, salary, STATUS, current_in_date FROM employee_tb   WHERE id = ?;");

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				dto.setId(resultSet.getInt(1));
				dto.setDept_id_fk(resultSet.getInt(2));
				dto.setNAME(resultSet.getString(3));
				dto.setMobile_no(resultSet.getString(4));
				dto.setAddress(resultSet.getString(5));
				dto.setEmail(resultSet.getString(6));
				dto.setGender(resultSet.getString(7));
				dto.setAge(resultSet.getInt(8));
				dto.setEducation(resultSet.getString(9));
				dto.setExperience(resultSet.getFloat(10));
				dto.setDesignation(resultSet.getString(11));
				dto.setJoining_date(resultSet.getString(12));
				dto.setLeaving_date(resultSet.getString(13));
				dto.setSalary(resultSet.getFloat(14));
				dto.setSTATUS(resultSet.getString(15));
				dto.setCurrent_in_date(resultSet.getString(16));

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
	public boolean updateemployee(Employeedto dto, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;

		try {

			// Update Query for update data
			ps = db.connection.prepareStatement(
					"UPDATE employee_tb SET  dept_id_fk = ?, NAME = ?, mobile_no =?, address = ?, email = ? , gender = ?, age = ?, education = ?, experience = ?, \r\n"
							+ "designation = ?, joining_date = ?, leaving_date =?, salary = ?, STATUS =? WHERE id = ?;\r\n"
							+ "");

			ps.setInt(1, dto.getDept_id_fk());
			ps.setString(2, dto.getNAME());
			ps.setString(3, dto.getMobile_no());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getEmail());
			ps.setString(6, dto.getGender());
			ps.setInt(7, dto.getAge());
			ps.setString(8, dto.getEducation());
			ps.setFloat(9, dto.getExperience());
			ps.setString(10, dto.getDesignation());
			ps.setString(11, dto.getJoining_date());
			ps.setString(12, dto.getLeaving_date());
			ps.setFloat(13, dto.getSalary());
			ps.setString(14, dto.getSTATUS());
			
			ps.setInt(15, dto.getId());

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
