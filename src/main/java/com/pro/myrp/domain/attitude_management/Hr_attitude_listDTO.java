package com.pro.myrp.domain.attitude_management;

import java.sql.Date;

public class Hr_attitude_listDTO {
//
	private int  employee_id           ; //사원번호
	private String employee_name       ; //사원 이름
	private Date attitude_date		   ; //휴가 시작일
	private int  hr_code_attitude      ; //근태번호널 값이 들어가도 됨
	private int  attitude_code         ; //근태 널값이 들어가도 됨
	private int  hr_code_group_leave   ; //휴가번호
	private int  leave_code            ; //휴가 종류
	private String leave_code_name     ; //휴가종류 이름
	private int  attitude_period       ; //휴가 기간
	private int  hr_code_group_reason  ; //휴가사유번호
	private int  attitude_reason       ; //휴가 사유
	private String attitude_reason_name; //휴가사유번호 이름
	
	public int getEmployee_id() {
		return employee_id;
	}
	
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	
	public String getEmployee_name() {
		return employee_name;
	}
	
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	
	public Date getAttitude_date() {
		return attitude_date;
	}
	
	public void setAttitude_date(Date attitude_date) {
		this.attitude_date = attitude_date;
	}
	
	public int getHr_code_attitude() {
		return hr_code_attitude;
	}
	
	public void setHr_code_attitude(int hr_code_attitude) {
		this.hr_code_attitude = hr_code_attitude;
	}
	
	public int getAttitude_code() {
		return attitude_code;
	}
	
	public void setAttitude_code(int attitude_code) {
		this.attitude_code = attitude_code;
	}
	
	public int getHr_code_group_leave() {
		return hr_code_group_leave;
	}
	
	public void setHr_code_group_leave(int hr_code_group_leave) {
		this.hr_code_group_leave = hr_code_group_leave;
	}
	
	public int getLeave_code() {
		return leave_code;
	}
	
	public void setLeave_code(int leave_code) {
		this.leave_code = leave_code;
	}
	
	public String getLeave_code_name() {
		return leave_code_name;
	}
	
	public void setLeave_code_name(String leave_code_name) {
		this.leave_code_name = leave_code_name;
	}
	
	public int getAttitude_period() {
		return attitude_period;
	}
	
	public void setAttitude_period(int attitude_period) {
		this.attitude_period = attitude_period;
	}
	
	public int getHr_code_group_reason() {
		return hr_code_group_reason;
	}
	
	public void setHr_code_group_reason(int hr_code_group_reason) {
		this.hr_code_group_reason = hr_code_group_reason;
	}
	
	public int getAttitude_reason() {
		return attitude_reason;
	}
	
	public void setAttitude_reason(int attitude_reason) {
		this.attitude_reason = attitude_reason;
	}
	
	public String getAttitude_reason_name() {
		return attitude_reason_name;
	}
	
	public void setAttitude_reason_name(String attitude_reason_name) {
		this.attitude_reason_name = attitude_reason_name;
	}
}
