package com.pro.myrp.service.basic;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.pro.myrp.persistence.basic.BasicDAO;

@Service
public class BasicServiceImpl implements BasicService {

	@Inject
	private BasicDAO dao;
}
