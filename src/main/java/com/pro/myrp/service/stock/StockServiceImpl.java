package com.pro.myrp.service.stock;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.domain.base_registration.ProductVO;
import com.pro.myrp.domain.distribution_manage.Stock_conditionDTO;
import com.pro.myrp.domain.distribution_manage.select_stockpile_searchDTO;
import com.pro.myrp.domain.distribution_manage.stockpile_searchDTO;
import com.pro.myrp.persistence.stock.StockDAO;

@Service
public class StockServiceImpl implements StockService, CodeMyRP {

	@Inject
	private StockDAO dao;
	
	@Override
	public String stock_condition_service(HttpServletRequest req, Model model) throws Exception {
		
		long stock_amount = 0;
		long purchase_unit_price = 0;
		long sale_unit_price = 0;
		long stock_purchase_sum = 0;
		long sale_unit_price_sum = 0;
		
		ArrayList<Stock_conditionDTO> stock_conditionDtos = new ArrayList<Stock_conditionDTO>();
		
		stock_conditionDtos = dao.select_stock_condition();
		
		for(int i = 0; i < stock_conditionDtos.size(); i++) {
			stock_amount += stock_conditionDtos.get(i).getStock_amount();
			purchase_unit_price += stock_conditionDtos.get(i).getPurchase_unit_price();
			sale_unit_price += stock_conditionDtos.get(i).getSale_unit_price();
			stock_purchase_sum += (stock_conditionDtos.get(i).getStock_amount() * stock_conditionDtos.get(i).getPurchase_unit_price());
			sale_unit_price_sum += ((long)stock_conditionDtos.get(i).getStock_amount() * (long)stock_conditionDtos.get(i).getSale_unit_price());
		}
		
		model.addAttribute("stock_conditionDtos", stock_conditionDtos);
		model.addAttribute("stock_amount", stock_amount);
		model.addAttribute("purchase_unit_price", purchase_unit_price);
		model.addAttribute("sale_unit_price", sale_unit_price);
		model.addAttribute("stock_purchase_sum", stock_purchase_sum);
		model.addAttribute("sale_unit_price_sum", sale_unit_price_sum);
		
		return null;
	}

	@Override
	public String search_stockpile_search_service(HttpServletRequest req, Model model) throws Exception {
		
		String condition = req.getParameter("condition");
		String search = req.getParameter("search");
		String where = req.getParameter("where");
		
		model.addAttribute("condition", condition);
		model.addAttribute("search", search);
		model.addAttribute("where", where);
		
		ArrayList<stockpile_searchDTO> search_stockpile_searchDtos  = dao.select_search_stockpile_search(model);
		
		model.addAttribute("search_stockpile_searchDtos", search_stockpile_searchDtos);
		
		return null;
	}

