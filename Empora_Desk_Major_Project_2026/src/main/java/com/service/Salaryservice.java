package com.service;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import com.db.DataDb;
import com.dto.Salarydto;

public class Salaryservice {

	public boolean insertSalaryinfo(Salarydto dto, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);

		try {

			String sql = "INSERT INTO salary_tb (employee_id_fk, salary_date, salary_month, salary_year, total_days, full_days, half_days, absent, leave_day, extra_days, \r\n"
					+ "final_salary)VALUES(?,?,?,?,?,?,?,?,?,?,?);";

			PreparedStatement ps = db.connection.prepareStatement(sql);

			ps.setInt(1, dto.getEmployee_id_fk());
			ps.setString(2, dto.getSalary_date());
			ps.setInt(3, dto.getSalary_month());
			ps.setInt(4, dto.getSalary_year());
			ps.setInt(5, dto.getTotal_days());
			ps.setFloat(6, dto.getFull_days());
			ps.setFloat(7, dto.getHalf_days());
			ps.setFloat(8, dto.getAbsent());
			ps.setFloat(9, dto.getLeave_day());
			ps.setFloat(10, dto.getExtra_days());
			ps.setFloat(11, dto.getFinal_salary());

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

	public boolean deleteEmployeeSalaryById(String id, HttpServletRequest request) {

		DataDb db = new DataDb(request);

		String sql = "DELETE FROM salary_tb WHERE id = ? ;";

		try {

			PreparedStatement preparedStatement = db.connection.prepareStatement(sql);

			preparedStatement.setString(1, id);

			System.out.println(preparedStatement);

			int i = preparedStatement.executeUpdate();

			if (i != 0) {
				return true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}

	public ArrayList<Salarydto> getSalaryInfoByName(String departmentName, String employeeName, String salaryYear, String salaryMonth, HttpServletRequest request) throws IOException {
	    DataDb db = new DataDb(request);
	    PreparedStatement ps = null;
	    ArrayList<Salarydto> list = new ArrayList<>();

	    try {
	        String sql = "SELECT st.id, employee_id_fk, salary_date, salary_month, salary_year, total_days, full_days, half_days, absent, leave_day, extra_days, final_salary, st.status, st.current_in_date, et.name, dt.name " +
	                     "FROM salary_tb st INNER JOIN employee_tb et ON st.employee_id_fk=et.id LEFT JOIN department_tb dt ON st.dept_id_fk=dt.id";

	        if (!departmentName.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE dt.name=?");
	            ps.setString(1, departmentName);
	        } else if (!employeeName.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE et.name=?");
	            ps.setString(1, employeeName);
	        } else if (!salaryYear.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE salary_year=?");
	            ps.setString(1, salaryYear);
	        } else if (!salaryMonth.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE salary_month=?");
	            ps.setString(1, salaryMonth);
	        } else if (!departmentName.equalsIgnoreCase("") && !employeeName.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE dt.name=? AND et.name=?");
	            ps.setString(1, departmentName);
	            ps.setString(2, employeeName);
	        } else if (!departmentName.equalsIgnoreCase("") && !salaryYear.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE dt.name=? AND salary_year=?");
	            ps.setString(1, departmentName);
	            ps.setString(2, salaryYear);
	        } else if (!departmentName.equalsIgnoreCase("") && !salaryMonth.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE dt.name=? AND salary_month=?");
	            ps.setString(1, departmentName);
	            ps.setString(2, salaryMonth);
	        } else if (!employeeName.equalsIgnoreCase("") && !salaryYear.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE et.name=? AND salary_year=?");
	            ps.setString(1, employeeName);
	            ps.setString(2, salaryYear);
	        } else if (!employeeName.equalsIgnoreCase("") && !salaryMonth.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE et.name=? AND salary_month=?");
	            ps.setString(1, employeeName);
	            ps.setString(2, salaryMonth);
	        } else if (!salaryYear.equalsIgnoreCase("") && !salaryMonth.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE salary_year=? AND salary_month=?");
	            ps.setString(1, salaryYear);
	            ps.setString(2, salaryMonth);
	        } else if (!departmentName.equalsIgnoreCase("") && !employeeName.equalsIgnoreCase("") && !salaryYear.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE dt.name=? AND et.name=? AND salary_year=?");
	            ps.setString(1, departmentName);
	            ps.setString(2, employeeName);
	            ps.setString(3, salaryYear);
	        } else if (!departmentName.equalsIgnoreCase("") && !employeeName.equalsIgnoreCase("") && !salaryMonth.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE dt.name=? AND et.name=? AND salary_month=?");
	            ps.setString(1, departmentName);
	            ps.setString(2, employeeName);
	            ps.setString(3, salaryMonth);
	        } else if (!departmentName.equalsIgnoreCase("") && !salaryYear.equalsIgnoreCase("") && !salaryMonth.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE dt.name=? AND salary_year=? AND salary_month=?");
	            ps.setString(1, departmentName);
	            ps.setString(2, salaryYear);
	            ps.setString(3, salaryMonth);
	        } else if (!employeeName.equalsIgnoreCase("") && !salaryYear.equalsIgnoreCase("") && !salaryMonth.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE et.name=? AND salary_year=? AND salary_month=?");
	            ps.setString(1, employeeName);
	            ps.setString(2, salaryYear);
	            ps.setString(3, salaryMonth);
	        } else if (!departmentName.equalsIgnoreCase("") && !employeeName.equalsIgnoreCase("") && !salaryYear.equalsIgnoreCase("") && !salaryMonth.equalsIgnoreCase("")) {
	            ps = db.connection.prepareStatement(sql + " WHERE dt.name=? AND et.name=? AND salary_year=? AND salary_month=?");
	            ps.setString(1, departmentName);
	            ps.setString(2, employeeName);
	            ps.setString(3, salaryYear);
	            ps.setString(4, salaryMonth);
	        } else {
	            ps = db.connection.prepareStatement(sql);
	        }

	        ResultSet resultSet = ps.executeQuery();

	        while (resultSet.next()) {
	        	Salarydto dto = new Salarydto();

	            dto.setId(resultSet.getInt(1));
	            dto.setEmployee_id_fk(resultSet.getInt(2));
	            dto.setSalary_date(resultSet.getString(3));
	            dto.setSalary_month(resultSet.getInt(4));
	            dto.setSalary_year(resultSet.getInt(5));
	            dto.setTotal_days(resultSet.getInt(6));
	            dto.setFull_days(resultSet.getFloat(7));
	            dto.setHalf_days(resultSet.getFloat(8));
	            dto.setAbsent(resultSet.getFloat(9));
	            dto.setLeave_day(resultSet.getFloat(10));
	            dto.setExtra_days(resultSet.getFloat(11));
	            dto.setFinal_salary(resultSet.getFloat(12));
	            dto.setSTATUS(resultSet.getString(13));
	            dto.setCurrent_in_date(resultSet.getString(14));
	            dto.setEmployee_name(resultSet.getString(15));
	            dto.setDept_name(resultSet.getString(16));

	            list.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (ps != null) {
					ps.close();
				}
	            if (db.connection != null) {
					db.connection.close();
				}
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return list;
	}



	public ArrayList<Salarydto> getSalaryinfo(HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);

		PreparedStatement ps = null;

		ArrayList<Salarydto> list = new ArrayList<>();

		try {

			String sql = "SELECT 	st.id, employee_id_fk, salary_date, salary_month, salary_year, total_days, full_days, half_days, absent, leave_day, extra_days, final_salary, st.status, st.current_in_date,et.name\r\n"
					+ "FROM salary_tb st INNER JOIN employee_tb et ON employee_id_fk=et.id;";

			ps = db.connection.prepareStatement(sql);

			System.out.println(ps);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {

				Salarydto dto = new Salarydto();

				dto.setId(resultSet.getInt(1));
				dto.setEmployee_id_fk(resultSet.getInt(2));
				dto.setSalary_date(resultSet.getString(3));
				dto.setSalary_month(resultSet.getInt(4));
				dto.setSalary_year(resultSet.getInt(5));
				dto.setTotal_days(resultSet.getInt(6));
				dto.setFull_days(resultSet.getFloat(7));
				dto.setHalf_days(resultSet.getFloat(8));
				dto.setAbsent(resultSet.getFloat(9));
				dto.setLeave_day(resultSet.getFloat(10));
				dto.setExtra_days(resultSet.getFloat(11));
				dto.setFinal_salary(resultSet.getFloat(12));
				dto.setSTATUS(resultSet.getString(13));
				dto.setCurrent_in_date(resultSet.getString(14));
				dto.setEmployee_name(resultSet.getString(15));

				list.add(dto);
			}
		} catch (Exception e) {

		} finally {
			if (db.connection != null) {
				try {
					db.connection.close();
				} catch (Exception e) {

				}
			}
		}
		return list;
	}

	public Salarydto getSalaryinfoById(int id, HttpServletRequest request) throws IOException {

		DataDb db = new DataDb(request);

		PreparedStatement ps = null;

		Salarydto dto = new Salarydto();

		try {

			String sql = "SELECT id, employee_id_fk, salary_date, salary_month, salary_year, total_days, full_days, half_days, absent, leave_day, extra_days, final_salary, "
					+ " STATUS, current_in_date FROM salary_tb where id =?;";

			// Select query for showing data on manage table
			ps = db.connection.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet resultSet = ps.executeQuery();

			while (resultSet.next()) {

				dto.setId(resultSet.getInt(1));
				dto.setEmployee_id_fk(resultSet.getInt(2));
				dto.setSalary_date(resultSet.getString(3));
				dto.setSalary_month(resultSet.getInt(4));
				dto.setSalary_year(resultSet.getInt(5));
				dto.setTotal_days(resultSet.getInt(6));
				dto.setFull_days(resultSet.getFloat(7));
				dto.setHalf_days(resultSet.getFloat(8));
				dto.setAbsent(resultSet.getFloat(9));
				dto.setLeave_day(resultSet.getFloat(10));
				dto.setExtra_days(resultSet.getFloat(11));
				dto.setFinal_salary(resultSet.getFloat(12));
				dto.setSTATUS(resultSet.getString(13));
				dto.setCurrent_in_date(resultSet.getString(14));

			}
		} catch (Exception e) {

		} finally {
			if (db.connection != null) {
				try {
					db.connection.close();
				} catch (Exception e) {

				}
			}
		}
		return dto;
	}

	public boolean updateSalaryInfo(Salarydto dto, HttpServletRequest request) {

		DataDb db = new DataDb(request);

		String sql = "UPDATE salary_tb SET employee_id_fk = ?, salary_date =?, salary_month = ?, salary_year = ?, total_days =?, full_days = ?,half_days = ?, absent =?, leave_day =?,extra_days = ?, \r\n"
				+ "final_salary = ? , STATUS = ? WHERE id = ?;";

		try {

			PreparedStatement preparedStatement = db.connection.prepareStatement(sql);

			preparedStatement.setInt(1, dto.getEmployee_id_fk());
			preparedStatement.setString(2, dto.getSalary_date());
			preparedStatement.setInt(3, dto.getSalary_month());
			preparedStatement.setInt(4, dto.getSalary_year());
			preparedStatement.setInt(5, dto.getTotal_days());
			preparedStatement.setFloat(6, dto.getFull_days());
			preparedStatement.setFloat(7, dto.getHalf_days());
			preparedStatement.setFloat(8, dto.getAbsent());
			preparedStatement.setFloat(9, dto.getLeave_day());
			preparedStatement.setFloat(10, dto.getExtra_days());
			preparedStatement.setFloat(11, dto.getFinal_salary());
			preparedStatement.setString(12, dto.getSTATUS());
			preparedStatement.setInt(13, dto.getId());

			System.out.println(preparedStatement);

			int i = preparedStatement.executeUpdate();

			if (i != 0) {
				return true;

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;

	}

}
