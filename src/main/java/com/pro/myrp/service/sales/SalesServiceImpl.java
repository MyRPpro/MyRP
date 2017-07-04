package com.pro.myrp.service.sales;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pro.myrp.persistence.sales.SalesDAO;

@Service
public class SalesServiceImpl implements SalesService {

	@Inject
	private SalesDAO dao;
}
