package com.pro.myrp.domain.hr_management.dto;

import java.sql.Date;

public class Hr_appointment_listDTO {

	private int employee_id;
	private String employee_name;
	private Date appointment_date;
	private int hr_code_group_rank;
	private int pre_rank;
	private String pre_rank_name;
	private int post_rank;
	private String post_rank_name;
	private int pre_dept;
	private String pre_dept_name;
	private int post_dept;
	private String post_dept_name;
	
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
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
	public String getPre_rank_name() {
		return pre_rank_name;
	}
	public void setPre_rank_name(String pre_rank_name) {
		this.pre_rank_name = pre_rank_name;
	}
	public int getPost_rank() {
		return post_rank;
	}
	public void setPost_rank(int post_rank) {
		this.post_rank = post_rank;
	}
	public String getPost_rank_name() {
		return post_rank_name;
	}
	public void setPost_rank_name(String post_rank_name) {
		this.post_rank_name = post_rank_name;
	}
	public int getPre_dept() {
		return pre_dept;
	}
	public void setPre_dept(int pre_dept) {
		this.pre_dept = pre_dept;
	}
	public String getPre_dept_name() {
		return pre_dept_name;
	}
	public void setPre_dept_name(String pre_dept_name) {
		this.pre_dept_name = pre_dept_name;
	}
	public int getPost_dept() {
		return post_dept;
	}
	public void setPost_dept(int post_dept) {
		this.post_dept = post_dept;
	}
	public String getPost_dept_name() {
		return post_dept_name;
	}
	public void setPost_dept_name(String post_dept_name) {
		this.post_dept_name = post_dept_name;
	}
}
