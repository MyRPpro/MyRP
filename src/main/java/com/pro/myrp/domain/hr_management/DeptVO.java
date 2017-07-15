package com.pro.myrp.domain.hr_management;

public class DeptVO {
	
	private int dept_id;
	private String dept_name;
	private String access_role;
	private String use_state;
	
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getAccess_role() {
		return access_role;
	}
	public void setAccess_role(String access_role) {
		this.access_role = access_role;
	}
	public String getUse_state() {
		return use_state;
	}
	public void setUse_state(String use_state) {
		this.use_state = use_state;
	}
}
