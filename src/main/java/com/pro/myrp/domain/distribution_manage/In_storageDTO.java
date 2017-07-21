package com.pro.myrp.domain.distribution_manage;

import java.sql.Date;

public class In_storageDTO {
	
	private String order_id;
	private String stock_order_type;
	private String product_id;
	private int warehouse_id;
	private int employee_id;
	private Date reg_date;
	private Date update_date;
	private String stock_state;
	
	private int count_purchase;
	private Date storage_in_date;
	
	private String purchase_id;
	
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getPurchase_id() {
		return purchase_id;
	}
	public void setPurchase_id(String purchase_id) {
		this.purchase_id = purchase_id;
	}
	public String getStock_order_type() {
		return stock_order_type;
	}
	public void setStock_order_type(String stock_order_type) {
		this.stock_order_type = stock_order_type;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public int getWarehouse_id() {
		return warehouse_id;
	}
	public void setWarehouse_id(int warehouse_id) {
		this.warehouse_id = warehouse_id;
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
	public String getStock_state() {
		return stock_state;
	}
	public void setStock_state(String stock_state) {
		this.stock_state = stock_state;
	}
	public int getCount_purchase() {
		return count_purchase;
	}
	public void setCount_purchase(int count_purchase) {
		this.count_purchase = count_purchase;
	}
	public Date getStorage_in_date() {
		return storage_in_date;
	}
	public void setStorage_in_date(Date storage_in_date) {
		this.storage_in_date = storage_in_date;
	}
	
	

}
