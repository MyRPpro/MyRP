package com.pro.myrp.service.purchase;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.purchase_management.PurchaseDTO;
import com.pro.myrp.persistence.purchase.purchaseDAO;

@Service
public class purchaseServiceImpl implements purchaseService {

	@Inject
	private purchaseDAO dao;

	@Override
	public void purchase_list_servie(Model model) {

		System.out.println("  -> purchase_list_servie ");

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");

		String search_str = null;	// 판매번호 검색
		int search_check = 0;		// 검색 종류	
		int cnt = 0;				// 검색 개

		System.out.println("  -> search_str :" + req.getParameter("search_str") );

		// 검색 종류 설정
		search_str = req.getParameter("search_str");
		if (search_str.equals("all") ) {
			search_check = 0;
		} else if (search_str.equals ("account")) {
			search_check = 2;
		} else if (search_str.equals ("stock")) {
			search_check = 3;
		} else if (search_str.equals ("check")) {
			search_check = 4;
		} else if (search_str != null && search_str != "") {
			search_check = 1;
		}
		
		System.out.println("  -> search_str : " + search_str);
		System.out.println("  -> search_check : " + search_check);
		
		// 검색어가 있을 경우
		if (search_check == 1) {
			// 개수 구하기
			System.out.println("  -> Search...");
			search_str = req.getParameter("search_str");
			req.setAttribute("search_str", search_str);
			cnt = dao.select_search_purchase_cnt(search_str);

		// 전표 조회일 경우
		} else if (search_check == 2) {
			System.out.println("  -> Account_Approve...");
			int update_cnt = dao.update_account_approve_purchase();
			System.out.println("  -> update_cnt : " + update_cnt);
			cnt = dao.select_account_approve_purchase_cnt();
			System.out.println("  -> Search Cnt : " + cnt);

		// 창고 출고 완료 일경우
		} else if (search_check == 3) {

			System.out.println("  -> Stock_Out...");
			int update_cnt = dao.update_stock_in_purchase();
			System.out.println("  -> update_cnt : " + update_cnt);

			cnt = dao.select_stock_in_purchase_cnt();
			System.out.println("  -> Search Cnt : " + cnt);

		// 구매 승인 요청일 경우
		} else if (search_check == 4) {
			System.out.println("  -> Search_Checkout...");
			cnt = dao.select_checkout_purchase_cnt();
			System.out.println("  -> Search Cnt : " + cnt);

		} else {
			System.out.println("  -> Search_All...");
			cnt = dao.select_all_purchase_cnt();
		}

		req.setAttribute("cnt", cnt);
		req.setAttribute("search_check", search_check);
		
	}

	@Override
	public void purchase_list_table_servie(Model model) {
		
		System.out.println("  -> purchase_list_table_servie " );
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int start = 0;
		int end	= 0;
		int cnt	= 0;
		int search_check = 0;
		String search_str = "";
		ArrayList<PurchaseDTO> dtos = null;

		cnt = (Integer) req.getAttribute("cnt");
		search_check = (Integer) req.getAttribute("search_check");
		search_str = (String) req.getAttribute("search_str");
		
		int pageSize	= 5;
		String pageNum	= null;
		int currentPage	= 0;

		pageNum = req.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		currentPage = Integer.parseInt(pageNum);
		
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		if(end > cnt) end = cnt;
		
		System.out.println("  -> start & end page : " + start +"/ "+ end);
		
		if(cnt > 0) {
			
			System.out.println("  -> Complete import cnt ...");
			
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			daoMap.put("search_str", search_str);
			
			if( search_check == 1 ){
				System.out.println("  -> Search_str List :" +  req.getParameter("search_str") );
				
				// 검색된 내용만 불러오기
				dtos = dao.select_purchase_list(daoMap);
				model.addAttribute("dtos", dtos);
				
			} else if( search_check == 2 ){
				
				// 승인된 내용 불러오기
				System.out.println("  -> Account Approve List  ...");
				dtos = dao.select_account_approve_purchase_list(daoMap);
				model.addAttribute("dtos", dtos);
			
			} else if ( search_check == 3 ){
				
				// 출고 완료 목록 표시
				System.out.println("  -> Stock In List  ...");
				dtos = dao.select_stock_in_purchase_list(daoMap);
				model.addAttribute("dtos", dtos);
				
				
			} else if ( search_check == 4 ){
				
				// 출고 완료 목록 표시
				System.out.println("  -> Checkout purchase List  ...");
				dtos = dao.select_checkout_purchase_list(daoMap);
				model.addAttribute("dtos", dtos);
				
				
			} else {
				System.out.println("  -> Print All List  ...");
				
				// 전체 목록 불러오기
				dtos = dao.select_purchase_All_list(daoMap);
				model.addAttribute("dtos", dtos);
			}

		} else System.out.println("  -> Cnt is Zero...");
		model.addAttribute("cnt", cnt);
		
		
		
		
	}

