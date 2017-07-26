package com.pro.myrp.domain.hr_management.vo;

public class Employee_infoVO {

	private int employee_id;
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
