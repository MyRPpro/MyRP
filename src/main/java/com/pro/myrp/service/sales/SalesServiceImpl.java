package com.pro.myrp.service.sales;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.sales_management.ModifySelectDTO;
import com.pro.myrp.domain.sales_management.SalesDTO;
import com.pro.myrp.persistence.sales.SalesDAO;

@Service
public class SalesServiceImpl implements SalesService {

	@Inject
	private SalesDAO dao;
	
	@Override
	public void sales_list_servie(Model model) {
		System.out.println("  -> sales_list_servie " );
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize	= 5;
		int pageBlock	= 3;
		int cnt			= 0;
		int start		= 0;
		int end			= 0;
		int number		= 0;
		String pageNum	= null;
		int currentPage	= 0;
		int pageCount	= 0;
		int	startPage	= 0;
		int endPage		= 0;
		
		ArrayList<SalesDTO> dtos = null;
		String search_str = null;
		int search_check = 0;
		
		// 검색어  유무 체크 
		if( req.getParameter("search_str") != null && req.getParameter("search_str") != "" ){
			/*System.out.println("널인데 왜 떠? : " + req.getParameter("search_str") );*/
			search_check = 1;
		}
		
		// 검색어가 있을 경우
		if( search_check == 1 ){
			
			search_str = req.getParameter("search_str");
			model.addAttribute("search_str",search_str);
			model.addAttribute("  -> search_str : " + search_str);

			// 개수 구하기
			cnt = dao.count_quick_serch_sales(search_str);
			System.out.println("  -> Search Cnt : " + cnt );
			
			
		// 검색어가 있을 경우(전체 로드)
		} else {
			
			// 전체 개수 구하기
			cnt = dao.select_sales_cnt();
			
		}
		
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt/pageSize)+((cnt%pageSize)>0?1:0);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		if(end > cnt) end = cnt;
		number = cnt - (currentPage - 1) * pageSize;
		
		
		if(cnt > 0) {
			
			System.out.println("  -> Complete import cnt ...");
			
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			daoMap.put("search_str", search_str);
			
			if( search_check == 1 ){
				System.out.println("  -> Search_str :" +  req.getParameter("search_str") );
				
				// 검색된 내용만 불러오기
				dtos = dao.select_quick_serch_sales(daoMap);
				model.addAttribute("SalesDTOs", dtos);
				
				
			} else {
				System.out.println("  -> Print All List  ...");
				
				// 전체 목록 불러오기
				dtos = dao.select_sales_list(daoMap);
				model.addAttribute("SalesDTOs", dtos);
				
			}

		} else {
			
			System.out.println("  -> Cnt is Zero...");
		}
		
		startPage = (currentPage/pageBlock)*pageBlock+1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		endPage = startPage+pageBlock-1;
		if(endPage>pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		if(cnt > 0) {
			model.addAttribute("cnt", cnt);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		}
		
	}
	
	@Override
	public void sales_list_table_servie(Model model) {
		
		System.out.println("  -> sales_list_table_servie " );
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize	= 5;
		int cnt			= 0;
		int start		= 0;
		int end			= 0;
		String pageNum	= null;
		int currentPage	= 0;
		
		
		ArrayList<SalesDTO> dtos = null;
		String search_str = null;
		int search_check = 0;
		
		// 검색어  유무 체크 
		if( req.getParameter("search_str") != null && 
				req.getParameter("search_str") != "" ){
			search_str = req.getParameter("search_str");
			System.out.println("  -> search_str : " + search_str);
			search_check = 1;
		}
		
		pageNum = req.getParameter("pageNum"); 
		if(pageNum==null) pageNum = "1";
		currentPage = Integer.parseInt(pageNum);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		
		System.out.println("  -> start,end : " + start +", "+ end);
		
		cnt = dao.select_sales_cnt();
	
		if(cnt > 0) {
			
			System.out.println("  -> Complete import cnt ...");
			
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			daoMap.put("search_str", search_str);
			
			if( search_check == 1 ){
				System.out.println("  -> Search_str :" +  req.getParameter("search_str") );
				
				// 검색된 내용만 불러오기
				dtos = dao.select_quick_serch_sales(daoMap);
				model.addAttribute("SalesDTOs", dtos);
				
			} else {
				System.out.println("  -> Print All List  ...");
				
				// 전체 목록 불러오기
				dtos = dao.select_sales_list(daoMap);
				model.addAttribute("dtos", dtos);
			}
			
		} else System.out.println("  -> Cnt is Zero...");
	}

