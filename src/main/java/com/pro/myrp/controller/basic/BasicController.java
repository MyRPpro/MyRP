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

	/**
	 * 거래처 등록 > 거래처 신규 등록
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String reg_company(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 거래처 등록 > 거래처 신규 등록 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String reg_company_pro(HttpServletRequest req, Model model) throws Exception;;
}
