package com.pro.myrp.domain.accounting_management;

import java.sql.Date;

public class Bank_accountVO {
	 
	private String bank_account_id; 	//계좌코드(계정코드)
	private String bank_account_name;   //계좌명
	private String bank_account_number; //계좌번호
	private int bank_account_balance; 	//잔액
	private String bank_account_type;   //계좌타입
	private String bank_name;          	//은행명 
	private String use_state;           //사용상태
	private Date reg_date;             	//등록일자
	
	
	public String getBank_account_id() {
		return bank_account_id;
	}
	public void setBank_account_id(String bank_account_id) {
		this.bank_account_id = bank_account_id;
	}
	public String getBank_account_name() {
		return bank_account_name;
	}
	public void setBank_account_name(String bank_account_name) {
		this.bank_account_name = bank_account_name;
	}
	public String getBank_account_number() {
		return bank_account_number;
	}
	public void setBank_account_number(String bank_account_number) {
		this.bank_account_number = bank_account_number;
	}
	public int getBank_account_balance() {
		return bank_account_balance;
	}
	public void setBank_account_balance(int bank_account_balance) {
		this.bank_account_balance = bank_account_balance;
	}
	public String getBank_account_type() {
		return bank_account_type;
	}
	public void setBank_account_type(String bank_account_type) {
		this.bank_account_type = bank_account_type;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
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
