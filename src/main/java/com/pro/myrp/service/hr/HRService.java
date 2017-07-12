package com.pro.myrp.service.hr;

import org.springframework.ui.Model;

import com.pro.myrp.service.MyRPService;

public interface HRService extends MyRPService {

	/**
	 * 인사관리 > 인사코드 등록 > 기초코드목록 서비스
	 * @author amaco78
	 * @param model
	 * @throws Exception
	 */
	public void base_code_list_service(Model model) throws Exception;
}
