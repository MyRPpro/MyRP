package com.pro.myrp.service.account;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.pro.myrp.domain.accounting_management.AccountVO;
import com.pro.myrp.domain.accounting_management.Bank_accountVO;
import com.pro.myrp.domain.accounting_management.JoinStatementDTO;
import com.pro.myrp.domain.accounting_management.StatementVO;

import com.pro.myrp.persistence.account.AccountDAO;

@Service
public class AccountServiceImpl implements AccountService {

	@Inject
	private AccountDAO dao;
	
	//계좌리스트
	@Transactional 
	@Override
	public void bank_account_list_service(Model model) throws Exception {
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
		int bank_account_reg_on = 0;
		
		
		
		if(req.getParameter("bank_account_reg_on")!=null) {
			bank_account_reg_on = Integer.parseInt(req.getParameter("bank_account_reg_on"));
		}
		model.addAttribute("bank_account_reg_on", bank_account_reg_on);
		
		cnt = dao.select_bank_account_cnt();
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
			ArrayList<Bank_accountVO> vos = new ArrayList<Bank_accountVO>();
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			vos = dao.select_bank_account_list(daoMap);
			model.addAttribute("bankAccountVos", vos);
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
	// 계좌등록 
	@Override
	public void register_bank_account_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		ArrayList<AccountVO> vos = new ArrayList<AccountVO>();
		vos = dao.select_bank_account_id();
		int vosCnt = vos.size();
		model.addAttribute("vos", vos);
		model.addAttribute("vosCnt", vosCnt);
	}
	
	// 계좌 등록 : bank_account_id 불러오기
	/*@Override
	public void call_bank_account_id_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
	}*/
	
	// 계좌등록 : 등록처리
	@Override
	public void register_bank_account_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String bank_account_id = req.getParameter("bank_account_id");
		String bank_account_name = req.getParameter("bank_account_name");
		String bank_account_number = req.getParameter("bank_account_number");
		int bank_account_balance = (Integer.parseInt(req.getParameter("bank_account_balance")));
		String bank_account_type = req.getParameter("bank_account_type");
		String bank_name = req.getParameter("bank_name");
		String use_state = req.getParameter("use_state");
		Date reg_date = req.getParameter("reg_date") =="" ? new Date(0):Date.valueOf(req.getParameter("reg_date"));
	
		Bank_accountVO vo = new Bank_accountVO();
		vo.setBank_account_id(bank_account_id);
		vo.setBank_account_name(bank_account_name);
		vo.setBank_account_number(bank_account_number);
		vo.setBank_account_balance(bank_account_balance);
		vo.setBank_account_type(bank_account_type);
		vo.setBank_name(bank_name);
		vo.setUse_state(use_state);
		vo.setReg_date(reg_date);
		
