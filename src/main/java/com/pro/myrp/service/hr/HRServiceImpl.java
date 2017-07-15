package com.pro.myrp.service.hr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.base_registration.ProductVO;
import com.pro.myrp.domain.hr_management.DeptVO;
import com.pro.myrp.domain.hr_management.Hr_codeVO;
import com.pro.myrp.domain.hr_management.Hr_code_groupVO;
import com.pro.myrp.persistence.hr.HRDAO;

@Service
public class HRServiceImpl implements HRService {

	@Inject
	private HRDAO dao;

	@Override
	public void base_code_group_list_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		List<Hr_code_groupVO> hr_code_groupVos = new ArrayList<>();
		hr_code_groupVos = dao.select_hr_code_groups();
		model.addAttribute("hr_code_groupVos", hr_code_groupVos);
	}

	@Override
	public void add_base_code_group_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
	}

	@Override
	public void add_base_code_group_dupCheck_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		if(req.getParameter("hr_code_group_id") != null) {
			int hr_code_group_id = Integer.parseInt(req.getParameter("hr_code_group_id"));
			Hr_code_groupVO vo = dao.select_hr_code_group(hr_code_group_id);
			if(vo != null) {
				model.addAttribute("cnt", 1);
			} else {
				model.addAttribute("cnt", 0);
			}
			model.addAttribute("hr_code_group_id", hr_code_group_id);
		} else {
			model.addAttribute("cnt", 0);
		}
	}

	@Override
	public void add_base_code_group_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		int hr_code_group_id = 0;
		if(req.getParameter("hr_code_group_id") != null) {
			hr_code_group_id = Integer.parseInt(req.getParameter("hr_code_group_id"));
		}
		String hr_code_group_name = req.getParameter("hr_code_group_name");
		String use_state = req.getParameter("use_state");
		Hr_code_groupVO vo = new Hr_code_groupVO();
		vo.setHr_code_group_id(hr_code_group_id);
		vo.setHr_code_group_name(hr_code_group_name);
		vo.setUse_state(use_state);
		
		int cnt = dao.insert_base_code_group(vo);
		
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void modify_base_code_group_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		if(req.getParameter("hr_code_group_id") != "") {
			int hr_code_group_id = Integer.parseInt(req.getParameter("hr_code_group_id"));
			Hr_code_groupVO hr_code_groupVo = new Hr_code_groupVO();
			hr_code_groupVo = dao.select_hr_code_group(hr_code_group_id);
			model.addAttribute("hr_code_groupVo", hr_code_groupVo);
		}
		
	}
	
	@Override
	public void modify_base_code_group_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		if(req.getParameter("hr_code_group_id") != null) {
			int hr_code_group_id =
					Integer.parseInt(req.getParameter("hr_code_group_id"));
			String use_state = req.getParameter("use_state");
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("hr_code_group_id", hr_code_group_id);
			daoMap.put("use_state", use_state);
			dao.update_hr_code_group(daoMap);
			model.addAttribute("hr_code_group_id", hr_code_group_id);
		}
		
		
	}
	
	@Override
	public void base_code_list_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		if(req.getParameter("hr_code_group_id") != null) {
			int hr_code_group_id = Integer.parseInt(req.getParameter("hr_code_group_id"));
			List<Hr_codeVO> hr_codeVos = new ArrayList<>();
			hr_codeVos = dao.select_hr_codes(hr_code_group_id);
			
			Hr_code_groupVO hr_code_groupVo = new Hr_code_groupVO();
			hr_code_groupVo = dao.select_hr_code_group(hr_code_group_id);
			model.addAttribute("hr_codeVos", hr_codeVos);
			model.addAttribute("hr_code_groupVo", hr_code_groupVo);
		}
		
	}

	@Override
	public void add_base_code_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		if(req.getParameter("hr_code_group_id") != null) {
			int hr_code_group_id =
					Integer.parseInt(req.getParameter("hr_code_group_id"));
			model.addAttribute("hr_code_group_id", hr_code_group_id);
		}
	}

	@Override
	public void add_base_code_dupCheck_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		if(req.getParameter("hr_code_group_id") != null) {
			int hr_code_group_id =
					Integer.parseInt(req.getParameter("hr_code_group_id"));
			
			if(req.getParameter("hr_code_id") != null) {
				int hr_code_id =
						Integer.parseInt(req.getParameter("hr_code_id"));
				Hr_codeVO hr_codeVo = new Hr_codeVO();
				Map<String, Object> daoMap = new HashMap<>();
				daoMap.put("hr_code_group_id", hr_code_group_id);
				daoMap.put("hr_code_id", hr_code_id);
				hr_codeVo = dao.select_hr_code(daoMap);
				if(hr_codeVo != null) {
					model.addAttribute("cnt", 1);
				} else {
					model.addAttribute("cnt", 0);
				}
				model.addAttribute("hr_code_group_id", hr_code_group_id);
				model.addAttribute("hr_code_id", hr_code_id);
			} else {
				model.addAttribute("cnt", 0);
			}
		
		}
		
	}
	
	@Override
	public void add_base_code_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		int hr_code_id = 0;
		if(req.getParameter("hr_code_id") != null) {
			hr_code_id = Integer.parseInt(req.getParameter("hr_code_id"));
		}
		int hr_code_group_id = Integer.parseInt(req.getParameter("hr_code_group_id"));
		String hr_code_name = req.getParameter("hr_code_name");
		String use_state = req.getParameter("use_state");
		Hr_codeVO vo = new Hr_codeVO();
		vo.setHr_code_group_id(hr_code_group_id);
		vo.setHr_code_id(hr_code_id);
		vo.setHr_code_name(hr_code_name);
		vo.setUse_state(use_state);
		int cnt = dao.insert_base_code(vo);
		model.addAttribute("hr_code_group_id", hr_code_group_id);
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void modify_base_code_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		if(req.getParameter("hr_code_group_id") != null) {
			int hr_code_group_id =
					Integer.parseInt(req.getParameter("hr_code_group_id"));
			if(req.getParameter("hr_code_id") != null) {
				int hr_code_id =
						Integer.parseInt(req.getParameter("hr_code_id"));
				Map<String, Object> daoMap = new HashMap<>();
				daoMap.put("hr_code_group_id", hr_code_group_id);
				daoMap.put("hr_code_id", hr_code_id);
				Hr_codeVO vo = dao.select_hr_code(daoMap);
				model.addAttribute("hr_codeVo", vo);
			}			
		}
	}

	@Override
	public void modify_base_code_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		if(req.getParameter("hr_code_group_id") != null) {
			int hr_code_group_id =
					Integer.parseInt(req.getParameter("hr_code_group_id"));
			if(req.getParameter("hr_code_id") != null) {
				int hr_code_id =
						Integer.parseInt(req.getParameter("hr_code_id"));
				String hr_code_name =
						req.getParameter("hr_code_name");
				String use_state =
						req.getParameter("use_state");
				Hr_codeVO vo = new Hr_codeVO();
				vo.setHr_code_group_id(hr_code_group_id);
				vo.setHr_code_id(hr_code_id);
				vo.setHr_code_name(hr_code_name);
				vo.setUse_state(use_state);
				int cnt = dao.update_hr_code(vo);
				model.addAttribute("cnt", cnt);
				model.addAttribute("hr_code_group_id", hr_code_group_id);
			}			
		}
	}


	@Override
	public void dept_list_service(Model model) throws Exception {
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
		
		cnt = dao.select_dept_cnt();
		System.out.println(cnt);
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
			List<DeptVO> vos = new ArrayList<>();
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			vos = dao.select_dept_list(daoMap);
			model.addAttribute("deptVos", vos);
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
	public void add_dept_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
	}


	@Override
	public void add_dept_dupCheck_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		if(req.getParameter("dept_id") != null) {
			int dept_id = Integer.parseInt(req.getParameter("dept_id"));
			DeptVO vo = dao.select_dept(dept_id);
			if(vo != null) {
				model.addAttribute("cnt", 1);
				model.addAttribute("dup_dept_name", vo.getDept_name());
			} else {
				model.addAttribute("cnt", 0);
			}
			model.addAttribute("dept_id", dept_id);
		}
	}


	@Override
	public void add_dept_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		if(req.getParameter("dept_id") != null) {
			int dept_id =
					Integer.parseInt(req.getParameter("dept_id"));
			String dept_name = req.getParameter("dept_name");
			String access_role = req.getParameter("access_role");
			String use_state = req.getParameter("use_state");
			DeptVO vo = new DeptVO();
			vo.setDept_id(dept_id);
			vo.setDept_name(dept_name);
			vo.setAccess_role(access_role);
			vo.setUse_state(use_state);
			int cnt = dao.insert_dept(vo);
			model.addAttribute("cnt", cnt);
		}
	}

}
