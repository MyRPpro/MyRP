package com.pro.myrp.service.sales;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.SalesVO;
import com.pro.myrp.persistence.sales.SalesDAO;

@Service
public class SalesServiceImpl implements SalesService {

	@Inject
	private SalesDAO dao;

	@Override
	public void sales_list_servie(Model model) throws Exception {

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
		
		cnt = dao.select_sales_cnt();
		
		System.out.println("  -> sales Count : " + cnt);
		
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
			ArrayList<SalesVO> vos = new ArrayList<SalesVO>();
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			
			vos = dao.select_sales_list(daoMap);
			model.addAttribute("salesVOs", vos);
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
	public void detail_sales_service(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String company_id = req.getParameter("company_id");
		System.out.println("  -> company_id : "  + company_id);
		SalesVO vo = dao.select_detail_service(company_id);
		
		if( vo != null ){
			System.out.println("  -> Complete value import ...");
			model.addAttribute("salesVo", vo);
			
		} else {	// 불러오기 실패
			System.out.println("  -> Error loading value...");
			
		}
		
	}
}