	@Override
	public void purchase_list_page_servie(Model model) {
		System.out.println("  -> purchase_list_page_servie " );
		
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

		int search_check = 0;
		
		cnt = (Integer) req.getAttribute("cnt");
		search_check = (Integer) req.getAttribute("search_check");
		model.addAttribute("check",search_check);
		
		System.out.println("  -> Test cnt : " + cnt);
		System.out.println("  -> Test search_check : " + search_check);
		
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
	public void modify_purchase_service(Model model){
		
		System.out.println("  -> modify_purchase_service");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");

		String purchase_id = req.getParameter("purchase_id");
		System.out.println("  -> purchase_id : "  + purchase_id);
		
		Map<String,Object> daoMap = new HashMap<>();
		daoMap.put("purchase_id", purchase_id);
		
		ArrayList<PurchaseDTO> dtos = dao.select_modify_purchase(daoMap);
		/*System.out.println("  -> dtos : " + dtos.toString() );*/
		
		if( dtos != null ){
			System.out.println("  -> Complete value import ...");
			model.addAttribute("dtos", dtos);
			
		} else {	// 불러오기 실패
			System.out.println("  -> Error loading value...");
		}
		
		System.out.println("  -> Modifiable ...");
		ArrayList<PurchaseDTO> dtos_account  = dao.select_account_ids();	// account_id
		ArrayList<PurchaseDTO> dtos_product  = dao.select_product_ids();	// product_id
		ArrayList<PurchaseDTO> dtos_company  = dao.select_company_ids();	// company_name
		ArrayList<PurchaseDTO> dtos_employee  = dao.select_employee_ids();	// employee_id
		
		model.addAttribute("dtos_account", dtos_account);
		model.addAttribute("dtos_product", dtos_product);
		model.addAttribute("dtos_company", dtos_company);
		model.addAttribute("dtos_employee", dtos_employee);
		
		System.out.println("  -> Complete Model dtos ...");
	
		model.addAttribute("Modify",1);
		model.addAttribute("purchase_id", purchase_id);
		
	}
	
	@Override
	public void modify_purchase_pro_service(Model model) {

		System.out.println("  -> modify_purchase_pro_service " );
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		// 공통코드
		String purchase_id = req.getParameter("purchase_id");
		String order_id = req.getParameter("order_id");
		String product_id = req.getParameter("product_id");
		String company_id = req.getParameter("company_id");
		String company_name = req.getParameter("company_name");
		int employee_id =  Integer.parseInt( req.getParameter("employee_id"));
		Date reg_date = req.getParameter("reg_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("reg_date")); 
		Date update_date = req.getParameter("update_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("update_date"));
		Date storage_in_date = req.getParameter("storage_in_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("storage_in_date"));
		int count_purchase = Integer.parseInt(req.getParameter("count_purchase") );
		int purchase_state = Integer.parseInt(req.getParameter("purchase_state") );
		int condition_note_payable = Integer.parseInt(req.getParameter("condition_note_payable") );
		
		// 가격 설정
		String supply_price = req.getParameter("supply_price");
		System.out.println( "supply_price : " + supply_price );

		Long price	=  Math.round(Double.parseDouble(req.getParameter("supply_price"))); 
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
		
		int cnt 	= 0;
		
		// 생성자 생성
		PurchaseDTO dto = new PurchaseDTO();
		dto.setPurchase_id(purchase_id);
		dto.setOrder_id(order_id);
		dto.setProduct_id(product_id);
		dto.setCompany_id(company_id);
		dto.setCompany_name(company_name);
		dto.setEmployee_id(employee_id);
		dto.setReg_date(reg_date);
		dto.setUpdate_date(update_date);
		dto.setStorage_in_date(storage_in_date);
		dto.setCount_purchase(count_purchase);
		dto.setPurchase_state(purchase_state);
		dto.setCondition_note_payable(condition_note_payable);
		System.out.println("  -> dto1: "+dto.toString());
		
		System.out.println("  -> 부가세 대수금 수정");
		dto.setPurchase_id(purchase_id);
		dto.setAccount_id("500011030000");
		dto.setSupply_price(tax);
		cnt = dao.update_purchase(dto);
		System.out.println("  -> 부가세 dto: "+dto.toString());
		if( cnt > 0 ) {
			System.out.println(" --> 업데이트 성공!");
			cnt++;
		}
		
		System.out.println("  -> 상품매입 수정");
		dto.setPurchase_id(purchase_id);
		dto.setAccount_id("500011050000");
		dto.setSupply_price(price);
		cnt = dao.update_purchase(dto);
		System.out.println("  -> 상품매출 dto: "+dto.toString());
		if( cnt > 0 ) {
			System.out.println(" --> 업데이트 성공!");
			cnt++;
		}
		
		System.out.println("  -> 매입채무 수정");
		dto.setPurchase_id(purchase_id);
		dto.setAccount_id("500012010000");
		dto.setSupply_price(sum);
		cnt = dao.update_purchase(dto);
		System.out.println("  -> 매출채권 dto: "+dto.toString());
		if( cnt > 0 ) {
			System.out.println(" --> 업데이트 성공!");
			cnt++;
		}
		
		model.addAttribute("cnt", cnt);
		System.out.println("  -> cnt 값 : " + cnt);
		
	}

	@Override
	public void detail_purchase_service(Model model) {
		
		System.out.println("  -> detail_purchase_service " );
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String purchase_id = req.getParameter("purchase_id");
		String purchase_state = req.getParameter("purchase_state");
		String account_id = req.getParameter("account_id");
		
		System.out.println("  -> purchase_id : "  + purchase_id);
		System.out.println("  -> purchase_state : "  + purchase_state);
		System.out.println("  -> account_id : "  + account_id);
		
		Map<String,Object> daoMap = new HashMap<>();
		daoMap.put("purchase_id", purchase_id);
		daoMap.put("account_id", account_id);
		
		ArrayList<PurchaseDTO> dtos = dao.select_detail_purchase(daoMap);
		/*System.out.println("  -> dtos : " + dtos.toString() );*/
		
		if( dtos != null ){
			System.out.println("  -> Complete value import ...");
			model.addAttribute("dtos", dtos);
			model.addAttribute("account_id", account_id);
			System.out.println("  -> account_id : "+ account_id );
			
		} else {	// 불러오기 실패
			System.out.println("  -> Error loading value...");
		}
		model.addAttribute("purchase_id", purchase_id);
		model.addAttribute("purchase_state", purchase_state);

	}

	@Override
	public void detail_purchase_pro_service(Model model) {

		System.out.println("  -> detail_purchase_pro_service " );
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String req_kind = req.getParameter("req_kind");
		int update_cnt = 0;
		if( req_kind.equals("storage_in") ){
			System.out.println("  -> Request a Storage In...");
			
			// 상품매입(500011050000)만 23203(구매전표승인완료)에서 23204(구매입고요청)으로 바꿈
			String purchase_id = req.getParameter("purchase_id");
			Map<String, Object> daoMap = new HashMap<>();
			System.out.println("  -> purchase_id : " + purchase_id);
			daoMap.put("purchase_id", purchase_id);
			daoMap.put("account_id", "500011050000");
			daoMap.put("purchase_state", 23204);
			update_cnt = dao.update_req_storage_in(daoMap);
			System.out.println("  -> update_cnt : " + update_cnt);
		}
		model.addAttribute("cnt", update_cnt);
	}

	
	@Override
	public void reg_purchase_service(Model model) {
		System.out.println("  -> reg_purchase_service");
	
		ArrayList<PurchaseDTO> product_ids = new ArrayList<>();
		ArrayList<PurchaseDTO> company_ids = new ArrayList<>();
		ArrayList<PurchaseDTO> employee_ids = new ArrayList<>();
		ArrayList<PurchaseDTO> account_ids = new ArrayList<>();
		
		product_ids = dao.select_product_ids();
		company_ids = dao.select_company_ids();
		employee_ids = dao.select_employee_ids();
		account_ids = dao.select_account_ids();
		
		model.addAttribute("product_ids",product_ids);
		model.addAttribute("company_ids",company_ids);
		model.addAttribute("employee_ids",employee_ids);
		model.addAttribute("account_ids",account_ids);
	}

	@Override
	public void reg_purchase_service_pro(Model model) {
		
		System.out.println("  -> reg_purchase_service_pro...");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		// 입력된 변수 받기 
		String account_id = req.getParameter("account_id");
		String product_id = req.getParameter("product_id");
		
		String company_id = req.getParameter("company_id");
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		Date reg_date = req.getParameter("reg_date") == "" ?
				new Date(0) : Date.valueOf(req.getParameter("reg_date"));
		Date storage_in_date = req.getParameter("storage_in_date") == "" ?
				new Date(0) : Date.valueOf(req.getParameter("storage_in_date"));
		int count_purchase = Integer.parseInt( req.getParameter("count_purchase") ); 
		Long supply_price = Long.parseLong( req.getParameter("supply_price") );
		int condition_note_payable = Integer.parseInt( req.getParameter("condition_note_payable") );
		String order_id = req.getParameter("order_id");
		
		// 생성자 생성
		PurchaseDTO dto = new PurchaseDTO();
		dto.setAccount_id(account_id);
		dto.setProduct_id(product_id);
		dto.setCompany_id(company_id);
		dto.setEmployee_id(employee_id);
		dto.setReg_date(reg_date);
		dto.setStorage_in_date(storage_in_date);
		dto.setCount_purchase(count_purchase);
		dto.setSupply_price(supply_price);
		dto.setCondition_note_payable(condition_note_payable);
		
		dto.setOrder_id(order_id);
		
		System.out.println("  -> dto : "+dto.toString());
		
		// DB에 값 입력 : INSERT PURCHASE_ORDER
		int purchase_cnt = dao.insert_reg_purchase(dto);
		
		if( purchase_cnt == 1 ){
			System.out.println("  -> Insert Success...");

		} else {
			System.out.println("  -> Error during Insert...");
		}
		
		model.addAttribute("cnt",purchase_cnt);
	
	}
	
	@Override
	public void reg_purchase_table(Model model) {
		
		System.out.println("  -> reg_purchase_table...");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");

		// 기본키 불러오기
		String purchase_id = dao.select_purchase_id();
		System.out.println("  -> purchase_id : " + purchase_id);
		
		// 입력된 변수 받기 
		String product_id = req.getParameter("product_id");
		String company_id = req.getParameter("company_id");
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		Date reg_date = req.getParameter("reg_date") == "" ?
			new Date(0) : Date.valueOf(req.getParameter("reg_date"));
		Date storage_in_date = req.getParameter("storage_in_date") == "" ?
			new Date(0) : Date.valueOf(req.getParameter("storage_in_date"));
		int count_purchase = Integer.parseInt( req.getParameter("count_purchase") ); 
		Long supply_price = Long.parseLong( req.getParameter("supply_price") );
		int purchase_state = Integer.parseInt(req.getParameter("purchase_state"));
		int condition_note_payable = Integer.parseInt( req.getParameter("condition_note_payable") );
		
		// 생성자 생성
		PurchaseDTO dto = new PurchaseDTO();
		dto.setPurchase_id(purchase_id);
		dto.setProduct_id(product_id);
		dto.setCompany_id(company_id);
		dto.setEmployee_id(employee_id);
		dto.setReg_date(reg_date);
		dto.setStorage_in_date(storage_in_date);
		dto.setCount_purchase(count_purchase);
		dto.setSupply_price(supply_price);
		dto.setPurchase_state(purchase_state);
		dto.setCondition_note_payable(condition_note_payable);

		// 가격 계산 ( 구매가, 부가세, 총합 )
		int cnt = 0;	
		long price = supply_price;
		long tax = price/10;
		long sum = price + tax;
		
		// 상품매입 insert , 가격 x 수량
		dto.setAccount_id("500011050000");
		dto.setSupply_price(price);
		System.out.println("  -> price : " + price );
		
		// purchase_order insert 구매 내역 입력
		int product_cnt = dao.insert_reg_purchase(dto);	
		if( product_cnt > 0 ){
			System.out.println("  -> product_cnt insert Complete... ");
			cnt = 1;
		}
		
		// 부가세대급금 insert , 부가세 10%
		dto.setAccount_id("500011030000");
		dto.setSupply_price(tax);
		System.out.println("  -> tax : " + tax );
		
		// purchase_order insert 구매 내역 입력
		int tax_cnt = dao.insert_reg_purchase(dto);
		if( tax_cnt > 0 ){
			System.out.println("  -> tax_cnt insert Complete... ");
			cnt = 2;
		}
		
		// 매입채무 insert , 상품매입 + 부가세
		dto.setAccount_id("500012010000");
		dto.setSupply_price(sum);
		System.out.println("  -> sum : " + sum );
		
		// purchase_order insert 구매 내역 입력
		int debt_cnt = dao.insert_reg_purchase(dto);
		if( debt_cnt > 0 ){
			System.out.println("  -> setAccount_id insert Complete... ");
			cnt = 3;
		}
		
		if ( cnt == 3 ){
			
			// 리스트를 만들어서 결과값을 담음
			List<PurchaseDTO> vos = new ArrayList<>();
			product_id = dto.getPurchase_id();
			vos = dao.select_purchase_order(product_id);
			model.addAttribute("vos", vos);
			
			// System.out.println( vos.toString() );
		}
		
		model.addAttribute("cnt", cnt);

		
	}

	
	@Override
	public void reg_purchase_search_service(Model model) {
		
		System.out.println("  -> reg_purchase_search_service...");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		
		
	}
	
	
}
		

