package com.pro.myrp.service.purchase;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.domain.accounting_management.Purchase_statementVO;
import com.pro.myrp.domain.base_registration.Order_stateVO;
import com.pro.myrp.domain.purchase_management.PU_stockorderVO;
import com.pro.myrp.domain.purchase_management.PurchaseDTO;
import com.pro.myrp.domain.sales_management.SA_stockorderVO;
import com.pro.myrp.domain.sales_management.SalesDTO;
import com.pro.myrp.persistence.purchase.purchaseDAO;

@Service
public class purchaseServiceImpl implements purchaseService,CodeMyRP {

	@Inject
	private purchaseDAO dao;

	// 구매 입력 
	@Override
	public void reg_purchase_service(Model model) {
		System.out.println("  -> reg_purchase_service");
	
		ArrayList<PurchaseDTO> product_ids = new ArrayList<>();
		ArrayList<PurchaseDTO> company_ids = new ArrayList<>();
		ArrayList<PurchaseDTO> employee_ids = new ArrayList<>();
		
		product_ids = dao.select_product_ids();
		company_ids = dao.select_company_ids();
		employee_ids = dao.select_employee_ids();
		
		model.addAttribute("product_ids",product_ids);
		model.addAttribute("company_ids",company_ids);
		model.addAttribute("employee_ids",employee_ids);
	}
	
	@Override
	public void reg_purchase_table(Model model) {
		
		System.out.println("  -> reg_purchase_table...");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");

		
		
		String purchase_id = dao.select_purchase_id();
		String product_id = req.getParameter("product_id");
		String company_id = req.getParameter("company_id");
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		Date reg_date = req.getParameter("reg_date") == "" ? new Date(0) : Date.valueOf(req.getParameter("reg_date"));
		Date storage_in_date = req.getParameter("storage_in_date") == "" ? new Date(0) : Date.valueOf(req.getParameter("storage_in_date"));
		int count_purchase = Integer.parseInt( req.getParameter("count_purchase") ); 
		count_purchase = Math.abs(count_purchase);
		Long supply_price = Long.parseLong( req.getParameter("supply_price") );
		int purchase_state = Integer.parseInt(req.getParameter("purchase_state"));
		int condition_note_payable = Integer.parseInt( req.getParameter("condition_note_payable") );
		
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
		
		// 오더 아이디가 있을 경우
		if( req.getParameter("order_id") != null ){
			String order_id = req.getParameter("order_id");
			dto.setOrder_id(order_id);
			
		} else {
			dto.setOrder_id("0");
		}

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

		// 리스트를 만들어서 결과값을 담음
		ArrayList<PurchaseDTO> dtos = new ArrayList<>();
		dtos = dao.select_reg_purchases(purchase_id);
		
		model.addAttribute("dtos", dtos);
		model.addAttribute("cnt", cnt);
	}
	
	@Override
	public void search_reg_purchase_service(Model model) {
		
		System.out.println("  -> search_reg_purchase_service...");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int cnt =0;
		cnt = dao.select_lack_reg_purchase_cnt();
		
		
		/*-----------------------------------------------------*/
		
		System.out.println("  -> 알람처리 실행!");
		List<Order_stateVO> orderVos = new ArrayList<>();
		orderVos = dao.select_request_purchase();
		for(int i=0; i<orderVos.size(); i++) {
			Order_stateVO orderVo = orderVos.get(i);
			String statement_id = orderVo.getOrder_id();
			List<SA_stockorderVO> tempVos = dao.select_sales_statement(statement_id);
			
			for(int j=0; j<tempVos.size(); j++) {
				SA_stockorderVO tempVo = tempVos.get(j);
				String sales_id = tempVo.getStock_order_type();
				
				Map<String, Object> daoMap = new HashMap<>();
				daoMap.put("sales_id", sales_id);
				daoMap.put("account_id", "500014030000");
				/*PurchaseDTO purchasedto = dao.select_search_purchase_order(daoMap);*/
				SalesDTO salesdto = dao.select_search_sales_order(daoMap);
				System.out.println("  -> salesdto_state() : " + salesdto.getSales_state() );
				
				if(salesdto.getSales_state() == request_sales_storage_out_warehouse) {
					daoMap.clear();
					daoMap.put("order_id", statement_id);
					daoMap.put("order_state", 0);
					System.out.println("  -> daoMap: " + daoMap.toString() );
					int dao_cnt = dao.update_order_state(daoMap);
					System.out.println("  -> dao_cnt : " + dao_cnt );
					
				}
			}
		}
		System.out.println("  -> 알람처리 종료!");
		
		/*-----------------------------------------------------*/
		
		
		req.setAttribute("cnt",cnt);
		
	}
	
