package com.pro.myrp.util.authentication;

import org.springframework.ui.Model;

import com.pro.myrp.domain.authentication.LoginDTO;
import com.pro.myrp.domain.authentication.UserVO;

public interface UserService {

	public void login_service(Model model) throws Exception;
	
	public void loginPOST_service(Model model) throws Exception;

	public void logout_service(Model model) throws Exception;
}
