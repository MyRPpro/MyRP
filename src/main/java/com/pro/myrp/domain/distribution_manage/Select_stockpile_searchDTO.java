package com.pro.myrp.domain.distribution_manage;

import java.sql.Date;

public class Select_stockpile_searchDTO {
	
	private String pro_id;
	private String product_id;
	private String product_name;
	private int moving_stock;
	private int minus_stock;
	private int plus_stock;
	private int stock_amount;
	private Date sto_date;
	
	private String sto_state;

	
	
	public int getMinus_stock() {
		return minus_stock;
	}
	public void setMinus_stock(int minus_stock) {
		this.minus_stock = minus_stock;
	}
	public int getPlus_stock() {
		return plus_stock;
	}
	public void setPlus_stock(int plus_stock) {
		this.plus_stock = plus_stock;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
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
	public String getPro_id() {
		return pro_id;
	}
	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}
	public Date getSto_date() {
		return sto_date;
	}
	public void setSto_date(Date sto_date) {
		this.sto_date = sto_date;
	}
	public String getSto_state() {
		return sto_state;
	}
	public void setSto_state(String sto_state) {
		this.sto_state = sto_state;
	}
	public int getMoving_stock() {
		return moving_stock;
	}
	public void setMoving_stock(int moving_stock) {
		this.moving_stock = moving_stock;
	}
	
	
}
