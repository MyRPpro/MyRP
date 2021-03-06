package com.pro.myrp.service.sales;

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
import com.pro.myrp.domain.accounting_management.Sales_statementVO;
import com.pro.myrp.domain.base_registration.Order_stateVO;
import com.pro.myrp.domain.sales_management.SA_stockorderVO;
import com.pro.myrp.domain.sales_management.SalesDTO;
import com.pro.myrp.persistence.sales.SalesDAO;



@Service
public class SalesServiceImpl implements SalesService,CodeMyRP  {

	@Inject
	private SalesDAO dao;
	
	
	@Override
	public void sales_list_servie(Model model) {
		System.out.println("  -> sales_list_servie " );
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String search_str = null;
		int search_check = 0;
		int cnt = 0;
		
		// 검색 종류 설정
		if( req.getParameter("search_str").equals("all") ){
			search_check = 0;
		} else if( req.getParameter("search_str").equals("account")){
			search_check = 2;
		} else if( req.getParameter("search_str").equals("account_c")){
			search_check = 3;
		} else if( req.getParameter("search_str").equals("out_c")){
			search_check = 5;
		} else if( req.getParameter("search_str").equals("receive_c")){
			search_check = 7;
		} else if( req.getParameter("search_str") != null && req.getParameter("search_str") != "" ){
			search_check = 1;
		}

		// 검색어가 있을 경우
		if( search_check == 1 ){
			search_str = req.getParameter("search_str");
			req.setAttribute("search_str",search_str);
			
			// 개수 구하기
			cnt = dao.count_quick_serch_sales(search_str);
		
		// 전표 조회일 경우
		} else if (search_check == 2 ){
			System.out.println("  -> Account_Approve");
			int update_cnt = dao.update_account_approve_serch_sales();
			System.out.println("  -> update_cnt : "+ update_cnt);
			cnt = dao.select_count_approve_sales();
			System.out.println("  -> Search Cnt : " + cnt );
			
		} else if (search_check == 3 ){
			System.out.println("  -> Account_Approve");
			
			// 추가사항 시작 : 가격이 양수면 승인처리 가격이 음수면 마감처리  //
			
			int update_cnt = dao.update_account_approve_serch_sales();
			/*
			price > 0 -> 22214
			price < 0 -> 22215
			*/
			// 추가사항 종료 //
			
			System.out.println("  -> update_cnt : "+ update_cnt);
			cnt = dao.select_count_approve_sales();
			System.out.println("  -> Search Cnt : " + cnt );
			
			/*-----------------------------------------------------*/
			
			System.out.println("  -> 알람처리 실행!");
			List<Order_stateVO> orderVos = new ArrayList<>();
			orderVos = dao.select_statements_approval();
			for(int i=0; i<orderVos.size(); i++) {
				Order_stateVO orderVo = orderVos.get(i);
				String statement_id = orderVo.getOrder_id();
				List<Sales_statementVO> tempVos = dao.select_sales_statement(statement_id);
				
				if(tempVos != null) {
					for(int j=0; j<tempVos.size(); j++) {
						Sales_statementVO tempVo = tempVos.get(j);
						String sales_id = tempVo.getSales_id();
						String account_id = tempVo.getAccount_id();
						Map<String, Object> daoMap = new HashMap<>();
						
						daoMap.put("sales_id", sales_id);
						daoMap.put("account_id", account_id);
						SalesDTO salesdto = dao.select_search_sales_order(daoMap);
						System.out.println("  -> salesdto.getSales_state() : " + salesdto.getSales_state());
						if(salesdto.getSales_state() == complete_approval_sales_statement ||
								salesdto.getSales_state() == deadline	) {
							daoMap.clear();
							daoMap.put("order_id", statement_id);
							daoMap.put("order_state", 0);
							System.out.println("  -> daoMap: " + daoMap.toString() );
							int dao_cnt = dao.update_order_state(daoMap);
							System.out.println("  -> dao_cnt : " + dao_cnt );
							/*
							daoMap.put("sales_state", complete_approval_sales_statement);
							*/
							
						}
					}
				}
			}
			System.out.println("  -> 알람처리 종료!");
			
			/*-----------------------------------------------------*/

		// 창고 출고 완료 일경우
		} else if(search_check == 5 ){
			
			System.out.println("  -> Stock_Out");
			int update_cnt = dao.update_stock_out_serch_sales(complete_sales_storage_out_warehouse);
			System.out.println("  -> update_cnt : "+ update_cnt);
			
			cnt = dao.select_count_stock_out_sales();
			System.out.println("  -> Search Cnt : " + cnt );
			
			/*-----------------------------------------------------*/
			
			System.out.println("  -> 알람처리 실행!");
			List<Order_stateVO> orderVos = new ArrayList<>();
			orderVos = dao.select_storage_out();
			
			for(int i=0; i<orderVos.size(); i++) {
				Order_stateVO orderVo = orderVos.get(i);
				String stock_order_id = orderVo.getOrder_id();
				
				SA_stockorderVO tempVo = dao.select_stock_order_all(stock_order_id);
				String sales_id = tempVo.getStock_order_type();
				Map<String, Object> daoMap = new HashMap<>();
				daoMap.put("sales_id", sales_id);
				daoMap.put("account_id", account_sales_of_product);
				SalesDTO salesdto = dao.select_search_sales_order(daoMap);
				System.out.println("  -> salesdto : " + salesdto.getSales_state());
				
				if(salesdto.getSales_state() == complete_sales_storage_out_warehouse) {
					daoMap.clear();
					daoMap.put("order_id", stock_order_id);
					daoMap.put("order_state", 0);
					System.out.println("  -> daoMap: " + daoMap.toString() );
					int dao_cnt = dao.update_order_state(daoMap);
					System.out.println("  -> dao_cnt : " + dao_cnt );
				}
			}
		
			System.out.println("  -> 알람처리 종료!");
			
			/*-----------------------------------------------------*/
			
			
			
		
		// 판매 승인 요청일 경우
		} else if(search_check == 4 ){
			// 
			cnt = dao.select_count_checkout_sales();
			System.out.println("  -> Search Cnt : " + cnt );
		
			
			
		} else if(search_check == 7 ){
			
			System.out.println("  -> Dead Line... ");
			// 나중에 하자 
			
			
		// 전체 조회일 경우
		} else {
			cnt = dao.select_sales_cnt();
			if(cnt == 0){
				System.out.println("  -> Not Exist Value...");
				cnt = -1;
			}
		}
		
		req.setAttribute("cnt",cnt);
		req.setAttribute("search_check",search_check);
		
		
		
	}
	
	
	@Override
	public void sales_list_table_servie(Model model) {
		
		System.out.println("  -> sales_list_table_servie " );
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int start = 0;
		int end	= 0;
		int cnt	= 0;
		int search_check = 0;
		String search_str = "";
		ArrayList<SalesDTO> dtos = null;

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
				dtos = dao.select_quick_serch_sales(daoMap);
				model.addAttribute("dtos", dtos);
				
			} else if( search_check == 2 ){
				
				// 승인된 내용 불러오기
				System.out.println("  -> Account Approve List  ...");
				dtos = dao.select_account_approve_serch_sales(daoMap);
				model.addAttribute("dtos", dtos);
			
			} else if ( search_check == 3 ){
				
				// 출고 완료 목록 표시
				System.out.println("  -> Account Approve List  ...");
				dtos = dao.select_account_approve_serch_sales(daoMap);
				model.addAttribute("dtos", dtos);
				
				
			} else if ( search_check == 5 ){
				
				// 출고 완료 목록 표시
				System.out.println("  -> Stock Out List  ...");
				dtos = dao.select_stock_out_serch_sales(daoMap);
				model.addAttribute("dtos", dtos);
				
			} 
			