	@Override
	public void search_reg_purchase_table_service(Model model) {
	System.out.println("  -> search_reg_purchase_table_service...");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");

		int start = 0;
		int end	= 0;
		int cnt	= 0;
		int pageSize	= 5;
		String pageNum	= null;
		int currentPage	= 0;
		
		cnt = (Integer) req.getAttribute("cnt");
		System.out.println(" -> table cnt : " + cnt );

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
			
			ArrayList<PurchaseDTO> dtos = new ArrayList<>();
			dtos = dao.select_lack_reg_purchase(daoMap);
			model.addAttribute("dtos",dtos);

		}
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum",pageNum);
			
	}
	
	@Override
	public void search_reg_purchase_page_service(Model model) {
	System.out.println("  -> search_reg_purchase_page_service...");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize	= 5;
		int pageBlock	= 5;
		int start		= 0;
		int end			= 0;
		int cnt 		= 0;
		int number		= 0;
		String pageNum	= null;
		int currentPage	= 0;
		int pageCount	= 0;
		int	startPage	= 0;
		int endPage		= 0;
		
		cnt = (Integer) req.getAttribute("cnt");
		System.out.println(" -> page cnt : " + cnt );
		
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
		
		System.out.println("  -> page pageNum : " + pageNum);
		
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

	public void search_reg_purchase_pro_service(Model model) {
		System.out.println("  -> search_reg_purchase_service...");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");	
		
		String stock_order_id = req.getParameter("stock_order_id");
		System.out.println("  -> stock_order_id : " + stock_order_id);
		
		PurchaseDTO dto = dao.select_reg_purchase_pro(stock_order_id);
		
		if( dto != null ){
			System.out.println("  -> Loadging Complete...");
			model.addAttribute("dto",dto);
			model.addAttribute("leck_cnt",1);
			
		} else {
			System.out.println("  -> Loadging Error...");
			model.addAttribute("leck_cnt",0);
		}

	}

	public void list_approval_pay_service(Model model){
		
		System.out.println("  -> list_approval_pay_service...");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		// 우선 상태 코드 업데이트
		Map<String,Object> daoMap = new HashMap<>();
		daoMap.put("before_state", request_payments);	// 상황 요청
		daoMap.put("after_state", approval_payments);	// 상황 승인
		
		int update_cnt = dao.update_purchase_state(daoMap);
		System.out.println("  -> approval_pay update_cnt : " + update_cnt);
		
		int cnt = dao.select_purchase_state_cnt(daoMap);
		System.out.println("  -> approval_pay Search Cnt : " + cnt);
		
		/*-----------------------------------------------------*/
		
		System.out.println("  -> 상환 요청 알람처리 실행!");
		List<Order_stateVO> orderVos = new ArrayList<>();
		orderVos = dao.select_statements_approval();
		for(int i=0; i<orderVos.size(); i++) {
			Order_stateVO orderVo = orderVos.get(i);
			String statement_id = orderVo.getOrder_id();
			List<Purchase_statementVO> tempVos = dao.select_purchase_statement(statement_id);
			
			for(int j=0; j<tempVos.size(); j++) {
				Purchase_statementVO tempVo = tempVos.get(j);
				String purchase_id = tempVo.getPurchase_id();
				String account_id = tempVo.getAccount_id();
				daoMap.clear();
				daoMap.put("purchase_id", purchase_id);
				daoMap.put("account_id", account_id);
				
				PurchaseDTO purchaseDTO = dao.select_search_purchase_order(daoMap);
				System.out.println("  -> alert_state() : " + purchaseDTO.getPurchase_state() );
				
				if(purchaseDTO.getPurchase_state() == approval_payments) {
					daoMap.clear();
					daoMap.put("order_id", statement_id);
					daoMap.put("order_state", 0);
					System.out.println("  -> daoMap: " + daoMap.toString() );
					int dao_cnt = dao.update_order_state(daoMap);
					System.out.println("  -> dao_cnt : " + dao_cnt );
				}
			}
		}
		System.out.println("  -> 알람처리 종료!");
		
		/*-----------------------------------------------------*/
		
		// 목록 출력이니 테이블로 만들자
		int pageSize	= 5;
		int pageBlock	= 5;
		int start		= 0;
		int end			= 0;
		int number		= 0;
		String pageNum	= null;
		int currentPage	= 0;
		int pageCount	= 0;
		int	startPage	= 0;
		int endPage		= 0;
		
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
		
		System.out.println("  -> start & end page : " + start +"/ "+ end);
		
		if(cnt > 0) {
			System.out.println("  -> Complete import cnt ...");
			
			model.addAttribute("cnt", cnt);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
			
			daoMap.clear();
			daoMap.put("start", start);
			daoMap.put("end", end);
			daoMap.put("state", approval_payments);
			
			ArrayList<PurchaseDTO> dtos = new ArrayList<>();
			dtos = dao.select_purchase_state(daoMap);
			model.addAttribute("dtos",dtos);
		}
		
	}

	public void list_complete_pay_service(Model model){

		System.out.println("  -> list_complete_pay_service...");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		// 우선 상태 코드 업데이트
		Map<String,Object> daoMap = new HashMap<>();
		daoMap.put("before_state", approval_payments);	// 상황 요청
		daoMap.put("after_state", complete_payments);	// 상황 완료
		
		int update_cnt = dao.update_purchase_state(daoMap);
		System.out.println("  -> complete_pay update_cnt : " + update_cnt);
		
		int cnt = dao.select_purchase_state_cnt(daoMap);
		System.out.println("  -> complete_pay Search Cnt : " + cnt);
		
		daoMap.put("after_state", purchase_deadline);	// 마감
		int temp_cnt = dao.select_purchase_state_cnt(daoMap);
		System.out.println("  -> complete_pay Search temp_cnt: " + temp_cnt);
		
		cnt = cnt + temp_cnt;
		
		
		// 목록 출력이니 테이블로 만들자
		int pageSize	= 5;
		int pageBlock	= 5;
		int start		= 0;
		int end			= 0;
		int number		= 0;
		String pageNum	= null;
		int currentPage	= 0;
		int pageCount	= 0;
		int	startPage	= 0;
		int endPage		= 0;
		
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
		System.out.println("  -> start & end page : " + start +"/ "+ end);
		
		ArrayList<PurchaseDTO> dtos = new ArrayList<>();
		
		if(cnt > 0) {
			System.out.println("  -> Complete import cnt ...");
			
			model.addAttribute("cnt", cnt);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("pageBlock", pageBlock);
			model.addAttribute("pageCount", pageCount);
			model.addAttribute("currentPage", currentPage);
			
			daoMap.clear();
			daoMap.put("start", start);
			daoMap.put("end", end);
			daoMap.put("state", "(23209,23299)" );
			
			dtos = dao.select_purchase_state(daoMap);
			model.addAttribute("dtos",dtos);
		}
		
	}
	
	
	
	
	// 구매 검색
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
		} else if (search_str.equals ("pay")) {
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
			
			/*-----------------------------------------------------*/
			
			System.out.println("  -> 알람처리 실행!");
			List<Order_stateVO> orderVos = new ArrayList<>();
			orderVos = dao.select_statements_approval();
			for(int i=0; i<orderVos.size(); i++) {
				Order_stateVO orderVo = orderVos.get(i);
				String statement_id = orderVo.getOrder_id();
				List<Purchase_statementVO> tempVos = dao.select_purchase_statement(statement_id);
				
				for(int j=0; j<tempVos.size(); j++) {
					Purchase_statementVO tempVo = tempVos.get(j);
					String purchase_id = tempVo.getPurchase_id();
					String account_id = tempVo.getAccount_id();
					
					Map<String, Object> daoMap = new HashMap<>();
					daoMap.put("purchase_id", purchase_id);
					daoMap.put("account_id", account_id);
					PurchaseDTO purchasedto = dao.select_search_purchase_order(daoMap);
					System.out.println("  -> salesdto_state() : " + purchasedto.getPurchase_state() );
					
					if(purchasedto.getPurchase_state() == complete_approval_purchase_statement) {
						daoMap.clear();
						daoMap.put("order_id", statement_id);
						daoMap.put("order_state", 0);
						System.out.println("  -> daoMap: " + daoMap.toString() );
						int dao_cnt = dao.update_order_state(daoMap);
						System.out.println("  -> dao_cnt : " + dao_cnt );
					}
				}
			}
			System.out.println("  -> 알람처리 종료!");
			
			/*-----------------------------------------------------*/
			
			

		// 창고 입고 완료 일경우
		} else if (search_check == 3) {

			System.out.println("  -> Stock_Out...");
			int update_cnt = dao.update_stock_in_purchase();
			System.out.println("  -> update_cnt : " + update_cnt);

			cnt = dao.select_stock_in_purchase_cnt();
			System.out.println("  -> Search Cnt : " + cnt);
			
			
			/*-----------------------------------------------------*/
			
			System.out.println("  -> 알람처리 실행!");
			List<Order_stateVO> orderVos = new ArrayList<>();
			orderVos = dao.select_complete_storage_in();
			for(int i=0; i<orderVos.size(); i++) {
				Order_stateVO orderVo = orderVos.get(i);
				String statement_id = orderVo.getOrder_id();
				List<PU_stockorderVO> tempVos = dao.select_purchase_stockorder(statement_id);
				
				for(int j=0; j<tempVos.size(); j++) {
					PU_stockorderVO tempVo = tempVos.get(j);
					String purchase_id = tempVo.getStock_order_type();
					
					Map<String, Object> daoMap = new HashMap<>();
					daoMap.put("purchase_id", purchase_id);
					daoMap.put("account_id", account_purchase_of_product);
					PurchaseDTO purchasedto = dao.select_search_purchase_order(daoMap);
					System.out.println("  -> salesdto_state() : " + purchasedto.getPurchase_state() );
					
					if(purchasedto.getPurchase_state() == complete_purchase_storage_in_warehouse) {
						daoMap.clear();
						daoMap.put("order_id", statement_id);
						daoMap.put("order_state", 0);
						System.out.println("  -> daoMap: " + daoMap.toString() );
						int dao_cnt = dao.update_order_state(daoMap);
						System.out.println("  -> dao_cnt : " + dao_cnt );
						
					}
				}
			}
			System.out.println("  -> 알람처리 종료!");
			
			/*-----------------------------------------------------*/
			

		// 지급완료 조회
		} else if (search_check == 4) {
			System.out.println("  -> Search_Complete_pay...");
			int update_cnt = dao.update_complete_pay_purchase();
			
			/*String purchase_id = ;
			
			Map<String,Object> daoMap = new HashMap<>();
			daoMap.put("purchase_id", purchase_id);
			daoMap.put("account_id", account_debt_of_sales );
			daoMap.put("complete_approval_purchase_statement", complete_approval_purchase_statement);
			daoMap.put("complete_payments", complete_payments);
			*/
			
			System.out.println("  -> update_cnt : " + update_cnt);
			cnt = dao.select_checkout_purchase_cnt();
			System.out.println("  -> Search Cnt : " + cnt);
			
			
		// 구매 승인 요청일 경우
		} else if (search_check == 99) {
			System.out.println("  -> Search_Checkout...");
			cnt = dao.select_checkout_purchase_cnt();
			System.out.println("  -> Search Cnt : " + cnt);

		} 
		
		else {
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
				System.out.println("  -> Search_Complete_pay List  ...");
				dtos = dao.select_complete_pay_purchase_list(daoMap);
				model.addAttribute("dtos", dtos);
				
				
			} else if ( search_check == 99 ){
				
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
			
			model.addAttribute("cnt", cnt);
			
		} else{
			System.out.println("  -> Cnt is Zero...");
			model.addAttribute("cnt", -1);
		}
		model.addAttribute("check",search_check);
		
		
		
	}

	@Override
	public void purchase_list_page_servie(Model model) {
		System.out.println("  -> purchase_list_page_servie " );
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize	= 5;
		int pageBlock	= 5;
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
		
		} else {
			System.out.println("  -> Cnt is Zero...");
			model.addAttribute("nocnt", 0);
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
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat cal_f = new SimpleDateFormat("yyyy-MM-dd");
		String now = cal_f.format(cal.getTime());
		
		
		// 공통코드
		String purchase_id = req.getParameter("purchase_id");
		String order_id = req.getParameter("order_id");
		String product_id = req.getParameter("product_id");
		String company_id = req.getParameter("company_id");
		String company_name = req.getParameter("company_name");
		int employee_id =  Integer.parseInt( req.getParameter("employee_id"));
		Date reg_date = req.getParameter("reg_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("reg_date")); 
		Date storage_in_date = req.getParameter("storage_in_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("storage_in_date"));
		int count_purchase = Integer.parseInt(req.getParameter("count_purchase") );
		int purchase_state = Integer.parseInt(req.getParameter("purchase_state") );
		int condition_note_payable = Integer.parseInt(req.getParameter("condition_note_payable") );
		
		// 가격 설정
		String supply_price = req.getParameter("supply_price");
		System.out.println( "  -> supply_price : " + supply_price );
		supply_price = supply_price.replace("￦","");
		supply_price = supply_price.replace(",","");
		
		Long price	=  Math.round(Double.parseDouble(supply_price)); 
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
		dto.setUpdate_date( Date.valueOf(now) );
		dto.setStorage_in_date(storage_in_date);
		dto.setCount_purchase(count_purchase);
		dto.setPurchase_state(purchase_state);
		dto.setCondition_note_payable(condition_note_payable);
		System.out.println("  -> dto: "+dto.toString());
		
		System.out.println("  -> 부가세 대수금 수정");
		dto.setPurchase_id(purchase_id);
		dto.setAccount_id("500011030000");
		dto.setSupply_price(tax);
		cnt = dao.update_purchase(dto);
		System.out.println("  -> 부가세 dto: "+dto.toString());
		if( cnt > 0 ) {
			System.out.println(" --> 업데이트 성공!");
			++cnt;
		}
		
		System.out.println("  -> 상품매입 수정");
		dto.setPurchase_id(purchase_id);
		dto.setAccount_id("500011050000");
		dto.setSupply_price(price);
		cnt = dao.update_purchase(dto);
		System.out.println("  -> 상품매출 dto: "+dto.toString());
		if( cnt > 0 ) {
			System.out.println(" --> 업데이트 성공!");
			++cnt;
		}
		
		System.out.println("  -> 매입채무 수정");
		dto.setPurchase_id(purchase_id);
		dto.setAccount_id("500012010000");
		dto.setSupply_price(sum);
		cnt = dao.update_purchase(dto);
		System.out.println("  -> 매출채권 dto: "+dto.toString());
		if( cnt > 0 ) {
			System.out.println(" --> 업데이트 성공!");
			++cnt;
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
		int insert_cnt = 0;
		int pay_diff = 0;
		String purchase_id = "";
		Date pay_date = null;
		PurchaseDTO dto = null;
		ArrayList<PurchaseDTO> dtos = new ArrayList<>();
		
		// 창고 입고 확인
		if( req_kind.equals("storage_in") ){
			System.out.println("  -> Request a Storage In...");
			
			// 상품매입(500011050000)만 23203(구매전표승인완료)에서 23204(구매입고요청)으로 바꿈
			purchase_id = req.getParameter("purchase_id");
			System.out.println("  -> purchase_id : " + purchase_id);
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("purchase_id", purchase_id);
			daoMap.put("account_id", account_purchase_of_product);	// 상품매입
			daoMap.put("purchase_state", 23204);		// 입고 요청
			update_cnt = dao.update_req_storage_in(daoMap);
			System.out.println("  -> update_cnt : " + update_cnt);
			model.addAttribute("update_cnt", update_cnt);
		}
		
		// 지급 날짜 , 남은 날짜 확인
		if( req_kind.equals("pay_date") ){
			
			// 수금기간을 조회 구매번호롸 상품매입(500011050000)을 사용하여 지급일을 계산
			purchase_id = req.getParameter("purchase_id");
			System.out.println("  -> purchase_id : " + purchase_id);
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("purchase_id", purchase_id);
			daoMap.put("account_id", "500012010000");	// 매입 채무
			daoMap.put("before_state", 23202);
			daoMap.put("after_state", 23206);
			
			// 상태 변경 ( 입고완료 23205 -> 지급 대기 23206  )
			update_cnt = dao.update_state(daoMap);
			
			if(update_cnt > 0){
				
				// 지급 날짜 불러오기
				pay_date = dao.select_purchase_pay_date(daoMap);
				System.out.println("  -> pay_date : " + pay_date);
				model.addAttribute("pay_date", pay_date);
				
				// 남은 날짜 불러오기
				pay_diff = dao.select_purchase_pay_diff(daoMap);
				System.out.println("  -> pay_diff : " + pay_diff);
				model.addAttribute("pay_diff", pay_diff);
				
			} else{
				System.out.println("  -> Update Cnt is Zero... ");
			}
			
			model.addAttribute("cnt", update_cnt);
		}
		
		// 지급  확인 버튼
		if( req_kind.equals("req_repay") ){
			
			System.out.println("  -> Req_Repay... ");
			
			// 현금(500011010000)과 매입채무(500012010000) 채권 생성 , 둘다 가격은 마이너스
			purchase_id = "";
			purchase_id = req.getParameter("purchase_id");
			System.out.println("  -> purchase_id : " + purchase_id);
			
			
			// 기존 구매 정보 상태변경 ( 23205 -> 23206 | 입고완료 ->  상환대기 )
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("purchase_id", purchase_id);
			daoMap.put("account_id", account_purchase_of_product  );	// 상품매입
			daoMap.put("after_state", wait_payments );					// 상환대기 23206
			update_cnt = dao.update_state_force(daoMap);
			
			// 정보 불러오기
			dto = dao.select_purchase(purchase_id);
			
			Long price = dto.getSupply_price();
			System.out.println( "  -> price : " + price );
			
			// 공통사항 설정
			dto.setPurchase_id(dao.select_purchase_id());
			dto.setSupply_price(-price);					// 가격 마이너스 설정
			dto.setPurchase_state(request_payments);		// 23207 상환요청
			dto.setOrder_id("0");
			
			// 매입채무 계정 설정
			dto.setAccount_id(account_debt_of_sales);
			insert_cnt = dao.insert_reg_purchase(dto);
			if(insert_cnt != 0 ) ++insert_cnt; 
			dtos.add(dto);
			
			// 현금 계정 설정
			dto.setAccount_id(account_cash);
			insert_cnt = dao.insert_reg_purchase(dto);
			if(insert_cnt != 0 ) ++insert_cnt;
			dtos.add(dto);
			
			System.out.println("  -> insert_cnt : " + insert_cnt);
			
			model.addAttribute("insert_cnt", insert_cnt);
			model.addAttribute("dtos", dtos);
		}
		
		// 상환 완료 하기 버튼
		if( req_kind.equals("req_complete_pay") ){
			
			System.out.println("  -> REQ_COMPLETE_PAY... ");
			
			purchase_id = req.getParameter("purchase_id");
			System.out.println("  -> purchase_id : " + purchase_id);
			
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.clear();
			daoMap.put("purchase_id", purchase_id);
			daoMap.put("account_id1", account_cash);
			daoMap.put("account_id2", account_debt_of_sales );
			daoMap.put("after_state", 23209);
			update_cnt = dao.update_state_force2(daoMap);
			System.out.println("  -> update_cnt : " + update_cnt);
			model.addAttribute("update_cnt", update_cnt);
			
		}
		
		// 상환 완료하고 구매통장 계산 
		if( req_kind.equals("req_purchase_bank") ){
			
			System.out.println("  -> REQ_COMPLETE_PAY... ");
			
			purchase_id = req.getParameter("purchase_id");
			System.out.println("  -> purchase_id : " + purchase_id);
			
			Map<String,Object> daoMap = new HashMap<>();
			daoMap.clear();
			daoMap.put("purchase_id",purchase_id);
			ArrayList<PurchaseDTO> bank_dtos = dao.select_detail_purchase(daoMap);
			
			int state = bank_dtos.get(0).getPurchase_state();
			System.out.println("  -> state :" + state);
			
			Long price = null;
			int purchase_bank_cnt = 0;
			if( state == complete_payments ){
				
				System.out.println("  -> Purchase_account_Update... ");
				
				price = bank_dtos.get(0).getSupply_price();
				int conunt = bank_dtos.get(0).getCount_purchase();
				price = price * conunt;
				price = Math.abs(price);
				daoMap.put("price",price);
				daoMap.put("account_id",account_debt_of_sales);
				
				// 구매통장 업데이트
				purchase_bank_cnt = dao.update_purchase_bank(daoMap); 
				System.out.println("  -> purchase_bank_cnt : " + purchase_bank_cnt);
				
				// 상태 업데이트
				int update_state = purchase_deadline;
				bank_dtos.get(1).setPurchase_state(update_state);
				update_cnt = dao.update_purchase( bank_dtos.get(1) );
				System.out.println("  -> update_cnt :" + update_cnt);
				
				model.addAttribute("purchase_bank_cnt",purchase_bank_cnt);
				model.addAttribute("price",price);
				
			} else {
				System.out.println("  -> Cnt is Zero... ");
			}
				model.addAttribute("purchase_bank_cnt",purchase_bank_cnt);
				model.addAttribute("price",price);
		}

	}

	

	
	
	// 구매 현황
	
	@Override
	public void search_status_purchase_service(Model model) {
		
		System.out.println("  -> search_status_sales_service " );

		ArrayList<PurchaseDTO> product_ids = new ArrayList<>();
		ArrayList<PurchaseDTO> company_ids = new ArrayList<>();
		ArrayList<PurchaseDTO> employee_ids = new ArrayList<>();
		ArrayList<PurchaseDTO> account_ids = new ArrayList<>();
		
		product_ids = dao.select_product_ids();
		company_ids = dao.select_company_ids();
		employee_ids = dao.select_employee_ids();
		account_ids = dao.select_account_ids();
		
		System.out.println("  -> product_ids :" + product_ids.toString());
		
		
		model.addAttribute("product_ids",product_ids);
		model.addAttribute("company_ids",company_ids);
		model.addAttribute("employee_ids",employee_ids);
		model.addAttribute("account_ids",account_ids);
	}


	
}
