package com.pro.myrp.service.purchase;

import java.io.Console;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.PurchaseVO;
import com.pro.myrp.persistence.purchase.purchaseDAO;

@Service
public class purchaseServiceImpl implements purchaseService {

	@Inject
	private purchaseDAO dao;

	@Override
	public void purchase_list_servie(Model model) {
		
		System.out.println("  -> purchase_list_servie " );
		
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
		
		ArrayList<PurchaseVO> vos = null;
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

			// 개수 구하기
			cnt = dao.count_quick_serch_purchase(search_str);
			System.out.println("  -> Search Cnt : " + cnt );
			
			
		// 검색어가 있을 경우(전체 로드)
		} else {
			
			// 전체 개수 구하기
			cnt = dao.select_purchase_cnt();
			
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
		System.out.println("  -> 테스트 : " + start+", "+end);
		
		
		if(cnt > 0) {
			
			System.out.println("  -> Complete import cnt ...");
			
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			daoMap.put("search_str", search_str);
			
			if( search_check == 1 ){
				System.out.println("  -> Search_str :" +  req.getParameter("search_str") );
				
				// 검색된 내용만 불러오기
				vos = dao.select_quick_serch_purchase(daoMap);
				model.addAttribute("purchaseVOs", vos);
				
				
			} else {
				System.out.println("  -> Print All List  ...");
				
				// 전체 목록 불러오기
				vos = dao.select_purchase_list(daoMap);
				model.addAttribute("purchaseVOs", vos);
				
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
		
		/*
		//-----------------------------------------------
		// search_str
		if ( req.getParameter("search_str") == null ){
			
		
			System.out.println("  -> Sales Count : " + cnt);
			
			
		} else {
			
			String search_str = req.getParameter("search_str");
			
			vos = dao.slect_quick_serch_purchase(search_str);
			cnt = vos.size();
			System.out.println("  -> Search Cnt : " + cnt );
		}
	
		
		for(int i=start-1 ; i<end ; i++){
			PurchaseVO tempvo = vos.get(i);
			
			
			System.out.println("vos.get(i) : " + vos.get(i));
			temp_vos.add(tempvo);
		}
		*/
		
	}

	@Override
	public void detail_purchase_service(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String company_id = req.getParameter("company_id");
		System.out.println("  -> company_id : "  + company_id);
		PurchaseVO vo = dao.select_detail_purchase( company_id );
		
		if( vo != null ){
			System.out.println("  -> Complete value import ...");
			model.addAttribute("purchaseVO", vo);
			
		} else {	// 불러오기 실패
			System.out.println("  -> Error loading value...");
			
		}
	}
	
	@Override
	public void modify_purchase_service(Model model){
		
		System.out.println("  -> modify_purchase_service");
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String purchase_id = req.getParameter("purchase_id");
		String account_id = req.getParameter("account_id");
		String order_id = req.getParameter("order_id");
		String product_id = req.getParameter("product_id");
		String company_id = req.getParameter("company_id");
		String company_name = req.getParameter("company_name");
		int employee_id =  Integer.parseInt( req.getParameter("employee_id"));
		Date reg_date = req.getParameter("reg_date") == ""  ? new Date(0):Date.valueOf(req.getParameter("reg_date")); 
		Date update_date = req.getParameter("update_date")	 == ""  ? new Date(0):Date.valueOf(req.getParameter("update_date"));
		Date storage_in_date = req.getParameter("storage_in_date")	 == ""  ? new Date(0):Date.valueOf(req.getParameter("storage_in_date"));
		int count_purchase = Integer.parseInt(req.getParameter("count_purchase") );
		long supply_price = Long.parseLong(req.getParameter("supply_price") );
		int purchase_state = Integer.parseInt(req.getParameter("purchase_state") );
		int condition_note_payable = Integer.parseInt(req.getParameter("condition_note_payable") );

		
		PurchaseVO vo = new PurchaseVO();
		
		vo.setPurchase_id(purchase_id);
		vo.setAccount_id(account_id);
		vo.setOrder_id(order_id);
		vo.setProduct_id(product_id);
		vo.setCompany_id(company_id);
		vo.setEmployee_id(employee_id);
		vo.setCompany_name(company_name);
		vo.setReg_date(reg_date);
		vo.setUpdate_date(update_date);
		vo.setStorage_in_date(storage_in_date);
		vo.setCount_purchase(count_purchase);
		vo.setSupply_price(supply_price);
		vo.setPurchase_state(purchase_state);
		vo.setCondition_note_payable(condition_note_payable);
		
		System.out.println("  -> vo : " + vo.getPurchase_id());
		
		
		int cnt = dao.update_purchase(vo);
		
		System.out.println("  -> cnt: "+cnt);
		model.addAttribute("cnt", cnt);
		
		
		
	}
	
	@Override
	public void quick_serch_purchase_service(Model model) {
		
		System.out.println("  -> quick_serch_purchase_service ");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String search_str = req.getParameter("search_str");
		System.out.println("  -> search_str : " + search_str);
		
		if(search_str != null){
			System.out.println("  -> Str Searching...");
			model.addAttribute("search_str",search_str);
		
		}else{
			System.out.println("  -> No Str Value...");
		}
	}

	
	@Override
	public void reg_purchase_service(Model model) {
		System.out.println("  -> reg_purchase_service");
		
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
	
		ArrayList<PurchaseVO> product_ids = new ArrayList<>();
		ArrayList<PurchaseVO> company_ids = new ArrayList<>();
		ArrayList<PurchaseVO> employee_ids = new ArrayList<>();
		
		product_ids = dao.select_product_ids();
		company_ids = dao.select_company_ids();
		employee_ids = dao.select_employee_ids();
		
		model.addAttribute("product_ids",product_ids);
		model.addAttribute("company_ids",company_ids);
		model.addAttribute("employee_ids",employee_ids);
	
		
		
		ArrayList<PurchaseVO> account_ids = new ArrayList<>();
		account_ids = dao.select_account_ids();
		model.addAttribute("account_ids",account_ids);
		
	
		/*
		// 테스트용 출력
		System.out.println(product_ids.toString());
		System.out.println(company_ids.toString());
		System.out.println(employee_ids.toString());
		*/

		/*
		// 배열 생성
		Map<String,String> product_map = new HashMap<>();
		product_map.put("id","product_id");
		product_map.put("name","product_name");
		
		Map<String,String> company_map = new HashMap<>();
		product_map.put("id","company_id");
		product_map.put("name","company_name");
		
		Map<String,String> employee_map = new HashMap<>();
		product_map.put("id","employee_id");
		product_map.put("name","employee_name");
		*/
		
		/*
		// 필요한 목록 만들기
		List<String> reg_table_list = Arrays.asList("product","company","employee");
		
		Iterator<String> iterator = reg_table_list.iterator();
		while (iterator.hasNext()) {
			
			 int num = 1;
			 String table_name = iterator.next();
			 String table_key = table_name + num;
			 String table_column = table_name+"_id";
			 
			 System.out.println(table_name+", "+table_column);
			 
			 List<String> table_key = new ArrayList<String>();
					 
					 
					 dao.select_reg_value(table_name);
			 
		}
		
		//product_id, company_id, employee_id
		Map<String,String> reg_list = new HashMap<>();
		reg_list.put("product", "product");
		*/
		
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
		PurchaseVO vo = new PurchaseVO();
		vo.setAccount_id(account_id);
		vo.setProduct_id(product_id);
		vo.setCompany_id(company_id);
		vo.setEmployee_id(employee_id);
		vo.setReg_date(reg_date);
		vo.setStorage_in_date(storage_in_date);
		vo.setCount_purchase(count_purchase);
		vo.setSupply_price(supply_price);
		vo.setCondition_note_payable(condition_note_payable);
		
		vo.setOrder_id(order_id);
		
		System.out.println("  -> vo : "+vo.toString());
		
		// DB에 값 입력 : INSERT PURCHASE_ORDER
		int purchase_cnt = dao.insert_reg_purchase(vo);
		
		int cnt =0;
		if( purchase_cnt == 1 ){
			System.out.println("  -> Insert Success...");
			
			// 전표 처리 : PURCHASE_STATEMENT
			int statement_cnt = dao.insert_reg_purchase_statement(vo);
			if ( statement_cnt == 1 ) cnt = 1;
			
		} else {
			System.out.println("  -> Error during Insert...");
		}
		
		model.addAttribute("cnt",purchase_cnt);
		
		
		
		//--------------------------------------------------
		/*
		// 없는 변수 제작 : order_id
		Calendar cal = Calendar.getInstance();
		String year = String.valueOf(cal.get(Calendar.YEAR)).substring(2,4);
		String month = String.valueOf(cal.get(Calendar.MONTH)+1);
		if ( month.length() == 1 ) month = "0"+month;
		String day = String.valueOf(cal.get(Calendar.DATE));
		String  temp_date = year+month+day;
		int i = 1;
		String order_id =  "2000"+temp_date+
		System.out.println("  -> 날짜 : " + temp_date);
		*/
		
	
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
		int condition_note_payable = Integer.parseInt( req.getParameter("condition_note_payable") );
		
		// 생성자 생성
		PurchaseVO vo = new PurchaseVO();
		vo.setPurchase_id(purchase_id);
		vo.setProduct_id(product_id);
		vo.setCompany_id(company_id);
		vo.setEmployee_id(employee_id);
		vo.setReg_date(reg_date);
		vo.setStorage_in_date(storage_in_date);
		vo.setCount_purchase(count_purchase);
		vo.setSupply_price(supply_price);
		vo.setCondition_note_payable(condition_note_payable);
		
		
		// order_id 불러오기(임시값 : null값도 괜춘)
		String order_id = req.getParameter("order_id");
		
		// 주문번호 : 테스트용
		int purchase_state = Integer.parseInt( req.getParameter("purchase_state") );
		vo.setPurchase_state(purchase_state);	// 주문번호 : 테스트용
		
		// account_id 설정 
		List<String> account_ids = new ArrayList<>();
	
		
		// 가격 계산 ( 구매가, 부가세, 총합 )
		int cnt = 0;	
		long price = supply_price;
		long tax = price/10;
		long sum = price + tax;
		String statement_id = null;
	
		
		// 상품매입 insert , 가격 x 수량
		vo.setAccount_id("500011050000");
		vo.setSupply_price(price);
		System.out.println("  -> price : " + price );
		
		// purchase_order insert 구매 내역 입력
		int product_cnt = dao.insert_reg_purchase(vo);	
		if( product_cnt > 0 ){
			System.out.println("  -> product_cnt insert Complete... ");
			statement_id = dao.select_statement_id();
			cnt = 1;
			
			/*
			vo.setStatement_id(statement_id);
			System.out.println("  -> statement_id : " + statement_id);
			// purchase_statement insert 구매 상태 전표 입력
			int product_stat_cnt = dao.insert_reg_purchase_statement(vo);
			if(product_stat_cnt > 0){
				System.out.println("  -> product_stat_cnt insert Complete... ");
			}
			*/
		}
		
		// 부가세대급금 insert , 부가세 10%
		vo.setAccount_id("500011030000");
		vo.setSupply_price(tax);
		System.out.println("  -> tax : " + tax );
		
		// purchase_order insert 구매 내역 입력
		int tax_cnt = dao.insert_reg_purchase(vo);
		if( tax_cnt > 0 ){
			System.out.println("  -> tax_cnt insert Complete... ");
			statement_id = dao.select_statement_id();
			cnt = 2;
			
			/*
			vo.setStatement_id(statement_id);
			System.out.println("  -> statement_id : " + statement_id);
			// purchase_statement insert 구매 상태 전표 입력
			int tax_cnt_cnt = dao.insert_reg_purchase_statement(vo);
			if( tax_cnt_cnt > 0){
				System.out.println("  -> tax_cnt_cnt insert Complete... ");
			}
			*/
		}
		
		// 매입채무 insert , 상품매입 + 부가세
		vo.setAccount_id("500012010000");
		vo.setSupply_price(sum);
		System.out.println("  -> sum : " + sum );
		
		// purchase_order insert 구매 내역 입력
		int debt_cnt = dao.insert_reg_purchase(vo);
		if( debt_cnt > 0 ){
			System.out.println("  -> setAccount_id insert Complete... ");
			statement_id = dao.select_statement_id();
			cnt = 3;
			
			/*
			vo.setStatement_id(statement_id);
			System.out.println("  -> statement_id : " + statement_id);
			// purchase_statement insert 구매 상태 전표 입력
			int debt_cnt_cnt = dao.insert_reg_purchase_statement(vo);
			if( debt_cnt_cnt > 0){
				System.out.println("  -> debt_cnt_cnt insert Complete... ");
			}
			*/
		}
		
		if ( cnt == 3 ){
			
			// 리스트를 만들어서 결과값을 담음
			List<PurchaseVO> vos = new ArrayList<>();
			product_id = vo.getPurchase_id();
			vos = dao.select_purchase_order(product_id);
			model.addAttribute("vos", vos);
			
			// System.out.println( vos.toString() );
		}
		
		model.addAttribute("cnt", cnt);
		// purchase_order 입력 
		// 500011050000 : 상품매입 
		// 500011030000 : 부가세대급금(10%)
		// 500012010000 : 매입채무 
		
	}
	
	
	
}
		

