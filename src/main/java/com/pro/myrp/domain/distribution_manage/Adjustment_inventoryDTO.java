package com.pro.myrp.domain.distribution_manage;

import java.sql.Date;

public class Adjustment_inventoryDTO {

	private String stock_order_id;
	private String product_id;
	private String product_name;
	private int warehouse_id;
	private String warehouse_name;
	private int employee_id;
	private int stock_amount;
	private Date reg_date;
	private Date search_date;
	private int taked_stock;
	private int delete_stock;
	
	
	
	public String getWarehouse_name() {
		return warehouse_name;
	}
	public void setWarehouse_name(String warehouse_name) {
		this.warehouse_name = warehouse_name;
	}
	public String getStock_order_id() {
		return stock_order_id;
	}
	public void setStock_order_id(String stock_order_id) {
		this.stock_order_id = stock_order_id;
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
	public int getStock_amount() {
		return stock_amount;
	}
	public void setStock_amount(int stock_amount) {
		this.stock_amount = stock_amount;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getSearch_date() {
		return search_date;
	}
	public void setSearch_date(Date search_date) {
		this.search_date = search_date;
	}
	public int getTaked_stock() {
		return taked_stock;
	}
	public void setTaked_stock(int taked_stock) {
		this.taked_stock = taked_stock;
	}
	public int getDelete_stock() {
		return delete_stock;
	}
	public void setDelete_stock(int delete_stock) {
		this.delete_stock = delete_stock;
	}
	
	
}
