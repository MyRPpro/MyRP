package com.pro.myrp.domain;

public class Stock_conditionDTO {

	private String product_id;
	private String product_name;
	private int stock_amount; 
	private int purchase_unit_price;

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
	public int getStock_amount() {
		return stock_amount;
	}
	public void setStock_amount(int stock_amount) {
		this.stock_amount = stock_amount;
	}
	public int getPurchase_unit_price() {
		return purchase_unit_price;
	}
	public void setPurchase_unit_price(int purchase_unit_price) {
		this.purchase_unit_price = purchase_unit_price;
	}
	
	
}
