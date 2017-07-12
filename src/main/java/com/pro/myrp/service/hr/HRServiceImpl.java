package com.pro.myrp.service.hr;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.hr_management.Hr_code_groupVO;
import com.pro.myrp.persistence.hr.HRDAO;

@Service
public class HRServiceImpl implements HRService {

	@Inject
	private HRDAO dao;

	@Override
	public void base_code_list_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		List<Hr_code_groupVO> hr_code_groupVos = new ArrayList<>();
		hr_code_groupVos = dao.select_hr_code_group();
		model.addAttribute("hr_code_groupVos", hr_code_groupVos);
	}
}
