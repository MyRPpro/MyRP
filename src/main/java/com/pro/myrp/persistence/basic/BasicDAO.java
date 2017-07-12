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
	public int select_company_cnt();
	
	/**
	 * 거래처 목록
	 * @return
	 */
	public ArrayList<CompanyVO> select_company_list(Map<String,Object> daoMap);

	/**
	 * 신규거래처 추가
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int insert_company(CompanyVO vo);

	/**
	 * 거래처 정보 불러오기
	 * @author amaco78
	 * @param company_id
	 * @return
	 */
	public CompanyVO select_company(String company_id);

	/**
	 * 거래처 정보 수정
	 * @author amaco78
	 * @param vo
	 * @return
	 */
	public int update_company(CompanyVO vo);
}
