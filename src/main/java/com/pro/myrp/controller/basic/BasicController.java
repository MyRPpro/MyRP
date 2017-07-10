package com.pro.myrp.controller.basic;

import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import com.pro.myrp.controller.MyRPController;

public interface BasicController extends MyRPController {

	/**
	 * 거래처 등록 > 거래처 리스트
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String company_list(HttpServletRequest req, Model model) throws Exception;
}
