package com.pro.myrp.controller.hr;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.service.hr.HRService;

@Controller
@RequestMapping("/hr_management/*")
public class HRControllerImpl implements HRController, CodeMyRP {

	@Inject
	private HRService service;

	@Override
	@GetMapping(value="manage_hr_code/base_code_group_list")
	public String base_code_list(HttpServletRequest req, Model model) throws Exception{
		System.out.println(code.c(base_code_group_list));
		model.addAttribute("req", req);
		service.base_code_list_service(model);
		return code.c(hr_management, manage_hr_code, base_code_group_list);
	}

	@Override
	@GetMapping(value="manage_dept/dept_list")
	public String dept_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(dept_list));
		model.addAttribute("req", req);
		
		return code.c(hr_management, manage_dept, dept_list);
	}

	@Override
	@GetMapping(value="manage_personnel_card/personnel_card_list")
	public String personnel_card_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(personnel_card_list));
		model.addAttribute("req", req);
		
		return code.c(hr_management, manage_personnel_card, personnel_card_list);
	}

	@Override
	@GetMapping(value="manage_service_attitude/search_attendance_absence")
	public String search_attendance_absence(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_attendance_absence));
		model.addAttribute("req", req);
		
		return code.c(hr_management, manage_service_attitude, search_attendance_absence);
	}

	@Override
	@GetMapping(value="manage_salary/salary_register")
	public String salary_register(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(salary_register));
		model.addAttribute("req", req);
		
		return code.c(hr_management, manage_salary, salary_register);
	}
}
