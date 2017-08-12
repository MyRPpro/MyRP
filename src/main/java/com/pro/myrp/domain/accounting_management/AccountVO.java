package com.pro.myrp.domain.accounting_management;

public class AccountVO {
	
	private String account_id; 			//계정코드
	private String account_name; 		//계정이름
	private long account_balance;		//잔액
	
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
	}
	public String getAccount_name() {
		return account_name;
	}
	public void setAccount_name(String account_name) {
		this.account_name = account_name;
	}
	public long getAccount_balance() {
		return account_balance;
	}
	public void setAccount_balance(long account_balance) {
		this.account_balance = account_balance;
	}
	
	
	
}
