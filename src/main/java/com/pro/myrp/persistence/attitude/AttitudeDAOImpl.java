package com.pro.myrp.persistence.attitude;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.attitude_management.Hr_attitude_listDTO;
import com.pro.myrp.domain.attitude_management.Service_attitudeVO;
import com.pro.myrp.domain.hr_management.dto.Hr_appointment_listDTO;
import com.pro.myrp.domain.hr_management.vo.DeptVO;
import com.pro.myrp.domain.hr_management.vo.EmployeeVO;
import com.pro.myrp.domain.hr_management.vo.Hr_codeVO;
import com.pro.myrp.persistence.hr.HRDAO;


@Repository
public class AttitudeDAOImpl implements AttitudeDAO {
///
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<EmployeeVO> select_employees() throws Exception {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_employees();
	}

	@Override
	public List<DeptVO> select_used_dept_list(String use_state) throws Exception {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_used_dept_list(use_state);
	}

	@Override
	public List<Hr_codeVO> select_used_hr_codes(Map<String, Object> daoMap) throws Exception {
		//
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_used_hr_codes(daoMap);
	}
	
	@Override
	public List<Hr_codeVO> select_used_hr_code(Map<String, Object> daomap) throws Exception {
		//
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_used_hr_code(daomap);
	}

	@Override
	public EmployeeVO select_employee(int employee_id) throws Exception {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_employee(employee_id);
	}

	@Override
	public String select_hr_code_name(Map<String, Object> daoMap) throws Exception {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_hr_code_name(daoMap);
	}
	
	@Override
	public String select_hr_code_names(Map<String, Object> daomap) throws Exception {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_hr_code_names(daomap);
	}

	@Override
	public String select_dept_name(int dept_id) throws Exception {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_dept_name(dept_id);
	}
	
	@Override
	public Date select_attitude_date(int employee_id) throws Exception {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_attitude_date(employee_id);
	}
	
	@Override
	public int insert_service_attitude(Service_attitudeVO vo) throws Exception {
		//
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.insert_service_attitude(vo);
	}
	
	@Override
	public int select_attitude_cnt(String search) throws Exception {
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_attitude_cnt(search);
	}
	
	@Override
	public List<Hr_attitude_listDTO> select_hr_attitude_list(Map<String, Object> daoMap) throws Exception {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_hr_attitude_list(daoMap);
	}

	@Override
	public List<Hr_attitude_listDTO> select_attitude(int employee_id) throws Exception {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_attitude(employee_id);
	}

	@Override
	public String select_pic_uid(int employee_id) {
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_pic_uid(employee_id);
	}

	
}
