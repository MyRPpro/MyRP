package com.pro.myrp.controller.basic;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

import com.pro.myrp.service.basic.BasicService;

@Controller
public class BasicControllerImpl implements BasicController {

	@Inject
	private BasicService service;
}
