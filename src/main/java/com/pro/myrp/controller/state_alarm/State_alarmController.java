package com.pro.myrp.controller.state_alarm;

import javax.servlet.ServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.controller.MyRPController;

public interface State_alarmController extends MyRPController {
	
	/**
	 * 상태변화 알람센터 > 메인화면 
	 * @author choidream
	 * @param req
	 * @param model
	 * @return
	 */
	public String state_alarm_main(ServletRequest req, Model model) throws Exception; 

	
	/**
	 * 상태변화 알람센터 > state code search in order_state  
	 * @author choidream
	 * @param req
	 * @param model
	 * @return
	 */
	public String state_alarm_pro(ServletRequest req, Model model) throws Exception;
}
