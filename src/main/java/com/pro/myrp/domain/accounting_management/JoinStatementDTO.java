package com.pro.myrp.domain.accounting_management;

import java.util.Date;

public class JoinStatementDTO {
	
	public String statement_id;
	public String purchase_id;
	public String account_id;
	
	public String salary_register_id;
	
	public String sales_id;
	
    public Date reg_date; 				//등록일자
    public int account_value;			//계정금액
    public int approval_state;			//주문상태
    public String statement_type; 		//전표타입	
	
    public String sales_account_id;
    public String purchase_account_id;
    public String salary_account_id;
    public String tax_account_id;
    
    public String account_name;
    public String company_name;
    
    
    public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	
    public String getSales_account_id() {
		return sales_account_id;
	}
	public void setSales_account_id(String sales_account_id) {
		this.sales_account_id = sales_account_id;
	}
	public String getPurchase_account_id() {
		return purchase_account_id;
	}
	public void setPurchase_account_id(String purchase_account_id) {
		this.purchase_account_id = purchase_account_id;
	}
	public String getSalary_account_id() {
		return salary_account_id;
	}
	public void setSalary_account_id(String salary_account_id) {
		this.salary_account_id = salary_account_id;
	}
	public String getTax_account_id() {
		return tax_account_id;
	}
	public void setTax_account_id(String tax_account_id) {
		this.tax_account_id = tax_account_id;
	}
	public String getStatement_id() {
		return statement_id;
	}
	public void setStatement_id(String statement_id) {
		this.statement_id = statement_id;
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
	public String getSalary_register_id() {
		return salary_register_id;
	}
	public void setSalary_register_id(String salary_register_id) {
		this.salary_register_id = salary_register_id;
	}
	public String getSales_id() {
		return sales_id;
	}
	public void setSales_id(String sales_id) {
		this.sales_id = sales_id;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getAccount_value() {
		return account_value;
	}
	public void setAccount_value(int account_value) {
		this.account_value = account_value;
	}
	public int getApproval_state() {
		return approval_state;
	}
	public void setApproval_state(int approval_state) {
		this.approval_state = approval_state;
	}
	public String getStatement_type() {
		return statement_type;
	}
	public void setStatement_type(String statement_type) {
		this.statement_type = statement_type;
	}
    
    
}
