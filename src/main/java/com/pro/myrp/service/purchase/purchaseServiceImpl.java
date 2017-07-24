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
import com.pro.myrp.domain.purchase_management.PurchaseDTO;
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
		
		ArrayList<PurchaseDTO> vos = null;
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
				model.addAttribute("PurchaseDTOs", vos);
				
				
			} else {
				System.out.println("  -> Print All List  ...");
				
				// 전체 목록 불러오기
				vos = dao.select_purchase_list(daoMap);
				model.addAttribute("PurchaseDTOs", vos);
				
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
			PurchaseDTO tempvo = vos.get(i);
			
			
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
		PurchaseDTO vo = dao.select_detail_purchase( company_id );
		
		if( vo != null ){
			System.out.println("  -> Complete value import ...");
			model.addAttribute("PurchaseDTO", vo);
			
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

		
		PurchaseDTO vo = new PurchaseDTO();
		
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
	
	
	
}
		

