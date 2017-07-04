package com.pro.myrp.service.hr;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pro.myrp.persistence.hr.HRDAO;

@Service
public class HRServiceImpl implements HRService {

	@Inject
	private HRDAO dao;
}
