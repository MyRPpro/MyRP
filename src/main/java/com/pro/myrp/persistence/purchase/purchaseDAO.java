package com.pro.myrp.persistence.purchase;

import java.util.ArrayList;
import java.util.Map;

import com.pro.myrp.domain.PurchaseVO;
import com.pro.myrp.persistence.MyRPDAO;

public interface purchaseDAO extends MyRPDAO {

	public int select_purchase_cnt();

	public ArrayList<PurchaseVO> select_purchase_list(Map<String, Object> daoMap);



}
