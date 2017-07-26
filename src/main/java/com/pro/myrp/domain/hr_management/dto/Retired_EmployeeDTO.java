package com.pro.myrp.domain.hr_management.dto;

import java.sql.Date;

public class Retired_EmployeeDTO {

	private int employee_id;
	private String employee_name;
	private int dept_id;
	private String dept_name;
	private int hr_code_group_rank;
	private int rank_code;
	private String hr_code_name;
	private Date join_date;
	private Date retired_date;
	private String retired_reason;
	
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
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public int getHr_code_group_rank() {
		return hr_code_group_rank;
	}
	public void setHr_code_group_rank(int hr_code_group_rank) {
		this.hr_code_group_rank = hr_code_group_rank;
	}
	public int getRank_code() {
		return rank_code;
	}
	public void setRank_code(int rank_code) {
		this.rank_code = rank_code;
	}
	public String getHr_code_name() {
		return hr_code_name;
	}
	public void setHr_code_name(String hr_code_name) {
		this.hr_code_name = hr_code_name;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public Date getRetired_date() {
		return retired_date;
	}
	public void setRetired_date(Date retired_date) {
		this.retired_date = retired_date;
	}
	public String getRetired_reason() {
		return retired_reason;
	}
	public void setRetired_reason(String retired_reason) {
		this.retired_reason = retired_reason;
	}
}
