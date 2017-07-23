package com.pro.myrp.domain.authentication;

public class UserVO {

	private String employee_name;
	private String employee_id;
	private String access_role;
	public String getEmployee_name() {
		return employee_name;
	}
	public void setEmployee_name(String employee_name) {
		this.employee_name = employee_name;
	}
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getAccess_role() {
		return access_role;
	}
	public void setAccess_role(String access_role) {
		this.access_role = access_role;
	}

}
