package com.pro.myrp.domain.accounting_management;

import java.util.Date;

public class StatementVO {
	public String statement_id; 		//전표번호
    public String account_id; 			//계정코드
    public Date reg_date; 				//등록일자
    public int account_value;			//계정금액
    public int approval_state;			//주문상태
    public String statement_type; 		//전표타입
    
	public String getStatement_id() {
		return statement_id;
	}
	public void setStatement_id(String statement_id) {
		this.statement_id = statement_id;
	}
	public String getAccount_id() {
		return account_id;
	}
	public void setAccount_id(String account_id) {
		this.account_id = account_id;
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
