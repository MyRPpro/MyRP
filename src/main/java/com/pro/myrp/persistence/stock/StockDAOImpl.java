package com.pro.myrp.persistence.stock;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.pro.myrp.domain.base_registration.ProductVO;
import com.pro.myrp.domain.distribution_manage.Stock_conditionDTO;
import com.pro.myrp.domain.distribution_manage.select_stockpile_searchDTO;
import com.pro.myrp.domain.distribution_manage.stockpile_searchDTO;

@Repository
public class StockDAOImpl implements StockDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public ArrayList<Stock_conditionDTO> select_stock_condition() {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_stock_condition();
	}

	@Override
	public ArrayList<stockpile_searchDTO> select_search_stockpile_search(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_search_stockpile_search(model);
	}

	@Override
	public ArrayList<select_stockpile_searchDTO> select_stockpile_search(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_stockpile_search(model);
	}

	@Override
	public ProductVO select_product_name(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_product_name(model);
	}

	@Override
	public ArrayList<select_stockpile_searchDTO> select_stockpile_search_purchase(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_stockpile_search_purchase(model);
	}

	@Override
	public ArrayList<select_stockpile_searchDTO> select_stockpile_search_sales(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_stockpile_search_sales(model);
	}
}
