package com.pro.myrp.persistence.state_alarm;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.pro.myrp.domain.state_alarm.State_alarmDTO;

public interface State_alaramDAO {

	ArrayList<State_alarmDTO> select_state_alarm(Model model);

	int select_salary_register_statement(Model model);

	int select_sales_statement(Model model);

	int select_purchase_statement(Model model);


}
