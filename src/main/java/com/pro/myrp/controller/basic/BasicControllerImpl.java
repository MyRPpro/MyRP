package com.pro.myrp.controller.basic;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.service.basic.BasicService;

@Controller
@RequestMapping("/base_registration/*")
public class BasicControllerImpl implements BasicController, CodeMyRP{

	@Inject
	private BasicService service;
	
	@Override
	@GetMapping(value="company_list")
	public String company_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(company_list));
		model.addAttribute("req", req);
		service.company_list_service(model);
		return code.c(base_registration, company_list);
	}

	@Override
	@GetMapping(value="reg_company")
	public String reg_company(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(reg_company));
		model.addAttribute("req", req);
		service.reg_company_service(model);
		return code.c(base_registration, reg_company);
	}

	@Override
	@PostMapping(value="reg_company_pro")
	public String reg_company_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(reg_company));
		model.addAttribute("req", req);
		service.reg_company_pro_service(model);
		return "redirect:"+code.c(base_registration, company_list);
	}

	@Override
	@GetMapping(value="modify_company")
	public String modify_company(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_company));
		model.addAttribute("req", req);
		service.modify_company_service(model);
		return code.c(base_registration, modify_company);
	}

	@Override
	@PostMapping(value="modify_company_pro")
	public String modify_company_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_company));
		model.addAttribute("req", req);
		service.modify_company_pro_service(model);
		return "redirect:"+code.c(base_registration, company_list);
	}
}
