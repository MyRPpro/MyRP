package com.pro.myrp.controller.attitude;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.controller.MyRPController;

public interface AttitudeController extends MyRPController {

	/**
	 * 근태관리 > 근태조회 > 근태조회화면
	 * @author 장재희
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String search_attitude_search(HttpServletRequest req, Model model) throws Exception;
}
