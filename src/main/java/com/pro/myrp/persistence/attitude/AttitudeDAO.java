package com.pro.myrp.persistence.attitude;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.pro.myrp.domain.attitude_management.Hr_attitude_listDTO;
import com.pro.myrp.domain.attitude_management.Service_attitudeVO;
import com.pro.myrp.domain.hr_management.DeptVO;
import com.pro.myrp.domain.hr_management.EmployeeVO;
import com.pro.myrp.domain.hr_management.Hr_appointment_listDTO;
import com.pro.myrp.domain.hr_management.Hr_codeVO;
import com.pro.myrp.domain.hr_management.Personnel_appointmentVO;
import com.pro.myrp.persistence.MyRPDAO;

public interface AttitudeDAO extends MyRPDAO {
//
	/**
	 * @author 장재희
	 * @return
	 * @throws Exception
	 */
	public List<EmployeeVO> select_employees() throws Exception;
	
	/**
	 * @author 장재희
	 * @param use_state
	 * @return
	 * @throws Exception
	 */
	public List<DeptVO> select_used_dept_list(String use_state) throws Exception;
	
	/**
	 * @author 장재희
	 * @param daoMap
	 * @return
	 * @throws Exception
	 */
	public List<Hr_codeVO> select_used_hr_codes(Map<String, Object> daoMap) throws Exception;
	
	/**
	 * @author 장재희
	 * @param daomap
	 * @return
	 * @throws Exception
	 */
	public List<Hr_codeVO> select_used_hr_code(Map<String, Object> daomap) throws Exception;
	
	
	/**
	 * @author 장재희
	 * @param employee_id
	 * @return
	 * @throws Exception
	 */
	public EmployeeVO select_employee(int employee_id) throws Exception;
	
	/**
	 * @author 장재희
	 * @param daoMap
	 * @return
	 * @throws Exception
	 */
	public String select_hr_code_name(Map<String,Object> daoMap) throws Exception;
	
	/**
	 * @author 장재희
	 * @param daomap
	 * @return
	 * @throws Exception
	 */
	public String select_hr_code_names(Map<String,Object> daomap) throws Exception;
	
	/**
	 * 
	 * @param employee_id
	 * @return
	 * @throws Exception
	 */
	public Date select_appointment_date(int employee_id) throws Exception;
	

	/**
	 * 
	 * @param dept_id
	 * @return
	 * @throws Exception
	 */
	public String select_dept_name(int dept_id) throws Exception;
	
	
	/**
	 * @author 장재희
	 * @param employee_idCheck
	 * @return
	 * @throws Exception
	 */
	public int employee_idCheck(int employee_id) throws Exception;
	
	/**
	 * @author 장재희
	 * @param daoMap
	 * @return
	 * @throws Exception
	 */
	public int attitude_dateCnt(Map<String, Object> daoMap) throws Exception; 
	
	/**
	 * @author 장재희
	 * @param vo
	 * @return
	 */
	public int insert_service_attitude(Service_attitudeVO vo) throws Exception;
	
	/**
	 * @author 장재희
	 * @param searchStr
	 * @return
	 */
	public int select_appointment_cnt(String search) throws Exception;
	
	/**
	 * @author 장재희
	 * @param daoMap
	 * @return
	 */
	public List<Hr_attitude_listDTO> select_hr_appointment_list(Map<String, Object> daoMap) throws Exception;
	
	
}
