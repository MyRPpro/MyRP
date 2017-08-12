package com.pro.myrp.domain.distribution_manage;

import java.sql.Date;

public class Select_stock_order_storageDTO {
	
	private String stock_order_id;
	private String stock_order_type;
	private int count_sales;
	private int available_stock;
	private int lack_stock;
	private Date storage_out_date;
	
	private String product_id;
	private int warehouse_id;
	private int employee_id;
	private Date reg_date;
	private Date update_date;
	private int stock_state;
	
	private int count_purchase;
	private Date storage_in_date;
	
	private String kor_name;
	private String product_name;
	private String warehouse_name;
	private String employee_name;
	
	
	
	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}


	public String getWarehouse_name() {
		return warehouse_name;
	}

	public void setWarehouse_name(String warehouse_name) {
		this.warehouse_name = warehouse_name;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public String getKor_name() {
		return kor_name;
	}

	public void setKor_name(String kor_name) {
		this.kor_name = kor_name;
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

	public String getStock_order_id() {
		return stock_order_id;
	}

	public void setStock_order_id(String stock_order_id) {
		this.stock_order_id = stock_order_id;
	}

	public int getCount_sales() {
		return count_sales;
	}

	public void setCount_sales(int count_sales) {
		this.count_sales = count_sales;
	}

	public int getAvailable_stock() {
		return available_stock;
	}

	public void setAvailable_stock(int available_stock) {
		this.available_stock = available_stock;
	}

	public int getLack_stock() {
		return lack_stock;
	}

	public void setLack_stock(int lack_stock) {
		this.lack_stock = lack_stock;
	}

	public Date getStorage_out_date() {
		return storage_out_date;
	}

	public void setStorage_out_date(Date storage_out_date) {
		this.storage_out_date = storage_out_date;
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

	public int getStock_state() {
		return stock_state;
	}

	public void setStock_state(int stock_state) {
		this.stock_state = stock_state;
	}

	public String getStock_order_type() {
		return stock_order_type;
	}

	public void setStock_order_type(String stock_order_type) {
		this.stock_order_type = stock_order_type;
	}
	
	

}
