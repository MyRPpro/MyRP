package com.pro.myrp.util;

import java.lang.reflect.Field;


public class CodeHandler {
//기능정의서 기능코드는 [1+module번호+기능번호+commit번호] 5자리로 구성됨
	
	//알람 센터
	public static final int state_alarm = 10100; 
		public static final int state_alarm_main =10110;					//알람센터 메인페이지
		public static final int state_alarm_pro =10110;					//알람센터 ajax 처리 페이지
	
	//기초등록
	public static final int base_registration = 11000;			
		//거래처 등록
		public static final int reg_company = 11100;
			public static final int company_list = 11110;										//거래처 리스트
			public static final int add_company = 11120;										//거래처 추가
			public static final int modify_company = 11130;										//거래처 수정
			//상품 등록
			public static final int reg_product = 11200;
				public static final int product_list = 11210;									//상품 리스트
				public static final int add_product = 11220;									//상품 신규 등록
				public static final int add_product_dupCheck = 11221;							//상품 번호 중복 체크
				public static final int add_product_pro = 11222;								//상품 신규 등록 처리
				public static final int modify_product = 11230;									//상품 수정
				public static final int modify_product_pro = 11231;								//상품 수정 처리
	
	//영업관리
	public static final int sales_management = 12000;
			
		// 판매검색
		public static final int search_sales 			= 12100;			
			public static final int sales_list 			= 12110;	// 판매 검색
			public static final int sales_list_table  	= 12120;	// 판매 리스트 테이블 내용
			public static final int sales_list_page 	= 12130;	// 판매 리스트 테이블 페이지 번호
			public static final int detail_sales 		= 12140;	// 판매 상세
			public static final int detail_sales_pro 	= 12150;	// 판매 상세 처리
			public static final int modify_sales 		= 12160;	// 판매 상세 + 수정
			public static final int modify_sales_pro 	= 12170;	// 판매 수정 처리
			
		// 판매입력
		public static final int input_sales 			= 12200;
			public static final int reg_sales 			= 12210;	//판매 입력
			public static final int reg_sales_table 	= 12220;	//판매 입력 처리
			
		// 판매 현황
		public static final int status_sales 					= 12300;	//판매현황		
			public static final int search_status_sales 		= 12310;	//편매현황 검색
			public static final int search_status_sales_table 	= 12320;	//판매현황 테이블
			public static final int search_status_sales_page 	= 12330;	//판매현황 페이지
			public static final int search_status_sales_detail 	= 12340;	//판매현황 세부
		
			// 거래처별 채권
		public static final int bond_by_transaction = 12400;			
			public static final int search_bond_by_transaction = 12410;			//거래처별채권 검색
			public static final int detail_bond_by_transaction = 12420;			//판매현황
			public static final int transaction_management_register = 12430;	//거래처별채권
		
			public static final int temp_table = 12990;		//임시 테이블	
				
			
	//구매관리
	public static final int purchase_management = 13000;
	
		// 구매검색
		public static final int search_purchase 		 = 13100;	// 구매 검색
			public static final int purchase_list 		 = 13110;	// 구매 리스트
			public static final int purchase_list_table  = 13120;	// 구매 리스트 테이블 내용
			public static final int purchase_list_page 	 = 13130;	// 구매 리스트 테이블 페이지 번호
			public static final int detail_purchase 	 = 13140;	// 구매 상세
			public static final int detail_purchase_pro  = 13150;	// 구매 상세 처이
			public static final int modify_purchase 	 = 13160;	// 구매 수정
			public static final int modify_purchase_pro  = 13170;	// 구매 수정 처리
			
		// 구매입력
		public static final int input_purchase = 13200;
			public static final int reg_purchase 			= 13210;	// 구매 입력 양식
			public static final int reg_purchase_table 		= 13220;	// 구매 입력 테이블
			public static final int search_reg_purchase 	= 13230;	// 부족 재고 조회
			public static final int search_reg_purchase_pro = 13240;	// 부족 재고 조회 처리
			
			
		// 구매 현황
		public static final int staus_purchase 						= 13300;	// 구매 현황	
			public static final int search_status_purchase 			= 13310;	// 구매 현황 검색
			public static final int search_status_purchase_table 	= 13320;	// 구매 현황 테이블
			public static final int search_status_purchase_page 	= 13330;	// 구매 현황 페이지
			public static final int search_status_purchase_detail 	= 13340;	// 구매 현황 세부
		// 거래처별 채권
		public static final int debt_by_company = 13400;			
			public static final int search_debt_by_company = 13410;			//거래처별채권 검색
			public static final int debt_by_company_list = 13420;			//판매현황
			public static final int transaction_company_register = 13430;	//거래처별채권
	
			//물류관리
			public static final int distribution_management = 14000;								//물류 관리
				public static final int stock_condition = 14100;									//재고현황 검색
					public static final int search_stock_condition = 14110;							//재고현황 검색
					
