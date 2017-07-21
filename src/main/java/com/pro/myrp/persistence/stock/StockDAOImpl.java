package com.pro.myrp.persistence.stock;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.pro.myrp.domain.base_registration.Order_stateVO;
import com.pro.myrp.domain.base_registration.ProductVO;
import com.pro.myrp.domain.distribution_manage.Search_distribution_orderDTO;
import com.pro.myrp.domain.distribution_manage.Select_stock_order_typeDTO;
import com.pro.myrp.domain.distribution_manage.Stock_conditionDTO;
import com.pro.myrp.domain.distribution_manage.In_storageDTO;
import com.pro.myrp.domain.distribution_manage.Out_storageDTO;
import com.pro.myrp.domain.distribution_manage.Select_stockpile_searchDTO;
import com.pro.myrp.domain.distribution_manage.Stockpile_searchDTO;

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
	public ArrayList<Stockpile_searchDTO> select_search_stockpile_search(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_search_stockpile_search(model);
	}

	@Override
	public ArrayList<Select_stockpile_searchDTO> select_stockpile_search(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_stockpile_search(model);
	}

	@Override
	public ArrayList<ProductVO> select_product_name(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_product_name(model);
	}

	@Override
	public ArrayList<ProductVO> select_product_id(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_product_id(model);
	}

	@Override
	public ArrayList<Order_stateVO> select_order_state(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_order_state(model);
	}

	@Override
	public ArrayList<In_storageDTO> select_in_storage(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_in_storage(model);
	}

	@Override
	public ArrayList<Out_storageDTO> select_out_storage(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_out_storage(model);
	}

	@Override
	public int insert_out_storage(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.insert_out_storage(model);
	}

	@Override
	public int insert_in_storage(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.insert_in_storage(model);
	}

	@Override
	public int update_stock_out_storage(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.update_stock_out_storage(model);
	}

	@Override
	public int select_product_in_warehouse(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_product_in_warehouse(model);
	}

	@Override
	public int insert_stock_out_storage(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.insert_stock_out_storage(model);
		
	}

	@Override
	public int update_sales_state(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.update_sales_state(model);
	}

	@Override
	public int update_order_state(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.update_order_state(model);
	}

	@Override
	public ArrayList<Search_distribution_orderDTO> Search_distribution_order(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.Search_distribution_order(model);
	}

	@Override
	public int update_purchase_state(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.update_purchase_state(model);
	}

	@Override
	public String select_stock_order_type(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_stock_order_type(model);
	}

	@Override
	public Select_stock_order_typeDTO select_stock_order_out_order(Model model) {
		StockDAO dao = sqlSession.getMapper(StockDAO.class);
		return dao.select_stock_order_out_order(model);
	}
}
