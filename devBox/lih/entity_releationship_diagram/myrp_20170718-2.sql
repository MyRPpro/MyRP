--------------------------------------------------------------------------------
-- 거래처 TABLE 생성 (company)
--------------------------------------------------------------------------------
CREATE TABLE company (
    company_id      CHAR(10)        NOT NULL    PRIMARY KEY,
    company_name    VARCHAR2(255)   NOT NULL,
    biz_reg_no      CHAR(12)        NOT NULL,
    ceo_name        VARCHAR2(20)    NOT NULL,
    corp_reg_no     CHAR(14)        NOT NULL,
    address         VARCHAR2(255)   NOT NULL,
    biz_type        VARCHAR2(255)   NOT NULL,
    biz_item        VARCHAR2(255)   NOT NULL,
    use_state       CHAR(1)         DEFAULT 'Y' NOT NULL
                    CHECK(use_state = 'Y' OR use_state = 'N'),
    company_type    CHAR(1)         DEFAULT 'S' NOT NULL
                    CHECK(company_type = 'S' OR company_type = 'C'),
    reg_date        DATE            DEFAULT SYSDATE
);
-- 거래처 추가
INSERT INTO company
VALUES( '1111111120','MyRP10','100-81-11111','이정재','110211-1234566',
        'aaa','aaa','aaa','Y');
COMMIT;
-- 거래처 정보 검색 (1~10번 튜플)
SELECT  *
FROM    (SELECT company_id, company_name, biz_reg_no, ceo_name, corp_reg_no,
        address, biz_type, biz_item, use_state, rownum rNum
        FROM    (SELECT *
                FROM    company
                ORDER BY company_name
                )
        )
