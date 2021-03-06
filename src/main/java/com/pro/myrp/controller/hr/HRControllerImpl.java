package com.pro.myrp.controller.hr;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.domain.hr_management.FileDTO;
import com.pro.myrp.domain.hr_management.vo.EmployeeVO;
import com.pro.myrp.service.hr.HRService;

@Controller
@RequestMapping("/hr_management/*")
public class HRControllerImpl implements HRController, CodeMyRP {

	@Inject
	private HRService service;

	@Override
	@GetMapping(value="manage_hr_code/base_code_group_list")
	public String base_code_group_list(HttpServletRequest req, Model model) throws Exception{
		System.out.println(code.c(base_code_group_list));
		model.addAttribute("req", req);
		service.base_code_group_list_service(model);
		return code.c(hr_management, manage_hr_code, base_code_group_list);
	}

	@Override
	@GetMapping(value="manage_hr_code/add_base_code_group")
	public String add_base_code_group(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_base_code_group));
		model.addAttribute("req", req);
		service.add_base_code_group_service(model);
		return code.c(hr_management, manage_hr_code, add_base_code_group);
	}

	@Override
	@GetMapping(value="manage_hr_code/add_base_code_group_dupCheck")
	public String add_base_code_group_dupCheck(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_base_code_group_dupCheck));
		model.addAttribute("req", req);
		service.add_base_code_group_dupCheck_service(model);
		return code.c(hr_management, manage_hr_code, add_base_code_group_dupCheck);
	}
	
	@Override
	@PostMapping(value="manage_hr_code/add_base_code_group_pro")
	public String add_base_code_group_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_base_code_group_pro));
		model.addAttribute("req", req);
		service.add_base_code_group_pro_service(model);
		return code.c(hr_management, manage_hr_code, add_base_code_group_pro);
	}

	@Override
	@GetMapping(value="/manage_hr_code/modify_base_code_group")
	public String modify_base_code_group(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_base_code_group));
		model.addAttribute("req", req);
		service.modify_base_code_group_service(model);
		return code.c(hr_management, manage_hr_code, modify_base_code_group);
	}
	
	@Override
	@GetMapping(value="/manage_hr_code/modify_base_code_group_pro")
	public String modify_base_code_group_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_base_code_group_pro));
		model.addAttribute("req", req);
		service.modify_base_code_group_pro_service(model);
		return "redirect:"+code.c(hr_management, manage_hr_code, base_code_list);
	}
	
	@Override
	@GetMapping(value="manage_hr_code/base_code_list")
	public String base_code_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(base_code_list));
		model.addAttribute("req", req);
		service.base_code_list_service(model);
		return code.c(hr_management, manage_hr_code, base_code_list);
	}
	
	@Override
	@GetMapping(value="manage_hr_code/add_base_code")
	public String add_base_code(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_base_code));
		model.addAttribute("req", req);
		service.add_base_code_service(model);
		return code.c(hr_management, manage_hr_code, add_base_code);
	}
	
	@Override
	@GetMapping(value="/manage_hr_code/add_base_code_dupCheck")
	public String add_base_code_dupCheck(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_base_code_dupCheck));
		model.addAttribute("req", req);
		service.add_base_code_dupCheck_service(model);
		return code.c(hr_management, manage_hr_code, add_base_code_dupCheck);
	}

	@Override
	@PostMapping(value="manage_hr_code/add_base_code_pro")
	public String add_base_code_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_base_code_pro));
		model.addAttribute("req", req);
		service.add_base_code_pro_service(model);
		return code.c(hr_management, manage_hr_code, add_base_code_pro);
	}

	@Override
	@GetMapping(value="manage_hr_code/modify_base_code")
	public String modify_base_code(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_base_code));
		model.addAttribute("req", req);
		service.modify_base_code_service(model);
		return code.c(hr_management, manage_hr_code, modify_base_code);
	}

	@Override
	@PostMapping(value="manage_hr_code/modify_base_code_pro")
	public String modify_base_code_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_base_code_pro));
		model.addAttribute("req", req);
		service.modify_base_code_pro_service(model);
		return code.c(hr_management, manage_hr_code, modify_base_code_pro);
	}
	
	@Override
	@GetMapping(value="manage_dept/dept_list")
	public String dept_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(dept_list));
		model.addAttribute("req", req);
		service.dept_list_service(model);
		return code.c(hr_management, manage_dept, dept_list);
	}

	@Override
	@GetMapping(value="manage_dept/add_dept")
	public String add_dept(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_dept));
		model.addAttribute("req", req);
		service.add_dept_service(model);
		return code.c(hr_management, manage_dept, add_dept);
	}
	
	@Override
	@GetMapping(value="manage_dept/add_dept_dupCheck")
	public String add_dept_dupCheck(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_dept_dupCheck));
		model.addAttribute("req", req);
		service.add_dept_dupCheck_service(model);
		return code.c(hr_management, manage_dept, add_dept_dupCheck);
	}

	@Override
	@PostMapping(value="manage_dept/add_dept_pro")
	public String add_dept_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_dept_pro));
		model.addAttribute("req", req);
		service.add_dept_pro_service(model);
		return code.c(hr_management, manage_dept, add_dept_pro);
	}
	
	@Override
	@GetMapping(value="manage_dept/modify_dept")
	public String modify_dept(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_dept));
		model.addAttribute("req", req);
		service.modify_dept_service(model);
		return code.c(hr_management, manage_dept, modify_dept);
	}
	
	@Override
	@PostMapping(value="manage_dept/modify_dept_pro")
	public String modify_dept_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_dept_pro));
		model.addAttribute("req", req);
		service.modify_dept_pro_service(model);
		return code.c(hr_management, manage_dept, modify_dept_pro);
	}
	
	@Override
	@GetMapping(value="manage_personnel_card/personnel_card_search")
	public String personnel_card_search(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(personnel_card_search));
		model.addAttribute("req", req);
		service.personnel_card_search_service(model);
		return code.c(hr_management, manage_personnel_card, personnel_card_search);
	}
	
	@Override
	@GetMapping(value="manage_personnel_card/personnel_card_list")
	public String personnel_card_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(personnel_card_list));
		model.addAttribute("req", req);
		service.personnel_card_list_service(model);
		return code.c(hr_management, manage_personnel_card, personnel_card_list);
	}

	@Override
	@GetMapping(value="manage_personnel_card/personnel_card_nav")
	public String personnel_card_nav(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(personnel_card_nav));
		model.addAttribute("req", req);
		service.personnel_card_nav_service(model);
		return code.c(hr_management, manage_personnel_card, personnel_card_nav);
	}
	
	@Override
	@GetMapping(value="manage_personnel_card/add_personnel_card")
	public String add_personnel_card(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_personnel_card));
		model.addAttribute("req", req);
		service.add_personnel_card_service(model);
		return code.c(hr_management, manage_personnel_card, add_personnel_card);
	}
	
	@Override
	@GetMapping(value="manage_personnel_card/add_personnel_card_picture")
	public String add_personnel_card_picture(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_personnel_card_picture));
		model.addAttribute("req", req);
		service.add_personnel_card_picture_service(model);
		return code.c(hr_management, manage_personnel_card, add_personnel_card_picture);
	}
	
	@Override
	@PostMapping(value="/manage_personnel_card/add_personnel_card_upload")
	public String add_personnel_card_upload(FileDTO dto, Model model) throws Exception {
		System.out.println(code.c(add_personnel_card_upload));
		
		MultipartFile file = dto.getFile();
		String originalName = dto.getName() + ".jpg";
		String savedName = uploadFile(originalName, file.getBytes());
		model.addAttribute("employee_id", dto.getName());
		model.addAttribute("savedName", savedName);
		service.add_personnel_card_upload_service(model);
		return code.c(hr_management, manage_personnel_card, add_personnel_card_upload);
	}
	
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		String path = "C:/Users/amaco78/Documents/project/MyRP/src/main/webapp/resources/images/picture_employee/";
		File target = new File(path,savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	@Override
	@GetMapping(value="manage_personnel_card/add_personnel_card_dupCheck")
	public String add_personnel_card_dupCheck(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_personnel_card_dupCheck));
		model.addAttribute("req", req);
		service.add_personnel_card_dupCheck_service(model);
		System.out.println(code.c(hr_management, manage_personnel_card, add_personnel_card_dupCheck));
		return code.c(hr_management, manage_personnel_card, add_personnel_card_dupCheck);
	}
	
	@Override
	@PostMapping(value="manage_personnel_card/add_personnel_card_pro")
	public String add_personnel_card_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_personnel_card_pro));
		model.addAttribute("req", req);
		service.add_personnel_card_pro_service(model);
		return code.c(hr_management, manage_personnel_card, add_personnel_card_pro);
	}

	@Override
	@GetMapping(value="manage_personnel_card/modify_personnel_card")
	public String modify_personnel_card(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_personnel_card));
		model.addAttribute("req", req);
		service.modify_personnel_card_service(model);
		return code.c(hr_management, manage_personnel_card, modify_personnel_card);
	}
	
	@Override
	@PostMapping(value="manage_personnel_card/modify_personnel_card_pro")
	public String modify_personnel_card_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_personnel_card_pro));
		model.addAttribute("req", req);
		service.modify_personnel_card_pro_service(model);
		return code.c(hr_management, manage_personnel_card, modify_personnel_card_pro);
	}

	@Override
	@GetMapping(value="manage_personnel_card/personnel_card_info")
	public String personnel_card_info(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(personnel_card_info));
		model.addAttribute("req", req);
		service.personnel_card_info_service(model);
		return code.c(hr_management, manage_personnel_card, personnel_card_info);
	}
	
	@Override
	@GetMapping(value="manage_hr_appointment/hr_appointment_search")
	public String hr_appointment_search(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(hr_appointment_search));
		model.addAttribute("req", req);
		service.hr_appointment_search_service(model);
		return code.c(hr_management, manage_hr_appointment, hr_appointment_search);
	}

	@Override
	@GetMapping(value="manage_hr_appointment/hr_appointment_nav")
	public String hr_appointment_nav(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(hr_appointment_nav));
		model.addAttribute("req", req);
		service.hr_appointment_nav_service(model);
		return code.c(hr_management, manage_hr_appointment, hr_appointment_nav);
	}

	@Override
	@GetMapping(value="manage_hr_appointment/hr_appointment_list")
	public String hr_appointment_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(hr_appointment_list));
		model.addAttribute("req", req);
		service.hr_appointment_list_service(model);
		return code.c(hr_management, manage_hr_appointment, hr_appointment_list);
	}
	
	@Override
	@GetMapping(value="manage_hr_appointment/add_hr_appointment")
	public String add_hr_appointment(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_hr_appointment));
		model.addAttribute("req", req);
		service.add_hr_appointment_service(model);
		return code.c(hr_management, manage_hr_appointment, add_hr_appointment);
	}

	@Override
	@ResponseBody
	@GetMapping(value="manage_hr_appointment/select_dept/{dept_id}")
	public ResponseEntity<List<EmployeeVO>> select_dept(@PathVariable("dept_id") int dept_id) {
		ResponseEntity<List<EmployeeVO>> entity = null;
		try {
			entity = new ResponseEntity<>(service.select_dept_service(dept_id),HttpStatus.OK);			
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@Override
	@GetMapping(value="manage_hr_appointment/hr_appointment_regform")
	public String hr_appointment_regform(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(hr_appointment_regform));
		model.addAttribute("req", req);
		service.hr_appointment_regform_service(model);
		return code.c(hr_management, manage_hr_appointment, hr_appointment_regform);
	}

	@Override
	@PostMapping(value="manage_hr_appointment/add_hr_appointment_pro")
	public String add_hr_appointment_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_hr_appointment_pro));
		model.addAttribute("req", req);
		service.add_hr_appointment_pro_service(model);
		return code.c(hr_management, manage_hr_appointment, add_hr_appointment_pro);
	}

	@Override
	@GetMapping(value="manage_hr_appointment/personnel_card_appointment")
	public String personnel_card_appointment(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(personnel_card_appointment));
		model.addAttribute("req", req);
		service.personnel_card_appointment_service(model);
		return code.c(hr_management, manage_hr_appointment, personnel_card_appointment);
	}

	@Override
	@GetMapping(value="manage_retired_employee/retired_employee_search")
	public String retired_employee_search(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(retired_employee_search));
		model.addAttribute("req", req);
		service.retired_employee_search_service(model);
		return code.c(hr_management, manage_retired_employee, retired_employee_search);
	}

	@Override
	@GetMapping(value="manage_retired_employee/retired_employee_list")
	public String retired_employee_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(retired_employee_list));
		model.addAttribute("req", req);
		service.retired_employee_list_service(model);
		return code.c(hr_management, manage_retired_employee, retired_employee_list);
	}

	@Override
	@GetMapping(value="manage_retired_employee/retired_employee_nav")
	public String retired_employee_nav(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(retired_employee_nav));
		model.addAttribute("req", req);
		service.retired_employee_nav_service(model);
		return code.c(hr_management, manage_retired_employee, retired_employee_nav);
	}

	@Override
	@GetMapping(value="manage_retired_employee/add_retired_employee")
	public String add_retired_employee(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_retired_employee));
		model.addAttribute("req", req);
		service.add_retired_employee_service(model);
		return code.c(hr_management, manage_retired_employee, add_retired_employee);
	}

	@Override
	@PostMapping(value="manage_retired_employee/add_retired_employee_pro")
	public String add_retired_employee_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(add_retired_employee_pro));
		model.addAttribute("req", req);
		service.add_retired_employee_pro_service(model);
		return code.c(hr_management, manage_retired_employee, add_retired_employee_pro);
	}
	
	@Override
	@GetMapping(value="manage_retired_employee/retired_employee_regform")
	public String retired_employee_regform(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(retired_employee_regform));
		model.addAttribute("req", req);
		service.retired_employee_regform_service(model);
		return code.c(hr_management, manage_retired_employee, retired_employee_regform);
	}
	
	@Override
	@GetMapping(value="manage_retired_employee/personnel_card_retired")
	public String personnel_card_retired(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(personnel_card_retired));
		model.addAttribute("req", req);
		service.personnel_card_retired_service(model);
		return code.c(hr_management, manage_retired_employee, personnel_card_retired);
	}
	
	@Override
	@GetMapping(value="manage_salary/salary_register_search")
	public String salary_register_search(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(salary_register_search));
		model.addAttribute("req", req);
		service.salary_register_search_service(model);
		return code.c(hr_management, manage_salary, salary_register_search);
	}
	
	@Override
	@GetMapping(value="manage_salary/salary_register_list")
	public String salary_register_list(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(salary_register_list));
		model.addAttribute("req", req);
		service.salary_register_list_service(model);
		return code.c(hr_management, manage_salary, salary_register_list);
	}

	@Override
	@GetMapping(value="manage_salary/salary_register_nav")
	public String salary_register_nav(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(salary_register_nav));
		model.addAttribute("req", req);
		service.salary_register_nav_service(model);
		return code.c(hr_management, manage_salary, salary_register_nav);
	}

	@Override
	@GetMapping(value="manage_salary/reg_salary_info")
	public String reg_salary_info(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(reg_salary_info));
		model.addAttribute("req", req);
		service.reg_salary_info_service(model);
		return code.c(hr_management, manage_salary, reg_salary_info);
	}
	
	@Override
	@PostMapping(value="manage_salary/reg_salary_info_pro")
	public String reg_salary_info_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(reg_salary_info_pro));
		model.addAttribute("req", req);
		service.reg_salary_info_pro_service(model);
		return code.c(hr_management, manage_salary, reg_salary_info_pro);
	}

	@Override
	@GetMapping(value="manage_salary/salary_statement_search")
	public String salary_statement_search(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(salary_statement_search));
		model.addAttribute("req", req);
		service.salary_statement_search_service(model);
		return code.c(hr_management, manage_salary, salary_statement_search);
	}

	@Override
	@GetMapping(value="manage_salary/clear_salary_bank_account")
	public String clear_salary_bank_account(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(clear_salary_bank_account));
		model.addAttribute("req", req);
		service.clear_salary_bank_account_service(model);
		return code.c(hr_management, manage_salary, clear_salary_bank_account);
	}

	@Override
	@GetMapping(value="manage_salary/clear_salary_bank_account_pro")
	public String clear_salary_bank_account_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(clear_salary_bank_account_pro));
		model.addAttribute("req", req);
		service.clear_salary_bank_account_pro_service(model);
		return code.c(hr_management, manage_salary, clear_salary_bank_account_pro);
	}
	
	@Override
	@GetMapping(value="manage_salary/modify_salary_info")
	public String modify_salary_info(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_salary_info));
		model.addAttribute("req", req);
		service.modify_salary_info_service(model);
		return code.c(hr_management, manage_salary, modify_salary_info);
	}

	@Override
	@PostMapping(value="manage_salary/modify_salary_info_pro")
	public String modify_salary_info_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(modify_salary_info_pro));
		model.addAttribute("req", req);
		service.modify_salary_info_pro_service(model);
		return code.c(hr_management, manage_salary, modify_salary_info_pro);
	}

	@Override
	@GetMapping(value="manage_salary/calc_salary")
	public String calc_salary(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(calc_salary));
		model.addAttribute("req", req);
		service.calc_salary_service(model);
		return code.c(hr_management, manage_salary, calc_salary);
	}

	@Override
	@PostMapping(value="manage_salary/calc_salary_pro")
	public String calc_salary_pro(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(calc_salary_pro));
		model.addAttribute("req", req);
		service.calc_salary_pro_service(model);
		return code.c(hr_management, manage_salary, calc_salary_pro);
	}

	@Override
	@GetMapping(value="manage_salary/fix_salary")
	public String fix_salary(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(fix_salary));
		model.addAttribute("req", req);
		service.fix_salary(model);
		return code.c(hr_management, manage_salary, fix_salary);
	}

	@Override
	@GetMapping(value="manage_salary/personnel_card_salary")
	public String personnel_card_salary(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(personnel_card_salary));
		model.addAttribute("req", req);
		service.personnel_card_salary_service(model);
		return code.c(hr_management, manage_salary, personnel_card_salary);
	}
	
}
