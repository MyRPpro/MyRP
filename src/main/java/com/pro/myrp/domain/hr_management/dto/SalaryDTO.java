package com.pro.myrp.domain.hr_management.dto;

public class SalaryDTO {

	private int dept_id;
	private String dept_name;
	private int employee_id;
	private String employee_name;
	private	long base_pay;
	private long bonus;
	private long benefit;
	private long cost;
	private long pay;
	private long deduction_cost;
	private long takehome_pay;

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
	public long getPay() {
		return pay;
	}
	public void setPay(long pay) {
		this.pay = pay;
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
