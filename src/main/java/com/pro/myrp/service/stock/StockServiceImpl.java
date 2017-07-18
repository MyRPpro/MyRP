package com.pro.myrp.service.stock;

import java.util.ArrayList;

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
		String house = req.getParameter("warehouse") == null ? null : req.getParameter("warehouse");
		String pro = req.getParameter("product") == null ? null : req.getParameter("product");
		String select_stockplie = req.getParameter("select_stockplie") == null ? null : req.getParameter("select_stockplie");
		String sales_state = req.getParameter("sales_state") == null ? null : req.getParameter("sales_state");
		String start_day = req.getParameter("start_day");
		String end_day = req.getParameter("end_day");
		String today = req.getParameter("today");
		
		int add_plus_stock = 0;
		int add_minus_stock = 0;
		int add_stock = 0;
		int minus_plus_stock = 0;
		int minus_minus_stock = 0; 
		
		String[] warehouse = house == null ? null : house.split("-");
		String[] product = pro == null ? null : pro.split("-");
		
		ArrayList<select_stockpile_searchDTO> select_stockpile_searchDtos = new ArrayList<select_stockpile_searchDTO>();
		ArrayList<select_stockpile_searchDTO> select_stockpile_minusDtos = new ArrayList<select_stockpile_searchDTO>();
		ArrayList<ProductVO> product_name_list = new ArrayList<ProductVO>();
		
		model.addAttribute("warehouse",warehouse);
		model.addAttribute("product",product);
		model.addAttribute("select_stockplie",select_stockplie);
		model.addAttribute("start_day",start_day);
		model.addAttribute("end_day",end_day);
		
		
		if(select_stockplie == null){
			//재고조정	
		}else if(select_stockplie.equals("adjustment_inventory")){
			select_stockpile_searchDtos = dao.select_stockpile_search(model);

		//구매
		}else if(select_stockplie.equals("purchase_order")){
			select_stockpile_searchDtos = dao.select_stockpile_search_purchase(model);
		
		//판매
		}else if(select_stockplie.equals("sales_order") || select_stockplie.equals("defective_warehouse")){
			model.addAttribute("sales_state",sales_state);
			select_stockpile_searchDtos = dao.select_stockpile_search_sales(model);
		}

		
		//총 재고 관련 계산
		for(int i = 0; i < select_stockpile_searchDtos.size(); i++){
			String product_id = select_stockpile_searchDtos.get(i).getProduct_id();
			
			model.addAttribute("product_id",product_id);
			
			if(product_name_list.size() == 0){
				product_name_list.add(dao.select_product_name(model));
				
			}else{
				int size = product_name_list.size();
				for(int y = 0; y < size; y++){
					if(!product_id.equals(product_name_list.get(y).getProduct_id())){
						product_name_list.add(dao.select_product_name(model));
						break;
					}
				}
			}
			add_plus_stock += select_stockpile_searchDtos.get(i).getCount_purchase();
			add_minus_stock += select_stockpile_searchDtos.get(i).getCount_sales();
			add_minus_stock += select_stockpile_searchDtos.get(i).getDeleted_stock();
		}
		
		if(Integer.parseInt(end_day.replace("-", "")) < Integer.parseInt(today.replace("-", ""))){
			
			System.out.println("여긴 타면 안됨");
			
			model.addAttribute("start_day",end_day);
			model.addAttribute("end_day",today);
			
			if(select_stockplie == null){
				
			}else if(select_stockplie.equals("adjustment_inventory")){
				select_stockpile_minusDtos = dao.select_stockpile_search(model);

			//구매
			}else if(select_stockplie.equals("purchase_order")){
				select_stockpile_minusDtos = dao.select_stockpile_search_purchase(model);
			
			//판매
			}else if(select_stockplie.equals("sales_order") || select_stockplie.equals("defective_warehouse")){
				select_stockpile_minusDtos = dao.select_stockpile_search_sales(model);
			}
			
			for(int i = 0; i < select_stockpile_minusDtos.size(); i++){
				
				minus_plus_stock += select_stockpile_minusDtos.get(i).getCount_purchase();
				
				minus_minus_stock += select_stockpile_minusDtos.get(i).getCount_sales();
				minus_minus_stock += select_stockpile_minusDtos.get(i).getDeleted_stock();
				
			}
			//add_stock += minus_minus_stock - minus_plus_stock;
		}
		
		for(int q = 0; q < product_name_list.size(); q++){
			int siz = select_stockpile_searchDtos.size();
			for(int w = 0; w < siz; w++ ){
				if(product_name_list.get(q).getProduct_id().equals(select_stockpile_searchDtos.get(w).getProduct_id())){
					add_stock += select_stockpile_searchDtos.get(w).getStock_amount();
					System.out.println(select_stockpile_searchDtos.get(w).getStock_amount());
					System.out.println(add_stock);
							break;
						}
					}
				}
		
		
		//각 product stock 계산
		for(int i = 0; i < product_name_list.size(); i++){
			int pstock = 0;
			int mstock = 0;
			int mstock2 = 0;
			int stock = product_name_list.get(i).getStock_amount();
			int size = select_stockpile_searchDtos.size();
			for(int a = 0; a < size;a++ ){
				if(product_name_list.get(i).getProduct_id().equals(select_stockpile_searchDtos.get(a).getProduct_id())){
					if(a+1 < size){
					for(int b = a+1; b < size; b++){	
						if(product_name_list.get(i).getProduct_id().equals(select_stockpile_searchDtos.get(b).getProduct_id())){
							
							pstock = select_stockpile_searchDtos.get(b).getCount_purchase();
							mstock = select_stockpile_searchDtos.get(b).getCount_sales();
							mstock2 = select_stockpile_searchDtos.get(b).getDeleted_stock();
							
							select_stockpile_searchDtos.get(i).setStock_amount(stock - pstock + mstock + mstock2);
							
							break;
						}else{
							break;
						}
					}
					}
				}
				
				if(Integer.parseInt(end_day.replace("-", "")) < Integer.parseInt(today.replace("-", ""))){
					product_name_list.get(i).setStock_amount(product_name_list.get(i).getStock_amount() + minus_minus_stock - minus_plus_stock);
				}
			}
		}
		
		
		
		
		model.addAttribute("select_stockpile_searchDtos", select_stockpile_searchDtos);
		model.addAttribute("product_name_list", product_name_list);
		
		model.addAttribute("add_plus_stock", add_plus_stock);
		model.addAttribute("add_minus_stock", add_minus_stock);
		model.addAttribute("add_stock", add_stock); 
		
		model.addAttribute("select_stockplie", select_stockplie);
		
		model.addAttribute("start_day",start_day);
		model.addAttribute("end_day",end_day);
	}

}
