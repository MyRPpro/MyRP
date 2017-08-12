package com.pro.myrp.domain.distribution_manage;

import java.sql.Date;

public class Search_distribution_orderDTO {

	private String stock_order_id;
	private String kor_name;
	private Date storage_out_date;
	
	public String getStock_order_id() {
		return stock_order_id;
	}
	public void setStock_order_id(String stock_order_id) {
		this.stock_order_id = stock_order_id;
	}

	public String getKor_name() {
		return kor_name;
	}
	public void setKor_name(String kor_name) {
		this.kor_name = kor_name;
	}
	public Date getStorage_out_date() {
		return storage_out_date;
	}
	public void setStorage_out_date(Date storage_out_date) {
		this.storage_out_date = storage_out_date;
	}
	
	
	
}