				public static final int stockpile = 14200;											//재고 수불부
					public static final int search_stockpile = 14210;								//재고수불부 검색 페이지
						public static final int search_stockpile_search = 14211;					//재고수불부 검색 Ajax 결과 페이지
						public static final int select_stockpile_search = 14212;					//재고수불부 검색 Ajax 결과 페이지
					public static final int search_adjust_information = 14220;						//조정 정보 조회
					public static final int search_selling_information = 14230;						//판매 정보 조회
					public static final int search_self_information = 14240;						//자가 정보 조회
					public static final int search_defective_information = 14250;					//불량 정보 조회
					public static final int search_and_modification_movement_information = 14260;	//이동 정보 조회 및 수정
					
				public static final int reg_warehouse = 14300;										//창고등록
					public static final int warehouse_list = 14310; 								//창고 리스트
					public static final int warehouse_view = 14320; 								//창고 등록 / 수정 입력
					public static final int warehouse_pro = 14330;									//창고 등록 / 수정 처리
					
					public static final int movement_warehouse = 14400;								//창고 이동
					public static final int movement_list = 14410; 									//전체 리스트
					public static final int movement_view = 14420;									//창고이동 등록 / 수정 입력		
					public static final int movement_pro = 14430;									//창고이동 등록 / 수정 처리
					public static final int movement_product = 14440;								//창고이동 등록 / 수정 입력 페이지에 창고 선택시 상품 뿌려주는
					
				public static final int adjustment_inventory  = 14500;								//재고 조정
					public static final int adjustment_inventory_list = 14510; 						//재고 조정 조회
					public static final int adjustment_inventory_view = 14520;						//재고 조정 등록
					public static final int adjustment_inventory_pro = 14530;						//재고 조정 처리
					
				public static final int search_distribution_order = 14600;							//물류 주문 조회
					public static final int statement_list = 14610; 								//전체 전표 리스트
					public static final int request_in_out_storage = 14620;							//전표 내용 조회
					public static final int approval_statement = 14650;								//전표 내용 승인
			
	//회계관리
	public static final int accounting_management = 15000;
		public static final int bank_account_registration = 15200;
			public static final int bank_account_list = 15210;			//계좌 리스트
			public static final int call_bank_account_id = 15220; 		//아이디 불러오기
			public static final int register_bank_account = 15230;		//계좌 등록
			public static final int modify_bank_account = 15240; 		//계좌 수정 
		//계정관리
		public static final int account_management = 15300;		
			public static final int search_account_list = 15310;		//계정 목록 조회
			public static final int add_account = 15320;				//계정 추가
			public static final int add_account_dupCheck = 15321; 		//계정 추가 > 중복확인
			public static final int modify_account = 15330;				//계정 수정
		//전표관리
		public static final int statement_management = 15400;
			public static final int search_all_statements = 15410;			//전체전표 조회
			public static final int search_statement_detail = 15420; 		//상세전표 조회
			public static final int search_unapproval_statements = 15430; 	//미승인 전표조회
			public static final int search_approval_statements = 15440;		//승인 전표조회
			public static final int approve_statement = 15450; 				//전표 승인
			public static final int disapprove_statement = 15460;			//전표 승인거절

			public static final int call_connected_id_view = 15480;			//연결주문id불러오기:뷰//전표 생성
			public static final int call_connected_id = 15490;				//연결주문id불러오기
			public static final int make_statement = 15470; 				//전표 생성
	
