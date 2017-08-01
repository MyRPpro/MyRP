package com.pro.myrp.controller.attitude;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.service.attitude.AttitudeService;

@Controller
@RequestMapping("/attitude_management/*")
public class AttitudeControllerImpl implements AttitudeController, CodeMyRP {
//	
	@Inject
	private AttitudeService service;

	@Override
	@GetMapping(value="search_attitude/search_attitude_search")
	public String search_attitude_search(HttpServletRequest req, Model model) throws Exception {
		//
		System.out.println(code.c(search_attitude_search));
		
		model.addAttribute("req", req);
		service.search_attitude_search_service(model);
		
		return code.c(attitude_management, search_attitude, search_attitude_search);
	}
	
	@Override
	@GetMapping(value="add_attitude/add_attitude_search")
	public String add_attitude_search (HttpServletRequest req, Model model) throws Exception {
		//
		System.out.println(code.c(add_attitude_search));
		
		model.addAttribute("req", req);
		service.add_attitude_search_service(model);
		
		return code.c(attitude_management, add_attitude, add_attitude_search);
	}
	
	@Override
	@GetMapping(value="add_attitude/attitude_form")
	public String attitude_form_service(HttpServletRequest req, Model model) throws Exception {
		// 
		System.out.println(code.c(attitude_form));
		
		model.addAttribute("req", req);
		service.attitude_form_service(model);
		
		return code.c(attitude_management, add_attitude, attitude_form);
	}

	@Override
	@GetMapping(value="add_attitude/add_attitude_search_pro")
	public String add_attitude_search_pro(HttpServletRequest req, Model model) throws Exception {
		//
		System.out.println(code.c(add_attitude_search_pro));
		
		model.addAttribute("req", req);
		service.add_attitude_search_pro_service(model);
		
		return code.c(attitude_management, add_attitude, add_attitude_search_pro);
		
	}

	@Override
	@GetMapping(value="search_attitude/hr_attitude_nav")
	public String hr_attitude_nav(HttpServletRequest req, Model model) throws Exception {
		//
		System.out.println(code.c(hr_attitude_nav));
		
		model.addAttribute("req", req);
		service.hr_attitude_nav_service(model);
		
		return code.c(attitude_management, search_attitude , hr_attitude_nav);
	}
	
	@Override
	@GetMapping(value="search_attitude/hr_attitude_list")
	public String hr_attitude_list(HttpServletRequest req, Model model) throws Exception {
		// 
		System.out.println(code.c(hr_attitude_list));
		
		model.addAttribute("req", req);
		service.hr_attitude_list_service(model);
		
		return code.c(attitude_management, search_attitude , hr_attitude_list );
	}

	

}
