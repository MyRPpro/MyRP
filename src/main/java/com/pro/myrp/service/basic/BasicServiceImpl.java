package com.pro.myrp.service.basic;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.base_registration.CompanyVO;
import com.pro.myrp.domain.base_registration.ProductVO;
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
			model.addAttribute("companyVos", vos);
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
	public void add_company_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
	}

	@Override
	public void add_company_pro_service(Model model) throws Exception {
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
		Date reg_date = req.getParameter("reg_date") == "" ? new Date(0):Date.valueOf(req.getParameter("reg_date"));
		
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
		vo.setReg_date(reg_date);
		
		int cnt = dao.insert_company(vo);
		System.out.println("cnt: "+cnt);
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void modify_company_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String company_id = req.getParameter("company_id");
		CompanyVO vo = new CompanyVO();
		vo = dao.select_company(company_id);
		model.addAttribute("companyVo", vo);
	}

	@Override
	public void modify_company_pro_service(Model model) throws Exception {
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
		Date reg_date = req.getParameter("reg_date") == "" ? new Date(0):Date.valueOf(req.getParameter("reg_date"));
		
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
		vo.setReg_date(reg_date);
		
		int cnt = dao.update_company(vo);
		System.out.println("cnt: "+cnt);
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void product_list_service(Model model) throws Exception {
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
		
		cnt = dao.select_product_cnt();
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
			ArrayList<ProductVO> vos = new ArrayList<ProductVO>();
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			vos = dao.select_product_list(daoMap);
			model.addAttribute("productVos", vos); 
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
	public void add_product_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
	}


	@Override
	public void add_product_dupCheck_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String product_id = req.getParameter("product_id");
		ProductVO vo = new ProductVO();
		vo = dao.select_product(product_id);
		if(vo != null) {
			model.addAttribute("cnt", 1);
			model.addAttribute("dup_product_name", vo.getProduct_name());
		} else {
			model.addAttribute("cnt", 0);
		}
		model.addAttribute("product_id", product_id);
	}


	@Override
	public void add_product_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String product_id = req.getParameter("product_id");
		String product_name = req.getParameter("product_name");
		int purchase_unit_price =
				Integer.parseInt(req.getParameter("purchase_unit_price"));
		int sale_unit_price =
				Integer.parseInt(req.getParameter("sale_unit_price"));
		String use_state = req.getParameter("use_state");
		Date reg_date = Date.valueOf(req.getParameter("reg_date"));
		ProductVO vo = new ProductVO();
		vo.setProduct_id(product_id);
		vo.setProduct_name(product_name);
		vo.setPurchase_unit_price(purchase_unit_price);
		vo.setSale_unit_price(sale_unit_price);
		vo.setUse_state(use_state);
		vo.setReg_date(reg_date);
		int cnt = dao.insert_product(vo);
		model.addAttribute("cnt", cnt);
	}
}
