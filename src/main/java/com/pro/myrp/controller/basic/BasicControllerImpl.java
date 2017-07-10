package com.pro.myrp.controller.basic;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pro.myrp.service.basic.BasicService;

@Controller
@RequestMapping("/base_registration/*")
public class BasicControllerImpl implements BasicController {

	@Inject
	private BasicService service;

	@Override
	@GetMapping(value="company_list")
	public String company_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println("company_list");
		model.addAttribute("req", req);
		service.company_list_service(model);
		
		return "base_registration/company_list";
	}

	@Override
	@GetMapping(value="reg_company")
	public String reg_company(HttpServletRequest req, Model model) throws Exception {
		System.out.println("reg_company");
		model.addAttribute("req", req);
		service.reg_company_service(model);
		return "base_registration/reg_company";
	}

	@Override
	@PostMapping(value="reg_company_pro")
	public String reg_company_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println("reg_company");
		model.addAttribute("req", req);
		service.reg_company_pro_service(model);
		return "redirect:/base_registration/company_list";
	}
}
