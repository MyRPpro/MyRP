package com.pro.myrp.domain.purchase_management;

import java.sql.Date;


/**
 * @author Jang.EC
 *
 */

public class PurchaseDTO {

	private String purchase_id;
	private String account_id;
	private String order_id;
	private String product_id;
	private String company_id;
	private int employee_id;
	private Date reg_date;
	private Date update_date;
	private Date storage_in_date;
	private int count_purchase;
	private long supply_price;
	private int purchase_state;
	private int condition_note_payable;
	
	// 기본 테이블외 추가한 변수들 
	private String product_name;
	private String company_name;
	private String employee_name;
	private String account_name;
	private String statement_id;
	private int rnum;
	private String state_name;
	private int lack_stock;
	private int stock_state;
	
	private String stock_order_type;
	private String sales_id;
	private String lack_id;
	private String lack_sales_id;
	private int purchase_unit_price;
	private String stock_order_id;
	
	
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getPurchase_id() {
		return purchase_id;
	}

	public void setPurchase_id(String purchase_id) {
		this.purchase_id = purchase_id;
	}

	public String getAccount_id() {
		return account_id;
	}

	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
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

	public Date getStorage_in_date() {
		return storage_in_date;
	}

	public void setStorage_in_date(Date storage_in_date) {
		this.storage_in_date = storage_in_date;
	}

	public int getCount_purchase() {
		return count_purchase;
	}

	public void setCount_purchase(int count_purchase) {
		this.count_purchase = count_purchase;
	}

	public long getSupply_price() {
		return supply_price;
	}

	public void setSupply_price(long supply_price) {
		this.supply_price = supply_price;
	}

	public int getPurchase_state() {
		return purchase_state;
	}

	public void setPurchase_state(int purchase_state) {
		this.purchase_state = purchase_state;
	}

	public int getCondition_note_payable() {
		return condition_note_payable;
	}

	public void setCondition_note_payable(int condition_note_payable) {
		this.condition_note_payable = condition_note_payable;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}



	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getEmployee_name() {
		return employee_name;
	}

	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}

	public String getAccount_name() {
		return account_name;
	}

	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}

	public String getStatement_id() {
		return statement_id;
	}

	public void setStatement_id(String statement_id) {
		this.statement_id = statement_id;
	}
	
	
		


	public String getState_name() {
		return state_name;
	}

	public void setState_name(String state_name) {
		this.state_name = state_name;
	}

	@Override
	public String toString() {
		return "PurchaseVO [purchase_id=" + purchase_id + ", account_id=" + account_id + ", order_id=" + order_id
				+ ", product_id=" + product_id + ", company_id=" + company_id + ", employee_id=" + employee_id
				+ ", reg_date=" + reg_date + ", update_date=" + update_date + ", storage_in_date=" + storage_in_date
				+ ", count_purchase=" + count_purchase + ", supply_price=" + supply_price + ", purchase_state="
				+ purchase_state + ", condition_note_payable=" + condition_note_payable + ", product_name="
				+ product_name + ", company_name=" + company_name + ", employee_name=" + employee_name
				+ ", account_name=" + account_name + ", statement_id=" + statement_id + ", rnum=" + rnum
				+ ", state_name=" + state_name + "]";
	}

	public int getLack_stock() {
		return lack_stock;
	}

	public void setLack_stock(int lack_stock) {
		this.lack_stock = lack_stock;
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

	public String getSales_id() {
		return sales_id;
	}

	public void setSales_id(String sales_id) {
		this.sales_id = sales_id;
	}

	public String getLack_id() {
		return lack_id;
	}

	public void setLack_id(String lack_id) {
		this.lack_id = lack_id;
	}

	public String getLack_sales_id() {
		return lack_sales_id;
	}

	public void setLack_sales_id(String lack_sales_id) {
		this.lack_sales_id = lack_sales_id;
	}

	public int getPurchase_unit_price() {
		return purchase_unit_price;
	}

	public void setPurchase_unit_price(int purchase_unit_price) {
		this.purchase_unit_price = purchase_unit_price;
	}

	public String getStock_order_id() {
		return stock_order_id;
	}

	public void setStock_order_id(String stock_order_id) {
		this.stock_order_id = stock_order_id;
	}

	
	
	
	
	
	
	
	
	
	
	
	
		
		
		
		
		
	
		
	
}
