package com.pro.myrp.service.attitude;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface AttitudeService extends MyRPService {

	/**
	 * 근태관리 > 근태조회 > 근태조회화면 서비스
	 * @author 장재희
	 * @param model
	 * @throws Exception
	 */
	public void search_attitude_search_service(Model model) throws Exception;
}
