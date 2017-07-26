package com.pro.myrp.persistence.state_alarm;

import java.util.ArrayList;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.pro.myrp.domain.state_alarm.State_alarmDTO;

@Repository
public class State_alaramDAOImpl implements State_alaramDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public ArrayList<State_alarmDTO> select_state_alarm(Model model) {
		State_alaramDAO dao = sqlSession.getMapper(State_alaramDAO.class);
		return dao.select_state_alarm(model);
	}

	@Override
	public int select_salary_register_statement(Model model) {
		State_alaramDAO dao = sqlSession.getMapper(State_alaramDAO.class);
		return dao.select_salary_register_statement(model);
	}

	@Override
	public int select_sales_statement(Model model) {
		State_alaramDAO dao = sqlSession.getMapper(State_alaramDAO.class);
		return dao.select_sales_statement(model);
	}

	@Override
	public int select_purchase_statement(Model model) {
		State_alaramDAO dao = sqlSession.getMapper(State_alaramDAO.class);
		return dao.select_purchase_statement(model);
	}

}
