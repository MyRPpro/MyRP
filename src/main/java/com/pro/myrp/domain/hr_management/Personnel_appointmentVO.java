package com.pro.myrp.domain.hr_management;

import java.sql.Date;

public class Personnel_appointmentVO {

	private int employee_id;
	private Date appointment_date;
	private int hr_code_group_rank;
	private int pre_rank;
	private int post_rank;
	private int pre_dept;
	private int post_dept;
	
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public Date getAppointment_date() {
		return appointment_date;
	}
	public void setAppointment_date(Date appointment_date) {
		this.appointment_date = appointment_date;
	}
	public int getHr_code_group_rank() {
		return hr_code_group_rank;
	}
	public void setHr_code_group_rank(int hr_code_group_rank) {
		this.hr_code_group_rank = hr_code_group_rank;
	}
	public int getPre_rank() {
		return pre_rank;
	}
	public void setPre_rank(int pre_rank) {
		this.pre_rank = pre_rank;
	}
	public int getPost_rank() {
		return post_rank;
	}
	public void setPost_rank(int post_rank) {
		this.post_rank = post_rank;
	}
	public int getPre_dept() {
		return pre_dept;
	}
	public void setPre_dept(int pre_dept) {
		this.pre_dept = pre_dept;
	}
	public int getPost_dept() {
		return post_dept;
	}
	public void setPost_dept(int post_dept) {
		this.post_dept = post_dept;
	}
}
