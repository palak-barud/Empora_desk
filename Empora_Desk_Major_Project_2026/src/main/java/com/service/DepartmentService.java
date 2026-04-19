package com.service;

import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.DepartmentDto;

public class DepartmentService {
	// Insert Method for Bank
	public boolean insertdepartmentinfo(DepartmentDto dto, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);

		try {

			// Insert Query of Bank

			PreparedStatement ps = db.connection.prepareStatement("INSERT INTO department_tb ( NAME)VALUES(?);");

			ps.setString(1, dto.getNAME());

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

	public boolean deletedepartmentinfo(String id, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);

		try {

			// Insert Query of Bank

			PreparedStatement ps = db.connection.prepareStatement("DELETE FROM department_tb WHERE id = ?  ;");

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
	public ArrayList<DepartmentDto> getdepartmentInfo(ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		ArrayList<DepartmentDto> list = new ArrayList<DepartmentDto>();

		try {

			// Select query for showing data on manage table
			preparedStatement = db.connection
					.prepareStatement("SELECT 	id, NAME, STATUS, current_in_date FROM department_tb ;");

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {

				DepartmentDto dto = new DepartmentDto();

				dto.setId(resultSet.getInt(1));
				dto.setNAME(resultSet.getString(2));
				dto.setSTATUS(resultSet.getString(3));
				dto.setCurrent_in_date(resultSet.getString(4));

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
	public DepartmentDto getdepartmentInfoById(int id, ServletConfig config, HttpServletRequest request)
			throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement preparedStatement = null;

		DepartmentDto dto = new DepartmentDto();

		try {

			// Select query for showing data on Edit page
			preparedStatement = db.connection
					.prepareStatement("SELECT 	id, NAME, STATUS, current_in_date FROM department_tb  WHERE id = ?;");

			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				dto.setId(resultSet.getInt(1));
				dto.setNAME(resultSet.getString(2));
				dto.setSTATUS(resultSet.getString(3));
				dto.setCurrent_in_date(resultSet.getString(4));

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
	public boolean updatedepartment(DepartmentDto dto, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);
		PreparedStatement ps = null;

		try {

			// Update Query for update data
			ps = db.connection.prepareStatement("UPDATE department_tb SET  NAME =?, status=? WHERE id =?  ;");

			ps.setString(1, dto.getNAME());
			ps.setString(2, dto.getSTATUS());
			ps.setInt(3, dto.getId());

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
