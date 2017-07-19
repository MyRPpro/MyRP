package com.pro.myrp.domain;

import java.sql.Date;

/**
 * @author Jang.EC
 *
 */

public class PurchaseDTO {

	private String purchase_id;
	private String account_id;
	private String order_id;
	private String product_id;
	private String company_id;
	private int employee_id;
	private Date reg_date;
	private Date update_date;
	private Date storage_in_date;
	private int count_purchase;
	private long supply_price;
	private int purchase_state;
	private int condition_note_payable;
	
	// 기본 테이블외 추가한 변수들 
	private String product_name;
	private String company_name;
	private String employee_name;
	private String account_name;
	private String statement_id;
	private int rnum;
	private String purchase_state_name;
	
	
}
