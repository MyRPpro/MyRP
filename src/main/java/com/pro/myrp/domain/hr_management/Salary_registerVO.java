package com.pro.myrp.domain.hr_management;

import java.sql.Date;

public class Salary_registerVO {

	private String salary_register_id;
	private String account_id;
	private Date reg_date;
	private String salary_register_name;
	private Date pay_date;
	private long total_pay;
	private int total_employee;
	private int salary_state;
	
	public String getSalary_register_id() {
		return salary_register_id;
	}
	public void setSalary_register_id(String salary_register_id) {
		this.salary_register_id = salary_register_id;
	}
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getSalary_register_name() {
		return salary_register_name;
	}
	public void setSalary_register_name(String salary_register_name) {
		this.salary_register_name = salary_register_name;
	}
	public Date getPay_date() {
		return pay_date;
	}
	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	public long getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(long total_pay) {
		this.total_pay = total_pay;
	}
	public int getTotal_employee() {
		return total_employee;
	}
	public void setTotal_employee(int total_employee) {
		this.total_employee = total_employee;
	}
	public int getSalary_state() {
		return salary_state;
	}
	public void setSalary_state(int salary_state) {
		this.salary_state = salary_state;
	}
}