		int cnt = dao.insert_bank_account(vo);
		model.addAttribute("cnt", cnt);
	}
	//계좌 수정
	@Override
	public void modify_bank_account_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String bank_account_id = req.getParameter("bank_account_id");
		Bank_accountVO vo = new Bank_accountVO();
		vo = dao.select_bank_account(bank_account_id);
		model.addAttribute("vo", vo);
	}
	//계좌 수정 처리
	@Override
	public void modify_bank_account_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String bank_account_id = req.getParameter("bank_account_id");
		String bank_account_name = req.getParameter("bank_account_name");
		String bank_account_number = req.getParameter("bank_account_number");
		String bank_name = req.getParameter("bank_name");
		String use_state = req.getParameter("use_state");
		Date reg_date = req.getParameter("reg_date") =="" ? new Date(0):Date.valueOf(req.getParameter("reg_date"));
		
		Bank_accountVO vo = new Bank_accountVO();
		vo.setBank_account_id(bank_account_id);
		vo.setBank_account_name(bank_account_name);
		vo.setBank_account_number(bank_account_number);
		vo.setBank_name(bank_name);
		vo.setUse_state(use_state);
		vo.setReg_date(reg_date);
		
		int cnt = dao.update_bank_account(vo);
		model.addAttribute("cnt", cnt);
	}
	
	// 전체 전표목록 조회
	@Transactional 
	@Override
	public void search_all_statements_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
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
		
		cnt = dao.select_statements_cnt();
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
			ArrayList<JoinStatementDTO> dtos = new ArrayList<JoinStatementDTO>();
			Map<String, Object> daoMap = new HashMap<>();
				daoMap.put("start", start);
				daoMap.put("end", end);
			int salesCnt = 0;
			int purchaseCnt = 0;
			int salaryCnt = 0;
			int taxCnt = 0;
			
			dtos = dao.select_statements(daoMap);
			JoinStatementDTO dto = new JoinStatementDTO();
				for(int i=0; i<dtos.size(); i++) {
					JoinStatementDTO tempDTO = dtos.get(i);
					if(tempDTO.getSales_id()!=null) {
					dto.setSales_id(tempDTO.getSales_id());
					}else if(tempDTO.getPurchase_id()!=null) {
					dto.setPurchase_id(tempDTO.getPurchase_id());
					}else if(tempDTO.getSalary_register_id()!=null) {
					dto.setSalary_register_id(tempDTO.getSalary_register_id());
					}else if(tempDTO.getTax_account_id()!=null) {
					dto.setTax_account_id(tempDTO.getTax_account_id());
					}
				}
				model.addAttribute("dtos", dtos);
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
	@Transactional 
	//상세전표조회
	@Override
	public void search_statement_detail(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String statement_id = req.getParameter("statement_id");
		String sales_id = req.getParameter("sales_id");
		String purchase_id = req.getParameter("purchase_id");
		String salary_register_id = req.getParameter("salary_register_id");
		
		int typeCnt = 0;
		Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("statement_id", statement_id);
		// 전표 디테일, account_name 가져오기
			if(sales_id !=null) {
				daoMap.put("sales_id", sales_id);
				typeCnt =1;
				model.addAttribute("sales_id", sales_id);
			}else if(purchase_id !=null) {
				daoMap.put("purchase_id", purchase_id);
				typeCnt =2;
				model.addAttribute("purchase_id", purchase_id);
			}else if(salary_register_id !=null) {
				daoMap.put("salary_register_id", salary_register_id);
				typeCnt =3;
				model.addAttribute("salary_register_id", salary_register_id);
			}else {
				typeCnt =4;
			}
			daoMap.put("typeCnt", typeCnt);
		ArrayList<JoinStatementDTO> dtos = dao.select_statement_detail(daoMap);
		model.addAttribute("dtos", dtos);
		
		JoinStatementDTO dto = new JoinStatementDTO();
		for(int i=0; i<dtos.size(); i++) {
			JoinStatementDTO tempDTO = dtos.get(i);
			dto.setStatement_type(tempDTO.getStatement_type());
			dto.setApproval_state(tempDTO.getApproval_state());
		}
		model.addAttribute("statement_type", dto.getStatement_type());
		model.addAttribute("approval_state", dto.getApproval_state());
		model.addAttribute("statement_id", statement_id);
		
		model.addAttribute("typeCnt",typeCnt);
		
		String company_name = dao.select_detail_company_name(daoMap);
		model.addAttribute("company_name", company_name);
	}
	//전표 생성
	@Override
	public void make_statement_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	}
	
	// 전표 승인 처리 
	@Transactional 
	@Override
	public void approve_statement_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String statement_ides = req.getParameter("statement_id");
		String statement_type = req.getParameter("statement_type");
		String connected_id = req.getParameter("connected_id"); 
		int typeCnt = Integer.parseInt(req.getParameter("typeCnt"));
		String statement_ids[] = statement_ides.split(",");
		int scnt = 0;
		int acnt = 0;
		int bcnt = 0;
		int checkCnt = 0;
		int cnt = statement_ids.length-1; //선택한 거래에 해당하는 전표개수
		Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("typeCnt", typeCnt);
			
		for(int i=1; i<cnt+1; i++) {
			daoMap.put("statement_id", statement_ids[i]);
			int checkBankAccountCnt = 0;
			int checkAccountCnt = dao.select_check_account_id_with_statement_id(daoMap);
			if(checkAccountCnt==1) { //계좌 가져야하는 계정의 전표라면
				checkCnt=1;
				checkBankAccountCnt = dao.select_check_excist(daoMap); //그 계정이 계좌가 있는지 확인
				if(checkBankAccountCnt==0) { //계좌가 없는경우
					checkCnt=2; 
				}
			}else {
				checkCnt=0;
			}
		}
		if(checkCnt==0) { //계좌 가져야하는 계정의 전표가 아닌경우
			for(int i= 1; i<cnt+1; i++){	
				daoMap.put("statement_id", statement_ids[i]);
				scnt += dao.update_statement_approval_state(daoMap); //전표 승인상태 변경
				acnt += dao.update_account_account_value(daoMap); // 계정 값 변경
			}
		}else if(checkCnt==1){ //계좌 가져야하는 계정의 전표인 경우
			for(int i= 1; i<cnt+1; i++){
				System.out.println(cnt+"번째 전표!*********");
				daoMap.put("statement_id", statement_ids[i]);
				scnt += dao.update_statement_approval_state(daoMap); //전표 승인상태 변경
				System.out.println("scnt : " + scnt);
				acnt += dao.update_account_account_value(daoMap); // 계정 값 변경 
				System.out.println("acnt : " + acnt);
				int typeCheck = dao.select_check_statement_type(daoMap); // 전표타입 판단
				int check = dao.select_account_id_check(daoMap); //매입채무는 -값이므로 부호 바꿔주기 위해서 우선 매입채무인지 아닌지 확인
				System.out.println("이제부터 통장처리");
				if(typeCheck!=0) { //입금, 출금, 급여 전표일 경우에만!
					if(check!=0) {
						System.out.println("매입채무!");
						bcnt += dao.update_bank_account_value_for_purchase(daoMap);
					}else {
						System.out.println("매입채무아님");
						bcnt += dao.update_bank_account_account_value(daoMap); //계좌 값 변경
					}
				}
			}
		}
		String statement_id = statement_ids[1];
		
		model.addAttribute("statement_id", statement_id);
		if(connected_id != null) model.addAttribute("connected_id", connected_id);
		model.addAttribute("typeCnt", typeCnt);
		model.addAttribute("cnt", cnt);
		model.addAttribute("scnt", scnt);
		model.addAttribute("acnt", acnt); 
		model.addAttribute("bcnt", bcnt);
		model.addAttribute("checkCnt", checkCnt);

	}
	// 전표 승인 거절
	@Transactional 
	@Override
	public void disapprove_statement_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req =(HttpServletRequest)map.get("req");
		
		String statement_ides = req.getParameter("statement_id");
		int typeCnt = Integer.parseInt(req.getParameter("typeCnt"));
		String statement_ids[] = statement_ides.split(",");
		int scnt = 0;
		int cnt = statement_ids.length-1; //선택한 거래에 해당하는 전표개수
		Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("typeCnt", typeCnt);
		for(int i= 1; i<cnt+1; i++){		
			daoMap.put("statement_id", statement_ids[i]);
			scnt += dao.update_statement_disapproval_state(daoMap);//전표 승인상태 변경
		}
		
		String statement_id = statement_ids[1];
		String connected_id = req.getParameter("connected_id"); 
		model.addAttribute("statement_id", statement_id);
		if(connected_id != null) model.addAttribute("connected_id", connected_id);
		model.addAttribute("typeCnt", typeCnt);
		model.addAttribute("cnt", cnt);
		model.addAttribute("scnt", scnt);
	}
	@Transactional 
	@Override
	public void search_unapproval_statements_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
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
		
		cnt = dao.select_unapproval_statements_cnt();
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
			ArrayList<JoinStatementDTO> dtos = new ArrayList<JoinStatementDTO>();
			Map<String, Object> daoMap = new HashMap<>();
				daoMap.put("start", start);
				daoMap.put("end", end);
			int salesCnt = 0;
			int purchaseCnt = 0;
			int salaryCnt = 0;
			int taxCnt = 0;
			
			dtos = dao.select_unapproval_statements(daoMap);
			JoinStatementDTO dto = new JoinStatementDTO();
				for(int i=0; i<dtos.size(); i++) {
					JoinStatementDTO tempDTO = dtos.get(i);
					if(tempDTO.getSales_id()!=null) {
					dto.setSales_id(tempDTO.getSales_id());
					}else if(tempDTO.getPurchase_id()!=null) {
					dto.setPurchase_id(tempDTO.getPurchase_id());
					}else if(tempDTO.getSalary_register_id()!=null) {
					dto.setSalary_register_id(tempDTO.getSalary_register_id());
					}
				}
				if(dto.getSales_id()!=null) { //sales_id 
					salesCnt = 1;
				}
				if(dto.getSalary_register_id()!=null) { //salary_register_id
					salaryCnt = 1;
				}
				if(dto.getPurchase_id()!=null) { //purchase_id
					purchaseCnt = 1;
				}
				if(dto.getSalary_register_id()==null && dto.getSales_id()==null && dto.getPurchase_id()==null){
					taxCnt = 1;
				}
				model.addAttribute("dtos", dtos);
				model.addAttribute("salesCnt", salesCnt);
				model.addAttribute("purchaseCnt", purchaseCnt);
				model.addAttribute("salaryCnt", salaryCnt);
				model.addAttribute("taxCnt", taxCnt);
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
	//승인전표 조회
	@Transactional 
	@Override
	public void search_approval_statements_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
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
		
		cnt = dao.select_approval_statements_cnt();
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
			ArrayList<JoinStatementDTO> dtos = new ArrayList<JoinStatementDTO>();
			Map<String, Object> daoMap = new HashMap<>();
				daoMap.put("start", start);
				daoMap.put("end", end);
			int salesCnt = 0;
			int purchaseCnt = 0;
			int salaryCnt = 0;
			int taxCnt = 0;
			
			dtos = dao.select_approval_statements(daoMap);
			JoinStatementDTO dto = new JoinStatementDTO();
				for(int i=0; i<dtos.size(); i++) {
					JoinStatementDTO tempDTO = dtos.get(i);
					if(tempDTO.getSales_id()!=null) {
					dto.setSales_id(tempDTO.getSales_id());
					}else if(tempDTO.getPurchase_id()!=null) {
					dto.setPurchase_id(tempDTO.getPurchase_id());
					}else if(tempDTO.getSalary_register_id()!=null) {
					dto.setSalary_register_id(tempDTO.getSalary_register_id());
					}
				}
				if(dto.getSales_id()!=null) { //sales_id 
					salesCnt = 1;
				}
				if(dto.getSalary_register_id()!=null) { //salary_register_id
					salaryCnt = 1;
				}
				if(dto.getPurchase_id()!=null) { //purchase_id
					purchaseCnt = 1;
				}
				if(dto.getSalary_register_id()==null && dto.getSales_id()==null && dto.getPurchase_id()==null){
					taxCnt = 1;
				}
				model.addAttribute("dtos", dtos);
				model.addAttribute("salesCnt", salesCnt);
				model.addAttribute("purchaseCnt", purchaseCnt);
				model.addAttribute("salaryCnt", salaryCnt);
				model.addAttribute("taxCnt", taxCnt);
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
	// connected_id 불러오기
	@Transactional 
	@Override
	public void call_connected_id_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String access_role = req.getParameter("access_role");
		ArrayList<JoinStatementDTO> dtos = new ArrayList<JoinStatementDTO>();
		if(access_role.equals("SA")) { //sales 
			dtos = dao.select_sales_statement();
			model.addAttribute("sales_dtos",dtos);
			model.addAttribute("sales_Cnt", dtos.size());
		}else if(access_role.equals("PU")) { //purchase
			dtos = dao.select_purchase_statement();
			model.addAttribute("purchase_dtos",dtos);
			model.addAttribute("purchase_Cnt", dtos.size());
		}else if(access_role.equals("HR")) { //salary
			dtos = dao.select_salary_statement();
			model.addAttribute("salary_dtos",dtos);
			model.addAttribute("salary_Cnt", dtos.size());
		}else if(access_role.equals("FI")) { //tax
			dtos = dao.select_tax_statement();
			model.addAttribute("tax_dtos",dtos);
			model.addAttribute("tax_Cnt", dtos.size());
		}
		model.addAttribute("access_role", access_role);
	}
	@Override
	public void call_connected_id_view_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	}
	// 전표 등록 처리
	@Override
	@Transactional 
	public void make_statement_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int typeCnt = Integer.parseInt(req.getParameter("typeCnt"));
		String connected_id = req.getParameter("connected_id");
		String statement_type = req.getParameter("statement_type");
		String account_id = req.getParameter("account_id");
		int search_statements_list_type = 0;
		int scnt = 0;
		int ccnt = 0;
		ArrayList<JoinStatementDTO> dtos = new ArrayList<JoinStatementDTO>();
		StatementVO vo = new StatementVO(); // 전표생성 
		JoinStatementDTO dto = new JoinStatementDTO(); //연결전표생성
		
		if(typeCnt==1) {
			dtos = dao.select_same_id_sales_statement(connected_id);
		}if(typeCnt==2) {
			dtos = dao.select_same_id_purchase_statement(connected_id);
		}if(typeCnt==3) {
			dtos = dao.select_same_id_salary_statement(connected_id);
		}if(typeCnt==4) { //tax의 경우
			JoinStatementDTO taxdto = new JoinStatementDTO(); // 세금 전표 생성
			taxdto = dao.select_same_type_tax(account_id);
			long taxValue = -taxdto.getAccount_value();
			
			vo.setAccount_value(taxValue);
			vo.setStatement_type(statement_type);
			scnt = dao.insert_statement(vo); //세금전표 생성처리(부가세대급금,부가세예수금)
			String taxStId = dao.select_get_tax_statement_id();
			dto.setAccount_id(account_id); 
			ccnt = dao.insert_connected_statement(dto); //연결전표 생성처리
			if(taxdto.getAccount_id().equals("500011030000")) { // 부가세대급금
				vo.setAccount_value(-taxValue);
			}
			scnt = scnt + dao.insert_statement(vo); //세금전표 생성처리(현금)
			String cashStId = dao.select_get_tax_statement_id();
			dto.setAccount_id("500011010000");
			ccnt = ccnt + dao.insert_connected_statement(dto); //연결전표 생성처리
			
			String statement_id = "," + taxStId + "," + cashStId;
			model.addAttribute("typeCnt", typeCnt);
			model.addAttribute("statement_id",statement_id);
			model.addAttribute("statement_type", statement_type);
		}
		if(typeCnt!=4) {
			search_statements_list_type = 2;
			for(int i=0; i<dtos.size(); i++) {
				JoinStatementDTO tempDTO = dtos.get(i);
				
				long account_value = tempDTO.getAccount_value();
				vo.setAccount_value(account_value);
				vo.setStatement_type(statement_type);
				if(typeCnt==4) {
					scnt = dao.insert_statement(vo);
				}
				scnt = scnt + dao.insert_statement(vo); // 전표생성
				
				if(typeCnt==1) {
					String sales_id = connected_id;
					dto.setSales_id(sales_id);
				}
				if(typeCnt==2) {
					String purchase_id = connected_id;
					dto.setPurchase_id(purchase_id);
				}
				if(typeCnt==3) {
					String salary_register_id = connected_id;
					dto.setSalary_register_id(salary_register_id);
				}
				
				account_id = tempDTO.getAccount_id();
				dto.setAccount_id(account_id);
				ccnt = dao.insert_connected_statement(dto); //연결전표 생성처리
			}
		
		model.addAttribute("addStatementCnt", scnt);
		model.addAttribute("addConnectedCnt", ccnt);
		}
		model.addAttribute("search_statements_list_type", search_statements_list_type);
	}
	
	//////////////////////////// 계정 관리 ///////////////////////////////////////
	@Override
	@Transactional 
	public void search_account_list_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		int pageSize	= 10;
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
		
		cnt = dao.select_account_cnt();
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
			ArrayList<AccountVO> vos = new ArrayList<AccountVO>();
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			vos = dao.select_account_list(daoMap);
			model.addAttribute("accountVos", vos);
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
	public void add_account_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	}
	@Override
	@Transactional 
	public void add_account_dupCheck_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String account_id = req.getParameter("account_id");
		if(req.getParameter("account_id") != null) {
			AccountVO vo = dao.select_account("5000" + account_id + "0000");
			if(vo != null) {
				model.addAttribute("cnt", 1);
				model.addAttribute("account_name", vo.getAccount_name());
			} else {
				model.addAttribute("cnt", 0);
			}
			model.addAttribute("account_id", account_id);
		}
	}
	@Override
	public void add_account_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String account_id = req.getParameter("account_id");
		String account_name = req.getParameter("account_name");
		int account_balance = Integer.parseInt(req.getParameter("account_balance"));
	
		AccountVO vo = new AccountVO();
		vo.setAccount_id(account_id);
		vo.setAccount_name(account_name);
		vo.setAccount_balance(account_balance);
		
		int cnt = dao.insert_account(vo);
		model.addAttribute("cnt", cnt);
	}
	@Override
	public void modify_account_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String account_id = req.getParameter("account_id");
		AccountVO vo = dao.select_ori_account(account_id);
		model.addAttribute("vo", vo);
	}
	@Override
	public void modify_account_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String account_id = req.getParameter("account_id");
		String account_name = req.getParameter("account_name");
		int account_balance = Integer.parseInt(req.getParameter("account_balance"));
		
		AccountVO vo = new AccountVO();
		vo.setAccount_id(account_id);
		vo.setAccount_name(account_name);
		vo.setAccount_balance(account_balance);
		
		int cnt = dao.update_modify_account(vo);
		model.addAttribute("cnt",cnt);		
	}
	@Override
	public void search_balance_sheet_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		ArrayList<JoinStatementDTO> yearDto = new ArrayList<JoinStatementDTO>();
		yearDto = dao.get_statement_year();
		model.addAttribute("yearDto",yearDto);
		model.addAttribute("yearValuable", yearDto.size());
	}
	@Override
	@Transactional 
	public void show_balance_sheet_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int year = Integer.parseInt(req.getParameter("year"));
		int quarter_end = Integer.parseInt(req.getParameter("quarter"));
		int quarter_start = quarter_end -3;
		if(quarter_end ==3) {
			quarter_start = quarter_end -2;
		}
		Map<Object, Object> daoMap = new HashMap<>();
		daoMap.put("year", year);
		daoMap.put("quarter_start", quarter_start);
		daoMap.put("quarter_end", quarter_end);
		ArrayList<JoinStatementDTO> dtos = new ArrayList<JoinStatementDTO>();
		ArrayList<AccountVO> vos = new ArrayList<AccountVO>();
		vos = dao.select_accounts();
		int assetsCnt = 0;
		int liabilitiesCnt = 0;
		int capitalCnt = 0;
		for(int i=0; i<vos.size(); i++) {
			JoinStatementDTO dto = new JoinStatementDTO();
			AccountVO tempVO = vos.get(i);
			String account_id = tempVO.getAccount_id();
			String account_name = tempVO.getAccount_name();
			daoMap.put("account_id", account_id);
			Long sum = (long) 0;
				if(dao.select_accounts_for_quarter_sales(daoMap)!=null) {
					sum += dao.select_accounts_for_quarter_sales(daoMap);
				}
				if(dao.select_accounts_for_quarter_purchase(daoMap)!=null) {
					sum += dao.select_accounts_for_quarter_purchase(daoMap);
				}
				if(dao.select_accounts_for_quarter_salary(daoMap)!=null) {
					sum += dao.select_accounts_for_quarter_salary(daoMap);
				}
				if(dao.select_accounts_for_quarter_tax(daoMap)!=null) {
					sum += dao.select_accounts_for_quarter_tax(daoMap);
				}
			
			String account_class = "";
			if(account_id.substring(4,6).equals("11")){ // 자산
				account_class = "assets";
				assetsCnt = assetsCnt + 1;
			}else if(account_id.substring(4,6).equals("12")) { //부채
				account_class = "liabilities";
				liabilitiesCnt = liabilitiesCnt + 1;
			}else if(account_id.substring(4,6).equals("13")) {
				account_class = "capital";
				capitalCnt = capitalCnt+1;
			}
			dto.setAccount_id(account_id);
			dto.setAccount_name(account_name);
			dto.setSum(sum);
			dto.setAccount_class(account_class);
			dtos.add(dto);
		}
		
		
		model.addAttribute("vos", vos);
		model.addAttribute("dtos",dtos);
		model.addAttribute("assetsCnt",assetsCnt);
		model.addAttribute("liabilitiesCnt",liabilitiesCnt);
		model.addAttribute("capitalCnt",capitalCnt);
		model.addAttribute("year", year);
		String quarter="";
		if(quarter_end==3) quarter="1분기";
		else if(quarter_end==6) quarter="2분기";
		else if(quarter_end==9) quarter="3분기";
		else if(quarter_end==12) quarter="4분기";
		model.addAttribute("quarter", quarter);
		
	}
	@Override
	public void search_profit_and_loss_statement_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		model.addAttribute("yearValuable", 999);
	}
	//손익계산서 조회
	@Override
	@Transactional 
	public void show_profit_and_loss_statement_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		Map<Object, Object> daoMap = new HashMap<>();
		daoMap.put("startDate", startDate);
		daoMap.put("endDate", endDate);
		ArrayList<JoinStatementDTO> dtos = new ArrayList<JoinStatementDTO>();
		ArrayList<AccountVO> vos = new ArrayList<AccountVO>();
		vos = dao.select_accounts();
		
		for(int i=0; i<vos.size(); i++) {
			JoinStatementDTO dto = new JoinStatementDTO();
			AccountVO tempVO = vos.get(i);
			String account_id = tempVO.getAccount_id();
			String account_name = tempVO.getAccount_name();
			daoMap.put("account_id", account_id);
			
			Long sum = (long) 0;
				if(dao.select_accounts_for_date_sales(daoMap)!=null) {
					sum += dao.select_accounts_for_date_sales(daoMap);
				}
				if(dao.select_accounts_for_date_purchase(daoMap)!=null) {
					sum += dao.select_accounts_for_date_purchase(daoMap);
				}
				if(dao.select_accounts_for_date_salary(daoMap)!=null) {
					sum += dao.select_accounts_for_date_salary(daoMap);
				}
				if(dao.select_accounts_for_date_tax(daoMap)!=null) {
					sum += dao.select_accounts_for_date_tax(daoMap);
				}
				
				if(account_id.equals("500014020000")) { //매출원가 계정
					ArrayList<JoinStatementDTO> sales_ids = new ArrayList<JoinStatementDTO>();
					sales_ids = dao.select_sales_id(daoMap);
					for(int j=0; j<sales_ids.size(); j++) {
						JoinStatementDTO tempDto = sales_ids.get(j);
						String sales_id = tempDto.getSales_id();
						Map<String, Object> oriPriceMap = new HashMap<>();
						oriPriceMap.put("sales_id", sales_id);
						oriPriceMap.put("account_id", "500014030000");
						int count_sales = dao.select_count_sales(oriPriceMap);
							long total_purchase_price = dao.select_total_purchase_price(daoMap);
							int total_purcahse_count = dao.select_total_purchase_count(daoMap);
						long sales_origin_unit_price = total_purchase_price/total_purcahse_count;
						/*int purchase_unit_price = dao.select_purchase_unit_price(oriPriceMap);*/
						sum = sum + (count_sales*sales_origin_unit_price);
					}
				}
			String account_class = "";
			if(account_id.substring(4,6).equals("14")){
				account_class = "profit_and_loss";
			}
			dto.setAccount_id(account_id);
			dto.setAccount_name(account_name);
			dto.setSum(sum);
			dto.setAccount_class(account_class);
			dtos.add(dto);
		}
		model.addAttribute("vos", vos);
		model.addAttribute("dtos",dtos);
		Date sDate = Date.valueOf(startDate);
		Date eDate = Date.valueOf(endDate);
		model.addAttribute("startDate",sDate);
		model.addAttribute("endDate",eDate);
	}
	@Override
	public void search_statement_of_cash_flows_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		model.addAttribute("yearValuable", 999);
	}
	@Override
	@Transactional 
	public void show_statement_of_cash_flows_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		Map<Object, Object> daoMap = new HashMap<>();
		daoMap.put("startDate", startDate);
		daoMap.put("endDate", endDate);
		
		ArrayList<JoinStatementDTO> pre_dtos = new ArrayList<JoinStatementDTO>();
		ArrayList<JoinStatementDTO> dtos = new ArrayList<JoinStatementDTO>();
		pre_dtos = dao.select_cash_values(daoMap);
		
		for(int i=0; i<pre_dtos.size(); i++) {
			JoinStatementDTO dto = new JoinStatementDTO();
			JoinStatementDTO tempVO = pre_dtos.get(i);
			String statement_id = tempVO.getStatement_id();
			Long account_value = (long) tempVO.getAccount_value();
			java.util.Date reg_date = tempVO.getReg_date();
			String tax = tempVO.getAccount_id();
			String account_name = "";
			if(tax!=null) { //세금
				if(dao.select_account_name_for_tax(statement_id)!=null) {
					account_name = dao.select_account_name_for_tax(statement_id);
				}else if(dao.select_account_name_for_tax(statement_id)==null){
					 continue;
				}
			}else if(tax==null){
				if(dao.select_account_name_for_all(statement_id)!=null) {
					account_name = dao.select_account_name_for_all(statement_id);
				}else if(dao.select_account_name_for_all(statement_id)==null){
					 continue;
				}
			}
			
			dto.setAccount_name(account_name);
			dto.setAccount_value(account_value);
			dto.setReg_date(reg_date);
			dtos.add(dto);
		}
		model.addAttribute("dtos", dtos);
		model.addAttribute("cnt",dtos.size());
		Date sDate = Date.valueOf(startDate);
		Date eDate = Date.valueOf(endDate);
		model.addAttribute("startDate",sDate);
		model.addAttribute("endDate",eDate);
		
	}
	@Override
	@Transactional 
	public void search_statements_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		int search_statements_list_type = 0;
		int input_type = 0;
		if(req.getParameter("search_statements_list_type")!=null) {
			search_statements_list_type = Integer.parseInt(req.getParameter("search_statements_list_type"));
		}else {
			search_statements_list_type = 1;
		}
		if(req.getParameter("input_type")!=null) {
			input_type = Integer.parseInt(req.getParameter("input_type"));
		}else {
			input_type = 0;
		}
		model.addAttribute("search_statements_list_type", search_statements_list_type);
		model.addAttribute("input_type",input_type);
	}
	@Override
	public void search_all_bond_debt_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
	}
	@Override
	@Transactional 
	public void search_bond_debt_by_company_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		ArrayList<JoinStatementDTO> dtos = new ArrayList<JoinStatementDTO>();
		ArrayList<JoinStatementDTO> pre_dtos = new ArrayList<JoinStatementDTO>();
		pre_dtos = dao.select_company_name();
		
		for(int i=0; i<pre_dtos.size(); i++) {
			JoinStatementDTO dto = new JoinStatementDTO();
			JoinStatementDTO tempVO = pre_dtos.get(i);
			String company_name="";
				System.out.println(i+"번째는 고객사 이름 " + tempVO.getSales_company_name() + "과 공급사 이름" + tempVO.getPurchase_company_name() + "가 있습니다");
				if(tempVO.getSales_company_name()!=null) {
					company_name = tempVO.getSales_company_name();
				}else if(tempVO.getPurchase_company_name()!=null){
					company_name = tempVO.getPurchase_company_name();
				}
		    dto.setCompany_name(company_name);
			dtos.add(dto);
		}
		model.addAttribute("dtos", dtos);
	}
	@Override
	@Transactional 
	public void show_all_bond_debt_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		Map<Object, Object> daoMap = new HashMap<>();
		daoMap.put("startDate", startDate);
		daoMap.put("endDate", endDate);
		ArrayList<JoinStatementDTO> dtos = new ArrayList<JoinStatementDTO>();
		ArrayList<JoinStatementDTO> pre_dtos = new ArrayList<JoinStatementDTO>();
		pre_dtos = dao.select_all_bond_debt_list(daoMap);
		for(int i=0; i<pre_dtos.size(); i++) {
			JoinStatementDTO dto = new JoinStatementDTO();
			JoinStatementDTO tempVO = pre_dtos.get(i);
			String account_id ="";
			String company_name="";
				if(tempVO.getSales_account_id()!=null) {
					account_id = tempVO.getSales_account_id();
					company_name = tempVO.getSales_company_name();
				}else if(tempVO.getPurchase_account_id()!=null){
					account_id = tempVO.getPurchase_account_id();
					company_name = tempVO.getPurchase_company_name();
				}
		    java.util.Date reg_date = tempVO.getReg_date();
		    Long account_value = tempVO.getAccount_value();
		    dto.setAccount_id(account_id);
		    dto.setCompany_name(company_name);
		    dto.setReg_date(reg_date);
		    dto.setAccount_value(account_value);
			dtos.add(dto);
		}
		model.addAttribute("dtos", dtos);
		model.addAttribute("dtosCnt", dtos.size());
	}
	@Override
	@Transactional 
	public void show_bond_debt_by_company_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String startDate = req.getParameter("startDate");
		String endDate = req.getParameter("endDate");
		String company_name = req.getParameter("company_name");
		Map<Object, Object> daoMap = new HashMap<>();
		daoMap.put("startDate", startDate);
		daoMap.put("endDate", endDate);
		daoMap.put("company_name", company_name);
		ArrayList<JoinStatementDTO> dtos = new ArrayList<JoinStatementDTO>();
		ArrayList<JoinStatementDTO> pre_dtos = new ArrayList<JoinStatementDTO>();
		pre_dtos = dao.select_bond_debt_list_by_company(daoMap);
		
		for(int i=0; i<pre_dtos.size(); i++) {
			JoinStatementDTO dto = new JoinStatementDTO();
			JoinStatementDTO tempVO = pre_dtos.get(i);
			String account_id ="";
				if(tempVO.getSales_account_id()!=null) {
					account_id = tempVO.getSales_account_id();
					company_name = tempVO.getSales_company_name();
				}else if(tempVO.getPurchase_account_id()!=null){
					account_id = tempVO.getPurchase_account_id();
					company_name = tempVO.getPurchase_company_name();
				}
		    java.util.Date reg_date = tempVO.getReg_date();
		    Long account_value = tempVO.getAccount_value();
		    dto.setAccount_id(account_id);
		    dto.setCompany_name(company_name);
		    dto.setReg_date(reg_date);
		    dto.setAccount_value(account_value);
			dtos.add(dto);
		}
		model.addAttribute("dtos", dtos);
		model.addAttribute("dtosCnt", dtos.size());
	}
	
}
