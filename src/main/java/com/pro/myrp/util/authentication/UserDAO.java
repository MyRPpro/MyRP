package com.pro.myrp.util.authentication;

import java.util.Map;

import com.pro.myrp.domain.authentication.LoginDTO;
import com.pro.myrp.domain.authentication.UserVO;

public interface UserDAO {
	
	public UserVO login(Map<String, Object> doaMap) throws Exception;
	
}