	@Override
	public void sales_list_page_servie(Model model) {
		
		System.out.println("  -> sales_list_page_servie " );
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize	= 5;
		int pageBlock	= 3;
		int cnt			= 0;
		int start		= 0;
		int end			= 0;
		int number		= 0;
		String pageNum	= null;
		int currentPage	= 0;
		int pageCount	= 0;
		int	startPage	= 0;
		int endPage		= 0;
		
		String search_str = null;
		int search_check = 0;
		
		// 검색어  유무 체크 
		if( req.getParameter("search_str") != null && req.getParameter("search_str") != "" ){
			search_check = 1;
		}
		
		// 검색어가 있을 경우
		if( search_check == 1 ){	
			
			search_str = req.getParameter("search_str");
			cnt = dao.count_quick_serch_sales(search_str);
			System.out.println("  -> SearchCnt : " + cnt );
		
		} else {	// 검색어가 없을 경우(전체 로드) 
			
			// 전체 개수 구하기
			cnt = dao.select_sales_cnt();
			System.out.println("  -> AllCnt : " + cnt );
		}
		
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt/pageSize)+((cnt%pageSize)>0?1:0);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		if(end > cnt) end = cnt;
		number = cnt - (currentPage - 1) * pageSize;
		
		startPage = (currentPage/pageBlock)*pageBlock+1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		endPage = startPage+pageBlock-1;
		if(endPage>pageCount) endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		if(cnt > 0) {
			model.addAttribute("cnt", cnt);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
		}
		
		
	}

	@Override
	public void detail_sales_service(Model model) {
		
		System.out.println("  -> detail_sales_service");
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String sales_id = req.getParameter("sales_id");
		String sales_state = req.getParameter("sales_state");
		
		System.out.println("  -> sales_id : "  + sales_id);
		System.out.println("  -> sales_state : "  + sales_state);
		
		Map<String,Object> daoMap = new HashMap<>();
		daoMap.put("sales_id", sales_id);
		
		
		ArrayList<SalesDTO> dtos = dao.select_detail_sales(daoMap);
		/*System.out.println("  -> dtos : " + dtos.toString() );*/
		
		if( dtos != null ){
			System.out.println("  -> Complete value import ...");
			model.addAttribute("dtos", dtos);
			
		} else {	// 불러오기 실패
			System.out.println("  -> Error loading value...");
			
		}
		
		int Modify = 0;
		if( sales_state.equals("22211")){
			System.out.println("  -> Modifiable ...");
			
			Modify = 1;
			ArrayList<ModifySelectDTO> dtos_account  = dao.select_account();	// account_id
			ArrayList<ModifySelectDTO> dtos_product  = dao.select_product();	// product_id
			ArrayList<ModifySelectDTO> dtos_company  = dao.select_company();	// company_name
			ArrayList<ModifySelectDTO> dtos_employee  = dao.select_employee();	// employee_id
			
			model.addAttribute("dtos_account", dtos_account);
			model.addAttribute("dtos_product", dtos_product);
			model.addAttribute("dtos_company", dtos_company);
			model.addAttribute("dtos_employee", dtos_employee);
			
			System.out.println("  -> Complete Model dtos ...");
			
		}
		model.addAttribute("Modify",Modify);
		
		
		/*	예전코드
			String company_id = req.getParameter("company_id");
			String sales_id = req.getParameter("sales_id");
			String account_id = req.getParameter("account_id");
			String sales_state = req.getParameter("sales_state");
			
			System.out.println("  -> company_id : "  + company_id);
			System.out.println("  -> sales_id : "  + sales_id);
			System.out.println("  -> account_id : "  + account_id);
			System.out.println("  -> sales_state : "  + sales_state);
			
			Map<String,Object> daoMap = new HashMap<>();
			daoMap.put("company_id", company_id);
			daoMap.put("sales_id", sales_id);
			daoMap.put("account_id", account_id);
			
			SalesDTO dto = dao.select_detail_sales( daoMap );
			
			if( dto != null ){
				System.out.println("  -> Complete value import ...");
				model.addAttribute("dto", dto);
				
			} else {	// 불러오기 실패
				System.out.println("  -> Error loading value...");
				
			}
			*/

	}
	

	@Override
	public void modify_sales_pro_service(Model model) {

		System.out.println("  -> modify_sales_pro_service");
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		/*
		// 넘어온 값 확인
		Enumeration params = req.getParameterNames();
		System.out.println("  -> Checking Value...");
		
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    System.out.println("    : "+name + " : " +req.getParameter(name));
		}
		*/
		
		// 공통코드
		String sales_id = req.getParameter("sales_id");
		String order_id = req.getParameter("order_id");
		String product_id = req.getParameter("product_id");
		String company_id = req.getParameter("company_id");
		String company_name = req.getParameter("company_name");
		int employee_id =  Integer.parseInt( req.getParameter("employee_id"));
		Date reg_date = req.getParameter("reg_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("reg_date")); 
		Date update_date = req.getParameter("update_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("update_date"));
		Date storage_out_date = req.getParameter("storage_out_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("storage_out_date"));
		int count_sales = Integer.parseInt(req.getParameter("count_sales") );
		int sales_state = Integer.parseInt(req.getParameter("sales_state") );
		int condition_note_receivable = Integer.parseInt(req.getParameter("condition_note_receivable") );
		
		// 가격 설정
		String selling_price = req.getParameter("selling_price");
		System.out.println( "selling_price : " + selling_price );

		Long price	=  Math.round(Double.parseDouble(req.getParameter("selling_price"))); 
		System.out.println( "price : " + price );
		
		Long tax	=  (price/10);
		Long sum	= (price + tax);
		
		System.out.println("  -> price : " + price);
		System.out.println("  -> tax : " + tax);
		System.out.println("  -> sum : " + sum);
		
		// 반복 변수 설정
		/*
		int price_check = 1;
		int tax_check = 0;
		int sum_check = 0;
		*/
		int modify_cnt = 0;
		int cnt 	= 0;
		
		// 생성자 생성
		SalesDTO dto = null;
		
		// 계좌별로 분기
		do{
			String account_id = req.getParameter("account_id");
			
			if ( modify_cnt == 0 ){
				System.out.println("  -> 부가세 예수금 수정");
				dto = new SalesDTO();
				dto.setAccount_id("500012020000");
				dto.setSelling_price(tax);
				modify_cnt = 1 ;
				
				
			} else if ( modify_cnt == 1 ){
				System.out.println("  -> 상품매출 수정");
				dto = new SalesDTO();
				dto.setAccount_id("500011020000");
				dto.setSelling_price(price);
				modify_cnt = 2;
				
				
			} else if ( modify_cnt == 2 ){
				System.out.println("  -> 매출채권 수정");
				dto = new SalesDTO();
				dto.setAccount_id("500011060000");
				dto.setSelling_price(sum);
				modify_cnt = 0;
				
			} else {
				System.out.println("  -> 입력값 오류");
			}
			
			dto.setSales_id(sales_id);
			dto.setOrder_id(order_id);
			dto.setProduct_id(product_id);
			dto.setCompany_id(company_id);
			dto.setCompany_name(company_name);
			dto.setEmployee_id(employee_id);
			dto.setReg_date(reg_date);
			dto.setUpdate_date(update_date);
			dto.setStorage_out_date(storage_out_date);
			dto.setCount_sales(count_sales);
			dto.setSales_state(sales_state);
			dto.setCondition_note_receivable(condition_note_receivable);
			
			cnt = dao.update_sales(dto);
			
			System.out.println("  -> dto: "+dto.toString());
			System.out.println("  -> cnt: "+cnt);
			model.addAttribute("cnt", cnt);
			
	} while( modify_cnt != 0 );
				
		
		
		
		/* 예전코드
		String sales_id = req.getParameter("sales_id");
		String account_id = req.getParameter("account_id");
		String order_id = req.getParameter("order_id");
		String product_id = req.getParameter("product_id");
		String company_id = req.getParameter("company_id");
		String company_name = req.getParameter("company_name");
		int employee_id =  Integer.parseInt( req.getParameter("employee_id"));
		Date reg_date = req.getParameter("reg_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("reg_date")); 
		Date update_date = req.getParameter("update_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("update_date"));
		Date storage_out_date = req.getParameter("storage_out_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("storage_out_date"));
		int count_sales = Integer.parseInt(req.getParameter("count_sales") );
		long selling_price = Long.parseLong(req.getParameter("selling_price") );
		int sales_state = Integer.parseInt(req.getParameter("sales_state") );
		int condition_note_receivable = Integer.parseInt(req.getParameter("condition_note_receivable") );
		
		SalesDTO dto = new SalesDTO();
		
		dto.setSales_id(sales_id);
		dto.setAccount_id(account_id);
		dto.setOrder_id(order_id);
		dto.setProduct_id(product_id);
		dto.setCompany_id(company_id);
		dto.setCompany_name(company_name);
		dto.setEmployee_id(employee_id);
		dto.setReg_date(reg_date);
		dto.setUpdate_date(update_date);
		dto.setStorage_out_date(storage_out_date);
		dto.setCount_sales(count_sales);
		dto.setSelling_price(selling_price);
		dto.setSales_state(sales_state);
		dto.setCondition_note_receivable(condition_note_receivable);
		
		System.out.println("  -> Sales_id : " + dto.getSales_id() );
		
		System.out.println("  -> Company_id : " + dto.getCompany_id() );
		System.out.println("  -> Company_name : " + dto.getCompany_name() );
		System.out.println("  -> dto : " + dto.toString() );
		
		int cnt = dao.update_sales(dto);
		
		System.out.println("  -> cnt: "+cnt);
		model.addAttribute("cnt", cnt);
		*/
	}


	



	

	


	
	

}
