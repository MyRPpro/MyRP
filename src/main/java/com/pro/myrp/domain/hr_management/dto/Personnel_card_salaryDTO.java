package com.pro.myrp.domain.hr_management.dto;

import java.sql.Date;

public class Personnel_card_salaryDTO {

	private String salary_register_id;
	private Date reg_date;
	private String salary_register_name;
	
	private int employee_id;
	private long base_pay;
	private long bonus;
	private long benefit;
	private long cost;
	private long total_pay;
	private long deduction_cost;
	private long takehome_pay;
	
	public String getSalary_register_id() {
		return salary_register_id;
	}
	public void setSalary_register_id(String salary_register_id) {
		this.salary_register_id = salary_register_id;
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
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public long getBase_pay() {
		return base_pay;
	}
	public void setBase_pay(long base_pay) {
		this.base_pay = base_pay;
	}
	public long getBonus() {
		return bonus;
	}
	public void setBonus(long bonus) {
		this.bonus = bonus;
	}
	public long getBenefit() {
		return benefit;
	}
	public void setBenefit(long benefit) {
		this.benefit = benefit;
	}
	public long getCost() {
		return cost;
	}
	public void setCost(long cost) {
		this.cost = cost;
	}
	public long getTotal_pay() {
		return total_pay;
	}
	public void setTotal_pay(long total_pay) {
		this.total_pay = total_pay;
	}
	public long getDeduction_cost() {
		return deduction_cost;
	}
	public void setDeduction_cost(long deduction_cost) {
		this.deduction_cost = deduction_cost;
	}
	public long getTakehome_pay() {
		return takehome_pay;
	}
	public void setTakehome_pay(long takehome_pay) {
		this.takehome_pay = takehome_pay;
	}
}
