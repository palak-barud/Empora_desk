package com.dto;

public class attendencedto {

	String DATE, attendence_status, STATUS, current_in_date,emp_name;
	public String getEmp_name() {
		return emp_name;
	}
	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}
	public String getDATE() {
		return DATE;
	}
	public void setDATE(String dATE) {
		DATE = dATE;
	}
	public String getAttendence_status() {
		return attendence_status;
	}
	public void setAttendence_status(String attendence_status) {
		this.attendence_status = attendence_status;
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
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getEmp_id_fk() {
		return emp_id_fk;
	}
	public void setEmp_id_fk(int emp_id_fk) {
		this.emp_id_fk = emp_id_fk;
	}
	int id, emp_id_fk;
}
