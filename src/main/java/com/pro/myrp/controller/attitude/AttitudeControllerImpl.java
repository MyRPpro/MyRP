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
	
	@Inject
	private AttitudeService service;

	@Override
	@GetMapping(value="search_attitude/search_attitude_search")
	public String search_attitude_search(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_attitude_search));
		model.addAttribute("req", req);
		service.search_attitude_search_service(model);
		return code.c(attitude_management, search_attitude, search_attitude_search);
	}

}
