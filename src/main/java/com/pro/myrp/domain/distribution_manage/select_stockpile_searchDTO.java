package com.pro.myrp.domain.distribution_manage;

import java.sql.Date;

public class select_stockpile_searchDTO {
	
	private Date disposal_date;
	
	private String sales_id;
	private String product_id;
	private Date storage_out_date;
	private int count_sales;
	private int sales_state;//판매 : 22213 , 불량 : 22313
	private String product_name;
	
	//구매
	private String purchase_id;
	//private String product_id;
	private Date update_date;
	private int count_purchase;
	private int purchase_state;//23203
	//private String product_name;
	
	//재고사용
	private String stock_order_id;
	//private Date update_date;
	//private String product_id;
	//private String product_name;
	
	//재고조정
	//private String stock_order_id;
	private int deleted_stock;
	
	//창고이동
	//private String stock_order_id;
	
	//재고
	//private String product_id;
	private int stock_amount;
	

	

	public Date getDisposal_date() {
		return disposal_date;
	}

	public void setDisposal_date(Date disposal_date) {
		this.disposal_date = disposal_date;
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

	public String getSales_id() {
		return sales_id;
	}

	public void setSales_id(String sales_id) {
		this.sales_id = sales_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
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

	public int getSales_state() {
		return sales_state;
	}

	public void setSales_state(int sales_state) {
		this.sales_state = sales_state;
	}

	public String getPurchase_id() {
		return purchase_id;
	}

	public void setPurchase_id(String purchase_id) {
		this.purchase_id = purchase_id;
	}

	public Date getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}

	public int getCount_purchase() {
		return count_purchase;
	}

	public void setCount_purchase(int count_purchase) {
		this.count_purchase = count_purchase;
	}

	public int getPurchase_state() {
		return purchase_state;
	}

	public void setPurchase_state(int purchase_state) {
		this.purchase_state = purchase_state;
	}

	public String getStock_order_id() {
		return stock_order_id;
	}

	public void setStock_order_id(String stock_order_id) {
		this.stock_order_id = stock_order_id;
	}

	public int getDeleted_stock() {
		return deleted_stock;
	}

	public void setDeleted_stock(int deleted_stock) {
		this.deleted_stock = deleted_stock;
	}
	
	
	
}
