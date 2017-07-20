package com.pro.myrp.persistence.hr;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.hr_management.DeptVO;
import com.pro.myrp.domain.hr_management.EmployeeVO;
import com.pro.myrp.domain.hr_management.Employee_infoVO;
import com.pro.myrp.domain.hr_management.Hr_appointment_listDTO;
import com.pro.myrp.domain.hr_management.Hr_codeVO;
import com.pro.myrp.domain.hr_management.Hr_code_groupVO;
import com.pro.myrp.domain.hr_management.Personnel_appointmentVO;
import com.pro.myrp.domain.hr_management.Personnel_cardDTO;
import com.pro.myrp.domain.hr_management.Personnel_card_listDTO;

@Repository
public class HRDAOImpl implements HRDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public List<Hr_code_groupVO> select_hr_code_groups() {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_hr_code_groups();
	}

	@Override
	public Hr_code_groupVO select_hr_code_group(int hr_code_group_id) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_hr_code_group(hr_code_group_id);
	}

	@Override
	public int insert_base_code_group(Hr_code_groupVO vo) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.insert_base_code_group(vo);
	}

	@Override
	public List<Hr_codeVO> select_hr_codes(int hr_code_group_id) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_hr_codes(hr_code_group_id);
	}

	@Override
	public List<Hr_codeVO> select_used_hr_codes(Map<String, Object> daoMap) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_used_hr_codes(daoMap);
	}
	
	@Override
	public int update_hr_code_group(Map<String, Object> daoMap) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.update_hr_code_group(daoMap);
	}

	@Override
	public Hr_codeVO select_hr_code(Map<String, Object> daoMap) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_hr_code(daoMap);
	}

	@Override
	public String select_hr_code_name(Map<String, Object> daoMap) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_hr_code_name(daoMap);
	}
	
	@Override
	public int insert_base_code(Hr_codeVO vo) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.insert_base_code(vo);
	}

	@Override
	public int update_hr_code(Hr_codeVO vo) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.update_hr_code(vo);
	}
	
	@Override
	public int select_dept_cnt() {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_dept_cnt();
	}

	@Override
	public List<DeptVO> select_dept_list(Map<String, Object> daoMap) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_dept_list(daoMap);
	}
	
	@Override
	public List<DeptVO> select_used_dept_list(String use_state) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_used_dept_list(use_state);
	}
	
	@Override
	public DeptVO select_dept(int dept_id) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_dept(dept_id);
	}

	@Override
	public String select_dept_name(int dept_id) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_dept_name(dept_id);
	}
	
	@Override
 	public int insert_dept(DeptVO vo) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.insert_dept(vo);
	}
	
	@Override
	public int update_dept(DeptVO vo) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.update_dept(vo);
	}

	@Override
	public int select_employee_cnt(String searchStr) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_employee_cnt(searchStr);
	}

	@Override
	public List<EmployeeVO> select_employee_list(Map<String, Object> daoMap) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_employee_list(daoMap);
	}

	@Override
	public List<EmployeeVO> select_employees() {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_employees();
	}
	
	@Override
	public List<Personnel_card_listDTO> select_personnel_card_list(Map<String, Object> daoMap) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_personnel_card_list(daoMap);
	}

	@Override
	public EmployeeVO select_employee(int employee_id) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_employee(employee_id);
	}

	@Override
	public int insert_employee(EmployeeVO vo) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.insert_employee(vo);
	}

	@Override
	public int insert_employee_info(Employee_infoVO vo2) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.insert_employee_info(vo2);
	}
	
	@Override
	public Personnel_cardDTO select_personnel_card(int employee_id) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_personnel_card(employee_id);
	}

	@Override
	public int update_employee(EmployeeVO vo) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.update_employee(vo);
	}

	@Override
	public int update_employee_info(Employee_infoVO vo2) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.update_employee_info(vo2);
	}

	@Override
	public int select_appointment_cnt(String searchStr) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_appointment_cnt(searchStr);
	}

	@Override
	public List<Hr_appointment_listDTO> select_hr_appointment_list(Map<String, Object> daoMap) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_hr_appointment_list(daoMap);
	}

	@Override
	public List<EmployeeVO> select_employee_list_for_dept_id(int dept_id) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_employee_list_for_dept_id(dept_id);
	}

	@Override
	public int insert_personnel_appointment(Personnel_appointmentVO vo) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.insert_personnel_appointment(vo);
	}

	@Override
	public Date select_appointment_date(int employee_id) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_appointment_date(employee_id);
	}

	@Override
	public int update_employee_appoint(Map<String, Object> daoMap) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.update_employee_appoint(daoMap);
	}

	@Override
	public List<Hr_appointment_listDTO> select_appointment(int employee_id) {
		HRDAO dao = sqlSession.getMapper(HRDAO.class);
		return dao.select_appointment(employee_id);
	}
}