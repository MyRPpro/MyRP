package com.pro.myrp.controller.hr;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.pro.myrp.service.hr.HRService;

@Controller
public class HRControllerImpl implements HRController {

	@Inject
	private HRService service;
}
