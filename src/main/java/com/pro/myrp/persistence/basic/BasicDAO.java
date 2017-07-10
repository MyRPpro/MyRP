package com.pro.myrp.persistence.basic;

import java.util.ArrayList;
import java.util.Map;

import com.pro.myrp.domain.CompanyVO;
import com.pro.myrp.persistence.MyRPDAO;

public interface BasicDAO extends MyRPDAO {

	/**
	 * 거래처 총 개수
	 * @return
	 */
	public int get_company_cnt();
	
	/**
	 * 거래처 목록
	 * @return
	 */
	public ArrayList<CompanyVO> get_company_list(Map<String,Object> daoMap);
}
