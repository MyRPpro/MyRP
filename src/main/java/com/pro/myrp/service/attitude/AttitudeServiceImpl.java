package com.pro.myrp.service.attitude;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.attitude_management.Hr_attitude_listDTO;
import com.pro.myrp.domain.attitude_management.Service_attitudeVO;
import com.pro.myrp.domain.hr_management.dto.Hr_appointment_listDTO;
import com.pro.myrp.domain.hr_management.vo.DeptVO;
import com.pro.myrp.domain.hr_management.vo.EmployeeVO;
import com.pro.myrp.domain.hr_management.vo.Hr_codeVO;
import com.pro.myrp.persistence.attitude.AttitudeDAO;

@Service
public class AttitudeServiceImpl implements AttitudeService {
//
	@Inject
	private AttitudeDAO dao;

	@Override
	public void search_attitude_search_service(Model model) throws Exception {
		//
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
	}
	
	@Override
	public void add_attitude_search_service(Model model) throws Exception {
		//
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		List<EmployeeVO> vos = new ArrayList<>(); //ArrayList 를 생성 한다
		vos = dao.select_employees(); //사원 검색 한다 검색된 사원을 list 에 담는다
		model.addAttribute("employeeVos", vos); //리스트에담긴 사원정보를 모델을 통해 컨트롤러에 전달한다
		
		String use_state = "Y";
		List<DeptVO> deptVos = dao.select_used_dept_list(use_state); //현재 상태를 확인 하고 존재 하는 부서인지 검색한다
		model.addAttribute("deptVos", deptVos);
		
		int hr_code_group_id = 2;
		
		Map<String, Object> daoMap = new HashMap<>();
		daoMap.put("use_state", use_state);
		daoMap.put("hr_code_group_id", hr_code_group_id);
		List<Hr_codeVO> hr_codeVos = dao.select_used_hr_codes(daoMap);
		
		model.addAttribute("hr_codeVos", hr_codeVos);
	
	}
	
	@Override
	public void attitude_form_service(Model model) throws Exception {
		// 
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int employee_id = Integer.parseInt(req.getParameter("employee_id")); //사원아이디를 전달  받아서 employee_id 담는다
		EmployeeVO vo = dao.select_employee(employee_id); //  전달 받아온 EmployeeVO타입의  사원 아이디를 검색 한다. 사원의 아이디가 있다면 vo담는다
		
		int hr_code_id = vo.getRank_code(); // 
		int hr_code_group_id = 3; // 휴가번호
		Map<String, Object> daoMap = new HashMap<>();//휴가 종류를 담을 HashMap 생성한다 
		daoMap.put("hr_code_group_id", hr_code_group_id); //휴가번호를 HashMap에 담는다
		daoMap.put("hr_code_id", hr_code_id); // 휴가 종류를 HashMap 에 담는다
		String leave_code = dao.select_hr_code_name(daoMap); //코드이름을 검색한다 검색된 코드이름을 leave_code 에 넣는
		
		int hr_code_group_id1 = 8; //휴가 사유 번호
		Map<String, Object> daomap = new HashMap<>(); //휴가 사유를 담을 HashMap 생성한다 
		daomap.put("hr_code_group_id", hr_code_group_id1);
		daomap.put("hr_code_id", hr_code_id);
		String attitude_reason = dao.select_hr_code_names(daomap);
		
		int dept_id = vo.getDept_id();
		String dept_name = dao.select_dept_name(dept_id);

		model.addAttribute("employeeVo", vo); //서비스에서 선택된 사원의 사번과 이름을 모델에 담아서  컨트롤러에게 전달한다
		model.addAttribute("hr_code_id", hr_code_id); //서비스에서 휴가번호를 모델에 담아서  컨트롤러에게 전달한다
		model.addAttribute("leave_code", leave_code);//서비스에서 휴가 종류를 모델에 담아서  컨트롤러에게 전달한다
		model.addAttribute("dept_id", dept_id); // 서비스에서 부서번호를 모델에 담아서 컨트롤러에게 전달한다
		model.addAttribute("dept_name", dept_name); //서비스에서 부서이름을 모델에 담아서 컨트롤러에 전달한다
		model.addAttribute("hr_code_id", hr_code_id); //서비스에서 휴가 사유를 모델에 담아서 컨트롤러에 전달한다
		model.addAttribute("attitude_reason", attitude_reason); //서비스에서 휴가사유종류를 모델에 담아서 컨트롤러에 전달한다
		
		Date attitude_date1 = dao.select_attitude_date(vo.getEmployee_id());
		
		String last_date = "2000-01-01";
		if(attitude_date1 != null) {
			last_date = attitude_date1.toString();
			System.out.println("last_date"+ last_date);
		}
		
		model.addAttribute("attitude_date1", attitude_date1);
		model.addAttribute("last_date", last_date);
		
		String use_state = "Y";
		List<DeptVO> deptVos = dao.select_used_dept_list(use_state);
		model.addAttribute("deptVos", deptVos);
		
		daoMap.clear();
		daoMap.put("use_state", use_state);
		daoMap.put("hr_code_group_id", hr_code_group_id);
		List<Hr_codeVO> hr_codeVos = dao.select_used_hr_codes(daoMap);
		model.addAttribute("hr_codeVos", hr_codeVos);
		
		daomap.clear();
		daomap.put("use_state", use_state);
		daomap.put("hr_code_group_id", hr_code_group_id1);
		List<Hr_codeVO> codeVos = dao.select_used_hr_code(daomap);
		model.addAttribute("codeVos", codeVos);
		
	}