WHERE rNum >= 1 AND rNUM <= 4;
--------------------------------------------------------------------------------
-- 품목 TABLE 생성 (product)
--------------------------------------------------------------------------------
CREATE TABLE product(
    product_id          CHAR(10)        PRIMARY KEY,
    product_name        VARCHAR2(255)   NOT NULL,
    purchase_unit_price NUMBER(10)      NOT NULL,
    sale_unit_price     NUMBER(10)      NOT NULL,
    use_state           CHAR(1)         DEFAULT 'Y' NOT NULL
                        CHECK(use_state = 'Y' OR use_state = 'N'),
    reg_date            DATE            DEFAULT SYSDATE
);
INSERT INTO product
VALUES('1200000001','JSP 2.3 웹프로그래밍',25000,27000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000002','JAVA 객체지향 디자인 패턴',26000,28000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000003','거침없이 배우는 자바스크립트/제이쿼리',30000,35000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000004','HTML5 + CSS3 웹 표준의 정석',25000,28000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000005','해킹방어를 위한 JAVA 시큐어코딩',26000,30000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000006','Oracle 11g 프로그래밍',20000,23000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000007','어서와 Java는 처음이지',30000,33000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000008','Head First Java',25000,28000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000009','Head First Java1',25000,28000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000010','Head First Java2',25000,28000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000011','Head First Java3',25000,28000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000012','Head First Java4',25000,28000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000013','Head First Java',25000,28000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000014','Head First Java',25000,28000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000015','Head First Java',25000,28000,'Y',SYSDATE);
INSERT INTO product
VALUES('1200000016','Head First Java',25000,28000,'Y',SYSDATE);
COMMIT;
--------------------------------------------------------------------------------
-- 인사코드그룹 TABLE 생성 (hr_code_group)
--------------------------------------------------------------------------------
CREATE TABLE hr_code_group(
    hr_code_group_id    NUMBER(1)       PRIMARY KEY,
    hr_code_group_name  VARCHAR2(255)   NOT NULL,
    use_state           CHAR(1)         DEFAULT 'Y' NOT NULL
                        CHECK(use_state = 'Y' OR use_state = 'N')
);
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state)
VALUES(2,'직급','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state)
VALUES(3,'휴가','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state)
VALUES(4,'급여','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state)
VALUES(5,'수당','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state)
VALUES(6,'경비','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state)
VALUES(7,'공제','Y');
COMMIT;
--------------------------------------------------------------------------------
-- 인사코드 TABLE 생성 (hr_code)
--------------------------------------------------------------------------------
CREATE TABLE hr_code(
    hr_code_group_id    NUMBER(1)       NOT NULL,
    hr_code_id          NUMBER(3)       NOT NULL,
    hr_code_name        VARCHAR2(255)   NOT NULL,
    use_state           CHAR(1)         DEFAULT 'Y' NOT NULL
                        CHECK(use_state = 'Y' OR use_state = 'N'),
    CONSTRAINT hr_code_group_id_fk FOREIGN KEY(hr_code_group_id)
                        REFERENCES hr_code_group(hr_code_group_id),
    CONSTRAINT hr_code_pk PRIMARY KEY(hr_code_group_id, hr_code_id)
);
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state)
VALUES(2,100,'사원','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state)
VALUES(2,200,'대리','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state)
VALUES(2,300,'과장','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state)
VALUES(2,400,'차장','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state)
VALUES(2,500,'부장','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state)
VALUES(2,600,'이사','Y');
COMMIT;
--------------------------------------------------------------------------------
-- 부서 TABLE 생성 (department)
--------------------------------------------------------------------------------
CREATE TABLE department(
    dept_id             NUMBER(4)       PRIMARY KEY,
    dept_name           VARCHAR2(255)   NOT NULL,
    access_role         VARCHAR2(255),
    use_state           CHAR(1)         DEFAULT 'Y' NOT NULL
                        CHECK(use_state = 'Y' OR use_state = 'N')
);
INSERT INTO department(dept_id,dept_name,access_role,use_state)
VALUES(2000,'영업','SA','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state)
VALUES(3000,'구매','PU','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state)
VALUES(4000,'물류','DT','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state)
VALUES(5000,'회계','FI','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state)
VALUES(6000,'인사','HR','Y');
COMMIT;
--------------------------------------------------------------------------------
-- 인사카드 TABLE 생성 (employee)
--------------------------------------------------------------------------------
CREATE TABLE employee(
    employee_id         NUMBER(4),
    dept_id             NUMBER(4),
    hr_code_group_rank  NUMBER(1),
    rank_code           NUMBER(3),
    employee_name       VARCHAR2(50)    NOT NULL,
    residence_reg_no    CHAR(13)        NOT NULL,
    join_date           DATE            DEFAULT SYSDATE,
    CONSTRAINT dept_id_fk FOREIGN KEY(dept_id)
                        REFERENCES department(dept_id),
    CONSTRAINT hr_code_group_rank_fk FOREIGN KEY(hr_code_group_rank,rank_code)
                        REFERENCES hr_code(hr_code_group_id,hr_code_id),
    CONSTRAINT employee_pk PRIMARY KEY(employee_id)
);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(6001,6000,2,100,'이인홍','7812161111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(4001,4000,2,200,'최연호','8510121111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(2001,2000,2,300,'장은철','8707101111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(3001,3000,2,400,'장재희','8705231111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(5001,5000,2,500,'이주원','9501302111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(0001,5000,2,500,'이주원','9501302111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(0002,5000,2,500,'이주원','9501302111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(0003,5000,2,500,'이주원','9501302111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(0004,5000,2,500,'이주원','9501302111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(0005,5000,2,500,'이주원','9501302111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(0006,5000,2,500,'이주원','9501302111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(0007,5000,2,500,'이주원','9501302111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(0008,5000,2,500,'이주원','9501302111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(0009,5000,2,500,'이주원','9501302111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(0010,5000,2,500,'이주원','9501302111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,
            employee_name,residence_reg_no,join_date)
VALUES(0011,5000,2,500,'이주원','9501302111111',SYSDATE);
COMMIT;
--------------------------------------------------------------------------------
-- 인사정보 TABLE 생성 (employee_info)
----------------------------------------------------------------------------------
--DROP TABLE employee_info;
CREATE TABLE employee_info(
    employee_id         NUMBER(4)       PRIMARY KEY,
    tel                 VARCHAR2(30),
    mobile_tel          VARCHAR2(30),
    passport_no         CHAR(9),
    email               VARCHAR2(40),
    address             VARCHAR2(255),
    hourly_wage         NUMBER(6)       NOT NULL,
    salary_account      VARCHAR2(20)    DEFAULT 0,
    CONSTRAINT employee_info_pk FOREIGN KEY(employee_id)
                        REFERENCES employee(employee_id)
);
--------------------------------------------------------------------------------
-- 인사발령 TABLE 생성 (personnel_appointment)
--------------------------------------------------------------------------------
CREATE TABLE personnel_appointment(
    employee_id         NUMBER(4),
    appointment_date    DATE            DEFAULT SYSDATE,
    hr_code_group_rank  NUMBER(1),
    pre_rank            NUMBER(3),
    post_rank           NUMBER(3),
    pre_dept            NUMBER(4),
    post_dept           NUMBER(4),
    CONSTRAINT employee_id_fk FOREIGN KEY(employee_id)
                        REFERENCES employee(employee_id),
    CONSTRAINT hr_code_pre_rank_fk FOREIGN KEY(hr_code_group_rank,pre_rank)
                        REFERENCES hr_code(hr_code_group_id,hr_code_id),
    CONSTRAINT hr_code_post_rank_fk FOREIGN KEY(hr_code_group_rank,post_rank)
                        REFERENCES hr_code(hr_code_group_id,hr_code_id),      
    CONSTRAINT pre_dept_fk FOREIGN KEY(pre_dept)
                        REFERENCES department(dept_id),
    CONSTRAINT post_dept_fk FOREIGN KEY(post_dept)
                        REFERENCES department(dept_id),
    CONSTRAINT personnel_appointment_pk PRIMARY KEY(employee_id,appointment_date)
);
--------------------------------------------------------------------------------
-- 퇴직자 TABLE 생성 (retired_employee)
--------------------------------------------------------------------------------
CREATE TABLE retired_employee(
    employee_id         NUMBER(4),
    retired_date        DATE            DEFAULT SYSDATE,
    retired_reason      VARCHAR2(255),
    CONSTRAINT retired_employee_fk FOREIGN KEY(employee_id)
                        REFERENCES employee(employee_id),
    CONSTRAINT retired_employee_pk PRIMARY KEY(employee_id,retired_date)
);
--------------------------------------------------------------------------------
-- 근무기록 TABLE 생성 (work_record)
--------------------------------------------------------------------------------
CREATE TABLE work_record(
    employee_id         NUMBER(4),
    work_date           DATE            DEFAULT SYSDATE,
    night_overtime      DATE,
    weekend_overtime    DATE,
    annual_denefit      DATE,
    CONSTRAINT work_record_fk FOREIGN KEY(employee_id)
                        REFERENCES employee(employee_id),
    CONSTRAINT work_record_pk PRIMARY KEY(employee_id,work_date)
);
--------------------------------------------------------------------------------
-- 근태 TABLE 생성 (service_attitude)
---------------------------------------------------------------------------------
--DROP TABLE service_attitude;
CREATE TABLE service_attitude(
    employee_id             NUMBER(4),
    attitude_date           DATE,
    hr_code_group_attitude  NUMBER(1),
    attitude_code           NUMBER(3),
    hr_code_group_leave     NUMBER(1),
    leave_code              NUMBER(3),
    attitude_period         DATE,
    hr_code_group_reason    NUMBER(1),
    attitude_reason         NUMBER(3),
    CONSTRAINT service_attitude_fk FOREIGN KEY(employee_id)
                        REFERENCES employee(employee_id),
    CONSTRAINT service_attitude_pk PRIMARY KEY(employee_id,attitude_date),
    CONSTRAINT service_attitude_fk2 FOREIGN KEY(hr_code_group_attitude,attitude_code)
                        REFERENCES hr_code(hr_code_group_id,hr_code_id),
    CONSTRAINT service_attitude_fk3 FOREIGN KEY(hr_code_group_leave,leave_code)
                        REFERENCES hr_code(hr_code_group_id,hr_code_id),
    CONSTRAINT service_attitude_fk4 FOREIGN KEY(hr_code_group_reason,attitude_reason)
                        REFERENCES hr_code(hr_code_group_id,hr_code_id)
);
--------------------------------------------------------------------------------
-- 급여대장 TABLE 생성 (salary_register)
--------------------------------------------------------------------------------
CREATE TABLE salary_register(
    salary_register_id      CHAR(12),
    account_id              CHAR(12),
    reg_date                DATE            DEFAULT SYSDATE,
    salary_register_name    VARCHAR2(255),
    pay_date                DATE,
    total_pay               NUMBER(12),
    total_employee          NUMBER(4),
    salary_state            NUMBER(5)       DEFAULT 0,
    CONSTRAINT salary_register_pk PRIMARY KEY(salary_register_id,account_id)
);
--------------------------------------------------------------------------------
--  급여 TABLE 생성 (salary)
--------------------------------------------------------------------------------
--DROP TABLE salary;
CREATE TABLE salary(
    salary_register_id      CHAR(12),
    account_id              CHAR(12),
    employee_id             NUMBER(4),
    base_pay                NUMBER(10),
    bouns                   NUMBER(10),
    benefit                 NUMBER(10),
    cost                    NUMBER(10),
    total_pay               NUMBER(12),
    deduction_cost          NUMBER(10),
    takehome_pay            NUMBER(10),
    CONSTRAINT salary_register_id_fk FOREIGN KEY(salary_register_id, account_id)
                            REFERENCES salary_register(salary_register_id, account_id),
    CONSTRAINT employee_id FOREIGN KEY(employee_id)
                            REFERENCES employee(employee_id),
    CONSTRAINT salary PRIMARY KEY(salary_register_id, account_id, employee_id)
);

CREATE TABLE order_state(
    order_id            CHAR(12)     PRIMARY KEY,
    order_state         NUMBER(5)	DEFAULT	0
);
--------------------------------------------------------------------------------
-- 계정 TABLE 생성 (account)
--------------------------------------------------------------------------------
CREATE TABLE account (
    account_id            CHAR(12)     PRIMARY KEY,
    account_balance       NUMBER(18)   DEFAULT 0,
    account_name          VARCHAR2(40) NOT NULL,
);

--------------------------------------------------------------------------------
-- 계좌 TABLE 생성 (bank_account)
--------------------------------------------------------------------------------
CREATE TABLE bank_account (
    bank_account_id       CHAR(12)     PRIMARY KEY, -- 계좌코드(계정코드)
    bank_account_name     VARCHAR2(255)     NOT NULL,-- 계좌명
    bank_account_number   VARCHAR2(20) NOT NULL,--계좌번호
    bank_account_balance  NUMBER(18)   DEFAULT 0,--잔액
    bank_account_type     VARCHAR2(12)  NOT NULL,--계좌타입
    bank_name             VARCHAR2(255)  NOT NULL,--은행명 
    use_state             CHAR(1)      DEFAULT 'Y'--사용상태
                          CHECK (use_state = 'Y' OR use_state ='N'),
    reg_date              DATE         DEFAULT SYSDATE,--등록일자
    CONSTRAINT FK_bank_account_id FOREIGN KEY(bank_account_id)   
                                  REFERENCES account(account_id)   
);

--------------------------------------------------------------------------------
-- 전표 TABLE 생성 (statement)
--------------------------------------------------------------------------------
CREATE TABLE statement (
    statement_id          CHAR(12)     	PRIMARY KEY, --전표번호
    reg_date              DATE         	DEFAULT SYSDATE, --등록일자
    account_value         NUMBER(18)   	NOT NULL, --계정금액
    approval_state        NUMBER(5)    	DEFAULT 0, --주문상태
    statement_type        NUMBER(5) 	NOT NULL
);

--------MyRP 물류관리 Table 생성 SQL--------
--DROP TABLE warehouse_information;
--DROP TABLE stock_information;
--DROP TABLE stock_order;
--DROP TABLE movement_warehouse;
--DROP TABLE defective_warehouse;
--DROP TABLE adjustment_inventory;
--DROP TABLE storage_out_order;
--DROP TABLE storage_in_order;

CREATE TABLE warehouse_information (
warehouse_id        NUMBER(4)	PRIMARY KEY,
warehouse_name      VARCHAR(255)	NOT NULL,
warehouse_location  VARCHAR(255)	NOT NULL
);

CREATE TABLE stock_information (
product_id      CHAR(10),
warehouse_id   NUMBER(4),	
stock_amount    NUMBER(4) NOT NULL,
CONSTRAINT stock_information_PK PRIMARY KEY(product_id, warehouse_id),
CONSTRAINT stock_information_FK FOREIGN KEY(product_id) REFERENCES product(product_id),
CONSTRAINT stock_information_FK1 FOREIGN KEY(warehouse_id) REFERENCES warehouse_information(warehouse_id)
);

CREATE TABLE stock_order (
stock_order_id    CHAR(12),
stock_order_type  CHAR(12),
product_id        CHAR(10)  NOT NULL,
warehouse_id     NUMBER(4)	NOT NULL,	
employee_id       NUMBER(4),
reg_date          DATE DEFAULT SYSDATE,
update_date       DATE DEFAULT SYSDATE,
stock_state       NUMBER(5)	DEFAULT	0,
CONSTRAINT stock_order_PK PRIMARY KEY(stock_order_id),
CONSTRAINT stock_order_FK1 FOREIGN KEY(employee_id) REFERENCES employee(employee_id),
CONSTRAINT stock_order_FK3 FOREIGN KEY(product_id, warehouse_id) REFERENCES stock_information(product_id, warehouse_id)
);

CREATE TABLE movement_warehouse (
  stock_order_id    CHAR(12),
  arrive_warehouse 	NUMBER(4)	NOT NULL,
  movement_amount 	NUMBER(4)	NOT NULL,
  movement_state    CHAR(1)   DEFAULT 0,
  CONSTRAINT movement_warehouse_PK PRIMARY KEY(stock_order_id),
  CONSTRAINT movement_warehouse_FK FOREIGN KEY(arrive_warehouse) REFERENCES warehouse_information(warehouse_id),
  CONSTRAINT movement_warehouse_FK1 FOREIGN KEY(stock_order_id) REFERENCES stock_order(stock_order_id)
);

CREATE TABLE defective_warehouse (
stock_order_id    CHAR(12),
management_plan   CHAR(1)   DEFAULT 0,	
defective_type    CHAR(1)   DEFAULT 0,
CONSTRAINT defective_warehouse_PK PRIMARY KEY(stock_order_id),
CONSTRAINT defective_warehouse_FK FOREIGN KEY(stock_order_id) REFERENCES stock_order(stock_order_id)
);

CREATE TABLE adjustment_inventory (
stock_order_id    CHAR(12),
search_date       DATE      DEFAULT SYSDATE,	
taked_stock       NUMBER(4)	NOT NULL,
delete_stock      NUMBER(4) NOT NULL,
CONSTRAINT adjustment_inventory_PK PRIMARY KEY(stock_order_id),
CONSTRAINT adjustment_inventory_FK FOREIGN KEY(stock_order_id) REFERENCES stock_order(stock_order_id)
);



CREATE TABLE storage_out_order (
stock_order_id    CHAR(12) ,	
count_sales       NUMBER(4)	NOT NULL,
available_stock   NUMBER(4) DEFAULT 0,
lack_stock        NUMBER(4) DEFAULT 0,		
storage_out_date  DATE      DEFAULT SYSDATE,		
CONSTRAINT storage_out_order_PK PRIMARY KEY(stock_order_id),
CONSTRAINT storage_out_order_FK FOREIGN KEY(stock_order_id) REFERENCES stock_order(stock_order_id)
);

CREATE TABLE storage_in_order (
stock_order_id    CHAR(12) ,	
count_purchase    NUMBER(4)	NOT NULL,
storage_in_date   DATE DEFAULT SYSDATE,		
CONSTRAINT storage_in_order_PK PRIMARY KEY(stock_order_id),
CONSTRAINT storage_in_order_FK FOREIGN KEY(stock_order_id) REFERENCES stock_order(stock_order_id)
);






--------------------------------------------------------------------------------
-- table SALES_ORDER
--------------------------------------------------------------------------------

--DROP TABLE sales_order;
CREATE TABLE sales_order
(
  sales_id          CHAR(12)    NOT NULL, /* 주문번호 */
  account_id        CHAR(12)    NOT NULL, /* 계정코드 */
  order_id          CHAR(12),   /* 주문번호 */
  product_id        CHAR(10),   /* 제품번호 */
  company_id        CHAR(10),   /* 회사번호 */
  employee_id       NUMBER(4),  /* 사원번호 */
  reg_date          DATE DEFAULT SYSDATE, /* 등록일자 */
  update_date       DATE DEFAULT SYSDATE, /* 최종수정일자*/
  storage_out_date  DATE DEFAULT SYSDATE, /* 출고일 */
  count_sales       NUMBER(4)    NOT NULL, /* 판매개수 */
  selling_price     NUMBER(10)   NOT NULL, /* 판매가 */
  sales_state       NUMBER(5)    DEFAULT 0, /* 주문상태 */
  condition_note_receivable      NUMBER(2) DEFAULT 3,  /* 수금조건 */
  
  CONSTRAINT sales_order_pk     PRIMARY KEY(sales_id, account_id),
  CONSTRAINT sales_order_fk1    FOREIGN KEY(account_id)   REFERENCES account(account_id),
  CONSTRAINT sales_order_fk3    FOREIGN KEY(product_id)   REFERENCES product(product_id),
  CONSTRAINT sales_order_fk4    FOREIGN KEY(company_id)   REFERENCES company(company_id),
  CONSTRAINT sales_order_fk5    FOREIGN KEY(employee_id)  REFERENCES employee(employee_id)
);
--------------------------------------------------------------------------------
-- table PURCHASE_ORDER
--------------------------------------------------------------------------------

-DROP TABLE purchase_order;
CREATE TABLE purchase_order (
	purchase_id       CHAR(12)       NOT NULL,  /* 주문번호 */
	account_id        CHAR(12)       NOT NULL,  /* 계정코드 */
	order_id          CHAR(12),                 /* 주문번호 */
	product_id        CHAR(10),                 /* 상품번호 */
	company_id        CHAR(10),                 /* 회사번호 */
	employee_id       NUMBER(4),                /* 사원번호 */
	reg_date          DATE DEFAULT    SYSDATE,  /* 등록일자 */
	update_date       DATE DEFAULT    SYSDATE,  /* 최종수정일자 */
	storage_in_date   DATE DEFAULT    SYSDATE,  /* 입고일 */
	count_purchase    NUMBER(4),                /* 구매개수 */
	supply_price      NUMBER(10)      NOT NULL, /* 공급가 */
	purchase_state    NUMBER(5)       DEFAULT 0, /* 판매상태 */
  condition_note_payable NUMBER(2)  DEFAULT 3, /* 지급조건 */
  
  CONSTRAINT purchase_order_pk    PRIMARY KEY(purchase_id, account_id),
  CONSTRAINT purchase_order_fk1   FOREIGN KEY(account_id)   REFERENCES account(account_id),
  CONSTRAINT purchase_order_fk3   FOREIGN KEY(product_id)   REFERENCES product(product_id),
  CONSTRAINT purchase_order_fk4   FOREIGN KEY(company_id)   REFERENCES company(company_id),
  CONSTRAINT purchase_order_fk5   FOREIGN KEY(employee_id)  REFERENCES employee(employee_id)
);


CREATE TABLE tax_statement (
    statement_id    CHAR(12)    PRIMARY KEY,
    account_id      CHAR(12),
    CONSTRAINT tax_statement_fk1 FOREIGN KEY(statement_id) REFERENCES statement(statement_id),
    CONSTRAINT tax_statement_fk2 FOREIGN KEY(account_id) REFERENCES account(account_id)
);

CREATE TABLE sales_statement (
    statement_id    CHAR(12)    PRIMARY KEY,
    sales_id        CHAR(12),
    account_id      CHAR(12),
    CONSTRAINT sales_statement_fk1 FOREIGN KEY(statement_id) REFERENCES statement(statement_id),
    CONSTRAINT sales_statement_fk2 FOREIGN KEY(sales_id,account_id) REFERENCES sales_order(sales_id,account_id)
);

CREATE TABLE purchase_statement (
    statement_id    CHAR(12)    PRIMARY KEY,
    purchase_id     CHAR(12),
    account_id      CHAR(12),
    CONSTRAINT purchase_statement_fk1 FOREIGN KEY(statement_id) REFERENCES statement(statement_id),
    CONSTRAINT purchase_statement_fk2 FOREIGN KEY(purchase_id,account_id) REFERENCES purchase_order(purchase_id,account_id)
);

CREATE TABLE salary_register_statement (
    statement_id    CHAR(12)    PRIMARY KEY,
    salary_register_id  CHAR(12),
    account_id      CHAR(12),
    CONSTRAINT salary_register_statement_fk1 FOREIGN KEY(statement_id) REFERENCES statement(statement_id),
    CONSTRAINT salary_register_statement_fk2 FOREIGN KEY(salary_register_id,account_id) REFERENCES salary_register(salary_register_id,account_id)
);
--------------------------------------------------------------------------------
-- 사원 목록 조회(employeeVO)
--------------------------------------------------------------------------------
SELECT  *
FROM    (SELECT employee_id, dept_id, hr_code_group_rank,
        rank_code, employee_name, residence_reg_no, join_date,
        rownum rNum
        FROM    (SELECT	*
                FROM	(SELECT *
                        FROM    employee
                        WHERE	employee_id like '%'||NVL(null,employee_id)||'%'
                        UNION
                        SELECT	*
                        FROM	employee
                        WHERE	employee_name like '%'||NVL(null,employee_name)||'%'
                        )
                ORDER BY employee_name
                )
        )
WHERE rNum >= 1 AND rNum <= 5;
--------------------------------------------------------------------------------
-- 인사카드 목록 조회(personnel_card_listDTO)
--------------------------------------------------------------------------------
SELECT	*
FROM	(SELECT employee_id, dept_id, dept_name,
        hr_code_group_rank, hr_code_group_name,
        rank_code, hr_code_name,
        employee_name, residence_reg_no, join_date,
        rownum rNum
        FROM    (SELECT *
                FROM    (SELECT E.employee_id, E.dept_id, D.dept_name,
                                E.hr_code_group_rank, G.hr_code_group_name,
                                E.rank_code, C.hr_code_name,
                                E.employee_name, E.residence_reg_no,
                                E.join_date
                        FROM    employee E, department D, hr_code C, hr_code_group G
                        WHERE	E.dept_id = D.dept_id
                        AND		E.hr_code_group_rank = G.hr_code_group_id
                        AND		E.rank_code = C.hr_code_id
                        AND     E.employee_id like '%'||NVL(null,employee_id)||'%'
                        UNION
                        SELECT E.employee_id, E.dept_id, D.dept_name,
                                E.hr_code_group_rank, G.hr_code_group_name,
                                E.rank_code, C.hr_code_name,
                                E.employee_name, E.residence_reg_no,
                                E.join_date
                        FROM    employee E, department D, hr_code C, hr_code_group G
                        WHERE	E.dept_id = D.dept_id
                        AND		E.hr_code_group_rank = G.hr_code_group_id
                        AND		E.rank_code = C.hr_code_id
                        AND     E.employee_name like '%'||NVL(null,employee_name)||'%'
                        )
                ORDER BY employee_name
                )
        )
WHERE rNum >= 1 AND rNum <= 5;




--------------------------------------------------------------------------------
-- 더미 데이터 (2017-07-17)
--------------------------------------------------------------------------------
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1100000001','회사이름 01','0010100001','이름01','0001010000011','사업자 주소입니다. 01','업테 01','종목 01','Y','S',to_date('07/13/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1100000002','회사이름 02','0020200002','이름02','0002020000022','사업자 주소입니다. 02','업테 02','종목 02','N','C',to_date('07/12/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1100000003','회사이름 03','0030300003','이름03','0003030000033','사업자 주소입니다. 03','업테 03','종목 03','N','S',to_date('07/11/2017', 'mm-dd-yyyy'));
commit;

Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1200000001','상품이름 01',5555555,11111110,'Y',to_date('17/07/13','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1200000002','상품이름 02',5554555,11109110,'N',to_date('17/07/12','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1200000003','상품이름 03',5553555,11107110,'Y',to_date('17/07/11','RR/MM/DD'));
commit;

INSERT INTO WAREHOUSE_INFORMATION(WAREHOUSE_ID,WAREHOUSE_NAME,WAREHOUSE_LOCATION) VALUES(1001,'양품창고','경기도 화성시 팔탄면');
INSERT INTO WAREHOUSE_INFORMATION(WAREHOUSE_ID,WAREHOUSE_NAME,WAREHOUSE_LOCATION) VALUES(2001,'불량품창고','경기도 화성시 팔탄면');
INSERT INTO WAREHOUSE_INFORMATION(WAREHOUSE_ID,WAREHOUSE_NAME,WAREHOUSE_LOCATION) VALUES(3001,'출고대기창고','경기도 화성시 팔탄면');
commit;

INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000001,1001,100);
INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000001,2001,10);
INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000002,1001,100);
INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000002,2001,10);
INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000003,1001,100);
INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000003,2001,10);
commit;

Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017071301',22111);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017071202',22112);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017071103',22113);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017071004',22114);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017070905',22115);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017070806',22116);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017070707',22117);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017070608',22118);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017070509',22119);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017070410',22120);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017070311',22121);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017070212',22122);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017070113',22123);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017063014',22124);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017062915',22125);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017062816',22126);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017062717',22127);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017062618',22128);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017062519',22129);
Insert into ORDER_STATE (ORDER_ID,ORDER_STATE) values ('200017062420',22130);
COMMIT;

INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011010000', '0', '현금');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011020000', '0', '매출채권');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011030000', '0', '부가세대급금');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011040000', '0', '재고자산');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011050000', '0', '상품매입');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011060000', '0', '상품매출');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500012010000', '0', '매입채무');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500012020000', '0', '부가세예수금');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500013010000', '0', '이익잉여금');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500014010000', '0', '급여');
commit;

INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(2,'직급','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(3,'휴가','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(4,'급여','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(5,'수당','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(6,'경비','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(7,'공제','Y');
COMMIT;

INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(2,100,'사원','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(2,200,'대리','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(2,300,'과장','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(2,400,'차장','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(2,500,'부장','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(2,600,'이사','Y');
COMMIT;

INSERT INTO department(dept_id,dept_name,access_role,use_state) VALUES(2000,'영업','SA','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state) VALUES(3000,'구매','PU','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state) VALUES(4000,'물류','DT','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state) VALUES(5000,'회계','FI','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state) VALUES(6000,'인사','HR','Y');
COMMIT;

INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,employee_name,residence_reg_no,join_date) VALUES(6001,6000,2,100,'이인홍','7812161111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,employee_name,residence_reg_no,join_date) VALUES(4001,4000,2,200,'최연호','8510121111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,employee_name,residence_reg_no,join_date) VALUES(2001,2000,2,300,'장은철','8707101111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,employee_name,residence_reg_no,join_date) VALUES(3001,3000,2,400,'장재희','8705231111111',SYSDATE);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,employee_name,residence_reg_no,join_date) VALUES(5001,5000,2,500,'이주원','9501302111111',SYSDATE);
COMMIT;
--------------------------------------------------------------------------------
-- 상품 판매 절차 시뮬레이션 (모듈연결 위주로)
--------------------------------------------------------------------------------
-- 판매전표승인요청 [영업주문생성]
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017071301','500011020000','300017071801','1200000001','1100000001',2001,to_date('07/14/2017', 'mm-dd-yyyy'),to_date('07/14/2017', 'mm-dd-yyyy'),to_date('07/14/2017', 'mm-dd-yyyy'),1,1100,22213,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017071301','500012020000','300017071801','1200000001','1100000001',2001,to_date('07/13/2017', 'mm-dd-yyyy'),to_date('07/13/2017', 'mm-dd-yyyy'),to_date('07/13/2017', 'mm-dd-yyyy'),1,100,22213,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017071301','500011060000','300017071801','1200000001','1100000001',2001,to_date('07/12/2017', 'mm-dd-yyyy'),to_date('07/12/2017', 'mm-dd-yyyy'),to_date('07/12/2017', 'mm-dd-yyyy'),1,1000,22213,3.0);
COMMIT;
-- 회계전표 생성[매출채권 계정, 부가세 예수금 계정, 상품매출 계정]
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071801,SYSDATE,1100,25451,54101);
INSERT INTO SALES_STATEMENT(STATEMENT_ID,SALES_ID,ACCOUNT_ID) VALUES(547017071801,211017071301,500011020000);
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071802,SYSDATE,100,25451,54101);
INSERT INTO SALES_STATEMENT(STATEMENT_ID,SALES_ID,ACCOUNT_ID) VALUES(547017071802,211017071301,500012020000);
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071803,SYSDATE,1000,25451,54101);
INSERT INTO SALES_STATEMENT(STATEMENT_ID,SALES_ID,ACCOUNT_ID) VALUES(547017071803,211017071301,500011060000);
COMMIT;
-- 회계팀 전표승인
UPDATE STATEMENT SET APPROVAL_STATE = 25452 WHERE STATEMENT_ID = 547017071801;
UPDATE STATEMENT SET APPROVAL_STATE = 25452 WHERE STATEMENT_ID = 547017071802;
UPDATE STATEMENT SET APPROVAL_STATE = 25452 WHERE STATEMENT_ID = 547017071803;
COMMIT;
-- 판매전표승인완료 [상품매출 연결된 오더는 출고요청으로 변경]
UPDATE SALES_ORDER SET SALES_STATE = 22214 WHERE SALES_ID = 211017071301 AND ACCOUNT_ID = 500011020000;
UPDATE SALES_ORDER SET SALES_STATE = 22214 WHERE SALES_ID = 211017071301 AND ACCOUNT_ID = 500012020000;
UPDATE SALES_ORDER SET SALES_STATE = 22222 WHERE SALES_ID = 211017071301 AND ACCOUNT_ID = 500011060000;
COMMIT;
-- 물류 출고요청 전표 생성
INSERT INTO STOCK_ORDER(STOCK_ORDER_ID,STOCK_ORDER_TYPE,PRODUCT_ID,WAREHOUSE_ID,EMPLOYEE_ID,REG_DATE,UPDATE_DATE,STOCK_STATE) VALUES(475017071801,211017071301,1200000001,1001,4001,SYSDATE,SYSDATE,24201);
INSERT INTO STORAGE_OUT_ORDER(STOCK_ORDER_ID,COUNT_SALES,AVAILABLE_STOCK,LACK_STOCK,STORAGE_OUT_DATE) VALUES(475017071801,1,100,0,to_date('07/12/2017', 'mm-dd-yyyy'));
COMMIT;
--출고대기창고에 요청수량 입고 처리
UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = STOCK_AMOUNT - 1 WHERE PRODUCT_ID = 1200000001 AND WAREHOUSE_ID = 1001;
INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000001,3001,1);
COMMIT;
--출고대기 [출고대기창고에 요청수량 모두 입고된 경우]
UPDATE STOCK_ORDER SET STOCK_STATE = 24202 WHERE STOCK_ORDER_ID = 475017071801;
COMMIT;
--출고완료 [출고대기창고에서 요청수량을 출고처리한 경우]
UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = STOCK_AMOUNT - 1 WHERE PRODUCT_ID = 1200000001 AND WAREHOUSE_ID = 3001;
UPDATE STOCK_ORDER SET STOCK_STATE = 24752 WHERE STOCK_ORDER_ID = 475017071801;
COMMIT;
--영업출고완료 [출고 완료된 상태를 영업주문 전표에 업데이트]
UPDATE SALES_ORDER SET SALES_STATE = 22223 WHERE SALES_ID = 211017071301 AND ACCOUNT_ID = 500011060000;
COMMIT;
--수금대기 [수금일로 부터 지정한 기간만큼 남은 시점에 상태 변경]
UPDATE SALES_ORDER SET SALES_STATE = 22411 WHERE SALES_ID = 211017071301 AND ACCOUNT_ID = 500011020000;
COMMIT;
--수금완료 [수금처리를 완료하여 매출채권 계정을 감하고 현금 계정을 가합니다. 회계전표처리:매출채권-,현금+]
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017071301','500011010000','300017071801','1200000001','1100000001',2001,to_date('07/14/2017', 'mm-dd-yyyy'),to_date('07/14/2017', 'mm-dd-yyyy'),to_date('07/14/2017', 'mm-dd-yyyy'),1,1100,22412,3.0);
UPDATE SALES_ORDER SET SALES_STATE = 22412 WHERE SALES_ID = 211017071301 AND ACCOUNT_ID = 500011020000;
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071804,SYSDATE,-1100,25451,54104);
INSERT INTO SALES_STATEMENT(STATEMENT_ID,SALES_ID,ACCOUNT_ID) VALUES(547017071804,211017071301,500011020000);
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071805,SYSDATE,1100,25451,54104);
INSERT INTO SALES_STATEMENT(STATEMENT_ID,SALES_ID,ACCOUNT_ID) VALUES(547017071805,211017071301,500011010000);
COMMIT;

