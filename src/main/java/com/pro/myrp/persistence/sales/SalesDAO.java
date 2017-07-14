package com.pro.myrp.persistence.sales;

import java.util.ArrayList;
import java.util.Map;

import com.pro.myrp.domain.SalesVO;
import com.pro.myrp.persistence.MyRPDAO;


public interface SalesDAO extends MyRPDAO {

	public int select_sales_cnt();

	public ArrayList<SalesVO> select_sales_list(Map<String, Object> daoMap);

}
