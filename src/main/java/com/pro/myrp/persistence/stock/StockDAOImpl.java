package com.pro.myrp.persistence.stock;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.pro.myrp.domain.Stock_conditionDTO;

@Repository
public class StockDAOImpl implements StockDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public ArrayList<Stock_conditionDTO> select_stock_condition() {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_stock_condition();
	}
}
