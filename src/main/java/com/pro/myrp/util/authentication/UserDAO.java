package com.pro.myrp.util.authentication;

import java.util.Map;

import com.pro.myrp.domain.authentication.LoginDTO;
import com.pro.myrp.domain.authentication.UserVO;

public interface UserDAO {
	
	public UserVO login(Map<String, Object> doaMap) throws Exception;

	/**
	 * 접속사원이 퇴사자인지 확인
	 * @author amaco78
	 * @param employee_id
	 * @return
	 */
	public Object select_retired_employee(int employee_id);
	
	
	
}
