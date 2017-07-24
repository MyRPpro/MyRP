package com.pro.myrp.domain.sales_management;

public class ModifySelectDTO {

	private String account_id;
	private String account_name;
	private String product_id;
	private String product_name;
	private String company_id;
	private String company_name;
	private String employee_id;
	private String employee_name;
	private String sales_state;
	private String sales_state_name;

	
	
	
	public String getAccount_id() {
		return account_id;
	}

	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public String getSales_state() {
		return sales_state;
	}

	public void setSales_state(String sales_state) {
		this.sales_state = sales_state;
	}

	public String getSales_state_name() {
		return sales_state_name;
	}

	public void setSales_state_name(String sales_state_name) {
		this.sales_state_name = sales_state_name;
	}

	@Override
	public String toString() {
		return "ModifySelect [account_id=" + account_id + ", account_name=" + account_name + ", product_id="
				+ product_id + ", product_name=" + product_name + ", company_id=" + company_id + ", company_name="
				+ company_name + ", employee_id=" + employee_id + ", employee_name=" + employee_name + ", sales_state="
				+ sales_state + ", sales_state_name=" + sales_state_name + "]";
	}

}
