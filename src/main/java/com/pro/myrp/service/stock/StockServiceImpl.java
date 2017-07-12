package com.pro.myrp.service.stock;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pro.myrp.persistence.stock.StockDAO;

@Service
public class StockServiceImpl implements StockService {

	@Inject
	private StockDAO dao;
}
