package com.pro.myrp.service.attitude;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

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
		
		
	
	}

	@Override
	public void add_attitude_search_pro_service(Model model) throws Exception {
		// 
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		
	}

	
}
