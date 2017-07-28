package com.pro.myrp.controller.state_alarm;

import javax.inject.Inject;
import javax.servlet.ServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pro.myrp.controller.MyRPController;
import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.service.state_alarm.State_alarmService;

@Controller
@RequestMapping("/state_alarm/*")
public class State_alarmControllerImpl implements CodeMyRP, State_alarmController {
	
	@Inject
	State_alarmService service;
	
	@Override
	@RequestMapping(value="state_alarm_main", method = {RequestMethod.GET,RequestMethod.POST})
	public String state_alarm_main(ServletRequest req, Model model) throws Exception{
		
		return "state_alarm/state_alarm_main";
		/*return code.c(state_alarm,state_alarm_main);*/
		
	}

	@Override
	@RequestMapping(value="state_alarm_pro", method = {RequestMethod.GET,RequestMethod.POST})
	public String state_alarm_pro(ServletRequest req, Model model) throws Exception {
		
		
		service.state_alarm_pro_service(req, model);
		return "state_alarm/state_alarm_pro";
		/*return code.c(state_alarm,state_alarm_pro);*/
	}
}
