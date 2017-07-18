package com.pro.myrp.service.account;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
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
		System.out.println("start,end:"+startPage+","+endPage);
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
	// 계좌등록 : 뷰(View)
	@Override
	public void register_bank_account_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
	}
	
	// 계좌 등록 : bank_account_id 불러오기
	@Override
	public void call_bank_account_id_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		ArrayList<AccountVO> vos = new ArrayList<AccountVO>();
		vos = dao.select_bank_account_id();
		model.addAttribute("vos", vos);
	}
	
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
		System.out.println("cnt: " + cnt);
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
		System.out.println("cnt: " +cnt);
		model.addAttribute("cnt", cnt);
	}
	
	// 전체 전표목록 조회
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
		System.out.println("cnt: " +  cnt);
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
					}
				}
				System.out.println("구매아이디: "+dto.getPurchase_id());
				System.out.println("판매아이디: "+dto.getSales_id());
				System.out.println("급여아이디: "+dto.getSalary_register_id());
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
				System.out.println("sales, purchase, salary, tax CNT : "+ salesCnt+","+ purchaseCnt +","+ salaryCnt +","+ taxCnt);
		}
		startPage = (currentPage/pageBlock)*pageBlock+1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		endPage = startPage+pageBlock-1;
		if(endPage>pageCount) endPage = pageCount;
		System.out.println("start,end:"+startPage+","+endPage);
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
	//상세전표조회
	/*@Override
	public void search_statement_detail(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String statement_id = req.getParameter("statement_id");
		String sales_id = req.getParameter("sales_id");
		String purchase_id = req.getParameter("purchase_id");
		String salary_register_id = req.getParameter("salary_register_id");
		
		ArrayList<StatementVO> vos = new ArrayList<StatementVO>();
		Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("statement_id", statement_id);
		// 전표 디테일, account_name 가져오기
		if(sales_id !=null) {
			daoMap.put("sales_id", sales_id);
			daoMap.put("typeCnt", 1);
		}else if(purchase_id !=null) {
			daoMap.put("purchase_id", purchase_id);
			daoMap.put("typeCnt", 2);
		}else if(salary_register_id !=null) {
			daoMap.put("salary_register_id", salary_register_id);
			daoMap.put("typeCnt", 3);
		}else {
			daoMap.put("typeCnt", 4);
		}
		vos = dao.select_statement_detail(daoMap);
		model.addAttribute("vos", vos);
		
		String company_name = dao.select_detail_company_name(daoMap);
		model.addAttribute("company_name", company_name);
	}*/
	/*@Override
	public void make_statement_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
	}*/
	/*@Override
	public void approve_statement_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		String statement_id = req.getParameter("statement_id");
		int scnt = 0;
		int acnt = 0;
		
		int cnt = dao.select_statement_cnt(statement_id); //선택한 거래에 해당하는 전표개수
		ArrayList<StatementVO> vos = new ArrayList<StatementVO>();
		vos = dao.select_statement_ids(statement_id);
		
		for(int i= 0; i<=cnt; i++){		
			StatementVO tempVO = vos.get(i);
			scnt += dao.update_statement_approval_state(tempVO.getStatement_id()); //전표 승인상태 변경
			System.out.println(dao.update_statement_approval_state(tempVO.getStatement_id()));
			acnt += dao.update_account_account_value(tempVO.getStatement_id()); // 계정 값 변경 
		}
		model.addAttribute("scnt", scnt);
		model.addAttribute("acnt", acnt); 
	}
	
	
	*/
}
