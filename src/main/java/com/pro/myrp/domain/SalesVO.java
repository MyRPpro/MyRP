package com.pro.myrp.domain;

import java.sql.Date;

public class SalesVO {

	private String sales_id;
	private String account_id;
	private String order_id;
	private String product_id;
	private String company_id;
	private int employee_id;
	private Date reg_date;
	private Date update_date;
	private Date storage_out_date;
	private int count_sales;
	private long selling_price;
	private int condition_note_receivable;
	private int sales_state;
	
	// 추가한 변수 들
	private String company_name;
	
	
	
	
	
	
	public String getSales_id() {
		return sales_id;
	}

	public void setSales_id(String sales_id) {
		this.sales_id = sales_id;
	}

	public String getAccount_id() {
		return account_id;
	}

	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public Date getStorage_out_date() {
		return storage_out_date;
	}

	public void setStorage_out_date(Date storage_out_date) {
		this.storage_out_date = storage_out_date;
	}

	public int getCount_sales() {
		return count_sales;
	}

	public void setCount_sales(int count_sales) {
		this.count_sales = count_sales;
	}

	public long getSelling_price() {
		return selling_price;
	}

	public void setSelling_price(long selling_price) {
		this.selling_price = selling_price;
	}

	public int getCondition_note_receivable() {
		return condition_note_receivable;
	}

	public void setCondition_note_receivable(int condition_note_receivable) {
		this.condition_note_receivable = condition_note_receivable;
	}

	public int getSales_state() {
		return sales_state;
	}

	public void setSales_state(int sales_state) {
		this.sales_state = sales_state;
	}
	
	


	@Override
	public String toString() {
		return "SalesVO [sales_id=" + sales_id + ", account_id=" + account_id + ", order_id=" + order_id
				+ ", product_id=" + product_id + ", company_id=" + company_id + ", employee_id=" + employee_id
				+ ", reg_date=" + reg_date + ", update_date=" + update_date + ", storage_out_date=" + storage_out_date
				+ ", count_sales=" + count_sales + ", selling_price=" + selling_price + ", condition_note_receivable="
				+ condition_note_receivable + ", sales_state=" + sales_state + "]";
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	
	
	
	
	
	
}