--------------------------------------------------------------------------------
-- 상품 구매 절차 시뮬레이션 (모듈연결 위주로)
--------------------------------------------------------------------------------
-- 판매전표승인요청 [영업주문생성]
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017071302','500011020000','300017071801','1200000002','1100000002',2001,to_date('07/14/2017', 'mm-dd-yyyy'),to_date('07/14/2017', 'mm-dd-yyyy'),to_date('07/14/2017', 'mm-dd-yyyy'),200,22000,22213,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017071302','500012020000','300017071801','1200000002','1100000002',2001,to_date('07/13/2017', 'mm-dd-yyyy'),to_date('07/13/2017', 'mm-dd-yyyy'),to_date('07/13/2017', 'mm-dd-yyyy'),200,2000,22213,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017071302','500011060000','300017071801','1200000002','1100000002',2001,to_date('07/12/2017', 'mm-dd-yyyy'),to_date('07/12/2017', 'mm-dd-yyyy'),to_date('07/12/2017', 'mm-dd-yyyy'),200,20000,22213,3.0);
COMMIT;
-- 회계전표 생성[매출채권 계정, 부가세 예수금 계정, 상품매출 계정]
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071806,SYSDATE,22000,25451,54101);
INSERT INTO SALES_STATEMENT(STATEMENT_ID,SALES_ID,ACCOUNT_ID) VALUES(547017071806,211017071302,500011020000);
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071807,SYSDATE,2000,25451,54101);
INSERT INTO SALES_STATEMENT(STATEMENT_ID,SALES_ID,ACCOUNT_ID) VALUES(547017071807,211017071302,500012020000);
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071808,SYSDATE,20000,25451,54101);
INSERT INTO SALES_STATEMENT(STATEMENT_ID,SALES_ID,ACCOUNT_ID) VALUES(547017071808,211017071302,500011060000);
COMMIT;
-- 회계팀 전표승인
UPDATE STATEMENT SET APPROVAL_STATE = 25452 WHERE STATEMENT_ID = 547017071806;
UPDATE STATEMENT SET APPROVAL_STATE = 25452 WHERE STATEMENT_ID = 547017071807;
UPDATE STATEMENT SET APPROVAL_STATE = 25452 WHERE STATEMENT_ID = 547017071808;
COMMIT;
-- 판매전표승인완료 [상품매출 연결된 오더는 출고요청으로 변경]
UPDATE SALES_ORDER SET SALES_STATE = 22214 WHERE SALES_ID = 211017071302 AND ACCOUNT_ID = 500011020000;
UPDATE SALES_ORDER SET SALES_STATE = 22214 WHERE SALES_ID = 211017071302 AND ACCOUNT_ID = 500012020000;
UPDATE SALES_ORDER SET SALES_STATE = 22222 WHERE SALES_ID = 211017071302 AND ACCOUNT_ID = 500011060000;
COMMIT;
-- 물류 출고요청 전표 생성
INSERT INTO STOCK_ORDER(STOCK_ORDER_ID,STOCK_ORDER_TYPE,PRODUCT_ID,WAREHOUSE_ID,EMPLOYEE_ID,REG_DATE,UPDATE_DATE,STOCK_STATE) VALUES(475017071802,211017071301,1200000002,1001,4001,SYSDATE,SYSDATE,24201);
INSERT INTO STORAGE_OUT_ORDER(STOCK_ORDER_ID,COUNT_SALES,AVAILABLE_STOCK,LACK_STOCK,STORAGE_OUT_DATE) VALUES(475017071802,200,100,100,to_date('07/12/2017', 'mm-dd-yyyy'));
-- 구매요청 [재고 부족 확인시 LACK_STOCK > 0]
UPDATE STOCK_ORDER SET STOCK_STATE = 24753 WHERE STOCK_ORDER_ID = 475017071802;
COMMIT;
--출고대기창고에 요청수량 입고 처리
UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = STOCK_AMOUNT - 100 WHERE PRODUCT_ID = 1200000002 AND WAREHOUSE_ID = 1001;
INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000002,3001,100);
COMMIT;
--재고준비중 [출고대기창고에 요청수량 중 일부만 입고된 경우]
UPDATE STOCK_ORDER SET STOCK_STATE = 24203 WHERE STOCK_ORDER_ID = 475017071802;
COMMIT;
-- 구매전표승인요청 [구매주문생성]
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('311017071301','500012010000','200017071301','1200000002','1100000002',3001,SYSDATE,SYSDATE,SYSDATE,100,11000,23202,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('311017071301','500011030000','200017071202','1200000002','1100000002',3001,SYSDATE,SYSDATE,SYSDATE,100,1000,23202,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('311017071301','500011050000','200017071103','1200000002','1100000002',3001,SYSDATE,SYSDATE,SYSDATE,100,10000,23202,3.0);
commit;
-- 회계전표 생성[매입채무 계정, 부가세 대급금 계정, 상품매입 계정]
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071809,SYSDATE,11000,25451,54102);
INSERT INTO PURCHASE_STATEMENT(STATEMENT_ID,PURCHASE_ID,ACCOUNT_ID) VALUES(547017071809,311017071301,500012010000);
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071810,SYSDATE,1000,25451,54102);
INSERT INTO PURCHASE_STATEMENT(STATEMENT_ID,PURCHASE_ID,ACCOUNT_ID) VALUES(547017071810,311017071301,500011030000);
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071811,SYSDATE,10000,25451,54102);
INSERT INTO PURCHASE_STATEMENT(STATEMENT_ID,PURCHASE_ID,ACCOUNT_ID) VALUES(547017071811,311017071301,500011050000);
COMMIT;
-- 회계팀 전표승인
UPDATE STATEMENT SET APPROVAL_STATE = 25452 WHERE STATEMENT_ID = 547017071809;
UPDATE STATEMENT SET APPROVAL_STATE = 25452 WHERE STATEMENT_ID = 547017071810;
UPDATE STATEMENT SET APPROVAL_STATE = 25452 WHERE STATEMENT_ID = 547017071811;
COMMIT;
-- 구매전표승인완료 [상품매입 연결된 오더는 입고요청으로 변경]
UPDATE PURCHASE_ORDER SET PURCHASE_STATE = 23203 WHERE PURCHASE_ID = 311017071301 AND ACCOUNT_ID = 500012010000;
UPDATE PURCHASE_ORDER SET PURCHASE_STATE = 23203 WHERE PURCHASE_ID = 311017071301 AND ACCOUNT_ID = 500011030000;
UPDATE PURCHASE_ORDER SET PURCHASE_STATE = 23204 WHERE PURCHASE_ID = 311017071301 AND ACCOUNT_ID = 500011050000;
COMMIT;
-- 물류 입고요청 전표 생성
INSERT INTO STOCK_ORDER(STOCK_ORDER_ID,STOCK_ORDER_TYPE,PRODUCT_ID,WAREHOUSE_ID,EMPLOYEE_ID,REG_DATE,UPDATE_DATE,STOCK_STATE) VALUES(475017071803,311017071301,1200000002,1001,4001,SYSDATE,SYSDATE,24101);
INSERT INTO STORAGE_IN_ORDER(STOCK_ORDER_ID,COUNT_PURCHASE,STORAGE_IN_DATE) VALUES(475017071803,100,SYSDATE);
COMMIT;
-- 입고완료 처리
UPDATE STOCK_ORDER SET STOCK_STATE = 24102 WHERE STOCK_ORDER_ID = 475017071803;
UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = STOCK_AMOUNT + 100 WHERE PRODUCT_ID = 1200000002 AND WAREHOUSE_ID = 1001;
--구매입고완료 [입고 완료된 상태를 구매주문 전표에 업데이트]
UPDATE PURCHASE_ORDER SET PURCHASE_STATE = 23205 WHERE PURCHASE_ID = 311017071301 AND ACCOUNT_ID = 500011050000;
COMMIT;
-- 지급대기
UPDATE PURCHASE_ORDER SET PURCHASE_STATE = 23206 WHRER PURCHASE_ID = 311017071301 AND ACCOUNT_ID = 500012010000;
-- 지급완료
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('311017071301','500011010000','200017071301','1200000002','1100000002',3001,SYSDATE,SYSDATE,SYSDATE,100,11000,23207,3.0);
UPDATE PURCHASE_ORDER SET PURCHASE_STATE = 23207 WHRER PURCHASE_ID = 311017071301 AND ACCOUNT_ID = 500012010000;
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071812,SYSDATE,-11000,25451,54105);
INSERT INTO PURCHASE_STATEMENT(STATEMENT_ID,PURCHASE_ID,ACCOUNT_ID) VALUES(547017071812,311017071301,500012010000);
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071813,SYSDATE,-11000,25451,54105);
INSERT INTO PURCHASE_STATEMENT(STATEMENT_ID,PURCHASE_ID,ACCOUNT_ID) VALUES(547017071813,311017071301,500011010000);
COMMIT;
-- 출고대기 
UPDATE STOCK_ORDER SET STOCK_STATE = 24202 WHERE STOCK_ORDER_ID = 475017071803;
UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = STOCK_AMOUNT - 100 WHERE PRODUCT_ID = 1200000002 AND WAREHOUSE_ID = 1001;
UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = STOCK_AMOUNT + 100 WHERE PRODUCT_ID = 1200000002 AND WAREHOUSE_ID = 3001;
-- 출고완료 처리
UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = STOCK_AMOUNT - 200 WHERE PRODUCT_ID = 1200000002 AND WAREHOUSE_ID = 3001;
UPDATE STOCK_ORDER SET STOCK_STATE = 24752 WHERE STOCK_ORDER_ID = 475017071802;
COMMIT;
--영업출고완료 [출고 완료된 상태를 영업주문 전표에 업데이트]
UPDATE SALES_ORDER SET SALES_STATE = 22223 WHERE SALES_ID = 211017071302 AND ACCOUNT_ID = 500011060000;
COMMIT;
--수금대기 [수금일로 부터 지정한 기간만큼 남은 시점에 상태 변경]
UPDATE SALES_ORDER SET SALES_STATE = 22411 WHERE SALES_ID = 211017071302 AND ACCOUNT_ID = 500011020000;
COMMIT;
--수금완료 [수금처리를 완료하여 매출채권 계정을 감하고 현금 계정을 가합니다. 회계전표처리:매출채권-,현금+]
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017071302','500011010000','300017071801','1200000002','1100000002',2001,SYSDATE,SYSDATE,SYSDATE,200,22000,22412,3.0);
UPDATE SALES_ORDER SET SALES_STATE = 22412 WHERE SALES_ID = 211017071302 AND ACCOUNT_ID = 500011020000;
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071814,SYSDATE,-22000,25451,54104);
INSERT INTO SALES_STATEMENT(STATEMENT_ID,SALES_ID,ACCOUNT_ID) VALUES(547017071814,211017071302,500011020000);
INSERT INTO STATEMENT(STATEMENT_ID,REG_DATE,ACCOUNT_VALUE,APPROVAL_STATE,STATEMENT_TYPE) VALUES(547017071815,SYSDATE,22000,25451,54104);
INSERT INTO SALES_STATEMENT(STATEMENT_ID,SALES_ID,ACCOUNT_ID) VALUES(547017071815,211017071302,500011010000);
COMMIT;
--------------------------------------------------------------------------------
-- 사용안함
--------------------------------------------------------------------------------


Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017071301','500014010000',to_date('17/07/14','RR/MM/DD'),'급여대장명 01',to_date('17/08/13','RR/MM/DD'),5000000,1793,26451);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017071202','500014010000',to_date('17/07/13','RR/MM/DD'),'급여대장명 02',to_date('17/08/12','RR/MM/DD'),-5000000,5303,26452);
COMMIT;
--------------------------------------------------------------------------------
-- 테이블 변경사항 2017-07-17 (상기 테이블들은 변경사항 적용상태로 수정됨)
--------------------------------------------------------------------------------
ALTER TABLE account DROP COLUMN order_id;
ALTER TABLE warehouse_information MODIFY warehouse_name VARCHAR(255);
ALTER TABLE stock_order DROP CONSTRAINT stock_order_FK1;
ALTER TABLE stock_order ADD CONSTRAINT stock_order_FK1 FOREIGN KEY(stock_order_type) REFERENCES order_state(order_id);
ALTER TABLE bank_account MODIFY bank_account_name VARCHAR2(255);
ALTER TABLE bank_account MODIFY bank_name VARCHAR2(255);
ALTER TABLE statement ADD statement_type NUMBER(5) NOT NULL;
ALTER TABLE adjustment_inventory ADD delete_stock NUMBER(4) NOT NULL;
ALTER TABLE stock_order DROP CONSTRAINT stock_order_fk2;

