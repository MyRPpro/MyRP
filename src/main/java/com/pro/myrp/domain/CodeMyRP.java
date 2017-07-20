package com.pro.myrp.domain;

public interface CodeMyRP {
	//기능정의서 기능코드는 [1+module번호+기능번호+commit번호] 5자리로 구성됨
	
		//기초등록
		public static final int base_registration = 11000;			
			//거래처 등록
			public static final int reg_company = 11100;
				public static final int company_list = 11110;									//거래처 리스트
				public static final int add_company = 11120;									//거래처 추가
				public static final int add_company_pro = 11121;								//거래처 추가 처리
				public static final int modify_company = 11130;									//거래처 수정
				public static final int modify_company_pro = 11131;								//거래처 수정 처리
			//상품 등록
			public static final int reg_product = 11200;
				public static final int product_list = 11210;									//상품 리스트
				public static final int add_product = 11220;									//상품 신규 등록
				public static final int add_product_dupCheck = 11221;							//상품 번호 중복 체크
				public static final int add_product_pro = 11222;								//상품 신규 등록 처리
				public static final int modify_product = 11230;									//상품 수정
				public static final int modify_product_pro = 11231;								//상품 수정 처리
				
		//영업관리
		public static final int sales_management 			= 12000;
			
		
			// 판매검색
			public static final int search_sales 			= 12100;			
				public static final int sales_list 			= 12110;	// 판매 검색
				public static final int sales_list_table  	= 12120;	// 판매 리스트 테이블 내용
				public static final int sales_list_page 	= 12130;	// 판매 리스트 테이블 페이지 번호
				public static final int detail_sales 		= 12140;	// 판매 상세
				public static final int modify_sales 		= 12150;	// 판매 상세 + 수정
				public static final int modify_sales_pro 	= 12160;	// 판매 수정 처리
				
			// 판매입력
			public static final int input_sales = 12200;
				public static final int reg_sales = 12210;			//판매 입력
				public static final int reg_sales_pro = 12220;		//판매 입력 처리
			// 판매 현황
			public static final int staus_sales = 12300;			
				public static final int search_status_sales = 12310;//편매현황 검색
				public static final int status_sales = 12320;		//판매현황
				/*public static final int detail_sales = 12120;		//판매 상세 (중복)*/			
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
				public static final int modify_purchase 	 = 13150;	// 구매 수정
				
			// 구매입력
			public static final int input_purchase = 13200;
				public static final int reg_purchase 		= 13210;	// 구매 입력 양식
				public static final int reg_purchase_table 	= 13220;	// 구매 입력 테이블
				
			// 구매 현황
			public static final int staus_purchase = 13300;			
				public static final int search_status_purchase = 13310;// 구매 현황 검색
				public static final int status_purchase = 13320;		// 구매 현황
				/*public static final int detail_purchase = 12120;		// 구매 상세 (중복)*/			
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
						public static final int search_stockpile = 14210;								//재고수불부 검색
							public static final int search_stockpile_search = 14211;					//재고수불부 검색 Ajax 페이지
							public static final int select_stockpile_search = 14212;					//재고수불부 검색 Ajax 결과 페이지
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
			//회계보고서
			//계좌등록
			public static final int bank_account_registration = 15200;
				public static final int bank_account_list = 15210;			//계좌 리스트
				public static final int call_bank_account_id = 15220; 		//아이디 불러오기
				public static final int register_bank_account = 15230;		//계좌 등록
				public static final int modify_bank_account = 15240; 		//계좌 수정 
			//현금출납
			//전표관리
			public static final int statement_management = 15400;
				public static final int search_all_statements = 15410;			//전체전표 조회
				public static final int search_statement_detail = 15420; 		//상세전표 조회
				public static final int search_disapproval_statement = 15430; 	//미승인 전표조회
				public static final int search_approval_statement = 15440;		//승인 전표조회
				public static final int approve_statement = 15450; 				//전표 승인
				public static final int disapprove_statement = 15460;			//전표 승인거절
				public static final int make_statement = 15470; 				//전표 생성
			//재권/채무 현황

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
				public static final int retired_employee_list = 16710;
				public static final int add_retired_employee = 16720;
				public static final int personnel_card_retired = 16730;
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


							
				
}
