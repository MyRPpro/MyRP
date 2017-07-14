package com.pro.myrp.domain;

import java.sql.Date;

public class PurchaseVO {

	private String purchase_id;
	private String account_id;
	private String order_id;
	private String product_id;
	private String company_id;
	private int employee_id;
	private Date reg_date;
	private Date update_date;
	private Date storage_in_date;
	private int count_purchase;
	private long supply_price;
	private int purchase_state;
	private int condition_note_payable;
	
	private String company_name;
	
	
	
	public String getPurchase_id() {
		return purchase_id;
	}
	public void setPurchase_id(String purchase_id) {
		this.purchase_id = purchase_id;
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
	public Date getStorage_in_date() {
		return storage_in_date;
	}
	public void setStorage_in_date(Date storage_in_date) {
		this.storage_in_date = storage_in_date;
	}
	public int getCount_purchase() {
		return count_purchase;
	}
	public void setCount_purchase(int count_purchase) {
		this.count_purchase = count_purchase;
	}
	public long getSupply_price() {
		return supply_price;
	}
	public void setSupply_price(long supply_price) {
		this.supply_price = supply_price;
	}
	public int getPurchase_state() {
		return purchase_state;
	}
	public void setPurchase_state(int purchase_state) {
		this.purchase_state = purchase_state;
	}
	public int getCondition_note_payable() {
		return condition_note_payable;
	}
	public void setCondition_note_payable(int condition_note_payable) {
		this.condition_note_payable = condition_note_payable;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	
	
	
	
	
	
	
	
	
	
		
		
		
		
		
	
		
	
}