			else if ( search_check == 4 ){
				
				// 출고 완료 목록 표시
				System.out.println("  -> Checkout Sales List  ...");
				dtos = dao.select_checkout_serch_sales(daoMap);
				model.addAttribute("dtos", dtos);
				
				
			} else {
				System.out.println("  -> Print All List  ...");
				
				// 전체 목록 불러오기
				dtos = dao.select_sales_list(daoMap);
				model.addAttribute("dtos", dtos);
			}

		} else System.out.println("  -> Cnt is Zero...");
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("check",search_check);
		
	}

	@Override
	public void sales_list_page_servie(Model model) {
		
		System.out.println("  -> sales_list_page_servie " );
		
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
		String account_id = req.getParameter("account_id");
		
		System.out.println("  -> sales_id : "  + sales_id);
		System.out.println("  -> account_id : "  + account_id);
		System.out.println("  -> sales_state : "  + sales_state);
		
		Map<String,Object> daoMap = new HashMap<>();
		daoMap.put("sales_id", sales_id);
		daoMap.put("account_id", account_id);
		
		ArrayList<SalesDTO> dtos = dao.select_detail_sales(daoMap);
		System.out.println("  -> dtos : " + dtos.toString() );
		
		if( dtos != null ){
			System.out.println("  -> Complete value import ...");
			model.addAttribute("dtos", dtos);
			model.addAttribute("account_id", account_id);
			System.out.println("  -> account_id : "+ account_id );
			
			
		} else {	// 불러오기 실패
			System.out.println("  -> Error loading value...");
		}
		model.addAttribute("sales_id", sales_id);
		model.addAttribute("sales_state", sales_state);

	}
	
	@Override
	public void detail_sales_pro_service(Model model) {
		
		System.out.println("  -> detail_sales_pro_service");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int update_cnt = 0;
		String req_kind = req.getParameter("req_kind");
		
		if( req_kind.equals("storage_out") ){
			System.out.println("  -> Request a Storage Out...");
			
			// 상품매출(500014030000)만 22214(전표승인)에서 22222(엽업출고 요청으로 바꿈)
			String sales_id = req.getParameter("sales_id");
			String account_id = dao.select_account_price();
			int req_out_strage = dao.select_strage_out();
			
			Map<String, Object> daoMap = new HashMap<>();
			System.out.println("  -> sales_id : " + sales_id);
			daoMap.put("sales_id", sales_id);
			daoMap.put("account_id", account_id );
			daoMap.put("sales_state", req_out_strage );

			update_cnt = dao.update_req_storage_out(daoMap);
			System.out.println("  -> update_cnt : " + update_cnt);
			
		}
		model.addAttribute("cnt", update_cnt);
		
	}

	@Override
	public void modify_sales_service(Model model) {

		System.out.println("  -> modify_sales_service");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String sales_id = "";
		String sales_state = "";
		sales_id = req.getParameter("sales_id");
		System.out.println("  -> sales_id : "  + sales_id);
		
		Map<String,Object> daoMap = new HashMap<>();
		daoMap.put("sales_id", sales_id);
		ArrayList<SalesDTO> dtos = dao.select_modify_sales(daoMap);
		
		if( dtos != null ){
			System.out.println("  -> Complete value import ...");
			model.addAttribute("dtos", dtos);
			
		} else 	System.out.println("  -> Error loading value..."); // 불러오기 실패
			
		ArrayList<SalesDTO> dtos_account  = dao.select_account();	
		ArrayList<SalesDTO> dtos_product  = dao.select_product();	
		ArrayList<SalesDTO> dtos_company  = dao.select_company();	
		ArrayList<SalesDTO> dtos_employee  = dao.select_employee();	
		
		model.addAttribute("dtos_account", dtos_account);
		model.addAttribute("dtos_product", dtos_product);
		model.addAttribute("dtos_company", dtos_company);
		model.addAttribute("dtos_employee", dtos_employee);
		
		sales_id = req.getParameter("sales_id");
		sales_state = req.getParameter("sales_state");
		
		model.addAttribute("sales_id", sales_id);
		model.addAttribute("sales_state", sales_state);
		System.out.println("  -> sales_id : "  + sales_id);
		System.out.println("  -> sales_state : "  + sales_state);
		

	
	}
	
	@Override
	public void modify_sales_pro_service(Model model) {

		System.out.println("  -> modify_sales_pro_service");
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		// 공통코드
		String sales_id = req.getParameter("sales_id");
		String order_id = req.getParameter("order_id");
		String product_id = req.getParameter("product_id");
		String company_id = req.getParameter("company_id");
		int employee_id =  Integer.parseInt( req.getParameter("employee_id"));
		Date reg_date = req.getParameter("reg_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("reg_date")); 
		Date update_date = new Date(System.currentTimeMillis());
		Date storage_out_date = req.getParameter("storage_out_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("storage_out_date"));
		int count_sales = Integer.parseInt(req.getParameter("count_sales") );
		int sales_state = Integer.parseInt(req.getParameter("sales_state") );
		int condition_note_receivable = Integer.parseInt(req.getParameter("condition_note_receivable") );

		// 가격 설정
		String selling_price = req.getParameter("selling_price");
		System.out.println( "  -> selling_price : " + selling_price );
		selling_price = selling_price.replace("￦","");
		selling_price = selling_price.replace(",","");
		
		Long price	=  Math.round(Double.parseDouble(selling_price)); 
		System.out.println( "price : " + price );
		
		Long tax	=  (price/10);
		Long sum	= (price + tax);
		
		System.out.println("  -> price : " + price);
		System.out.println("  -> tax : " + tax);
		System.out.println("  -> sum : " + sum);
		
		SalesDTO dto = new SalesDTO();
		dto.setSales_id(sales_id);
		dto.setOrder_id(order_id);
		dto.setProduct_id(product_id);
		dto.setCompany_id(company_id);
		dto.setEmployee_id(employee_id);
		dto.setReg_date(reg_date);
		dto.setUpdate_date(update_date);
		dto.setStorage_out_date(storage_out_date);
		dto.setCount_sales(count_sales);
		dto.setSales_state(sales_state);	
		dto.setCondition_note_receivable(condition_note_receivable);
		System.out.println("  -> dto: "+dto.toString());
		
		int cnt = 0;
		// 상품매출 insert , 가격 x 수량
		String price_code = dao.select_account_price();
		dto.setAccount_id(price_code);
		System.out.println("  -> 상품매출 : " + dto.getAccount_id());
		System.out.println("  -> price : " + price );
		dto.setSelling_price(price);
		int product_cnt = dao.update_sales(dto);	
		if( product_cnt > 0 ){
			System.out.println("  -> product_cnt insert Complete... ");
			++cnt;
		}
		
		// 부가세예수금 insert , 부가세 10%
		String tax_code = dao.select_account_tax();
		dto.setAccount_id(tax_code);
		System.out.println("  -> 부가세예수금 : " + dto.getAccount_id());
		System.out.println("  -> tax : " + tax );
		dto.setSelling_price(tax);
		int tax_cnt = dao.update_sales(dto);
		if( tax_cnt > 0 ){
			System.out.println("  -> tax_cnt insert Complete... ");
			++cnt;
		}
		
		// 매출채권 insert , 상품매출 + 부가세
		String sum_code = dao.select_account_sum();
		dto.setAccount_id(sum_code);
		System.out.println("  -> 매출채권 : " + dto.getAccount_id());
		System.out.println("  -> sum : " + sum );
		dto.setSelling_price(sum);
		int debt_cnt = dao.update_sales(dto);
		if( debt_cnt > 0 ){
			System.out.println("  -> setAccount_id insert Complete... ");
			++cnt;
		}
		
		model.addAttribute("cnt", cnt);
		System.out.println("  -> cnt 값 : " + cnt);
		
	}
	
	@Override
	public void reg_sales_service(Model model) {
		System.out.println("  -> reg_sales_service");
	
		ArrayList<SalesDTO> product_ids = new ArrayList<>();
		ArrayList<SalesDTO> company_ids = new ArrayList<>();
		ArrayList<SalesDTO> employee_ids = new ArrayList<>();
		
		product_ids = dao.select_product_ids();
		company_ids = dao.select_company_ids();
		employee_ids = dao.select_employee_ids();
		
		model.addAttribute("product_ids",product_ids);
		model.addAttribute("company_ids",company_ids);
		model.addAttribute("employee_ids",employee_ids);
	
		ArrayList<SalesDTO> account_ids = new ArrayList<>();
		account_ids = dao.select_account_ids();
		model.addAttribute("account_ids",account_ids);
		
	}

	@Override
	public void reg_sales_table(Model model) {
		System.out.println("  -> reg_sales_table...");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String sales_id = dao.select_sales_id();
		String product_id = req.getParameter("product_id");
		String company_id = req.getParameter("company_id");
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		Date reg_date = req.getParameter("reg_date") == "" ? new Date(0) : Date.valueOf(req.getParameter("reg_date"));
		Date storage_out_date = req.getParameter("storage_out_date") == "" ? new Date(0) : Date.valueOf(req.getParameter("storage_out_date"));
		int count_sales = Integer.parseInt( req.getParameter("count_sales") ); 
		Long supply_price = Long.parseLong( req.getParameter("selling_price") );
		int sales_state = request_approval_sales_statement;
		int condition_note_receivable = Integer.parseInt( req.getParameter("condition_note_receivable") );
		
		// 생성자 생성
		SalesDTO dto = new SalesDTO();
		dto.setSales_id(sales_id);
		dto.setProduct_id(product_id);
		dto.setCompany_id(company_id);
		dto.setEmployee_id(employee_id);
		dto.setReg_date(reg_date);
		dto.setStorage_out_date(storage_out_date);
		dto.setCount_sales(count_sales);
		dto.setSelling_price(supply_price);
		dto.setSales_state(sales_state);	
		dto.setCondition_note_receivable(condition_note_receivable);

		// 판매 상태 : 테스트용
		System.out.println("  -> sales_state : " + dto.getSales_state());
		System.out.println("  -> test dto get : " + dto.toString());

		// 가격 계산 ( 구매가, 부가세, 총합 )
		int cnt = 0;	
		long price = supply_price;
		long tax = price/10;
		long sum = price + tax;

		// 상품매출 insert , 가격 x 수량

		String price_code = dao.select_account_price();
		dto.setAccount_id(price_code);
		System.out.println("  -> 상품매출 : " + dto.getAccount_id());
		System.out.println("  -> price : " + price );
		dto.setSelling_price(price);
		int product_cnt = dao.insert_reg_sales(dto);	
		if( product_cnt > 0 ){
			System.out.println("  -> product_cnt insert Complete... ");
			cnt++;
		}

		// 부가세예수금 insert , 부가세 10%
		String tax_code = dao.select_account_tax();
		dto.setAccount_id(tax_code);
		System.out.println("  -> 부가세예수금 : " + dto.getAccount_id());
		System.out.println("  -> tax : " + tax );
		dto.setSelling_price(tax);
		int tax_cnt = dao.insert_reg_sales(dto);
		if( tax_cnt > 0 ){
			System.out.println("  -> tax_cnt insert Complete... ");
			cnt++;
		}

		// 매출채권 insert , 상품매출 + 부가세
		String sum_code = dao.select_account_sum();
		dto.setAccount_id(sum_code);
		System.out.println("  -> 매출채권 : " + dto.getAccount_id());
		System.out.println("  -> sum : " + sum );
		dto.setSelling_price(sum);
		int debt_cnt = dao.insert_reg_sales(dto);
		if( debt_cnt > 0 ){
			System.out.println("  -> setAccount_id insert Complete... ");
			cnt++;
		}

		if ( cnt == 3 ){

			// 리스트를 만들어서 결과값을 담음
			ArrayList<SalesDTO> dtos = new ArrayList<>();
			sales_id = dto.getSales_id();
			dtos = dao.select_sales_order(sales_id);
			model.addAttribute("dtos", dtos);
			System.out.println("  ->  dtos : " + dtos.toString());

		} else System.out.println("  -> Insert Error... ");

		model.addAttribute("cnt", cnt);

	}

	@Override
	public void req_storage_out_service(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String sales_id = req.getParameter("sales_id");
		String account_id = dao.select_account_price();
		int req_strage_out = dao.select_req_storage_out();
		
		Map<String, Object> daoMap = new HashMap<>();
		System.out.println("  -> sales_id" + sales_id);
		daoMap.put("sales_id", sales_id);
		daoMap.put("account_id", account_id);
		daoMap.put("sales_state", req_strage_out );
		dao.update_req_storage_out(daoMap);

	}

	@Override
	public void req_receive_service(Model model) {
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String sales_id="";
		int update_cnt = 0;
		Date pay_date = null;
		int pay_diff = 0;
		
		// 수금기간을 조회 구매번호롸 상품매입(500011050000)을 사용하여 지급일을 계산
		sales_id = req.getParameter("sales_id");
		System.out.println("  -> sales_id : " + sales_id);
		
		Map<String, Object> daoMap = new HashMap<>();
		daoMap.put("sales_id", sales_id);
		daoMap.put("account_id", "500011020000");	// 매출 채권
		daoMap.put("before_state", 22214);
		daoMap.put("after_state", 22411);
		
		// 상태 변경 ( 입고완료 23205 -> 지급 대기 23206  )
		update_cnt = dao.update_state(daoMap);
		System.out.println("  -> 수금 update_cnt :" + update_cnt);
		
		if(update_cnt > 0){
			
			// 지급 날짜 불러오기
			pay_date = dao.select_sales_pay_date(daoMap);
			System.out.println("  -> pay_date : " + pay_date);
			model.addAttribute("pay_date", pay_date);
			
			// 남은 날짜 불러오기
			pay_diff = dao.select_sales_pay_diff(daoMap);
			System.out.println("  -> pay_diff : " + pay_diff);
			model.addAttribute("pay_diff", pay_diff);
			
		} else{
			System.out.println("  -> Update Cnt is Zero... ");
		}
		
		model.addAttribute("cnt", update_cnt);
		model.addAttribute("sales_id", sales_id);
		
	}


	@Override
	public void req_receive_pro_service(Model model) {
		
		System.out.println("  -> req_receive_pro_service ");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String sales_id="";
		Long price = null;
		SalesDTO dto = new SalesDTO();
		ArrayList<SalesDTO> dtos = new ArrayList<>();
		int update_cnt = 0;
		int insert_cnt = 0;
		
		// 현금(500011010000)과 매입채무(500012010000) 채권 생성 , 둘다 가격은 마이너스
		sales_id = req.getParameter("sales_id");
		System.out.println("  -> sales_id : " + sales_id);
		dto = dao.select_sales(sales_id);
		System.out.println("  -> dto : " + dto.toString());

		price = dto.getSelling_price();
		System.out.println( "  -> price : " + price );
		
		// 기존 구매 정보 상태변경 ( 23205 -> 23206 | 입고완료 -> 지급대기 )
		Map<String, Object> daoMap = new HashMap<>();
		daoMap.put("sales_id", sales_id);
		daoMap.put("account_id", "500011020000");
		daoMap.put("after_state", 22412);
		update_cnt = dao.update_state_force(daoMap);
		System.out.println("  -> update_cnt : " + update_cnt);
		
		// 공통사항 설정
		dto.setSales_id(dao.select_sales_id());
		dto.setSales_state(22213);
		dto.setOrder_id("0");
		
		// 매입채무 계정 설정
		dto.setAccount_id("500011020000");
		dto.setSelling_price(-price);
		insert_cnt = dao.insert_reg_sales(dto);
		if(insert_cnt != 0 ) ++insert_cnt; 
		dtos.add(dto);
		
		// 현금 계정 설정
		dto.setAccount_id("500011010000");
		dto.setSelling_price(price);
		insert_cnt = dao.insert_reg_sales(dto);
		if(insert_cnt != 0 ) ++insert_cnt;
		dtos.add(dto);
		
		// 추가 사항 시작  : 판매통장에 입금----------------------------------------------------- // 
		
		int count = dto.getCount_sales();
		price = price * count;
		update_cnt = dao.update_sales_bank_account(price);
		System.out.println("  -> bank update_cnt :" + update_cnt);
		
		// 추가 사항 종료----------------------------------------------------- // 
		
		System.out.println("  -> update_cnt : " + insert_cnt);
		
		model.addAttribute("cnt", insert_cnt);
		model.addAttribute("dtos", dtos);
		
	}
		

	
	
	
	/*-----------------------------------------------------*/
	
	@Override
	public void search_status_sales_service(Model model) {
		
		System.out.println("  -> search_status_sales_service " );

		ArrayList<SalesDTO> product_ids = new ArrayList<>();
		ArrayList<SalesDTO> company_ids = new ArrayList<>();
		ArrayList<SalesDTO> employee_ids = new ArrayList<>();
		ArrayList<SalesDTO> account_ids = new ArrayList<>();
		
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
	public void search_status_sales_table_service(Model model) {
		System.out.println("  -> search_status_sales_service " );

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
		Map<String,Object> optionMap = new HashMap<>();
		
		String start_date = null;
		String end_date = null;
		int date_check = 0;
		
		
		/*System.out.println( req.getParameter("start_date")  );*/
		
		// 검색 종류 체크
		if( req.getParameter("start_date").equals("all") && req.getParameter("end_date").equals("all") ){
			System.out.println("  -> ALL List Conut Search : table");
			date_check = 0;
			
		} else if( !req.getParameter("start_date").equals("null") || !req.getParameter("start_date").equals("undefined") || !req.getParameter("start_date").equals("0") ){
			System.out.println("  -> Date Search : table");
			date_check = 1;
		}
	
		if( !req.getParameter("account").equals("null") && !req.getParameter("account").equals("0") ){
			optionMap.put("account", req.getParameter("account"));
			date_check = 2;
		}
		
		if( !req.getParameter("product").equals("null") && !req.getParameter("product").equals("0") ){
			optionMap.put("product", req.getParameter("product"));
			date_check = 2;
		}
		
		if( !req.getParameter("company").equals("null") && !req.getParameter("company").equals("0") ){
			optionMap.put("company", req.getParameter("company"));
			date_check = 2;
		}
		
		if( !req.getParameter("employee").equals("null") && !req.getParameter("employee").equals("0") ){
			optionMap.put("employee", req.getParameter("employee"));
			date_check = 2;
			
		} 
		 
		
		// 날짜가 있을 경우
		if( date_check == 1 ){
			
			start_date 	= req.getParameter("start_date").replace("-", "");
			end_date 	= req.getParameter("end_date").replace("-", "");
			// 개수 구하기
			Map<String,String> daoMap = new HashMap<>();
			daoMap.put("start_date", start_date);
			daoMap.put("end_date", end_date);
			cnt = dao.count_search_status_sales(daoMap);
			System.out.println("  -> Search Cnt : " + cnt );
			
			
		// 옵션이 있을 경우
		} else if(date_check == 2){
			
			// 개수 구하기
			cnt = dao.count_option_status_sales(optionMap);
			
			
		// 검색어가 있을 경우(전체 로드)	
		} else {
			cnt = dao.select_sales_cnt();
			
		}
		

		pageNum = req.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
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
			
			
			// 검색된 내용만 불러오기
			if( date_check == 1 ){
				
				daoMap.put("start_date", start_date);
				daoMap.put("end_date", end_date);
				
				System.out.println("  -> Search_str :" +  req.getParameter("search_str") );
				dtos = dao.select_serch_status_sales(daoMap);
				model.addAttribute("SalesDTOs", dtos);
				
			// 옵션 검색
			} else if(date_check == 2 ){
				optionMap.put("start", start);
				optionMap.put("end", end);
				dtos = dao.select_serch_option_status_sales(optionMap);
				model.addAttribute("SalesDTOs", dtos);
			
				// 전체 목록 불러오기		
			} else {
				
				System.out.println("  -> Print All List  ...");
				dtos = dao.select_all_status_sales(daoMap);
				model.addAttribute("SalesDTOs", dtos);
				
			}

		} else {
			cnt = -1;
			System.out.println("  -> Cnt is Zero...");
			System.out.println("cnt체크 : " + cnt);
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
	public void search_status_sales_page_service(Model model) {
		System.out.println("  -> search_status_sales_page_service " );

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
		
		Map<String,Object> optionMap = new HashMap<>();
		
		String start_date = null;
		String end_date = null;
		int date_check = 0;
		
		
		System.out.println( req.getParameter("start_date")  );

		// 검색 종류 체크
		if( req.getParameter("start_date").equals("all") && req.getParameter("end_date").equals("all") ){
			System.out.println("  -> ALL List Conut Search : page");
			date_check = 0;
			
		}else if( !req.getParameter("start_date").equals("null") || !req.getParameter("start_date").equals("undefined") || !req.getParameter("start_date").equals("0") ){
			System.out.println("  -> Date Search  : page");
			date_check = 1;
		}
	
		if( !req.getParameter("account").equals("null") && !req.getParameter("account").equals("0") ){
			optionMap.put("account", req.getParameter("account"));
			date_check = 2;
		}
		
		if( !req.getParameter("product").equals("null") && !req.getParameter("product").equals("0") ){
			optionMap.put("product", req.getParameter("product"));
			date_check = 2;
		}
		
		if( !req.getParameter("company").equals("null") && !req.getParameter("company").equals("0") ){
			optionMap.put("company", req.getParameter("company"));
			date_check = 2;
		}
		
		if( !req.getParameter("employee").equals("null") && !req.getParameter("employee").equals("0") ){
			optionMap.put("employee", req.getParameter("employee"));
			date_check = 2;
			
		} 
		 
		
		// 날짜가 있을 경우
		if( date_check == 1 ){
			
			start_date 	= req.getParameter("start_date").replace("-", "");
			end_date 	= req.getParameter("end_date").replace("-", "");
			// 개수 구하기
			Map<String,String> daoMap = new HashMap<>();
			daoMap.put("start_date", start_date);
			daoMap.put("end_date", end_date);
			cnt = dao.count_search_status_sales(daoMap);
			model.addAttribute("date_check",1);
			
			
		// 옵션이 있을 경우
		} else if(date_check == 2){
			
			// 개수 구하기
			cnt = dao.count_option_status_sales(optionMap);
			model.addAttribute("date_check",3);
			
		// 검색어가 있을 경우(전체 로드)	
		} else {
			cnt = dao.select_sales_cnt();
			model.addAttribute("date_check",2);
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
	public void search_status_sales_detail_service(Model model) {
		
		System.out.println("  -> search_status_sales_detail_service");
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		// 여기서 변수명만 수정하면 완료!
		String var1 = req.getParameter("sales_id");
		String var2 = req.getParameter("account_id");
		
		Map<String,Object> daoMap = new HashMap<>();
		daoMap.put("var1", var1);
		daoMap.put("var2", var2);
		ArrayList<SalesDTO> dtos = dao.select_detail_status_sales(daoMap);
		
		if( dtos != null ){
			System.out.println("  -> Complete value import ...");
			model.addAttribute("dtos", dtos);
			
		} else {	// 불러오기 실패
			System.out.println("  -> Error loading value...");
		}
	}

	
	/*-----------------------------------------------------*/
	
	@Override
	public void sales_statement_search_service(Model model) {
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		List<Order_stateVO> orderVos = new ArrayList<>();
		orderVos = dao.select_statements_approval();
		for(int i=0; i<orderVos.size(); i++) {
			Order_stateVO orderVo = orderVos.get(i);
			String statement_id = orderVo.getOrder_id();
			List<Sales_statementVO> tempVos = dao.select_sales_statement(statement_id);
			
			if(tempVos != null) {
				for(int j=0; j<tempVos.size(); j++) {
					Sales_statementVO tempVo = tempVos.get(j);
					String sales_id = tempVo.getSales_id();
					String account_id = tempVo.getAccount_id();
					Map<String, Object> daoMap = new HashMap<>();
					
					daoMap.put("sales_id", sales_id);
					daoMap.put("account_id", account_id);
					SalesDTO salesdto = dao.select_search_sales_order(daoMap);
					if(salesdto.getSales_state() == request_approval_sales_statement) {
						dao.update_sales_state(daoMap);
						daoMap.clear();
						
						daoMap.put("statement_id", statement_id);
						daoMap.put("order_state", 0);
						dao.update_order_state(daoMap);
						/*
						daoMap.put("sales_state", complete_approval_sales_statement);
						*/
						
					}
				}
			}
		}
	}


	
	/*-----------------------------------------------------*/
	

	
	

}
