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
	 * 거래처 등록 > 거래처 번호 중복 체크
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_company_dupCheck(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 거래처 등록 > 거래처 신규 등록 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String reg_company_pro(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 거래처 등록 > 거래처 수정
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_company(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 거래처 등록> 거래처 수정 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_company_pro(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 상품 등록 > 상품 리스트
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String product_list(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 상품 등록 > 상품 신규 등록
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_product(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 상품 등록 > 상품 번호 중복 확인
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_product_dupCheck(HttpServletRequest req, Model model) throws Exception;
	
	/**
	 * 상품 등록 > 상품 신규 등록 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String add_product_pro(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 상품 등록 > 상품 정보 수정
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_product(HttpServletRequest req, Model model) throws Exception;

	/**
	 * 상품 등록 > 상품 정보 수정 처리
	 * @author amaco78
	 * @param req
	 * @param model
	 * @return
	 * @throws Exception
	 */
	public String modify_product_pro(HttpServletRequest req, Model model) throws Exception;

}
