package com.pro.myrp.service.stock;

import java.sql.Date;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.domain.base_registration.ProductVO;
import com.pro.myrp.domain.distribution_manage.Search_distribution_orderDTO;
import com.pro.myrp.domain.distribution_manage.Select_stock_order_movement_warehouseDTO;
import com.pro.myrp.domain.distribution_manage.Select_stock_order_storageDTO;
import com.pro.myrp.domain.distribution_manage.Stock_conditionDTO;
import com.pro.myrp.domain.distribution_manage.Stock_informationVO;
import com.pro.myrp.domain.distribution_manage.Adjustment_inventoryDTO;
import com.pro.myrp.domain.distribution_manage.In_storageDTO;
import com.pro.myrp.domain.distribution_manage.Out_storageDTO;
import com.pro.myrp.domain.distribution_manage.Select_stockpile_searchDTO;
import com.pro.myrp.domain.distribution_manage.Stockpile_searchDTO;
import com.pro.myrp.domain.distribution_manage.WarehouseVO;
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
		
		ArrayList<Stockpile_searchDTO> search_stockpile_searchDtos  = dao.select_search_stockpile_search(model);
		
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

		ArrayList<Select_stockpile_searchDTO> select_stockpile_searchDtos = new ArrayList<Select_stockpile_searchDTO>();
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
		
		/*int warehouse_good_stock = 0;
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
		}*/
		
		
		for(int i = 0; i < select_stockpile_searchDtos.size(); i++){
			if(select_stockpile_searchDtos.get(i).getPro_id().substring(0, 4).equals("4754")){
				select_stockpile_searchDtos.get(i).setMinus_stock(select_stockpile_searchDtos.get(i).getMoving_stock());
			}else if(select_stockpile_searchDtos.get(i).getPro_id().substring(0, 4).equals("4755")){
				select_stockpile_searchDtos.get(i).setPlus_stock(select_stockpile_searchDtos.get(i).getMoving_stock());
			}else if(select_stockpile_searchDtos.get(i).getPro_id().substring(0, 4).equals("4753")){
				if(select_stockpile_searchDtos.get(i).getMoving_stock() > 0){
					select_stockpile_searchDtos.get(i).setPlus_stock(select_stockpile_searchDtos.get(i).getMoving_stock());
				}else{
					select_stockpile_searchDtos.get(i).setMinus_stock(-select_stockpile_searchDtos.get(i).getMoving_stock());
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
			ArrayList<Select_stockpile_searchDTO> select_stockpile_minusDtos = new ArrayList<Select_stockpile_searchDTO>();
			model.addAttribute("start_day",end_day);
			model.addAttribute("end_day",today);
			
			select_stockpile_minusDtos = dao.select_stockpile_search(model);
			
			for(int y = 0; y < select_product.size(); y++){
				for(int i = 0; i < select_stockpile_minusDtos.size(); i++){
					if(select_product.get(y).getProduct_id().equals(select_stockpile_minusDtos.get(i).getProduct_id())){
						
					for(int x = 0; x < select_stockpile_searchDtos.size(); x++){
						if(select_product.get(y).getProduct_id().equals(select_stockpile_searchDtos.get(x).getProduct_id())){
							int stock = select_stockpile_searchDtos.get(x).getStock_amount();
							
							if(select_stockpile_minusDtos.get(i).getPro_id().substring(0, 4).equals("4754")){
								select_stockpile_searchDtos.get(x).setStock_amount(stock + select_stockpile_minusDtos.get(i).getMoving_stock());
								
							}else if(select_stockpile_minusDtos.get(i).getPro_id().substring(0, 4).equals("4755")){
								select_stockpile_searchDtos.get(x).setStock_amount(stock - select_stockpile_minusDtos.get(i).getMoving_stock());
							
							}else if(select_stockpile_minusDtos.get(i).getPro_id().substring(0, 4).equals("4753")){
								if(select_stockpile_minusDtos.get(i).getMoving_stock() > 0){
									select_stockpile_searchDtos.get(x).setStock_amount(stock - select_stockpile_minusDtos.get(i).getMoving_stock());
								
								}else if(select_stockpile_minusDtos.get(i).getMoving_stock() < 0){
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
		
		/*model.addAttribute("warehouse_good_stock", warehouse_good_stock);
		model.addAttribute("warehouse_bad_stock", warehouse_bad_stock);
		model.addAttribute("warehouse_will_stock", warehouse_will_stock); */
		
		model.addAttribute("start_day",start_day);
		model.addAttribute("end_day",end_day);
		
		model.addAttribute("add_stock",add_stock);
	}
	

	@Override
	public void search_distribution_order_service(HttpServletRequest req, Model model) throws Exception {
		ArrayList<In_storageDTO> in_storageDtos = new ArrayList<In_storageDTO>();
		ArrayList<Out_storageDTO> out_storageDtos = new ArrayList<Out_storageDTO>();
		ArrayList<ProductVO> proVos = dao.select_product_name(model);
		
		model.addAttribute("proVos", proVos);
		
		String goes = req.getParameter("goes");
		model.addAttribute("goes",goes);
		String stock_order_id = req.getParameter("oder_id");
		
		if(goes != null && goes.equals("in")){
			model.addAttribute("stock_order_id", stock_order_id);
			in_storageDtos = dao.select_storage_in_order(model);
			model.addAttribute("stock_order_id", null);
			out_storageDtos = dao.select_storage_out_order(model);
		}else if(goes != null && goes.equals("out")){
			model.addAttribute("stock_order_id", stock_order_id);
			out_storageDtos = dao.select_storage_out_order(model);
			model.addAttribute("stock_order_id", null);
			in_storageDtos = dao.select_storage_in_order(model);
			
		}

		
		int pageSize = 5;
		int pageBlock = 3;
		
		int istart = 0;
		int iend = 0;
		int ostart = 0;
		int oend = 0;
		
		int inumber = 0;
		int onumber = 0;
		
		String ipageNum = null;
		String opageNum = null;
		int icurrentPage = 0; 
		int ocurrentPage = 0; 
		
		int ipageCount = 0;
		int opageCount = 0;
		
		int istartPage = 0; 		
		int iendPage = 0; 
		int ostartPage = 0; 		
		int oendPage = 0;
		
		
		int icnt = in_storageDtos.size();
		int ocnt = out_storageDtos.size();
				
		ipageNum = req.getParameter("ipageNum");
		opageNum = req.getParameter("opageNum");
		
		if(ipageNum == null){
			ipageNum = "1";
		}
		
		if(opageNum == null){
			opageNum = "1";
		}
		
		icurrentPage = (Integer.parseInt(ipageNum));
		ocurrentPage = (Integer.parseInt(opageNum));
		
		ipageCount = (icnt/pageSize) + (icnt%pageSize > 0 ? 1 : 0);
		opageCount = (ocnt/pageSize) + (ocnt%pageSize > 0 ? 1 : 0);
		
		istart = (icurrentPage - 1) * pageSize + 1;
		iend = istart + pageSize - 1;
		ostart = (ocurrentPage - 1) * pageSize + 1;
		oend = ostart + pageSize - 1;
		
		
		if(iend > icnt){
			iend = icnt;
		}
		
		if(oend > ocnt){
			oend = ocnt;
		}
		
		inumber = icnt - (icurrentPage - 1) * pageSize; 
		onumber = ocnt - (ocurrentPage - 1) * pageSize;
		
		if(goes != null && goes.equals("in")){
			model.addAttribute("stock_order_id", stock_order_id);
			in_storageDtos = dao.select_storage_in_order(model);
			model.addAttribute("stock_order_id", null);
		}else if(goes != null && goes.equals("out")){
			model.addAttribute("stock_order_id", stock_order_id);
			out_storageDtos = dao.select_storage_out_order(model);
			model.addAttribute("stock_order_id", null);
			
		}
		
		
		if(icnt > 0){
			model.addAttribute("start",istart);
			model.addAttribute("end",iend);
			if(goes != null && goes.equals("in")){
				model.addAttribute("stock_order_id", stock_order_id);
			}
			in_storageDtos = dao.select_storage_in_order(model);
			if(goes != null && goes.equals("in")){
				model.addAttribute("stock_order_id", null);
			}
		}
		
		if(ocnt > 0){
			model.addAttribute("start",ostart);
			model.addAttribute("end",oend);
			if(goes != null && goes.equals("out")){
				model.addAttribute("stock_order_id", stock_order_id);
			}
			out_storageDtos = dao.select_storage_out_order(model);
			
		}
		
		istartPage = (icurrentPage / pageBlock) * pageBlock + 1;
		if(icurrentPage % pageBlock == 0){
			istartPage -= pageBlock;
		}
		
		iendPage = istartPage + pageBlock - 1;
		if(iendPage > ipageCount){
			iendPage = ipageCount;
		}
		
		ostartPage = (ocurrentPage / pageBlock) * pageBlock + 1;
		if(ocurrentPage % pageBlock == 0){
			ostartPage -= pageBlock;
		}
		
		
		oendPage = ostartPage + pageBlock - 1;
		if(oendPage > opageCount){
			oendPage = opageCount;
		}
		
		 
		
		model.addAttribute("icnt", icnt); 			
		model.addAttribute("inumber", inumber); 	
		model.addAttribute("ipageNum", ipageNum); 	
		model.addAttribute("ocnt", ocnt); 			
		model.addAttribute("onumber", onumber); 	
		model.addAttribute("opageNum", opageNum);
		
		if(icnt > 0){
			model.addAttribute("icnt", icnt);
			model.addAttribute("istartPage", istartPage);	
			model.addAttribute("iendPage", iendPage);		
			model.addAttribute("pageBlock", pageBlock);	
			model.addAttribute("ipageCount", ipageCount);	
			model.addAttribute("icurrentPage", icurrentPage);
		}
		
		if(ocnt > 0){
			model.addAttribute("ocnt", ocnt);
			model.addAttribute("ostartPage", ostartPage);	
			model.addAttribute("oendPage", oendPage);		
			model.addAttribute("opageBlock", pageBlock);	
			model.addAttribute("opageCount", opageCount);	
			model.addAttribute("ocurrentPage", ocurrentPage);
		}
		
		model.addAttribute("in_storageDtos", in_storageDtos);
		model.addAttribute("out_storageDtos", out_storageDtos);
	}

	@Override
	public void request_in_out_storage_service(HttpServletRequest req, Model model) throws Exception {
		String goes = req.getParameter("goes");
		model.addAttribute("goes",goes);

		int pageSize = 5;
		int pageBlock = 3;
		
		int cnt = 0;
		int start = 0;
		int end = 0;
		
		int number = 0;
		String pageNum = null; 	
		int currentPage = 0; 	
		
		int pageCount = 0; 		
		int startPage = 0; 		
		int endPage = 0; 
		
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		currentPage = (Integer.parseInt(pageNum));
		
		if(goes.equals("in")){
			ArrayList<In_storageDTO> in_storageDtos = new ArrayList<In_storageDTO>();
			model.addAttribute("opt", 1);
			in_storageDtos = dao.select_in_storage(model);
			
			cnt = in_storageDtos.size();
			
			pageCount = (cnt/pageSize) + (cnt%pageSize > 0 ? 1 : 0);
			
			start = (currentPage - 1) * pageSize + 1;
			end = start + pageSize - 1;
			
			if(end > cnt){
				end = cnt;
			}
			
			number = cnt - (currentPage - 1) * pageSize; 
			
			if(cnt > 0){
				model.addAttribute("start",start);
				model.addAttribute("end",end);
				in_storageDtos = dao.select_in_storage(model);
				model.addAttribute("in_storageDtos",in_storageDtos);
				
			}
			
			startPage = (currentPage / pageBlock) * pageBlock + 1;
			if(currentPage % pageBlock == 0){
				startPage -= pageBlock;
			}
			
			endPage = startPage + pageBlock - 1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
			
		}else if(goes.equals("out")){
			ArrayList<Out_storageDTO> out_storageDtos = new ArrayList<Out_storageDTO>();
			model.addAttribute("opt", 1);
			out_storageDtos = dao.select_out_storage(model);
			
			cnt = out_storageDtos.size();
			
			pageCount = (cnt/pageSize) + (cnt%pageSize > 0 ? 1 : 0);
			
			start = (currentPage - 1) * pageSize + 1;
			end = start + pageSize - 1;
			
			if(end > cnt){
				end = cnt;
			}
			
			number = cnt - (currentPage - 1) * pageSize; 
			
			if(cnt > 0){
				model.addAttribute("start",start);
				model.addAttribute("end",end);
				out_storageDtos = dao.select_out_storage(model);
				model.addAttribute("out_storageDtos",out_storageDtos);
				
			}
			
			startPage = (currentPage / pageBlock) * pageBlock + 1;
			if(currentPage % pageBlock == 0){
				startPage -= pageBlock;
			}
			
			endPage = startPage + pageBlock - 1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
		
			
		}else if(goes.equals("storage_out_complete")){
			ArrayList<Search_distribution_orderDTO> order_stateDto = new ArrayList<Search_distribution_orderDTO>();
			order_stateDto = dao.Search_distribution_order(model);
			
			cnt = order_stateDto.size();
			
			pageCount = (cnt/pageSize) + (cnt%pageSize > 0 ? 1 : 0);
			
			start = (currentPage - 1) * pageSize + 1;
			end = start + pageSize - 1;
			
			if(end > cnt){
				end = cnt;
			}
			
			number = cnt - (currentPage - 1) * pageSize; 
			
			if(cnt > 0){
				model.addAttribute("start",start);
				model.addAttribute("end",end);
				order_stateDto = dao.Search_distribution_order(model);
				model.addAttribute("order_stateDto",order_stateDto);
			}
			
			startPage = (currentPage / pageBlock) * pageBlock + 1;
			if(currentPage % pageBlock == 0){
				startPage -= pageBlock;
			}
			
			endPage = startPage + pageBlock - 1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
			
		}
		
		model.addAttribute("cnt", cnt); 			
		model.addAttribute("number", number); 	
		model.addAttribute("pageNum", pageNum); 	
		
		if(cnt > 0){
			model.addAttribute("cnt", cnt);
			model.addAttribute("startPage", startPage);	
			model.addAttribute("endPage", endPage);		
			model.addAttribute("pageBlock", pageBlock);	
			model.addAttribute("pageCount", pageCount);	
			model.addAttribute("currentPage", currentPage);
		}
	}

	@Override
	public void request_in_out_storage_pro_service(HttpServletRequest req, Model model) throws Exception {
		String goes = req.getParameter("goes");
		String stock_order_type = req.getParameter("id");
		
		String product_id;
		int warehouse_id;
		int employee_id;
		Date reg_date;
		String stock_state;
		
		int count_sales;
		int stock_amount;
		int available_stock;
		int lack_stock;
		Date storage_out_date;
		
		int count_purchase;
		Date storage_in_date;
		
		int cnt = 0;
		int stock_cnt = 0;
	
		ArrayList<Out_storageDTO> out_storageDtos = new ArrayList<Out_storageDTO>();
		ArrayList<In_storageDTO> in_storageDtos = new ArrayList<In_storageDTO>();
		
		model.addAttribute("stock_order_type", stock_order_type);
		
		if(goes.equals("out_storage")){
			out_storageDtos = dao.select_out_storage(model);
			
			product_id = out_storageDtos.get(0).getProduct_id();
			warehouse_id = out_storageDtos.get(0).getWarehouse_id();
			employee_id = out_storageDtos.get(0).getEmployee_id();
			reg_date = out_storageDtos.get(0).getReg_date();
			count_sales = out_storageDtos.get(0).getCount_sales();
			stock_amount = out_storageDtos.get(0).getStock_amount();
			available_stock = count_sales;
			lack_stock = 0;
			storage_out_date = out_storageDtos.get(0).getStorage_out_date();
			stock_state = "24202";
			
			model.addAttribute("product_id", product_id);
			model.addAttribute("warehouse_id", warehouse_id);
			model.addAttribute("employee_id", employee_id);
			model.addAttribute("reg_date", reg_date);
			model.addAttribute("count_sales", count_sales);
			model.addAttribute("available_stock", available_stock);
			model.addAttribute("lack_stock", lack_stock);
			model.addAttribute("storage_out_date", storage_out_date);
			model.addAttribute("stock_state", stock_state);
			
			cnt = dao.insert_out_storage(model);
			if(cnt == 1){
				
				 dao.update_stock_out_storage(model);
				 stock_cnt = dao.select_product_in_warehouse(model);
				 System.out.println("stock_cnt : " + stock_cnt);
				 if(stock_cnt >= 1){
					 model.addAttribute("st_op", 1);
					 dao.update_stock_out_storage(model);
				 }else{
					 model.addAttribute("warehouse_id", null);
					 dao.insert_stock_out_storage(model);
					 model.addAttribute("warehouse_id", warehouse_id);
				 }
				 model.addAttribute("op", 1);
				cnt = dao.insert_out_storage(model);
				cnt = dao.update_order_state(model);
				cnt = dao.update_orderstate_state(model);
				goes = "out";
			}
			
		}else if(goes.equals("out_storage_wait")){
			out_storageDtos = dao.select_out_storage(model);

			product_id = out_storageDtos.get(0).getProduct_id();
			warehouse_id = out_storageDtos.get(0).getWarehouse_id();
			employee_id = out_storageDtos.get(0).getEmployee_id();
			reg_date = out_storageDtos.get(0).getReg_date();
			count_sales = out_storageDtos.get(0).getCount_sales();
			stock_amount = out_storageDtos.get(0).getStock_amount();
			available_stock = stock_amount;
			lack_stock = count_sales - stock_amount;
			storage_out_date = out_storageDtos.get(0).getStorage_out_date();
			stock_state = "24203";
			
			model.addAttribute("product_id", product_id);
			model.addAttribute("warehouse_id", warehouse_id);
			model.addAttribute("employee_id", employee_id);
			model.addAttribute("reg_date", reg_date);
			model.addAttribute("count_sales", count_sales);
			model.addAttribute("available_stock", available_stock);
			model.addAttribute("lack_stock", lack_stock);
			model.addAttribute("storage_out_date", storage_out_date);
			model.addAttribute("stock_state", stock_state);
			
			cnt = dao.insert_out_storage(model);
			if(cnt == 1){
				
				 dao.update_stock_out_storage(model);
				 stock_cnt = dao.select_product_in_warehouse(model);
				 
				 if(stock_cnt >= 1){
					 model.addAttribute("st_op", 1);
					 dao.update_stock_out_storage(model);
				 }else{
					 model.addAttribute("warehouse_id", null);
					 dao.insert_stock_out_storage(model);
					 model.addAttribute("warehouse_id", warehouse_id);
				 }
				cnt = dao.update_order_state(model);
				//dao.update_sales_state(model);
				model.addAttribute("op", 1);
				cnt = dao.insert_out_storage(model);
				cnt = dao.update_orderstate_state(model);
				goes = "out";
			}
		}else if(goes.equals("in_storage")){
			
			in_storageDtos = dao.select_in_storage(model);
			product_id = in_storageDtos.get(0).getProduct_id();
			warehouse_id = in_storageDtos.get(0).getWarehouse_id();
			employee_id = in_storageDtos.get(0).getEmployee_id();
			reg_date = in_storageDtos.get(0).getReg_date();
			count_purchase = in_storageDtos.get(0).getCount_purchase();
			storage_in_date = in_storageDtos.get(0).getStorage_in_date();
			stock_state = "24102";
			String order_id = in_storageDtos.get(0).getOrder_id();
			
			model.addAttribute("product_id", product_id);
			model.addAttribute("warehouse_id", warehouse_id);
			model.addAttribute("employee_id", employee_id);
			model.addAttribute("reg_date", reg_date);
			model.addAttribute("count_purchase", count_purchase);
			model.addAttribute("storage_in_date", storage_in_date);
			model.addAttribute("stock_state", stock_state);
			model.addAttribute("order_id", order_id);
			
			//todo STOCK_ORDER_id 가져와야 함
			cnt = dao.insert_in_storage(model);
			if(cnt == 1){
				model.addAttribute("op", 1);
				cnt = dao.insert_in_storage(model);
				dao.update_order_state(model);
				//dao.update_purchase_state(model);
				 model.addAttribute("st_op", 2);
				 dao.update_stock_out_storage(model);
				 
				 stock_state = "24202";
				 model.addAttribute("stock_state", stock_state);
				 cnt = dao.update_orderstate_state(model);
				 goes = "in";
				 
				 //dao.update_sales_state(model);
			}
		}else if(goes.equals("storage_out_complete")){
			Select_stock_order_storageDTO dto = dao.select_stock_order_out_order(model);
			
			String stock_order_id = dto.getStock_order_id();
			stock_order_type = dto.getStock_order_type();
			count_sales = dto.getCount_sales();
			available_stock = dto.getAvailable_stock();
			lack_stock = dto.getLack_stock();
			storage_out_date = dto.getStorage_out_date();
			
			product_id = dto.getProduct_id();
			warehouse_id = dto.getWarehouse_id();
			employee_id = dto.getEmployee_id();
			reg_date = dto.getReg_date();
			stock_state = "24752";
			
			model.addAttribute("stock_order_id", stock_order_id);
			model.addAttribute("stock_order_type", stock_order_type);
			model.addAttribute("available_stock", count_sales);
			model.addAttribute("lack_stock", lack_stock);
			model.addAttribute("stock_state", stock_state);
			model.addAttribute("product_id", product_id);
			
			dao.update_order_state(model);
			model.addAttribute("st_op", 4);
			dao.update_stock_out_storage(model);
			//dao.update_sales_state(model);
			goes = "out";
			
		}else if(goes.equals("stock_complete")){
			product_id = req.getParameter("product_id");
			lack_stock = Integer.parseInt(req.getParameter("lack_stock"));
			model.addAttribute("product_id", product_id);
			model.addAttribute("available_stock", lack_stock);
			model.addAttribute("stock_state", "24202");
			dao.update_order_state(model);
			
			dao.update_stock_out_storage(model);
			model.addAttribute("st_op","1");
			dao.update_stock_out_storage(model);
			goes = "out";
		}
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("goes",goes);
	}

	@Override
	public void reg_warehouse_service(HttpServletRequest req, Model model) throws Exception {
		ArrayList<WarehouseVO> reg_warehouse_listVos = new ArrayList<WarehouseVO>(); 
		reg_warehouse_listVos = dao.select_warehouse_list(model);
		model.addAttribute("reg_warehouse_listVos",reg_warehouse_listVos);
	}
	
	@Override
	public void reg_warehouse_view_service(HttpServletRequest req, Model model) throws Exception {
		String warehouse_id = req.getParameter("id") == null ? null : req.getParameter("id");
		model.addAttribute("id", warehouse_id);
		if(!warehouse_id.equals("new")){
			ArrayList<WarehouseVO> reg_warehouse_listVos = new ArrayList<WarehouseVO>();
			model.addAttribute("warehouse_id",warehouse_id);
			reg_warehouse_listVos = dao.select_warehouse_list(model);
			model.addAttribute("reg_warehouse_listVos",reg_warehouse_listVos);
			model.addAttribute("newmodify", "modify");
		}else{
			String nomal = req.getParameter("nomal");
			String bad = req.getParameter("bad");
			String wait = req.getParameter("wait");
			model.addAttribute("nomal",nomal);
			model.addAttribute("bad",bad);
			model.addAttribute("wait",wait);
			model.addAttribute("newmodify", "new");
		}
	}

	@Override
	public void reg_warehouse_pro_service(HttpServletRequest req, Model model) throws Exception {
		String warehouse_id = req.getParameter("warehouse_id");
		String warehouse_name = req.getParameter("warehouse_name");
		String warehouse_location = req.getParameter("warehouse_location");
		String opt = req.getParameter("opt");
		
		model.addAttribute("warehouse_id", warehouse_id);
		model.addAttribute("warehouse_name", warehouse_name);
		model.addAttribute("warehouse_location", warehouse_location);
		
		if(opt.equals("new")){
			dao.insert_warehouse(model);
		}else if(opt.equals("modify")){
			dao.update_warehouse(model);
		}
	}

	@Override
	public void movement_warehouse_list_service(HttpServletRequest req, Model model)  throws Exception{
		ArrayList<Select_stock_order_movement_warehouseDTO> movement_warehouseDtos = new ArrayList<Select_stock_order_movement_warehouseDTO>();
		ArrayList<WarehouseVO> warehouseVos = new ArrayList<WarehouseVO>();
		
		movement_warehouseDtos = dao.select_movement_warehouse_list(model);
		model.addAttribute("movement_warehouseDtos",movement_warehouseDtos);
		
		warehouseVos = dao.select_warehouse_list(model);
		model.addAttribute("warehouseVos",warehouseVos);
		
		int pageSize = 5;
		int pageBlock = 3;
		
		int cnt = 0;
		int start = 0;
		int end = 0;
		
		int number = 0;
		
		String pageNum = null; 	
		int currentPage = 0; 	
		
		int pageCount = 0; 		
		int startPage = 0; 		
		int endPage = 0; 
		
		cnt = movement_warehouseDtos.size();
				
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		currentPage = (Integer.parseInt(pageNum));
		pageCount = (cnt/pageSize) + (cnt%pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		
		if(end > cnt){
			end = cnt;
		}
		
		number = cnt - (currentPage - 1) * pageSize; 
		
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		if(cnt > 0){
			model.addAttribute("start",start);
			model.addAttribute("end",end);
			movement_warehouseDtos = dao.select_movement_warehouse_list(model);
			model.addAttribute("movement_warehouseDtos",movement_warehouseDtos);
			
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0){
			startPage -= pageBlock;
		}
		
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		model.addAttribute("cnt", cnt); 			
		model.addAttribute("number", number); 	
		model.addAttribute("pageNum", pageNum); 	
		
		if(cnt > 0){
			model.addAttribute("cnt", cnt);
			model.addAttribute("startPage", startPage);	
			model.addAttribute("endPage", endPage);		
			model.addAttribute("pageBlock", pageBlock);	
			model.addAttribute("pageCount", pageCount);	
			model.addAttribute("currentPage", currentPage);
		}
		
	}
	
	@Override
	public void movement_warehouse_view_service(HttpServletRequest req, Model model)  throws Exception{
		String id = req.getParameter("id");
		model.addAttribute("id",id);
		String doit = req.getParameter("doit");
		model.addAttribute("doit",doit);
		
		
		ArrayList<WarehouseVO> warehouseVos = new ArrayList<WarehouseVO>();

		warehouseVos = dao.select_warehouse_list(model);
		
		model.addAttribute("warehouseVos",warehouseVos);
		
		String warehouse_id = req.getParameter("warehouse_id");
		model.addAttribute("warehouse_id",warehouse_id);
	}

	@Override
	public void movement_warehouse_pro_service(HttpServletRequest req, Model model)  throws Exception{
		String id = req.getParameter("id");
		String opt = req.getParameter("opt") == null ? null : req.getParameter("opt");
		
		if(id != null && id.equals("new")){
			String product_id = req.getParameter("product_id");
			String warehouse_id = req.getParameter("warehouse_id");
			String employee_id = req.getParameter("employee_id");
			String arrive_warehouse_id = req.getParameter("arrive_warehouse_id");
			String movement_amount = req.getParameter("movement_amount");
			
			model.addAttribute("product_id",product_id);
			model.addAttribute("warehouse_id",warehouse_id);
			model.addAttribute("employee_id",employee_id);
			model.addAttribute("arrive_warehouse_id",arrive_warehouse_id);
			model.addAttribute("movement_amount",movement_amount);
			model.addAttribute("stock_order_id", "4751");

			dao.insert_stock_order(model);
			dao.insert_movement_warehouse(model);
		
		}else if(opt != null && opt.equals("del")){
			model.addAttribute("stock_order_id", id);
			dao.delete_movement_warehouse(model);
			dao.delete_movement_stock_order(model);
		
		}else if(opt != null && opt.equals("confirm")){
			ArrayList<Select_stock_order_movement_warehouseDTO> movement_warehouseDtos = new ArrayList<Select_stock_order_movement_warehouseDTO>();
			model.addAttribute("stock_order_id", id);
			movement_warehouseDtos = dao.select_movement_warehouse_list(model);
			
			String product_id =  movement_warehouseDtos.get(0).getProduct_id();
			int warehouse_id =  movement_warehouseDtos.get(0).getWarehouse_id();
			int arrive_warehouse_id =  movement_warehouseDtos.get(0).getArrive_warehouse();
			int stock_amount =  movement_warehouseDtos.get(0).getMovement_amount();
			
			model.addAttribute("product_id", product_id);
			model.addAttribute("warehouse_id", warehouse_id);
			
			model.addAttribute("stock_amount", stock_amount);
			
			model.addAttribute("mv_op", "1");
			dao.update_stock_out_storage(model);
			
			model.addAttribute("warehouse_id", arrive_warehouse_id);
			ArrayList<ProductVO> productVos = new ArrayList<ProductVO>();
			productVos = dao.select_product_info(model);
			
			model.addAttribute("mv_op", "2");
			
			model.addAttribute("arrive_warehouse_id", arrive_warehouse_id);
			if(productVos.size() > 0){
				dao.update_stock_out_storage(model);
			}else{
				model.addAttribute("warehouse_id", arrive_warehouse_id);
				dao.insert_stock_out_storage(model);
			}
			model.addAttribute("movement_state", "1");
			dao.update_movement_warehouse(model);
			
		}else{
			String product_id = req.getParameter("product_id");
			String warehouse_id = req.getParameter("warehouse_id");
			String employee_id = req.getParameter("employee_id");
			String arrive_warehouse_id = req.getParameter("arrive_warehouse_id");
			String movement_amount = req.getParameter("movement_amount");
			String stock_order_id = req.getParameter("stock_order_id");
			
			model.addAttribute("product_id",product_id);
			model.addAttribute("warehouse_id",warehouse_id);
			model.addAttribute("employee_id",employee_id);
			model.addAttribute("arrive_warehouse_id",arrive_warehouse_id);
			model.addAttribute("movement_amount",movement_amount);
			model.addAttribute("stock_order_id",stock_order_id);
			
			dao.update_stock_order(model);
			dao.update_movement_warehouse(model);
		}
	}

	@Override
	public void movement_warehouse_product_service(HttpServletRequest req, Model model) throws Exception {
		String id = req.getParameter("id");
		model.addAttribute("id",id);
		
		ArrayList<WarehouseVO> warehouseVos = new ArrayList<WarehouseVO>();
		warehouseVos = dao.select_warehouse_list(model);
		model.addAttribute("warehouseVos",warehouseVos);
		
		String warehouse_id = req.getParameter("warehouse_id");
		model.addAttribute("warehouse_id", warehouse_id);
		
		String warehouse_name = req.getParameter("warehouse_name");
		model.addAttribute("warehouse_name", warehouse_name);
		
		ArrayList<ProductVO> productVos = new ArrayList<ProductVO>();
		productVos = dao.select_product_info(model);
		model.addAttribute("productVos",productVos);
		
		if(!id.equals("new")){
			ArrayList<Select_stock_order_movement_warehouseDTO> movement_warehouseDtos = new ArrayList<Select_stock_order_movement_warehouseDTO>();
			model.addAttribute("stock_order_id", id);
			movement_warehouseDtos = dao.select_movement_warehouse_list(model);
			model.addAttribute("movement_warehouseDtos",movement_warehouseDtos);
		}
	}

	@Override
	public void adjustment_inventory_list(HttpServletRequest req, Model model) throws Exception {
		ArrayList<ProductVO> productVos = new ArrayList<ProductVO>();
		productVos = dao.select_only_product_id_name(model);
		ArrayList<WarehouseVO> warehouseVos = new ArrayList<WarehouseVO>();
		warehouseVos = dao.select_warehouse_list(model);
		
		String stock_order_id = req.getParameter("oder_id");
		model.addAttribute("stock_order_id", stock_order_id);
		
		ArrayList<Adjustment_inventoryDTO> Adjustment_inventoryDtos = new ArrayList<Adjustment_inventoryDTO>();
		Adjustment_inventoryDtos = dao.select_adjustment_inventory(model);
		
		
		
		int pageSize = 5;
		int pageBlock = 3;
		
		int cnt = 0;
		int start = 0;
		int end = 0;
		
		int number = 0;
		String pageNum = null; 	
		int currentPage = 0; 	
		
		int pageCount = 0; 		
		int startPage = 0; 		
		int endPage = 0; 
		
		cnt = Adjustment_inventoryDtos.size();
				
		pageNum = req.getParameter("pageNum");
		
		if(pageNum == null){
			pageNum = "1";
		}
		
		currentPage = (Integer.parseInt(pageNum));
		pageCount = (cnt/pageSize) + (cnt%pageSize > 0 ? 1 : 0);
		
		start = (currentPage - 1) * pageSize + 1;
		end = start + pageSize - 1;
		
		if(end > cnt){
			end = cnt;
		}
		
		number = cnt - (currentPage - 1) * pageSize; 
		
		if(cnt > 0){
			model.addAttribute("start",start);
			model.addAttribute("end",end);
			Adjustment_inventoryDtos = dao.select_adjustment_inventory(model);
			model.addAttribute("Adjustment_inventoryDtos",Adjustment_inventoryDtos);
			
		}
		
		startPage = (currentPage / pageBlock) * pageBlock + 1;
		if(currentPage % pageBlock == 0){
			startPage -= pageBlock;
		}
		
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		model.addAttribute("cnt", cnt); 			
		model.addAttribute("number", number); 	
		model.addAttribute("pageNum", pageNum); 	
		
		if(cnt > 0){
			model.addAttribute("cnt", cnt);
			model.addAttribute("startPage", startPage);	
			model.addAttribute("endPage", endPage);		
			model.addAttribute("pageBlock", pageBlock);	
			model.addAttribute("pageCount", pageCount);	
			model.addAttribute("currentPage", currentPage);
		}
		
		model.addAttribute("productVos",productVos);
		model.addAttribute("warehouseVos",warehouseVos);
	}
	
	@Override
	public void adjustment_inventory_view_service(HttpServletRequest req, Model model) throws Exception {
		String product_id = req.getParameter("product_id");
		String product_name = req.getParameter("product_name");
		String warehouse_id = req.getParameter("warehouse_id");
		String warehouse_name = req.getParameter("warehouse_name");
		
		Stock_informationVO stockVo = new Stock_informationVO();
		model.addAttribute("product_id",product_id);
		model.addAttribute("warehouse_id",warehouse_id);
		stockVo = dao.select_stock_information(model);
		
		model.addAttribute("product_name",product_name);
		model.addAttribute("warehouse_id",warehouse_id);
		model.addAttribute("warehouse_name",warehouse_name);
		model.addAttribute("stockVo",stockVo);
	}

	@Override
	public void adjustment_inventory_pro_service(HttpServletRequest req, Model model) throws Exception {
		String product_id = req.getParameter("product_id"); 
		int warehouse_id = Integer.parseInt(req.getParameter("warehouse_id")); 
		int employee_id = Integer.parseInt(req.getParameter("employee_id")); 
		int taked_stock = Integer.parseInt(req.getParameter("taked_stock")); 
		int delete_stock = Integer.parseInt(req.getParameter("delete_stock"));
		
		model.addAttribute("stock_order_id", "4753");
		model.addAttribute("product_id",product_id);
		model.addAttribute("warehouse_id",warehouse_id);
		model.addAttribute("employee_id",employee_id);
		model.addAttribute("taked_stock",taked_stock);
		model.addAttribute("delete_stock",delete_stock);
		model.addAttribute("ad_op","1");
		dao.insert_stock_order(model);
		dao.insert_adjustment_inventory(model);
		dao.update_stock_out_storage(model);
		
	}

	
}


