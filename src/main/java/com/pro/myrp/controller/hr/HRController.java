package com.pro.myrp.controller.hr;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.pro.myrp.controller.MyRPController;

public interface HRController extends MyRPController {

	/**
	 * 인사관리 > 인사코드 등록 > 기초코드목록
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 */
	public String base_code_list(HttpServletRequest req, Model model) throws Exception;
}
