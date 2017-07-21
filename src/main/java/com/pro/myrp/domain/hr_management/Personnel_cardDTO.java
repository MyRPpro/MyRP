package com.pro.myrp.domain.hr_management;

import java.sql.Date;

/**
 * 인사카드DTO<br>
 * hr_code_group (hr_code_group_id)
 * hr_code (hr_code_group_id,hr_code_id)<br>
 * dept (dept_id)<br>
 * employee (employee_id)<br>
 * employee_info (employee_id)<br>
 * @author amaco78
 *
 */
public class Personnel_cardDTO {

	private int employee_id;
	private int dept_id;
	private String dept_name;
	private int hr_code_group_rank;
	private String hr_code_group_name;
	private int rank_code;
	private String hr_code_name;
	private String employee_name;
	private String residence_reg_no;
	private Date join_date;
	
	private String tel;
	private String mobile_tel;
	private String passport_no;
	private String email;
	private String address;
	private int hourly_wage;
	private String salary_account;
	
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
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
	public String getHr_code_group_name() {
		return hr_code_group_name;
	}
	public void setHr_code_group_name(String hr_code_group_name) {
		this.hr_code_group_name = hr_code_group_name;
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
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getResidence_reg_no() {
		return residence_reg_no;
	}
	public void setResidence_reg_no(String residence_reg_no) {
		this.residence_reg_no = residence_reg_no;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMobile_tel() {
		return mobile_tel;
	}
	public void setMobile_tel(String mobile_tel) {
		this.mobile_tel = mobile_tel;
	}
	public String getPassport_no() {
		return passport_no;
	}
	public void setPassport_no(String passport_no) {
		this.passport_no = passport_no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getHourly_wage() {
		return hourly_wage;
	}
	public void setHourly_wage(int hourly_wage) {
		this.hourly_wage = hourly_wage;
	}
	public String getSalary_account() {
		return salary_account;
	}
	public void setSalary_account(String salary_account) {
		this.salary_account = salary_account;
	}
}
