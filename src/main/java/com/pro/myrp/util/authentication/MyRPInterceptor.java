package com.pro.myrp.util.authentication;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public interface MyRPInterceptor {

	public static final Logger logger = LoggerFactory.getLogger(MyRPInterceptor.class);
	
	public static final String ROLE = "ROLE";
	public static final String ROLE_ADMIN = "ADMIN";
	public static final String ROLE_SALES = "SA";
	public static final String ROLE_PURCHASE = "PU";
	public static final String ROLE_DISTRIBUTION = "DT";
	public static final String ROLE_ACCOUNT = "FI";
	public static final String ROLE_HR = "HR";
}
