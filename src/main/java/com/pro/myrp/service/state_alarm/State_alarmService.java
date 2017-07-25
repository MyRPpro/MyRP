package com.pro.myrp.service.state_alarm;

import javax.servlet.ServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface State_alarmService extends MyRPService {

	public String state_alarm_pro_service(ServletRequest req, Model model) throws Exception;

	
}
