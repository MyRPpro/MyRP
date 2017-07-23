package com.pro.myrp.domain.hr_management;

import java.sql.Date;

public class Retired_employeeVO {

	private int employee_id;
	private Date retired_date;
	private String retired_reason;
	
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public Date getRetired_date() {
		return retired_date;
	}
	public void setRetired_date(Date retired_date) {
		this.retired_date = retired_date;
	}
	public String getRetired_reason() {
		return retired_reason;
	}
	public void setRetired_reason(String retired_reason) {
		this.retired_reason = retired_reason;
	}
}
