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
			order_stateList.add(25451);
			model.addAttribute("order_state",order_stateList);
			state_alarmDtos = dao.select_state_alarm(model);
			
			for(int i = 0; i < state_alarmDtos.size();i++){
				state =state_alarmDtos.get(i); 

				switch(state.getOrder_state()){
					case 25451 : state.setState_addr("/accounting_management/statement_management/search_unapproval_statements"); state.setState_msg("전표 승인 요청이 도착했습니다.");break;
								
				}
			}
		}else if(role.equals("DT")){
			order_stateList.add(23204);
			order_stateList.add(22222);
			model.addAttribute("order_state",order_stateList);
			state_alarmDtos = dao.select_state_alarm(model);
			
			for(int i = 0; i < state_alarmDtos.size();i++){
				state =state_alarmDtos.get(i); 

				switch(state.getOrder_state()){
					case 23204 :state.setState_addr("/distribution_management/search_distribution_order/statement_list");
					state.setState_msg("구매팀에서 구매입고 요청이 도착했습니다.");
					state.setFrom_dept("구매팀");
					break;
					case 22222 :state.setState_addr("/distribution_management/search_distribution_order/statement_list");
					state.setState_msg("영업팀에서 영업출고 요청이 도착했습니다.");
					state.setFrom_dept("영업팀");
					break;
				}
			}
		}else if(role.equals("HR")){
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
				System.out.println("\n!"+hr_state+"\n");
				switch(hr_state){
					case 25452 	: state.setState_addr("/hr_management/manage_salary/fix_salary"); state.setState_msg("회계팀에서 전표 승인 알림이 도착했습니다."); break;
					case 25453 	: state.setState_addr("/hr_management/manage_salary/fix_salary"); state.setState_msg("회계팀에서 전표 승인 거절 알림이 도착했습니다."); break;
					case 0		: state_alarmDtos.remove(i); i-=1; break;
				}
			}
		}else if(role.equals("PU")){

			order_stateList.add(24102);
			order_stateList.add(24753);
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
				
				if(purchase_state == 25452){
					state.setState_addr("/purchase_management/search_purchase/purchase_list"); state.setState_msg("회계팀에서 전표 승인 알림이 도착했습니다.");
					continue;
				}
				
				switch(state.getOrder_state()){
					case 24102 :state.setState_addr("/purchase_management/search_purchase/purchase_list"); state.setState_msg("물류팀에서 입고완료 알림이 도착했습니다.");break;
					case 24753 :state.setState_addr("/purchase_management/search_purchase/purchase_list"); state.setState_msg("물류팀에서 구매요청이 도착했습니다.");break;
					default : state_alarmDtos.remove(i); i-=1; break;
				}
				
				
			}
		}else if(role.equals("SA")){
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
				
				if(state.getOrder_state() == 24752){
					state.setState_addr("/sales_management/search_sales/sales_list"); 
					state.setState_msg("출고완료 알림");
					state.setFrom_dept("물류");
					continue;
				}
				
				switch(sa_state){
					case 25452 :state.setState_addr("/sales_management/search_sales/sales_list");
					state.setState_msg("전표승인 알림");
					state.setFrom_dept("회계");
					break;
					case 25453 :state.setState_addr("/sales_management/search_sales/sales_list");
					state.setState_msg("전표승인거절 알림");
					state.setFrom_dept("회계");
					break;
					default : state_alarmDtos.remove(i); i-=1; break;
				}
				
			}
		}
		model.addAttribute("state_alarmDtos", state_alarmDtos);
		model.addAttribute("size", state_alarmDtos.size());
		return null;
	}
	
	

}