	//인사관리
	public static final int hr_management = 16000;
		//인사코드관리
		public static final int manage_hr_code = 16100;										
			public static final int base_code_group_list = 16110;							//인사코드 그룹 목록
			public static final int add_base_code_group = 16120;							//인사코드 그룹 등록 화면
			public static final int add_base_code_group_dupCheck = 16121;					//인사코드 그룹번호 중복확인
			public static final int add_base_code_group_pro = 16122;						//인사코드 그룹 등록 처리
			public static final int modify_base_code_group = 16130;							//인사코드 그룹 수정 화면
			public static final int modify_base_code_group_pro = 16131;						//인사코드 그룹 수정 처리
			public static final int base_code_list = 16140;									//인사코드 목록
			public static final int add_base_code = 16150;									//인사코드 등록 화면
			public static final int add_base_code_dupCheck = 16151;							//인사코드 번호 중복확인
			public static final int add_base_code_pro = 16152;								//인사코드 등록 처리
			public static final int modify_base_code = 16160;								//인사코드 수정 화면
			public static final int modify_base_code_pro = 16161;							//인사코드 수정 처리
		//부서관리
		public static final int manage_dept = 16200;
			public static final int dept_list = 16210;										//부서 목록
			public static final int add_dept = 16220;										//부서 등록 화면
			public static final int add_dept_dupCheck = 16221;								//부서번호 중복확인
			public static final int add_dept_pro = 16222;									//부서 등록 처리
			public static final int modify_dept = 16230;									//부서 수정 화면
			public static final int modify_dept_pro = 16231;								//부서 수정 처리
		//인사카드관리
		public static final int manage_personnel_card = 16300;
			public static final int personnel_card_search = 16310;
			public static final int personnel_card_list = 16311;
			public static final int personnel_card_nav = 16312;
			public static final int add_personnel_card = 16320;
			public static final int add_personnel_card_picture = 16321;
			public static final int add_personnel_card_upload = 16322;
			public static final int add_personnel_card_dupCheck = 16323;
			public static final int add_personnel_card_pro = 16324;
			public static final int modify_personnel_card = 16330;
			public static final int modify_personnel_card_pro = 16331;
		//급여관리
		public static final int manage_salary = 16500;
			public static final int salary_register = 16510;
			public static final int reg_salary_info = 16520;
			public static final int fix_work_record = 16530;
			public static final int calc_salary = 16540;
			public static final int fix_salary = 16550;
			public static final int search_salary_history = 16560;
		//인사발령 관리
		public static final int manage_hr_appointment = 16600;
			public static final int hr_appointment_search = 16610;
			public static final int hr_appointment_list = 16611;
			public static final int hr_appointment_nav = 16612;
			public static final int add_hr_appointment = 16620;
			public static final int hr_appointment_regform = 16621;
			public static final int add_hr_appointment_pro = 16622;
			public static final int personnel_card_appointment = 16630;
		//퇴사자 관리
		public static final int manage_retired_employee = 16700;
			public static final int retired_employee_search = 16710;
			public static final int retired_employee_list = 16711;
			public static final int retired_employee_nav = 16712;
			public static final int add_retired_employee = 16720;
			public static final int retired_employee_regform = 16721;
			public static final int add_retired_employee_pro = 16722;
			public static final int personnel_card_retired = 16730;
	
	//근태관리
	public static final int attitude_management = 17000;
		public static final int search_attitude = 17100;
			public static final int search_attitude_search = 17110;
		
		public static final int add_attitude = 17200;
			
			
	//상태정의서 상태코드는 [2+module번호+기능번호+상태번호] 5자리로 구성됨
	
			
			
		
			
	//상태코드
	public static final int statet_transition = 20000;
		
		//회계 
		public static final int disapproval_statement 		= 25451;	// 전표 미승인								
		public static final int approval_statement_state 	= 25452;	// 전표 승인	
		public static final int denial_approval_statement 	= 25453;	// 전표 승인 거절	
		
		//인사
		public static final int request_payments_salary 	= 26451;	// 급여지급요청						
		public static final int wait_payments_salary 		= 26452;	// 급여지급대기
		public static final int complete_payments_salary 	= 26453;	// 급여지급완료
		
		//물류
		public static final int receive_request_storage_in_warehouse 	= 24101;	// 입고요청접수						
		public static final int complete_storage_in_warehouse 			= 24102;	// 입고완료
		public static final int receive_request_storage_out_warehouse 	= 24201;	// 출고요청접수
		public static final int wait_storage_out_warehouse 				= 24202;	// 출고대기						
		public static final int prepare_inventory 						= 24203;	// 재고준비중
		public static final int complete_storage_out_warehouse 			= 24752;	// 출고완료
		public static final int request_purchase 						= 24753;	// 구매요청						
		public static final int complete_inventory 						= 24621;	// 재고조사완료
		
		//영업
		public static final int check_sales_estimate 					= 22211;	// 판매견적확인						
		public static final int approval_sales_estimate 				= 22212;	// 판매견적승인
		public static final int request_approval_sales_statement 		= 22213;	// 판매전표승인요청
		public static final int complete_approval_sales_statement 		= 22214;	// 판매전표승인완료						
		public static final int deadline 								= 22215;	// 마감
		public static final int request_sales_storage_out_warehouse 	= 22222;	// 영업출고요청
		public static final int complete_sales_storage_out_warehouse 	= 22223;	// 영업출고완료						
		public static final int wait_colleciton 						= 22411;	// 수금대기
		public static final int complete_colleciton 					= 22412;	// 수금완료

		//구매
		public static final int check_order								= 23201;	// 주문확인
		public static final int request_approval_purchase_statement 	= 23202;	// 구매전표승인요청
		public static final int complete_approval_purchase_statement 	= 23203;	// 구매전표승인완료
		public static final int request_purchase_storage_in_warehouse 	= 23204;	// 구매입고요청						
		public static final int complete_purchase_storage_in_warehouse 	= 23205;	// 구매입고완료
		public static final int wait_payments 							= 23206;	// 지급대기
		public static final int complete_payments 						= 23207;	// 지급완료						


		
		
		
			
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
