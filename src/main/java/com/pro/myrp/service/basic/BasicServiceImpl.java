package com.pro.myrp.service.basic;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.CompanyVO;
import com.pro.myrp.persistence.basic.BasicDAO;

@Service
public class BasicServiceImpl implements BasicService {

	@Inject
	private BasicDAO dao;

	@Override
	public void company_list_service(Model model) throws Exception {
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
		
		cnt = dao.select_company_cnt();
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
			ArrayList<CompanyVO> vos = new ArrayList<CompanyVO>();
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			vos = dao.select_company_list(daoMap);
			model.addAttribute("vos", vos);
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

	@Override
	public void reg_company_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
	}


	@Override
	public void reg_company_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String company_id = req.getParameter("company_id");
		String company_name = req.getParameter("company_name");
		String biz_reg_no = req.getParameter("biz_reg_no");
		String ceo_name = req.getParameter("ceo_name");
		String corp_reg_no = req.getParameter("corp_reg_no");
		String address = req.getParameter("address");
		String biz_type = req.getParameter("biz_type");
		String biz_item = req.getParameter("biz_item");
		String use_state = req.getParameter("use_state");
		String company_type = req.getParameter("company_type");
		
		CompanyVO vo = new CompanyVO();
		vo.setCompany_id(company_id);
		vo.setCompany_name(company_name);
		vo.setBiz_reg_no(biz_reg_no);
		vo.setCeo_name(ceo_name);
		vo.setCorp_reg_no(corp_reg_no);
		vo.setAddress(address);
		vo.setBiz_type(biz_type);
		vo.setBiz_item(biz_item);
		vo.setUse_state(use_state);
		vo.setCompany_type(company_type);
		
		int cnt = dao.insert_company(vo);
		System.out.println("cnt: "+cnt);
		model.addAttribute("cnt", cnt);
	}
}
