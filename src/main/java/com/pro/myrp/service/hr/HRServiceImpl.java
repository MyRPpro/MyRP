package com.pro.myrp.service.hr;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
	public void add_base_code_dupCheck_service(Model model) throws Exception {
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

}
