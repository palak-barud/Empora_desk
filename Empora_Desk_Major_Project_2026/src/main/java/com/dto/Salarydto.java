package com.dto;

public class Salarydto {
	
	int id, employee_id_fk,salary_month, salary_year, total_days,dept_id_fk;
	public int getDept_id_fk() {
		return dept_id_fk;
	}
	public void setDept_id_fk(int dept_id_fk) {
		this.dept_id_fk = dept_id_fk;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEmployee_id_fk() {
		return employee_id_fk;
	}
	public void setEmployee_id_fk(int employee_id_fk) {
		this.employee_id_fk = employee_id_fk;
	}
	public int getSalary_month() {
		return salary_month;
	}
	public void setSalary_month(int salary_month) {
		this.salary_month = salary_month;
	}
	public int getSalary_year() {
		return salary_year;
	}
	public void setSalary_year(int salary_year) {
		this.salary_year = salary_year;
	}
	public int getTotal_days() {
		return total_days;
	}
	public void setTotal_days(int total_days) {
		this.total_days = total_days;
	}
	public String getSalary_date() {
		return salary_date;
	}
	public void setSalary_date(String salary_date) {
		this.salary_date = salary_date;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	public String getCurrent_in_date() {
		return current_in_date;
	}
	public void setCurrent_in_date(String current_in_date) {
		this.current_in_date = current_in_date;
	}
	public float getFull_days() {
		return full_days;
	}
	public void setFull_days(float full_days) {
		this.full_days = full_days;
	}
	public float getHalf_days() {
		return half_days;
	}
	public void setHalf_days(float half_days) {
		this.half_days = half_days;
	}
	public float getAbsent() {
		return absent;
	}
	public void setAbsent(float absent) {
		this.absent = absent;
	}
	public float getLeave_day() {
		return leave_day;
	}
	public void setLeave_day(float leave_day) {
		this.leave_day = leave_day;
	}
	public float getExtra_days() {
		return extra_days;
	}
	public void setExtra_days(float extra_days) {
		this.extra_days = extra_days;
	}
	public float getFinal_salary() {
		return final_salary;
	}
	public void setFinal_salary(float final_salary) {
		this.final_salary = final_salary;
	}
	String  salary_date, STATUS, current_in_date,employee_name,dept_name;
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	float  full_days, half_days, absent, leave_day, extra_days, final_salary;
	

}
