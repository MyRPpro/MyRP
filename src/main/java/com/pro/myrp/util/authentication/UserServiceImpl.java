package com.pro.myrp.util.authentication;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.authentication.LoginDTO;
import com.pro.myrp.domain.authentication.UserVO;

@Service
public class UserServiceImpl implements UserService, MyRPInterceptor {

	@Inject
	private UserDAO dao;
	
	@Override
	public void login_service(Model model) throws Exception {
		System.out.println("■■■SERVICE■■■ login_service");
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
	}

	@Override
	public void loginPOST_service(Model model) throws Exception {
		System.out.println("■■■SERVICE■■■ loginPOST_service");
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String employee_name = req.getParameter("employee_name");
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		Map<String, Object> daoMap = new HashMap<>();
		daoMap.put("employee_name", employee_name);
		daoMap.put("employee_id", employee_id);
		
		UserVO vo = dao.login(daoMap);
		if(vo != null) model.addAttribute("userVO", vo);
	}

	@Override
	public void logout_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		System.out.println("■■■SERVICE■■■ logout_service");
		req.getSession().setAttribute(ROLE, null);
	}

}
