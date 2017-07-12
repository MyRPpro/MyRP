package com.pro.myrp.service.purchase;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pro.myrp.persistence.purchase.PurchaseDAO;

@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Inject
	private PurchaseDAO dao;
}
