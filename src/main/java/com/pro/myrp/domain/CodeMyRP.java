package com.pro.myrp.domain;

public interface CodeMyRP {
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
			
	
			// 판매검색
			public static final int search_sales = 12100;			
				public static final int sales_list = 12110;			//판매 리스트(검색기능 포함)
				public static final int detail_sales = 12120;		//판매 상세
				public static final int modify_slaes = 12130;		//판매 수정
				public static final int search_title = 12140;		//제목으로 검색
				
				
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
			
			
		
		
		//구매관리
		public static final int purchase_management = 13000;
		
		//물류관리
		public static final int distribution_management = 14000;
		
		//회계관리
		public static final int accountion_management = 15000;
		
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
		
}
