package com.pro.myrp.service.account;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.accounting_management.Bank_accountVO;
import com.pro.myrp.persistence.account.AccountDAO;

@Service
public class AccountServiceImpl implements AccountService {

	@Inject
	private AccountDAO dao;

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
}
