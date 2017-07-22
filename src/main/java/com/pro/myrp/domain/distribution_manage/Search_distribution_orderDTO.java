package com.pro.myrp.domain.distribution_manage;

import java.sql.Date;

public class Search_distribution_orderDTO {

	private String order_id;
	private String sales_id;
	private int order_state;
	private Date storage_out_date;
	
	
	public String getSales_id() {
		return sales_id;
	}
	public void setSales_id(String sales_id) {
		this.sales_id = sales_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public Date getStorage_out_date() {
		return storage_out_date;
	}
	public void setStorage_out_date(Date storage_out_date) {
		this.storage_out_date = storage_out_date;
	}
	
	
}
