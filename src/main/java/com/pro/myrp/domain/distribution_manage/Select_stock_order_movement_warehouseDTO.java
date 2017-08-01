package com.pro.myrp.domain.distribution_manage;

import java.sql.Date;

public class Select_stock_order_movement_warehouseDTO {
	
	private String stock_order_id;
	private String product_id;
	private String product_name;
	private int warehouse_id;
	private String warehouse_name;
	private int employee_id;
	private String employee_name;
	private Date reg_date;
	private Date update_date;
	
	private int arrive_warehouse;
	private int movement_amount;
	private String movement_state;

	
	

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

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getArrive_warehouse() {
		return arrive_warehouse;
	}

	public void setArrive_warehouse(int arrive_warehouse) {
		this.arrive_warehouse = arrive_warehouse;
	}

	public int getMovement_amount() {
		return movement_amount;
	}

	public void setMovement_amount(int movement_amount) {
		this.movement_amount = movement_amount;
	}

	public String getMovement_state() {
		return movement_state;
	}

	public void setMovement_state(String movement_state) {
		this.movement_state = movement_state;
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

}
