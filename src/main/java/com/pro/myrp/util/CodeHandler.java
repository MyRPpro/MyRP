package com.pro.myrp.util;

import java.lang.reflect.Field;


public class CodeHandler {
//기능정의서 기능코드는 [1+module번호+기능번호+commit번호] 5자리로 구성됨
	
	//기초등록
	public static final int base_registration = 11000;			
		//거래처 등록
		public static final int reg_company = 11100;
			public static final int company_list = 11110;		//거래처 리스트
			public static final int add_company = 11120;		//거래처 추가
			public static final int modify_company = 11130;		//거래처 수정
		//상품 등록
		public static final int reg_product = 11200;
			public static final int product_list = 11210;		//상품 리스트
			public static final int add_product = 11220;		//상품 신규 등록
			public static final int modify_product = 11230;		//상품 수정
	
	//영업관리
	public static final int sales_management = 12000;
	
	//구매관리
	public static final int purchase_management = 13000;
	
	//물류관리
	public static final int distribution_management = 14000;								//물류 관리
		public static final int stock_condition = 14100;									//재고현황 검색
			public static final int search_stock_condition = 14110;							//재고현황 검색
			
		public static final int stockpile = 14200;											//재고 수불부
			public static final int search_stockpile = 14210;								//재고수불부 검색
			public static final int search_adjust_information = 14220;						//조정 정보 조회
			public static final int search_selling_information = 14230;						//판매 정보 조회
			public static final int search_self_information = 14240;						//자가 정보 조회
			public static final int search_defective_information = 14250;					//불량 정보 조회
			public static final int search_and_modification_movement_information = 14260;	//이동 정보 조회 및 수정
			
		public static final int reg_warehouse = 14300;										//창고등록
			public static final int warehouse_list = 14310; 								//창고 리스트
			public static final int registration_warehouse = 14320;							//창고 등록
			public static final int modifycation_warehouse =14330;							//창고 수정
			public static final int delete_warehouse = 14340;								//창고 삭제
			
			public static final int movement_warehouse = 14400;									//창고 이동
			public static final int movement_all_list = 14410; 								//전체 리스트
			public static final int movement_unidentified_list = 14420;						//미확인 리스트		
			public static final int movement_identified_list = 14430;						//확인 리스트
			public static final int registration_movement_warehouse = 14440;				//창고 이동 등록		
			public static final int modification_movement_warehouse = 14450;				//창고 이동 수정		
			public static final int delete_movement_warehouse = 14460;						//창고 이동 삭제	
			
		public static final int adjustment_inventory  = 14500;								//재고 조정
			public static final int adjustment_inventory_list = 14510; 						//재고 조정 조회
			public static final int registraion_adjustment_inventory = 14520;				//재고 조정 등록
			
		public static final int search_distribution_order = 14600;							//물류 주문 조회
			public static final int all_statement_list = 14610; 							//전체 전표 리스트
			public static final int unidentified_lstatement_ist = 14620;					//미확인 전표 리스트
			public static final int identified_statement_ist = 14630;						//확인 전표 리스트
			public static final int query_statement = 14640;								//전표 내용 조회
			public static final int approval_statement = 14650;								//전표 내용 승인
	//회계관리
	public static final int accounting_management = 15000;
		public static final int bank_account_registration_branch = 15200;
			public static final int bank_account_list = 15210;			//계좌 리스트
			public static final int call_bank_account_id = 15220; 		//아이디 불러오기
			public static final int register_bank_account = 15230;		//계좌 등록
			public static final int modify_bank_account = 15240; 		//계좌 수정 
			public static final int delete_bank_account = 15250;		//계좌 삭제
	
	
	//인사관리
	public static final int hr_management = 16000;
		//인사코드관리
		public static final int manage_hr_code = 16100;
			public static final int base_code_group_list = 16110;
			public static final int add_base_code_group = 16120;
			public static final int modify_base_code_group = 16130;
			public static final int base_code_list = 16140;
			public static final int add_base_code = 16150;
			public static final int modify_base_code = 16160;
		//부서관리
		public static final int manage_dept = 16200;
			public static final int dept_list = 16210;
			public static final int add_dept = 16220;
			public static final int modify_dept = 16230;
		//인사카드관리
		public static final int manage_personnel_card = 16300;
			public static final int personnel_card_list = 16310;
			public static final int reg_personnel_card = 16320;
			public static final int modify_personnel_card = 16330;
			public static final int manage_hr_appointment = 16340;
			public static final int manage_retired_employee = 16350;
		//근태관리
		public static final int manage_service_attitude = 16400;
			public static final int search_attendance_absence = 16410;
			public static final int reg_attendance = 16420;
			public static final int reg_service_attitude = 16430;
			public static final int search_service_attitude = 16440;
			public static final int service_attitude_summary_sheet = 16450;
		//급여관리
		public static final int manage_salary = 16500;
			public static final int salary_register = 16510;
			public static final int reg_salary_info = 16520;
			public static final int fix_work_record = 16530;
			public static final int calc_salary = 16540;
			public static final int fix_salary = 16550;
			public static final int search_salary_history = 16560;
		//상태정의서 상태코드는 [2+module번호+기능번호+상태번호] 5자리로 구성됨
	
