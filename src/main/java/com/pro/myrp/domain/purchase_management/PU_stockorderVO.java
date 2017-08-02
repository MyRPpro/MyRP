package com.pro.myrp.domain.purchase_management;

import java.sql.Date;

public class PU_stockorderVO {

	private String stock_order_id;
	private String stock_order_type;
	private String product_id;
	private int warehouse_id;
	private int employee_id;
	private Date reg_date;
	private Date update_date;
	private int stock_state;

	public String getStock_order_id() {
		return stock_order_id;
	}

	public void setStock_order_id(String stock_order_id) {
		this.stock_order_id = stock_order_id;
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

	public int getStock_state() {
		return stock_state;
	}

	public void setStock_state(int stock_state) {
		this.stock_state = stock_state;
	}

	@Override
	public String toString() {
		return "SA_stockorderVO [stock_order_id=" + stock_order_id + ", stock_order_type=" + stock_order_type
				+ ", product_id=" + product_id + ", warehouse_id=" + warehouse_id + ", employee_id=" + employee_id
				+ ", reg_date=" + reg_date + ", update_date=" + update_date + ", stock_state=" + stock_state + "]";
	}
	

}
