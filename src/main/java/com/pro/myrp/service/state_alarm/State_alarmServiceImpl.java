package com.pro.myrp.service.state_alarm;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.ServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.pro.myrp.domain.state_alarm.State_alarmDTO;
import com.pro.myrp.persistence.state_alarm.State_alaramDAO;

@Service
public class State_alarmServiceImpl implements State_alarmService {
	
	@Inject
	State_alaramDAO dao;

	@Override
	public String state_alarm_pro_service(ServletRequest req, Model model) throws Exception {
		
		ArrayList<State_alarmDTO> state_alarmDtos = new ArrayList<State_alarmDTO>();
		ArrayList<Integer> order_stateList = new ArrayList<Integer>();
		State_alarmDTO state = null;
		String role = req.getParameter("role");
		String order_id = null;
		
		if(role.equals("FI")){
		//화계팀 입력 시작============================================================================================================================================================
			/*
			 * 입력방법
			 * 1. order_stateList.add("신규 등록 코드"); 작성
			 * 2. switch case 문 안에 조건 작성
			 * switch(state.getOrder_state()){ 
			 * 	case 신규 등록 코드 : setFrom_dept("발신 팀"); setState_msg("메시지"); setState_addr("이동 주소"); break;
			 * }
			 * switch 문이 2개 이상인 경우 switch(state.getOrder_state()) 안에 넣으셔야합니다. 
			 */
			
			order_stateList.add(25451);
			model.addAttribute("order_state",order_stateList);
			state_alarmDtos = dao.select_state_alarm(model);
			
			for(int i = 0; i < state_alarmDtos.size();i++){
				int fi_state = 0;
				state =state_alarmDtos.get(i); 
				order_id = state.getOrder_id();
				
				model.addAttribute("order_id",order_id);
				model.addAttribute("order_state", 25451);
				
				if(dao.select_salary_register_statement(model) > 0){
					fi_state = 1;
				}else if(dao.select_purchase_statement(model) > 0){
					order_stateList.add(25452);
					fi_state = 2;
				}else if(dao.select_sales_statement(model) > 0){
					fi_state = 3;
				}

				switch(fi_state){
					case 1 : 	state.setState_addr("/accounting_management/statement_management/search_statements?input_type=1"); 
								state.setState_msg("전표 승인 요청");
								state.setFrom_dept("인사"); break;
					case 2 : 	state.setState_addr("/accounting_management/statement_management/search_statements?input_type=1"); 
								state.setState_msg("전표 승인 요청");
								state.setFrom_dept("구매"); break;
					case 3 : 	state.setState_addr("/accounting_management/statement_management/search_statements?input_type=1"); 
								state.setState_msg("전표 승인 요청");
								state.setFrom_dept("영업"); break;
					case 0 : 	state_alarmDtos.remove(i); i-=1; break;
				}
			}
		//화계팀 입력 끝============================================================================================================================================================
		}else if(role.equals("DT")){
		//물류팀 입력 시작============================================================================================================================================================
			/*
			 * 입력방법
			 * 1. order_stateList.add("신규 등록 코드"); 작성
			 * 2. switch case 문 안에 조건 작성
			 * switch(state.getOrder_state()){ 
			 * 	case 신규 등록 코드 : setFrom_dept("발신 팀"); setState_msg("메시지"); setState_addr("이동 주소"); break;
			 * }
			 * switch 문이 2개 이상인 경우 switch(state.getOrder_state()) 안에 넣으셔야합니다. 
			 */
			
			order_stateList.add(23204);
			order_stateList.add(22222);
			order_stateList.add(24202);
			model.addAttribute("order_state",order_stateList);
			state_alarmDtos = dao.select_state_alarm(model);
			
			for(int i = 0; i < state_alarmDtos.size();i++){
				state =state_alarmDtos.get(i); 

				switch(state.getOrder_state()){
					case 23204 :state.setState_addr("/distribution_management/search_distribution_order/statement_list?goes=in"); 
								state.setState_msg("구매입고 요청");
								state.setFrom_dept("구매"); break;
					case 24202 :state.setState_addr("/distribution_management/search_distribution_order/statement_list?goes=out"); 
								state.setState_msg("출고완료 요청");
								state.setFrom_dept("영업"); break;			
					case 22222 :state.setState_addr("/distribution_management/search_distribution_order/statement_list?goes=out"); 
								state.setState_msg("출고 요청");
								state.setFrom_dept("영업");break;
				}
			}
		//물류팀 입력 끝============================================================================================================================================================
		}else if(role.equals("HR")){
		//인사팀 입력 시작============================================================================================================================================================
			/*
			 * 입력방법
			 * 1. order_stateList.add("신규 등록 코드"); 작성
			 * 2. switch case 문 안에 조건 작성
			 * switch(state.getOrder_state()){ 
			 * 	case 신규 등록 코드 : setFrom_dept("발신 팀"); setState_msg("메시지"); setState_addr("이동 주소"); break;
			 * }
			 * switch 문이 2개 이상인 경우 switch(state.getOrder_state()) 안에 넣으셔야합니다. 
			 */
			
			order_stateList.add(25452);
			order_stateList.add(25453);
			model.addAttribute("order_state",order_stateList);
			state_alarmDtos = dao.select_state_alarm(model);
			
			for(int i = 0; i < state_alarmDtos.size();i++){
				int hr_state = 0;
				state =state_alarmDtos.get(i);
				order_id = state.getOrder_id();
				
				model.addAttribute("order_id",order_id);
				model.addAttribute("order_state", 25452);
				if(dao.select_salary_register_statement(model) > 0){
					hr_state = 25452;
				}
			
				model.addAttribute("order_state", 25453);
				if(dao.select_salary_register_statement(model) > 0){
					hr_state = 25453;
				}
				
				switch(hr_state){
					case 25452 	: 	state.setState_addr("/hr_management/manage_salary/salary_register_search"); 
									state.setState_msg("전표 승인 알림"); 
									state.setFrom_dept("회계"); break;
					case 25453 	: 	state.setState_addr("/hr_management/manage_salary/salary_register_search"); 
									state.setState_msg("전표 승인 거절 알림"); 
									state.setFrom_dept("회계");break;
					case 0		: 	state_alarmDtos.remove(i); i-=1; break;
				}
			}
		//인사팀 입력 끝============================================================================================================================================================
		}else if(role.equals("PU")){
		//구매팀 입력 시작============================================================================================================================================================
			/*
			 * 입력방법
			 * 1. order_stateList.add("신규 등록 코드"); 작성
			 * 2. switch case 문 안에 조건 작성
			 * switch(state.getOrder_state()){ 
			 * 	case 신규 등록 코드 : setFrom_dept("발신 팀"); setState_msg("메시지"); setState_addr("이동 주소"); break;
			 * }
			 * switch 문이 2개 이상인 경우 switch(state.getOrder_state()) 안에 넣으셔야합니다. 
			 */
			
			order_stateList.add(24102);
			order_stateList.add(24203);
			order_stateList.add(25452);
			model.addAttribute("order_state",order_stateList);
			state_alarmDtos = dao.select_state_alarm(model);
			for(int i = 0; i < state_alarmDtos.size();i++){
				int purchase_state = 0;
				state =state_alarmDtos.get(i); 
				order_id = state.getOrder_id();
				
				model.addAttribute("order_id",order_id);
				model.addAttribute("order_state", 25452);
				if(dao.select_purchase_statement(model) > 0){
					order_stateList.add(25452);
					purchase_state = 25452;
				}
				
				
				
				switch(state.getOrder_state()){
					case 24102 :	state.setState_addr("/purchase_management/search_purchase/purchase_list"); 
									state.setState_msg("입고완료 알림");
									state.setFrom_dept("물류");continue;
					case 24203 :	state.setState_addr("/purchase_management/input_purchase/reg_purchase"); 
									state.setState_msg("구매 요청");
									state.setFrom_dept("물류");continue;
				}
				
				switch(purchase_state){
				case 25452 : 	state.setState_addr("/purchase_management/search_purchase/purchase_list"); 
								state.setState_msg("전표 승인 알림"); 
								state.setFrom_dept("회계"); continue;
				case 0	   : 	state_alarmDtos.remove(i); i-=1; break;
								
			}
				
				
			}
		//구매팀 입력 끝============================================================================================================================================================
		}else if(role.equals("SA")){
		//판매팀 입력 시작============================================================================================================================================================
			/*
			 * 입력방법
			 * 1. order_stateList.add("신규 등록 코드"); 작성
			 * 2. switch case 문 안에 조건 작성
			 * switch(state.getOrder_state()){ 
			 * 	case 신규 등록 코드 : setFrom_dept("발신 팀"); setState_msg("메시지"); setState_addr("이동 주소"); break;
			 * }
			 * switch 문이 2개 이상인 경우 switch(state.getOrder_state()) 안에 넣으셔야합니다. 
			 */
			
			System.out.println("SA들어옴");
			order_stateList.add(25452);
			order_stateList.add(25453);
			order_stateList.add(24752);
			
			model.addAttribute("order_state",order_stateList);
			state_alarmDtos = dao.select_state_alarm(model);
			for(int i = 0; i < state_alarmDtos.size();i++){
				int sa_state = 0;
				state =state_alarmDtos.get(i);
				order_id = state.getOrder_id();
				
				model.addAttribute("order_id",order_id);
				model.addAttribute("order_state", 25452);
				if(dao.select_sales_statement(model) > 0){
					sa_state = 25452;
				}
			
				model.addAttribute("order_state", 25453);
				if(dao.select_sales_statement(model) > 0){
					sa_state = 25453;
				}
				
				switch(state.getOrder_state()){
					case 24752 : 	state.setState_addr("/sales_management/search_sales/sales_list"); 
									state.setState_msg("출고완료 알림");
									state.setFrom_dept("물류"); continue;
				}
				
				switch(sa_state){
					case 25452 :	state.setState_addr("/sales_management/search_sales/sales_list"); 
									state.setState_msg("전표 승인 알림");
									state.setFrom_dept("회계"); break;
					case 25453 :	state.setState_addr("/sales_management/search_sales/sales_list"); 
									state.setState_msg("전표 승인 거절 알림"); 
									state.setFrom_dept("회계"); break;
					case 0     : 	state_alarmDtos.remove(i); i-=1; break;
				}
				
			}
		}
		//판매팀 입력 끝============================================================================================================================================================
		String goes = req.getParameter("goes");
		model.addAttribute("goes", goes);
		model.addAttribute("state_alarmDtos", state_alarmDtos);
		model.addAttribute("size", state_alarmDtos.size());
		return null;
	}
	


}
