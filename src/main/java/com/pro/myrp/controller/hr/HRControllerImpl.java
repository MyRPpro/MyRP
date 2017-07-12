package com.pro.myrp.controller.hr;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.myrp.service.hr.HRService;

@Controller
@RequestMapping("/hr_management/*")
public class HRControllerImpl implements HRController {

	@Inject
	private HRService service;

	@Override
	@GetMapping(value="reg_hr_code/base_code_group_list")
	public String base_code_list(HttpServletRequest req, Model model) throws Exception{
		System.out.println("base_code_list");
		model.addAttribute("req", req);
		service.base_code_list_service(model);
		return "hr_management/reg_hr_code/base_code_group_list";
	}
}
