package com.pro.myrp.persistence.purchase;

import java.util.ArrayList;
import java.util.Map;

import com.pro.myrp.domain.PurchaseVO;
import com.pro.myrp.persistence.MyRPDAO;

public interface purchaseDAO extends MyRPDAO {

	public int select_purchase_cnt();

	public ArrayList<PurchaseVO> select_purchase_list( Map<String, Object> daoMap);

	public PurchaseVO select_detail_purchase(String company_id);

	public int update_purchase(PurchaseVO vo);

	public int count_quick_serch_purchase (String search_str);
	
	public ArrayList<PurchaseVO> select_quick_serch_purchase( Map<String, Object> daoMap);
	
	
	

	



}