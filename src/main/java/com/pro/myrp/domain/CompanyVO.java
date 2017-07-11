package com.pro.myrp.domain;

import java.sql.Date;

public class CompanyVO {

	private String company_id;
	private String company_name;
	private String biz_reg_no;
	private String ceo_name;
	private String corp_reg_no;
	private String address;
	private String biz_type;
	private String biz_item;
	private String use_state;
	private String company_type;
	private Date reg_date;
	
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getBiz_reg_no() {
		return biz_reg_no;
	}
	public void setBiz_reg_no(String biz_reg_no) {
		this.biz_reg_no = biz_reg_no;
	}
	public String getCeo_name() {
		return ceo_name;
	}
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	public String getCorp_reg_no() {
		return corp_reg_no;
	}
	public void setCorp_reg_no(String corp_reg_no) {
		this.corp_reg_no = corp_reg_no;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBiz_type() {
		return biz_type;
	}
	public void setBiz_type(String biz_type) {
		this.biz_type = biz_type;
	}
	public String getBiz_item() {
		return biz_item;
	}
	public void setBiz_item(String biz_item) {
		this.biz_item = biz_item;
	}
	public String getUse_state() {
		return use_state;
	}
	public void setUse_state(String use_state) {
		this.use_state = use_state;
	}
	public String getCompany_type() {
		return company_type;
	}
	public void setCompany_type(String company_type) {
		this.company_type = company_type;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
