package com.pro.myrp.domain.attitude_management;

import java.sql.Date;

public class AttitudeVO {
//
	private int employee_id;
	private Date attitude_date;
	private int hr_code_attitude;
	private int attitude_code;
	private int hr_code_group_leave;
	private int leave_code;
	private Date attitude_period;
	private int hr_code_group_reason;
	private int attitude_reason;
	
	public int getEmployee_id() {
		return employee_id;
	}
	
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
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
	
	public Date getAttitude_period() {
		return attitude_period;
	}
	
	public void setAttitude_period(Date attitude_period) {
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
	
}