ALTER TABLE statement DROP CONSTRAINT statement_FK1;
ALTER TABLE statement DROP CONSTRAINT statement_FK2;
ALTER TABLE statement DROP CONSTRAINT statement_FK3;
ALTER TABLE statement DROP COLUMN connected_id;
ALTER TABLE statement DROP COLUMN account_id;

CREATE TABLE tax_statement (
    statement_id    CHAR(12)    PRIMARY KEY,
    account_id      CHAR(12),
    CONSTRAINT tax_statement_fk1 FOREIGN KEY(statement_id) REFERENCES statement(statement_id),
    CONSTRAINT tax_statement_fk2 FOREIGN KEY(account_id) REFERENCES account(account_id)
);

CREATE TABLE sales_statement (
    statement_id    CHAR(12)    PRIMARY KEY,
    sales_id        CHAR(12),
    account_id      CHAR(12),
    CONSTRAINT sales_statement_fk1 FOREIGN KEY(statement_id) REFERENCES statement(statement_id),
    CONSTRAINT sales_statement_fk2 FOREIGN KEY(sales_id,account_id) REFERENCES sales_order(sales_id,account_id)
);

CREATE TABLE purchase_statement (
    statement_id    CHAR(12)    PRIMARY KEY,
    purchase_id     CHAR(12),
    account_id      CHAR(12),
    CONSTRAINT purchase_statement_fk1 FOREIGN KEY(statement_id) REFERENCES statement(statement_id),
    CONSTRAINT purchase_statement_fk2 FOREIGN KEY(purchase_id,account_id) REFERENCES purchase_order(purchase_id,account_id)
);

CREATE TABLE salary_register_statement (
    statement_id    CHAR(12)    PRIMARY KEY,
    salary_register_id  CHAR(12),
    account_id      CHAR(12),
    CONSTRAINT salary_register_statement_fk1 FOREIGN KEY(statement_id) REFERENCES statement(statement_id),
    CONSTRAINT salary_register_statement_fk2 FOREIGN KEY(salary_register_id,account_id) REFERENCES salary_register(salary_register_id,account_id)
);

CREATE SEQUENCE purchase_seq
START WITH 1 INCREMENT BY 1 MAXVALUE 99999;
--------------------------------------------------------------------------------
-- 테이블 변경사항 2017-07-18 (상기 테이블들은 변경사항 적용상태로 수정됨)
--------------------------------------------------------------------------------
ALTER TABLE sales_order DROP CONSTRAINT SALES_ORDER_FK2;
ALTER TABLE purchase_order DROP CONSTRAINT PURCHASE_ORDER_FK2;
ALTER TABLE stock_order DROP CONSTRAINT STOCK_ORDER_FK1;