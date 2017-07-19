package com.pro.myrp.controller.hr;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.pro.myrp.domain.CodeMyRP;
import com.pro.myrp.domain.hr_management.EmployeeVO;
import com.pro.myrp.domain.hr_management.FileDTO;
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
		String msg = "";
		MultipartFile file = dto.getFile();
		if (file != null) {
			String fileName = dto.getName();
			try {
				String path = "C:/Users/amaco78/Documents/project/MyRP/src/main/webapp/resources/images/";
				File file2 = new File(path + fileName + ".jpg");
				file.transferTo(file2);
				model.addAttribute("employee_id", fileName);
				msg = "성공적으로 파일업로드 되었습니다.";
			} catch (IOException e) {
				e.printStackTrace();
				msg = "파일업로드에 실패하였습니다. 잠시후 다시 시도해 주세요.";
			}
		} else {
			msg = "선택받은 파일이 없거나 재대로 연결되지 않았습니다.";
		}
		model.addAttribute("msg", msg);
		return code.c(hr_management, manage_personnel_card, add_personnel_card_upload);
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
	@GetMapping(value="manage_service_attitude/search_attendance_absence")
	public String search_attendance_absence(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(search_attendance_absence));
		model.addAttribute("req", req);
		
		return code.c(hr_management, manage_service_attitude, search_attendance_absence);
	}

	@Override
	@GetMapping(value="manage_salary/salary_register")
	public String salary_register(HttpServletRequest req, Model model) throws Exception {
		System.out.println(code.c(salary_register));
		model.addAttribute("req", req);
		
		return code.c(hr_management, manage_salary, salary_register);
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
			System.out.println("entity service start");
			entity = new ResponseEntity<>(service.select_dept_service(dept_id),HttpStatus.OK);			
			System.out.println("entity service end");
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		System.out.println("entity return");
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
}
