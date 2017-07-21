package com.pro.myrp.domain.base_registration;

import java.sql.Date;

public class ProductVO {

	private String product_id;
	private String product_name;
	private int purchase_unit_price;
	private int sale_unit_price;
	private String use_state;
	private Date reg_date;

	private String warehouse_id;
	private int stock_amount;
	
	
	
	public String getWarehouse_id() {
		return warehouse_id;
	}
	public void setWarehouse_id(String warehouse_id) {
		this.warehouse_id = warehouse_id;
	}
	public int getStock_amount() {
		return stock_amount;
	}
	public void setStock_amount(int stock_amount) {
		this.stock_amount = stock_amount;
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
	public int getPurchase_unit_price() {
		return purchase_unit_price;
	}
	public void setPurchase_unit_price(int purchase_unit_price) {
		this.purchase_unit_price = purchase_unit_price;
	}
	public int getSale_unit_price() {
		return sale_unit_price;
	}
	public void setSale_unit_price(int sale_unit_price) {
		this.sale_unit_price = sale_unit_price;
	}
	public String getUse_state() {
		return use_state;
	}
	public void setUse_state(String use_state) {
		this.use_state = use_state;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
}