	@Override
	public void add_attitude_search_pro_service(Model model) throws Exception {
		// 
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int employee_id = Integer.parseInt(req.getParameter("employee_id")); //사원번호
	
		int	hr_code_group_leave = 3; //휴가코드
		if(req.getParameter("hr_code_group_leave") != null) {
				hr_code_group_leave = Integer.parseInt(req.getParameter("hr_code_group_leave"));
				
		}
		
		int leave_code = Integer.parseInt(req.getParameter("leave_code")); //휴가종류코드

		Date attitude_date1 = Date.valueOf(req.getParameter("attitude_date1")); //시작날자
		Date attitude_date2 = Date.valueOf(req.getParameter("attitude_date2")); // 종료
				
		int hr_code_group_reason =8; //휴가사유코드
		if(req.getParameter("hr_code_group_reason")!=null) {
			hr_code_group_reason = Integer.parseInt(req.getParameter("hr_code_group_reason"));
			
		}
		
		int attitude_reason = Integer.parseInt(req.getParameter("attitude_reason")); //휴가에따른 사유 종류
		
		Service_attitudeVO vo = new Service_attitudeVO();
		
		vo.setEmployee_id(employee_id); 
		vo.setAttitude_date1(attitude_date1); 
		vo.setAttitude_date2(attitude_date2);
		vo.setHr_code_group_leave(hr_code_group_leave); 
		vo.setLeave_code(leave_code);
		vo.setHr_code_group_reason(hr_code_group_reason);
		vo.setAttitude_reason(attitude_reason);
		
		int cnt = dao.insert_service_attitude(vo);
		model.addAttribute("cnt", cnt);
		
	}
	
	@Override
	public void hr_attitude_nav_service(Model model) throws Exception {
		// 
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
		
		String search = req.getParameter("search");
		cnt = dao.select_attitude_cnt(search);
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
		model.addAttribute("searchStr", search);
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
	public void hr_attitude_list_service(Model model) throws Exception {
		// 
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int pageSize	= 5;
		int cnt			= 0;
		int start		= 0;
		int end			= 0;
		String pageNum	= null;
		int currentPage	= 0;
		
		String search = req.getParameter("search");
		cnt = dao.select_attitude_cnt(search);
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
			daoMap.put("search", search);
			List<Hr_attitude_listDTO> dtos = new ArrayList<>();
			dtos = dao.select_hr_attitude_list(daoMap);
			for(int i=0; i < dtos.size(); i++) {
				Hr_attitude_listDTO dto = dtos.get(i);
				
				int hr_code_group_leave = dto.getHr_code_group_leave();
				int leave_code = dto.getLeave_code();
				int hr_code_group_reason = dto.getHr_code_group_reason();
				int attitude_reason = dto.getAttitude_reason();
				
				daoMap.clear();
				daoMap.put("hr_code_group_id", hr_code_group_leave);
				daoMap.put("hr_code_id", leave_code);
				dto.setLeave_code_name(dao.select_hr_code_name(daoMap));
				
				daoMap.clear();
				daoMap.put("hr_code_group_id", hr_code_group_reason);
				daoMap.put("hr_code_id", attitude_reason);
				dto.setAttitude_reason_name(dao.select_hr_code_names(daoMap));
	
			}
			model.addAttribute("hr_attitude_listDtos", dtos);
		}
	}

	@Override
	public void personnel_card_attitude_service(Model model) throws Exception {
		//
		Map<String,Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
		int employee_id = Integer.parseInt(req.getParameter("employee_id"));
		List<Hr_attitude_listDTO> dtos = dao.select_attitude(employee_id);
		for(int i=0; i<dtos.size(); i++) {
			Hr_attitude_listDTO dto = dtos.get(i);
		
			Map<String, Object> daoMap = new HashMap<>();
			daoMap.put("hr_code_group_id", dto.getHr_code_group_leave());
			daoMap.put("hr_code_id", dto.getLeave_code());
			String leave_code_name = dao.select_hr_code_name(daoMap);
			
			daoMap.clear();
			daoMap.put("hr_code_group_id", dto.getHr_code_group_reason());
			daoMap.put("hr_code_id", dto.getAttitude_reason());
			String attitude_reason_name = dao.select_hr_code_names(daoMap);
			
			dto.setLeave_code_name(leave_code_name);
			dto.setAttitude_reason_name(attitude_reason_name);
			
		}
		model.addAttribute("employee_id", employee_id);
		model.addAttribute("dtos", dtos);

		String pic_uid = dao.select_pic_uid(employee_id);
		model.addAttribute("pic_uid", pic_uid);
	}
	
}
