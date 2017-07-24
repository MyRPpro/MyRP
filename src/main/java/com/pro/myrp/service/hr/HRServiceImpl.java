package com.pro.myrp.service.hr;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.domain.hr_management.DeptVO;
import com.pro.myrp.domain.hr_management.EmployeeVO;
import com.pro.myrp.domain.hr_management.Employee_infoVO;
import com.pro.myrp.domain.hr_management.Hr_appointment_listDTO;
import com.pro.myrp.domain.hr_management.Hr_codeVO;
import com.pro.myrp.domain.hr_management.Hr_code_groupVO;
import com.pro.myrp.domain.hr_management.Personnel_appointmentVO;
import com.pro.myrp.domain.hr_management.Personnel_cardDTO;
import com.pro.myrp.domain.hr_management.Personnel_card_listDTO;
import com.pro.myrp.domain.hr_management.Retired_EmployeeDTO;
import com.pro.myrp.domain.hr_management.Retired_employeeVO;
import com.pro.myrp.persistence.hr.HRDAO;

@Service
public class HRServiceImpl implements HRService, CodeMyRP {

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
	
	@Override
	public void modify_dept_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		if(req.getParameter("dept_id") != null) {
			int dept_id =
					Integer.parseInt(req.getParameter("dept_id"));
			DeptVO vo = new DeptVO();
			vo = dao.select_dept(dept_id);
			model.addAttribute("deptVo", vo);
		}
	}

	@Override
	public void modify_dept_pro_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		int dept_id = Integer.parseInt(req.getParameter("dept_id"));
		String dept_name = req.getParameter("dept_name");
		String access_role = req.getParameter("access_role");
		String use_state = req.getParameter("use_state");
		DeptVO vo = new DeptVO();
		vo.setDept_id(dept_id);
		vo.setDept_name(dept_name);
		vo.setAccess_role(access_role);
		vo.setUse_state(use_state);
		int cnt = dao.update_dept(vo);
		model.addAttribute("cnt", cnt);
	}

	@Override
	public void personnel_card_search_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
	}
	
	@Override
	public void personnel_card_list_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize	= 5;
		int cnt			= 0;
		int start		= 0;
		int end			= 0;
		String pageNum	= null;
		int currentPage	= 0;
		
		String searchStr = req.getParameter("searchStr");
		cnt = dao.select_employee_cnt(searchStr);
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		currentPage = Integer.parseInt(pageNum);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		if(end > cnt) end = cnt;
		if(cnt > 0) {
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			daoMap.put("searchStr", searchStr);
			List<EmployeeVO> vos = new ArrayList<>();
			vos = dao.select_employee_list(daoMap);
			model.addAttribute("employeeVos", vos);
			List<Personnel_card_listDTO> dtos = new ArrayList<>();
			dtos = dao.select_personnel_card_list(daoMap);
			model.addAttribute("presonnel_card_listDtos", dtos);
		}
	}

	@Override
	public void personnel_card_nav_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize	= 5;
		int pageBlock	= 3;
		int cnt			= 0;
		String pageNum	= null;
		int currentPage	= 0;
		int pageCount	= 0;
		int	startPage	= 0;
		int endPage		= 0;
		
		String searchStr = req.getParameter("searchStr");
		cnt = dao.select_employee_cnt(searchStr);
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt/pageSize)+((cnt%pageSize)>0?1:0);
		startPage = (currentPage/pageBlock)*pageBlock+1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		endPage = startPage+pageBlock-1;
		if(endPage>pageCount) endPage = pageCount;
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchStr", searchStr);
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
	public void add_personnel_card_service(Model model) throws Exception {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		String use_state = "Y";
		List<DeptVO> deptVos = dao.select_used_dept_list(use_state);
		model.addAttribute("deptVos", deptVos);
		
		int hr_code_group_id = 2;
		Map<String, Object> daoMap = new HashMap<>();
		daoMap.put("use_state", use_state);
		daoMap.put("hr_code_group_id", hr_code_group_id);
		List<Hr_codeVO> hr_codeVos = dao.select_used_hr_codes(daoMap);
		model.addAttribute("hr_codeVos", hr_codeVos);
	}

	@Override
	public void add_personnel_card_picture_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		String employee_id = req.getParameter("employee_id");
		model.addAttribute("employee_id", employee_id);
	}

	@Override
	public void add_personnel_card_dupCheck_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		if(req.getParameter("employee_id") != null) {
			int employee_id = Integer.parseInt(req.getParameter("employee_id"));
			EmployeeVO vo = dao.select_employee(employee_id);
			if(vo != null) {
				model.addAttribute("cnt", 1);
				model.addAttribute("dup_employee_name", vo.getEmployee_name());
			} else {
				model.addAttribute("cnt", 0);
			}
			model.addAttribute("employee_id", employee_id);
		}
	}

	@Override
	public void add_personnel_card_pro_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		String employee_name = req.getParameter("employee_name");
		int dept_id = Integer.parseInt(req.getParameter("dept_id"));
		int hr_code_id = Integer.parseInt(req.getParameter("hr_code_id"));
		String residence_reg_no1 = req.getParameter("residence_reg_no1");
		String residence_reg_no2 = req.getParameter("residence_reg_no2");
		String residence_reg_no = residence_reg_no1+residence_reg_no2;
		Date join_date = Date.valueOf(req.getParameter("join_date"));
		String tel = req.getParameter("tel");
		String mobile_tel = req.getParameter("mobile_tel");
		String passport_no = req.getParameter("passport_no");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String email = email1+"@"+email2;
		String address = req.getParameter("address");
		int hourly_wage = Integer.parseInt(req.getParameter("hourly_wage"));
		String salary_account = req.getParameter("salary_account");
		
		Personnel_card_listDTO dto = new Personnel_card_listDTO();
		EmployeeVO vo = new EmployeeVO();
		vo.setEmployee_id(employee_id);
		vo.setEmployee_name(employee_name);
		vo.setDept_id(dept_id);
		vo.setHr_code_group_rank(2);
		vo.setRank_code(hr_code_id);			
		vo.setResidence_reg_no(residence_reg_no);
		vo.setJoin_date(join_date);
		int cnt = dao.insert_employee(vo);
		Employee_infoVO vo2 = new Employee_infoVO();
		vo2.setEmployee_id(employee_id);
		vo2.setTel(tel);
		vo2.setMobile_tel(mobile_tel);
		vo2.setPassport_no(passport_no);
		vo2.setEmail(email);
		vo2.setAddress(address);
		vo2.setHourly_wage(hourly_wage);
		vo2.setSalary_account(salary_account);
		int cnt2 = dao.insert_employee_info(vo2);
		model.addAttribute("cnt", cnt);
		model.addAttribute("cnt2", cnt2);
	}

	@Override
	public void modify_personnel_card_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		Personnel_cardDTO dto = new Personnel_cardDTO();
		dto = dao.select_personnel_card(employee_id);
		model.addAttribute("employee_id", dto.getEmployee_id());
		model.addAttribute("personnel_cardDto", dto);
	}

	@Override
	public void modify_personnel_card_pro_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		String employee_name = req.getParameter("employee_name");
		int dept_id = Integer.parseInt(req.getParameter("dept_id"));
		int hr_code_id = Integer.parseInt(req.getParameter("rank_code"));
		String residence_reg_no1 = req.getParameter("residence_reg_no1");
		String residence_reg_no2 = req.getParameter("residence_reg_no2");
		String residence_reg_no = residence_reg_no1+residence_reg_no2;
		Date join_date = Date.valueOf(req.getParameter("join_date"));
		String tel = req.getParameter("tel");
		String mobile_tel = req.getParameter("mobile_tel");
		String passport_no = req.getParameter("passport_no");
		String email = "";
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String email3 = req.getParameter("email3");
		if(email3.equals("0")) {
			email = email1+"@"+email2;			
		} else {
			email = email1+"@"+email3;
		}

		String address = req.getParameter("address");
		int hourly_wage = Integer.parseInt(req.getParameter("hourly_wage"));
		String salary_account = req.getParameter("salary_account");
		
		Personnel_card_listDTO dto = new Personnel_card_listDTO();
		EmployeeVO vo = new EmployeeVO();
		vo.setEmployee_id(employee_id);
		vo.setEmployee_name(employee_name);
		vo.setDept_id(dept_id);
		vo.setHr_code_group_rank(2);
		vo.setRank_code(hr_code_id);			
		vo.setResidence_reg_no(residence_reg_no);
		vo.setJoin_date(join_date);
		int cnt = dao.update_employee(vo);
		Employee_infoVO vo2 = new Employee_infoVO();
		vo2.setEmployee_id(employee_id);
		vo2.setTel(tel);
		vo2.setMobile_tel(mobile_tel);
		vo2.setPassport_no(passport_no);
		vo2.setEmail(email);
		vo2.setAddress(address);
		vo2.setHourly_wage(hourly_wage);
		vo2.setSalary_account(salary_account);
		int cnt2 = dao.update_employee_info(vo2);
		model.addAttribute("cnt", cnt);
		model.addAttribute("cnt2", cnt2);
	}

	@Override
	public void hr_appointment_search_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
	}

	@Override
	public void hr_appointment_nav_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize	= 5;
		int pageBlock	= 3;
		int cnt			= 0;
		String pageNum	= null;
		int currentPage	= 0;
		int pageCount	= 0;
		int	startPage	= 0;
		int endPage		= 0;
		
		String searchStr = req.getParameter("searchStr");
		cnt = dao.select_appointment_cnt(searchStr);
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt/pageSize)+((cnt%pageSize)>0?1:0);
		startPage = (currentPage/pageBlock)*pageBlock+1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		endPage = startPage+pageBlock-1;
		if(endPage>pageCount) endPage = pageCount;
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchStr", searchStr);
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
	public void hr_appointment_list_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize	= 5;
		int cnt			= 0;
		int start		= 0;
		int end			= 0;
		String pageNum	= null;
		int currentPage	= 0;
		
		String searchStr = req.getParameter("searchStr");
		cnt = dao.select_appointment_cnt(searchStr);
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		currentPage = Integer.parseInt(pageNum);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		if(end > cnt) end = cnt;
		if(cnt > 0) {
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			daoMap.put("searchStr", searchStr);
			List<Hr_appointment_listDTO> dtos = new ArrayList<>();
			dtos = dao.select_hr_appointment_list(daoMap);
			for(int i=0; i<dtos.size(); i++) {
				Hr_appointment_listDTO dto = dtos.get(i);
				int hr_code_group_rank = dto.getHr_code_group_rank();
				int pre_rank = dto.getPre_rank();
				int post_rank = dto.getPost_rank();
				int pre_dept = dto.getPre_dept();
				int post_dept = dto.getPost_dept();
				daoMap.clear();
				daoMap.put("hr_code_group_id", hr_code_group_rank);
				daoMap.put("hr_code_id", pre_rank);
				dto.setPre_rank_name(dao.select_hr_code_name(daoMap));
				daoMap.clear();
				daoMap.put("hr_code_group_id", hr_code_group_rank);
				daoMap.put("hr_code_id", post_rank);
				dto.setPost_rank_name(dao.select_hr_code_name(daoMap));
				dto.setPre_dept_name(dao.select_dept_name(pre_dept));
				dto.setPost_dept_name(dao.select_dept_name(post_dept));
			}
			model.addAttribute("hr_appointment_listDtos", dtos);
		}
	}
	
	@Override
	public void add_hr_appointment_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		List<EmployeeVO> vos = new ArrayList<>();
		
		vos = dao.select_employees();
		model.addAttribute("employeeVos", vos);
		
		String use_state = "Y";
		List<DeptVO> deptVos = dao.select_used_dept_list(use_state);
		model.addAttribute("deptVos", deptVos);
		
		int hr_code_group_id = 2;
		Map<String, Object> daoMap = new HashMap<>();
		daoMap.put("use_state", use_state);
		daoMap.put("hr_code_group_id", hr_code_group_id);
		List<Hr_codeVO> hr_codeVos = dao.select_used_hr_codes(daoMap);
		model.addAttribute("hr_codeVos", hr_codeVos);		
	}

	@Override
	public List<EmployeeVO> select_dept_service(int dept_id) throws Exception {
		return dao.select_employee_list_for_dept_id(dept_id);
	}

	@Override
	public void hr_appointment_regform_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		EmployeeVO vo = dao.select_employee(employee_id);
		int hr_code_id = vo.getRank_code();
		int hr_code_group_id = 2;
		Map<String, Object> daoMap = new HashMap<>();
		daoMap.put("hr_code_group_id", hr_code_group_id);
		daoMap.put("hr_code_id", hr_code_id);
		String rank_name = dao.select_hr_code_name(daoMap);
		
		int dept_id = vo.getDept_id();
		String dept_name = dao.select_dept_name(dept_id);

		model.addAttribute("hr_code_id", hr_code_id);
		model.addAttribute("rank_name", rank_name);
		model.addAttribute("dept_id", dept_id);
		model.addAttribute("dept_name", dept_name);
		model.addAttribute("employeeVo", vo);
		
		
		Date appointment_date = dao.select_appointment_date(vo.getEmployee_id());
		String last_date = "2000-01-01";
		if(appointment_date != null) {
			last_date = appointment_date.toString();			
		}
		model.addAttribute("appointment_date", appointment_date);
		model.addAttribute("last_date", last_date);
		String use_state = "Y";
		List<DeptVO> deptVos = dao.select_used_dept_list(use_state);
		model.addAttribute("deptVos", deptVos);
		
		daoMap.clear();
		daoMap.put("use_state", use_state);
		daoMap.put("hr_code_group_id", hr_code_group_id);
		List<Hr_codeVO> hr_codeVos = dao.select_used_hr_codes(daoMap);
		model.addAttribute("hr_codeVos", hr_codeVos);
		
	}

	@Override
	public void add_hr_appointment_pro_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		Date appointment_date = Date.valueOf(req.getParameter("appointment_date"));
		int hr_code_group_rank = Integer.parseInt(req.getParameter("hr_code_group_rank"));
		int pre_rank = Integer.parseInt(req.getParameter("pre_rank"));
		int post_rank = Integer.parseInt(req.getParameter("post_rank"));
		int pre_dept = Integer.parseInt(req.getParameter("pre_dept"));
		int post_dept = Integer.parseInt(req.getParameter("post_dept"));
		

		
		Personnel_appointmentVO vo = new Personnel_appointmentVO();
		vo.setEmployee_id(employee_id);
		vo.setAppointment_date(appointment_date);
		vo.setHr_code_group_rank(hr_code_group_rank);
		vo.setPre_rank(pre_rank);
		vo.setPost_rank(post_rank);
		vo.setPre_dept(pre_dept);
		vo.setPost_dept(post_dept);
		int cnt = dao.insert_personnel_appointment(vo);
		if(cnt == 1) {
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("employee_id", employee_id);
			daoMap.put("dept_id", post_dept);
			daoMap.put("rank_code", post_rank);
			cnt = dao.update_employee_appoint(daoMap);
			model.addAttribute("cnt", cnt);
		}
	}

	@Override
	public void personnel_card_appointment_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		List<Hr_appointment_listDTO> dtos = dao.select_appointment(employee_id);
		for(int i=0; i<dtos.size(); i++) {
			Hr_appointment_listDTO dto = dtos.get(i);
		
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("hr_code_group_id", dto.getHr_code_group_rank());
			daoMap.put("hr_code_id", dto.getPre_rank());
			String pre_rank_name = dao.select_hr_code_name(daoMap);
			daoMap.clear();
			daoMap.put("hr_code_group_id", dto.getHr_code_group_rank());
			daoMap.put("hr_code_id", dto.getPost_rank());
			String post_rank_name = dao.select_hr_code_name(daoMap);
			
			String pre_dept_name = dao.select_dept_name(dto.getPre_dept());
			String post_dept_name = dao.select_dept_name(dto.getPost_dept());
			dto.setPre_rank_name(pre_rank_name);
			dto.setPost_rank_name(post_rank_name);
			dto.setPre_dept_name(pre_dept_name);
			dto.setPost_dept_name(post_dept_name);
		}
		model.addAttribute("employee_id", employee_id);
		model.addAttribute("dtos", dtos);
	}

	@Override
	public void retired_employee_search_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
	}

	@Override
	public void retired_employee_list_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");

		int pageSize	= 5;
		int cnt			= 0;
		int start		= 0;
		int end			= 0;
		String pageNum	= null;
		int currentPage	= 0;
		
		String searchStr = req.getParameter("searchStr");
		cnt = dao.select_retired_employee_cnt(searchStr);
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		currentPage = Integer.parseInt(pageNum);
		start = (currentPage -1) * pageSize + 1;
		end = start + pageSize - 1;
		if(end > cnt) end = cnt;
		if(cnt > 0) {
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("start", start);
			daoMap.put("end", end);
			daoMap.put("searchStr", searchStr);
			List<Retired_EmployeeDTO> dtos = new ArrayList<>();
			dtos = dao.select_retired_employee_list(daoMap);
			for(int i=0; i<dtos.size(); i++) {
				Retired_EmployeeDTO dto = dtos.get(i);
				int dept_id = dto.getDept_id();
				int hr_code_group_id = dto.getHr_code_group_rank();
				int hr_code_id = dto.getRank_code();
				daoMap.clear();
				daoMap.put("hr_code_group_id", hr_code_group_id);
				daoMap.put("hr_code_id", hr_code_id);
				dto.setHr_code_name(dao.select_hr_code_name(daoMap));
				daoMap.clear();
				dto.setDept_name(dao.select_dept_name(dept_id));
			}
			model.addAttribute("retired_employeeDto", dtos);
		}
	}

	@Override
	public void retired_employee_nav_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");

		int pageSize	= 5;
		int pageBlock	= 3;
		int cnt			= 0;
		String pageNum	= null;
		int currentPage	= 0;
		int pageCount	= 0;
		int	startPage	= 0;
		int endPage		= 0;
		
		String searchStr = req.getParameter("searchStr");
		cnt = dao.select_retired_employee_cnt(searchStr);
		pageNum = req.getParameter("pageNum");
		if(pageNum == null) pageNum = "1";
		currentPage = Integer.parseInt(pageNum);
		pageCount = (cnt/pageSize)+((cnt%pageSize)>0?1:0);
		startPage = (currentPage/pageBlock)*pageBlock+1;
		if(currentPage % pageBlock == 0) startPage -= pageBlock;
		endPage = startPage+pageBlock-1;
		if(endPage>pageCount) endPage = pageCount;
		model.addAttribute("cnt", cnt);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchStr", searchStr);
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
	public void add_retired_employee_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		List<EmployeeVO> vos = new ArrayList<>();
		
		vos = dao.select_employees();
		model.addAttribute("employeeVos", vos);
		
		String use_state = "Y";
		List<DeptVO> deptVos = dao.select_used_dept_list(use_state);
		model.addAttribute("deptVos", deptVos);
		
		int hr_code_group_id = 2;
		Map<String, Object> daoMap = new HashMap<>();
		daoMap.put("use_state", use_state);
		daoMap.put("hr_code_group_id", hr_code_group_id);
		List<Hr_codeVO> hr_codeVos = dao.select_used_hr_codes(daoMap);
		model.addAttribute("hr_codeVos", hr_codeVos);	
	}

	
	@Override
	public void retired_employee_regform_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		EmployeeVO vo = dao.select_employee(employee_id);
		
		String employee_name = vo.getEmployee_name();
		int dept_id = vo.getDept_id();
		String dept_name = dao.select_dept_name(dept_id);
		int hr_code_group_rank = vo.getHr_code_group_rank();
		int rank_code = vo.getRank_code();
		Map<String, Object> daoMap = new HashMap<>();
		daoMap.put("hr_code_group_id", hr_code_group_rank);
		daoMap.put("hr_code_id", rank_code);
		String hr_code_name = dao.select_hr_code_name(daoMap);
		Date join_date = vo.getJoin_date();
		
		Retired_EmployeeDTO dto = new Retired_EmployeeDTO();
		dto.setEmployee_id(employee_id);
		dto.setEmployee_name(employee_name);
		dto.setDept_id(dept_id);
		dto.setDept_name(dept_name);
		dto.setHr_code_group_rank(hr_code_group_rank);
		dto.setRank_code(rank_code);
		dto.setHr_code_name(hr_code_name);
		dto.setJoin_date(join_date);
		model.addAttribute("dto", dto);
	}


	@Override
	public void add_retired_employee_pro_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		Date retired_date = Date.valueOf(req.getParameter("retired_date"));
		String retired_reason = req.getParameter("retired_reason");
		
		Retired_employeeVO vo = new Retired_employeeVO();
		vo.setEmployee_id(employee_id);
		vo.setRetired_date(retired_date);
		vo.setRetired_reason(retired_reason);
		
		int cnt = dao.insert_retired_employee(vo);
		model.addAttribute("cnt", cnt);
	}


	@Override
	public void personnel_card_retired_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		List<Retired_EmployeeDTO> dtos = dao.select_retired_employee_history(employee_id);
		model.addAttribute("employee_id", employee_id);
		model.addAttribute("dtos", dtos);
	}

	@Override
	public void salary_register_search_service(Model model) throws Exception {
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
	}

}