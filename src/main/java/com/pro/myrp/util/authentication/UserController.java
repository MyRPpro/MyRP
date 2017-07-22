package com.pro.myrp.util.authentication;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.myrp.domain.authentication.LoginDTO;
import com.pro.myrp.domain.authentication.UserVO;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Inject
	private UserService service;
	
	@GetMapping(value="login")
	public String loginGET(HttpServletRequest req, Model model) throws Exception {
		System.out.println("■■■■■■■■■■loginGET");
		model.addAttribute("req", req);
		service.login_service(model);
		return "user/login";
	}
	
	@PostMapping(value="loginPost")
	public String loginPOST(HttpServletRequest req, Model model) throws Exception {
		System.out.println("■■■■■■■■■■loginPOST");
		model.addAttribute("req", req);
		service.loginPOST_service(model);
		return "user/loginPost";
	}
	
	@GetMapping(value="logout")
	public String logout(HttpServletRequest req, Model model) throws Exception {
		System.out.println("■■■■■■■■■■logout");
		model.addAttribute("req", req);
		service.logout_service(model);
		return "user/logout";
	}
}
