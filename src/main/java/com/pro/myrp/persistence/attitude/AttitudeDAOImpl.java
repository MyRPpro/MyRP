package com.pro.myrp.persistence.attitude;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.attitude_management.Hr_attitude_listDTO;
import com.pro.myrp.domain.attitude_management.Service_attitudeVO;
import com.pro.myrp.domain.hr_management.DeptVO;
import com.pro.myrp.domain.hr_management.EmployeeVO;
import com.pro.myrp.domain.hr_management.Hr_codeVO;

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
	public Date select_appointment_date(int employee_id) throws Exception {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_appointment_date(employee_id);
	}
	
	@Override
	public int employee_idCheck(int employee_id) throws Exception {
		//
		int cnt =0;
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class); 
		cnt = dao.employee_idCheck(employee_id);
		return cnt;
	}
	
	@Override
	public int attitude_dateCnt(Map<String, Object> daoMap) throws Exception {
		//
		int cnt = 0;
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		int employee_id_checkCnt = dao.employee_idCheck ((int) daoMap.get("employee_id"));
		
		if (employee_id_checkCnt != 0) { 
			int attitude_dateCnt=dao.attitude_dateCnt(daoMap);
			System.out.println("--->attitude_dateCnt"+attitude_dateCnt);
			if(attitude_dateCnt != 1) {
				cnt = 1;
				System.out.println("---->attitude_dateCnt"+attitude_dateCnt);
			} else {
				cnt = 2;
				System.out.println("----->attitude_dateCnt"+attitude_dateCnt);
			} 
		} else {
			cnt = 0;
		} 
		return cnt;
	}

	@Override
	public int insert_service_attitude(Service_attitudeVO vo) throws Exception {
		//
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.insert_service_attitude(vo);
	}

	@Override
	public int select_appointment_cnt(String search) throws Exception {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_appointment_cnt(search);
	}

	@Override
	public List<Hr_attitude_listDTO> select_hr_appointment_list(Map<String, Object> daoMap) throws Exception {
		// 
		AttitudeDAO dao = sqlSession.getMapper(AttitudeDAO.class);
		return dao.select_hr_appointment_list(daoMap);
	}
	
}