	@Override
	public void select_stockpile_search_service(HttpServletRequest req, Model model) throws Exception {
		String pro = req.getParameter("product") == null ? null : req.getParameter("product");
		String start_day = req.getParameter("start_day");
		String end_day = req.getParameter("end_day");
		String today = req.getParameter("today");
		int add_stock= 0;
		
		String[] product = pro == null ? null : pro.split("-");
		
		ArrayList<select_stockpile_searchDTO> select_stockpile_searchDtos = new ArrayList<select_stockpile_searchDTO>();
		ArrayList<ProductVO> product_name_list = new ArrayList<ProductVO>();
		ArrayList<ProductVO> select_product = new ArrayList<ProductVO>();
		ArrayList<String> search_product = new ArrayList<String>();
		
		model.addAttribute("product",product);
		model.addAttribute("start_day",start_day);
		model.addAttribute("end_day",end_day);
		
		select_stockpile_searchDtos = dao.select_stockpile_search(model);
		
		search_product.add(select_stockpile_searchDtos.get(0).getProduct_id());
		for(int i = 0; i < select_stockpile_searchDtos.size(); i++){
				for(int a = 0; a < search_product.size(); a++ ){
					 if(!select_stockpile_searchDtos.get(i).getProduct_id().equals(search_product.get(a))){
						 search_product.add(select_stockpile_searchDtos.get(i).getProduct_id());
						 break;
					 }
				}
			}

		model.addAttribute("product_id", search_product);
		product_name_list = dao.select_product_name(model);
		select_product = dao.select_product_id(model);
		
		int warehouse_good_stock = 0;
		int warehouse_bad_stock = 0;
		int warehouse_will_stock = 0;
		
		search_product.add(product_name_list.get(0).getProduct_id());
		for(int i = 0;i < product_name_list.size(); i++){
			if(product_name_list.get(i).getWarehouse_id().equals("1001")){
				warehouse_good_stock += product_name_list.get(i).getStock_amount();
			}else if(product_name_list.get(i).getWarehouse_id().equals("2001")){
				warehouse_bad_stock += product_name_list.get(i).getStock_amount();
			}else if(product_name_list.get(i).getWarehouse_id().equals("3001")){
				warehouse_will_stock += product_name_list.get(i).getStock_amount();
			}
		}
		
		
		for(int i = 0; i < select_stockpile_searchDtos.size(); i++){
			if(select_stockpile_searchDtos.get(i).getPro_id().substring(0, 1).equals("2")){
				select_stockpile_searchDtos.get(i).setMinus_stock(select_stockpile_searchDtos.get(i).getMoving_stock());
			}else if(select_stockpile_searchDtos.get(i).getPro_id().substring(0, 1).equals("3")){
				select_stockpile_searchDtos.get(i).setPlus_stock(select_stockpile_searchDtos.get(i).getMoving_stock());
			}else if(select_stockpile_searchDtos.get(i).getPro_id().substring(0, 1).equals("4")){
				if(select_stockpile_searchDtos.get(i).getMoving_stock() > 0){
					select_stockpile_searchDtos.get(i).setPlus_stock(select_stockpile_searchDtos.get(i).getMoving_stock());
				}else{
					select_stockpile_searchDtos.get(i).setMinus_stock(select_stockpile_searchDtos.get(i).getMoving_stock());
				}
			}
			
		}
		
		
		for(int i = 0; i < select_product.size(); i++){
			String product_name = null;
			int stock_amount = 0;
			for(int x = 0; x < product_name_list.size(); x++){
				if(product_name_list.get(x).getProduct_id().equals(select_product.get(i).getProduct_id())){
					product_name = product_name_list.get(x).getProduct_name();
					stock_amount = product_name_list.get(x).getStock_amount();
					
					add_stock += product_name_list.get(x).getStock_amount();
					select_product.get(i).setProduct_name(product_name);
					break;
				}
			}
			for(int y = 0; y < select_stockpile_searchDtos.size(); y++){
				if(product_name != null && select_product.get(i).getProduct_id().equals(select_stockpile_searchDtos.get(y).getProduct_id())){
					select_stockpile_searchDtos.get(y).setProduct_name(product_name);
					select_stockpile_searchDtos.get(y).setStock_amount(stock_amount);
				}
			}
		}
		
		if(Integer.parseInt(end_day.replace("-", "")) < Integer.parseInt(today.replace("-", ""))){
			ArrayList<select_stockpile_searchDTO> select_stockpile_minusDtos = new ArrayList<select_stockpile_searchDTO>();
			model.addAttribute("start_day",end_day);
			model.addAttribute("end_day",today);
			
			select_stockpile_minusDtos = dao.select_stockpile_search(model);
			
			for(int y = 0; y < select_product.size(); y++){
				for(int i = 0; i < select_stockpile_minusDtos.size(); i++){
					if(select_product.get(y).getProduct_id().equals(select_stockpile_minusDtos.get(i).getProduct_id())){
						
					for(int x = 0; x < select_stockpile_searchDtos.size(); x++){
						if(select_product.get(y).getProduct_id().equals(select_stockpile_searchDtos.get(x).getProduct_id())){
							int stock = select_stockpile_searchDtos.get(x).getStock_amount();
							
							if(select_stockpile_minusDtos.get(i).getPro_id().substring(0, 1).equals("2")){
								select_stockpile_searchDtos.get(x).setStock_amount(stock + select_stockpile_minusDtos.get(i).getMoving_stock());
								
							}else if(select_stockpile_minusDtos.get(i).getPro_id().substring(0, 1).equals("3")){
								select_stockpile_searchDtos.get(x).setStock_amount(stock - select_stockpile_minusDtos.get(i).getMoving_stock());
							
							}else if(select_stockpile_minusDtos.get(i).getPro_id().substring(0, 1).equals("4")){
								if(select_stockpile_minusDtos.get(i).getMoving_stock() > 0){
									select_stockpile_searchDtos.get(x).setStock_amount(stock - select_stockpile_minusDtos.get(i).getMoving_stock());
								
								}else{
									select_stockpile_searchDtos.get(x).setStock_amount(stock + select_stockpile_minusDtos.get(i).getMoving_stock());
									
								}
							}
						
							}
						}
					}
				}
			}
		}
			
		//재고 계산
		int stock = 0;
		for(int i = 0; i < select_product.size(); i++){
			for(int y = select_stockpile_searchDtos.size()-1; y >= 0; y--){
				if(select_product.get(i).getProduct_id().equals(select_stockpile_searchDtos.get(y).getProduct_id())){
					for(int x = y - 1; x >= 0; x--){
					if(select_product.get(i).getProduct_id().equals(select_stockpile_searchDtos.get(x).getProduct_id())){
							 stock = select_stockpile_searchDtos.get(y).getMinus_stock() - select_stockpile_searchDtos.get(y).getPlus_stock();
							select_stockpile_searchDtos.get(x).setStock_amount(select_stockpile_searchDtos.get(y).getStock_amount() + stock);
							break;
							
						}
					}
				}
				
			}
		}
		
		model.addAttribute("select_stockpile_searchDtos", select_stockpile_searchDtos);
		model.addAttribute("product_name_list", product_name_list);
		model.addAttribute("select_product", select_product);
		
		model.addAttribute("warehouse_good_stock", warehouse_good_stock);
		model.addAttribute("warehouse_bad_stock", warehouse_bad_stock);
		model.addAttribute("warehouse_will_stock", warehouse_will_stock); 
		
		model.addAttribute("start_day",start_day);
		model.addAttribute("end_day",end_day);
		
		model.addAttribute("add_stock",add_stock);
	}
}


