package com.pro.myrp.domain.state_alarm;

public class State_alarmDTO {
	
	private String order_id;
	private int order_state;
	private int code;
	private String kor_name;
	private String eng_name;
	private String state_addr;
	private String state_msg;
	
	
	
	
	public String getState_msg() {
		return state_msg;
	}
	public void setState_msg(String state_msg) {
		this.state_msg = state_msg;
	}
	public String getState_addr() {
		return state_addr;
	}
	public void setState_addr(String state_addr) {
		this.state_addr = state_addr;
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
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getKor_name() {
		return kor_name;
	}
	public void setKor_name(String kor_name) {
		this.kor_name = kor_name;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getFrom_dept() {
		return from_dept;
	}
	public void setFrom_dept(String from_dept) {
		this.from_dept = from_dept;
	}

}