	public CodeHandler() {
		
	}
	
	public void c_list() {
		Object obj = this;
		for(Field field : obj.getClass().getDeclaredFields()){
			field.setAccessible(true);
			try {
				Object value = field.get(obj);
				System.out.println(field.getName() + "," + value);
				System.out.println(field.get(obj).getClass().getSimpleName());
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 코드값 -> 코드명 변환기
	 * @author amaco78
	 * @param code [int]
	 * @return codeName [String]
	 */
	public String c(int code) {
		Object obj = this;
		for(Field field : obj.getClass().getDeclaredFields()){
			field.setAccessible(true);
			try {
				if(field.get(obj).getClass().getSimpleName().equals("Integer")){
					if(code == ((Integer)(field.get(obj))).intValue()) return field.getName();					
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * 코드값 -> 코드명 변환기(/code1/code2)
	 * @author amaco78
	 * @param code1
	 * @param code2
	 * @return
	 */
	public String c(int code1, int code2) {
		String codeName = "";
		Object obj = this;
		codeName += "/";
		for(Field field : obj.getClass().getDeclaredFields()){
			field.setAccessible(true);
			try {
				if(field.get(obj).getClass().getSimpleName().equals("Integer")){
					if(code1 == ((Integer)(field.get(obj))).intValue()) codeName += field.getName();					
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		codeName += "/";
		for(Field field : obj.getClass().getDeclaredFields()){
			field.setAccessible(true);
			try {
				if(field.get(obj).getClass().getSimpleName().equals("Integer")){
					if(code2 == ((Integer)(field.get(obj))).intValue()) codeName += field.getName();					
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return codeName;
	}
	
	/**
	 * 코드값 -> 코드명 변환기(/code1/code2/code3)
	 * @author amaco78
	 * @param code1
	 * @param code2
	 * @param code3
	 * @return
	 */
	public String c(int code1, int code2, int code3) {
		String codeName = "";
		Object obj = this;
		codeName += "/";
		for(Field field : obj.getClass().getDeclaredFields()){
			field.setAccessible(true);
			try {
				if(field.get(obj).getClass().getSimpleName().equals("Integer")){
					if(code1 == ((Integer)(field.get(obj))).intValue()) codeName += field.getName();					
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		codeName += "/";
		for(Field field : obj.getClass().getDeclaredFields()){
			field.setAccessible(true);
			try {
				if(field.get(obj).getClass().getSimpleName().equals("Integer")){
					if(code2 == ((Integer)(field.get(obj))).intValue()) codeName += field.getName();					
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		codeName += "/";
		for(Field field : obj.getClass().getDeclaredFields()){
			field.setAccessible(true);
			try {
				if(field.get(obj).getClass().getSimpleName().equals("Integer")){
					if(code3 == ((Integer)(field.get(obj))).intValue()) codeName += field.getName();					
				}
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return codeName;
	}
	
	/**
	 * 코드명 -> 코드값 변환기
	 * @author amaco78
	 * @param codeName [String]
	 * @return code [int]
	 */
	public int c(String codeName) {
		Object obj = this;
		for(Field field : obj.getClass().getDeclaredFields()){
			field.setAccessible(true);
			try {
				if(codeName.equals(field.getName())) return ((Integer)(field.get(obj))).intValue();
			} catch (IllegalArgumentException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}
}
