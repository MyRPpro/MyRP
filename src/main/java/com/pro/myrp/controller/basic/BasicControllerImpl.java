package com.pro.myrp.controller.basic;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
}
