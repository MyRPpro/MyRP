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
VAULES(2,'직급','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state)
VAULES(3,'휴가','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state)
VAULES(4,'급여','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state)
VAULES(5,'수당','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state)
VAULES(6,'경비','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state)
VAULES(7,'공제','Y');
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
    statement_id          CHAR(12)     PRIMARY KEY, --전표번호
    reg_date              DATE         DEFAULT SYSDATE, --등록일자
    account_value         NUMBER(18)   NOT NULL, --계정금액
    approval_state        NUMBER(5)    DEFAULT 0, --주문상태
    statement_type        NUMBER(5) NOT NULL,
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
CONSTRAINT stock_order_FK2 FOREIGN KEY(stock_order_type) REFERENCES order_state(order_id),
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
  CONSTRAINT sales_order_fk2    FOREIGN KEY(order_id)     REFERENCES order_state(order_id),
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
  CONSTRAINT purchase_order_fk2   FOREIGN KEY(order_id)     REFERENCES order_state(order_id),
  CONSTRAINT purchase_order_fk3   FOREIGN KEY(product_id)   REFERENCES product(product_id),
  CONSTRAINT purchase_order_fk4   FOREIGN KEY(company_id)   REFERENCES company(company_id),
  CONSTRAINT purchase_order_fk5   FOREIGN KEY(employee_id)  REFERENCES employee(employee_id)
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
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000001','회사이름 01','0010100001','이름01','0001010000011','사업자 주소입니다. 01','업테 01','종목 01','Y','S',to_date('07/13/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000002','회사이름 02','0020200002','이름02','0002020000022','사업자 주소입니다. 02','업테 02','종목 02','N','C',to_date('07/12/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000003','회사이름 03','0030300003','이름03','0003030000033','사업자 주소입니다. 03','업테 03','종목 03','N','S',to_date('07/11/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000004','회사이름 04','0040400004','이름04','0004040000044','사업자 주소입니다. 04','업테 04','종목 04','Y','C',to_date('07/10/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000005','회사이름 05','0050500005','이름05','0005050000055','사업자 주소입니다. 05','업테 05','종목 05','Y','S',to_date('07/09/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000006','회사이름 06','0060600006','이름06','0006060000066','사업자 주소입니다. 06','업테 06','종목 06','N','C',to_date('07/08/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000007','회사이름 07','0070700007','이름07','0007070000077','사업자 주소입니다. 07','업테 07','종목 07','N','S',to_date('07/07/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000008','회사이름 08','0080800008','이름08','0008080000088','사업자 주소입니다. 08','업테 08','종목 08','Y','C',to_date('07/06/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000009','회사이름 09','0090900009','이름09','0009090000099','사업자 주소입니다. 09','업테 09','종목 09','Y','S',to_date('07/05/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000010','회사이름 10','0101000010','이름10','00101000001010','사업자 주소입니다. 10','업테 10','종목 10','N','C',to_date('07/04/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000011','회사이름 11','0111100011','이름11','00111100001111','사업자 주소입니다. 11','업테 11','종목 11','N','S',to_date('07/03/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000012','회사이름 12','0121200012','이름12','00121200001212','사업자 주소입니다. 12','업테 12','종목 12','Y','C',to_date('07/02/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000013','회사이름 13','0131300013','이름13','00131300001313','사업자 주소입니다. 13','업테 13','종목 13','Y','S',to_date('07/01/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000014','회사이름 14','0141400014','이름14','00141400001414','사업자 주소입니다. 14','업테 14','종목 14','N','C',to_date('06/30/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000015','회사이름 15','0151500015','이름15','00151500001515','사업자 주소입니다. 15','업테 15','종목 15','N','S',to_date('06/29/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000016','회사이름 16','0161600016','이름16','00161600001616','사업자 주소입니다. 16','업테 16','종목 16','Y','C',to_date('06/28/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000017','회사이름 17','0171700017','이름17','00171700001717','사업자 주소입니다. 17','업테 17','종목 17','Y','S',to_date('06/27/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000018','회사이름 18','0181800018','이름18','00181800001818','사업자 주소입니다. 18','업테 18','종목 18','N','C',to_date('06/26/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000019','회사이름 19','0191900019','이름19','00191900001919','사업자 주소입니다. 19','업테 19','종목 19','N','S',to_date('06/25/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1000000020','회사이름 20','0202000020','이름20','00202000002020','사업자 주소입니다. 20','업테 20','종목 20','Y','C',to_date('06/24/2017', 'mm-dd-yyyy'));
commit;

Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000001','상품이름 01',5555555,11111110,'Y',to_date('17/07/13','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000002','상품이름 02',5554555,11109110,'N',to_date('17/07/12','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000003','상품이름 03',5553555,11107110,'Y',to_date('17/07/11','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000004','상품이름 04',5552555,11105110,'N',to_date('17/07/10','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000005','상품이름 05',5551555,11103110,'Y',to_date('17/07/09','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000006','상품이름 06',5550555,11101110,'N',to_date('17/07/08','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000007','상품이름 07',5549555,11099110,'Y',to_date('17/07/07','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000008','상품이름 08',5548555,11097110,'N',to_date('17/07/06','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000009','상품이름 09',5547555,11095110,'Y',to_date('17/07/05','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000010','상품이름 10',5546555,11093110,'N',to_date('17/07/04','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000011','상품이름 11',5545555,11091110,'Y',to_date('17/07/03','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000012','상품이름 12',5544555,11089110,'N',to_date('17/07/02','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000013','상품이름 13',5543555,11087110,'Y',to_date('17/07/01','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000014','상품이름 14',5542555,11085110,'N',to_date('17/06/30','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000015','상품이름 15',5541555,11083110,'Y',to_date('17/06/29','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000016','상품이름 16',5540555,11081110,'Y',to_date('17/06/28','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000017','상품이름 17',5539555,11079110,'N',to_date('17/06/27','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000018','상품이름 18',5538555,11077110,'Y',to_date('17/06/26','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000019','상품이름 19',5537555,11075110,'Y',to_date('17/06/25','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1000000020','상품이름 20',5536555,11073110,'N',to_date('17/06/24','RR/MM/DD'));
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

Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500001000000','200017071301',5000000,'판매계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500002000000','200017071202',4990000,'구매계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500003000000','200017071103',4980000,'인사계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500004000000','200017071004',4970000,'창고계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500005000000','200017070905',4960000,'판매계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500006000000','200017070806',4950000,'구매계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500007000000','200017070707',4940000,'인사계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500008000000','200017070608',4930000,'창고계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500009000000','200017070509',4920000,'판매계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500010000000','200017070410',4910000,'구매계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500011000000','200017070311',4900000,'인사계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500012000000','200017070212',4890000,'창고계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500013000000','200017070113',4880000,'판매계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500014000000','200017063014',4870000,'구매계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500015000000','200017062915',4860000,'인사계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500016000000','200017062816',4850000,'창고계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500017000000','200017062717',4840000,'판매계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500018000000','200017062618',4830000,'구매계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500019000000','200017062519',4820000,'인사계정');
Insert into ACCOUNT (ACCOUNT_ID,ORDER_ID,ACCOUNT_BALANCE,ACCOUNT_NAME) values ('500020000000','200017062420',4810000,'창고계정');
COMMIT;

Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017071301','500001000000',to_date('17/07/14','RR/MM/DD'),'급여대장명 01',to_date('17/08/13','RR/MM/DD'),900000000000,1793,26451);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017071202','500002000000',to_date('17/07/13','RR/MM/DD'),'급여대장명 02',to_date('17/08/12','RR/MM/DD'),870000000000,5303,26452);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017071103','500003000000',to_date('17/07/12','RR/MM/DD'),'급여대장명 03',to_date('17/08/11','RR/MM/DD'),840000000000,2388,26451);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017071004','500004000000',to_date('17/07/11','RR/MM/DD'),'급여대장명 04',to_date('17/08/10','RR/MM/DD'),810000000000,8484,26452);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017070905','500005000000',to_date('17/07/10','RR/MM/DD'),'급여대장명 05',to_date('17/08/09','RR/MM/DD'),780000000000,7489,26452);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017070806','500006000000',to_date('17/07/09','RR/MM/DD'),'급여대장명 06',to_date('17/08/08','RR/MM/DD'),750000000000,1134,26452);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017070707','500007000000',to_date('17/07/08','RR/MM/DD'),'급여대장명 07',to_date('17/08/07','RR/MM/DD'),720000000000,3384,26452);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017070608','500008000000',to_date('17/07/07','RR/MM/DD'),'급여대장명 08',to_date('17/08/06','RR/MM/DD'),690000000000,3172,26453);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017070509','500009000000',to_date('17/07/06','RR/MM/DD'),'급여대장명 09',to_date('17/08/05','RR/MM/DD'),660000000000,2957,26453);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017070410','500010000000',to_date('17/07/05','RR/MM/DD'),'급여대장명 10',to_date('17/08/04','RR/MM/DD'),630000000000,4822,26453);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017070311','500011000000',to_date('17/07/04','RR/MM/DD'),'급여대장명 11',to_date('17/08/03','RR/MM/DD'),600000000000,1903,26453);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017070212','500012000000',to_date('17/07/03','RR/MM/DD'),'급여대장명 12',to_date('17/08/02','RR/MM/DD'),570000000000,1630,26453);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017070113','500013000000',to_date('17/07/02','RR/MM/DD'),'급여대장명 13',to_date('17/08/01','RR/MM/DD'),540000000000,7519,26454);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017063014','500014000000',to_date('17/07/01','RR/MM/DD'),'급여대장명 14',to_date('17/07/31','RR/MM/DD'),510000000000,7808,26454);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017062915','500015000000',to_date('17/06/30','RR/MM/DD'),'급여대장명 15',to_date('17/07/30','RR/MM/DD'),480000000000,6534,26454);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017062816','500016000000',to_date('17/06/29','RR/MM/DD'),'급여대장명 16',to_date('17/07/29','RR/MM/DD'),450000000000,4973,26454);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017062717','500017000000',to_date('17/06/28','RR/MM/DD'),'급여대장명 17',to_date('17/07/28','RR/MM/DD'),420000000000,321,26454);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017062618','500018000000',to_date('17/06/27','RR/MM/DD'),'급여대장명 18',to_date('17/07/27','RR/MM/DD'),390000000000,6314,26455);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017062519','500019000000',to_date('17/06/26','RR/MM/DD'),'급여대장명 19',to_date('17/07/26','RR/MM/DD'),360000000000,5619,26455);
Insert into MYRP.SALARY_REGISTER (SALARY_REGISTER_ID,ACCOUNT_ID,REG_DATE,SALARY_REGISTER_NAME,PAY_DATE,TOTAL_PAY,TOTAL_EMPLOYEE,SALARY_STATE) values ('645017062420','500020000000',to_date('17/06/25','RR/MM/DD'),'급여대장명 20',to_date('17/07/25','RR/MM/DD'),330000000000,4734,26455);
COMMIT;

Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (1,'부서명 01','모듈접근권한명 01','Y');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (2,'부서명 02','모듈접근권한명 02','N');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (3,'부서명 03','모듈접근권한명 03','Y');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (4,'부서명 04','모듈접근권한명 04','N');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (5,'부서명 05','모듈접근권한명 05','Y');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (6,'부서명 06','모듈접근권한명 06','N');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (7,'부서명 07','모듈접근권한명 07','Y');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (8,'부서명 08','모듈접근권한명 08','N');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (9,'부서명 09','모듈접근권한명 09','Y');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (10,'부서명 10','모듈접근권한명 10','N');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (11,'부서명 11','모듈접근권한명 11','Y');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (12,'부서명 12','모듈접근권한명 12','N');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (13,'부서명 13','모듈접근권한명 13','Y');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (14,'부서명 14','모듈접근권한명 14','N');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (15,'부서명 15','모듈접근권한명 15','Y');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (16,'부서명 16','모듈접근권한명 16','N');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (17,'부서명 17','모듈접근권한명 17','Y');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (18,'부서명 18','모듈접근권한명 18','N');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (19,'부서명 19','모듈접근권한명 19','Y');
Insert into MYRP.DEPARTMENT (DEPT_ID,DEPT_NAME,ACCESS_ROLE,USE_STATE) values (20,'부서명 20','모듈접근권한명 20','N');
COMMIT;

INSERT INTO HR_CODE_GROUP (HR_CODE_GROUP_ID, HR_CODE_GROUP_NAME, USE_STATE) VALUES (1,'인사코드그룹이름 01','Y');
INSERT INTO HR_CODE_GROUP (HR_CODE_GROUP_ID, HR_CODE_GROUP_NAME, USE_STATE) VALUES (2,'인사코드그룹이름 02','N');
INSERT INTO HR_CODE_GROUP (HR_CODE_GROUP_ID, HR_CODE_GROUP_NAME, USE_STATE) VALUES (3,'인사코드그룹이름 03','Y');
INSERT INTO HR_CODE_GROUP (HR_CODE_GROUP_ID, HR_CODE_GROUP_NAME, USE_STATE) VALUES (4,'인사코드그룹이름 04','N');
INSERT INTO HR_CODE_GROUP (HR_CODE_GROUP_ID, HR_CODE_GROUP_NAME, USE_STATE) VALUES (5,'인사코드그룹이름 05','Y');
INSERT INTO HR_CODE_GROUP (HR_CODE_GROUP_ID, HR_CODE_GROUP_NAME, USE_STATE) VALUES (6,'인사코드그룹이름 06','N');
INSERT INTO HR_CODE_GROUP (HR_CODE_GROUP_ID, HR_CODE_GROUP_NAME, USE_STATE) VALUES (7,'인사코드그룹이름 07','Y');
INSERT INTO HR_CODE_GROUP (HR_CODE_GROUP_ID, HR_CODE_GROUP_NAME, USE_STATE) VALUES (8,'인사코드그룹이름 08','N');
INSERT INTO HR_CODE_GROUP (HR_CODE_GROUP_ID, HR_CODE_GROUP_NAME, USE_STATE) VALUES (9,'인사코드그룹이름 09','Y');
INSERT INTO HR_CODE_GROUP (HR_CODE_GROUP_ID, HR_CODE_GROUP_NAME, USE_STATE) VALUES (0,'인사코드그룹이름 10','N');
COMMIT;

Insert into MYRP.HR_CODE (HR_CODE_GROUP_ID,HR_CODE_ID,HR_CODE_NAME,USE_STATE) values (1,1,'인사코드명 01','Y');
Insert into MYRP.HR_CODE (HR_CODE_GROUP_ID,HR_CODE_ID,HR_CODE_NAME,USE_STATE) values (2,2,'인사코드명 02','N');
Insert into MYRP.HR_CODE (HR_CODE_GROUP_ID,HR_CODE_ID,HR_CODE_NAME,USE_STATE) values (3,3,'인사코드명 03','Y');
Insert into MYRP.HR_CODE (HR_CODE_GROUP_ID,HR_CODE_ID,HR_CODE_NAME,USE_STATE) values (4,4,'인사코드명 04','N');
Insert into MYRP.HR_CODE (HR_CODE_GROUP_ID,HR_CODE_ID,HR_CODE_NAME,USE_STATE) values (5,5,'인사코드명 05','Y');
Insert into MYRP.HR_CODE (HR_CODE_GROUP_ID,HR_CODE_ID,HR_CODE_NAME,USE_STATE) values (6,6,'인사코드명 06','N');
Insert into MYRP.HR_CODE (HR_CODE_GROUP_ID,HR_CODE_ID,HR_CODE_NAME,USE_STATE) values (7,7,'인사코드명 07','Y');
Insert into MYRP.HR_CODE (HR_CODE_GROUP_ID,HR_CODE_ID,HR_CODE_NAME,USE_STATE) values (8,8,'인사코드명 08','N');
Insert into MYRP.HR_CODE (HR_CODE_GROUP_ID,HR_CODE_ID,HR_CODE_NAME,USE_STATE) values (9,9,'인사코드명 09','Y');
Insert into MYRP.HR_CODE (HR_CODE_GROUP_ID,HR_CODE_ID,HR_CODE_NAME,USE_STATE) values (0,10,'인사코드명 10','N');
COMMIT;

Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (1,1,1,1,'사원이름 01','1111111111101',to_date('17/07/14','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (2,2,2,2,'사원이름 02','1111111111102',to_date('17/07/13','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (3,3,3,3,'사원이름 03','1111111111103',to_date('17/07/12','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (4,4,4,4,'사원이름 04','1111111111104',to_date('17/07/11','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (5,5,5,5,'사원이름 05','1111111111105',to_date('17/07/10','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (6,6,6,6,'사원이름 06','1111111111106',to_date('17/07/09','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (7,7,7,7,'사원이름 07','1111111111107',to_date('17/07/08','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (8,8,8,8,'사원이름 08','1111111111108',to_date('17/07/07','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (9,9,9,9,'사원이름 09','1111111111109',to_date('17/07/06','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (10,10,0,10,'사원이름 10','1111111111110',to_date('17/07/05','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (11,11,1,1,'사원이름 11','1111111111111',to_date('17/07/04','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (12,12,2,2,'사원이름 12','1111111111112',to_date('17/07/03','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (13,13,3,3,'사원이름 13','1111111111113',to_date('17/07/02','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (14,14,4,4,'사원이름 14','1111111111114',to_date('17/07/01','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (15,15,5,5,'사원이름 15','1111111111115',to_date('17/06/30','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (16,16,6,6,'사원이름 16','1111111111116',to_date('17/06/29','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (17,17,7,7,'사원이름 17','1111111111117',to_date('17/06/28','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (18,18,8,8,'사원이름 18','1111111111118',to_date('17/06/27','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (19,19,9,9,'사원이름 19','1111111111119',to_date('17/06/26','RR/MM/DD'));
Insert into MYRP.EMPLOYEE (EMPLOYEE_ID,DEPT_ID,HR_CODE_GROUP_RANK,RANK_CODE,EMPLOYEE_NAME,RESIDENCE_REG_NO,JOIN_DATE) values (20,20,0,10,'사원이름 20','1111111111120',to_date('17/06/25','RR/MM/DD'));
COMMIT;

INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017071301','500001000000','200017071301','1000000001','1000000001',1.0,to_date('07/14/2017', 'mm-dd-yyyy'),to_date('07/14/2017', 'mm-dd-yyyy'),to_date('07/14/2017', 'mm-dd-yyyy'),428.0,9.0E9,22211.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017071202','500002000000','200017071202','1000000002','1000000002',2.0,to_date('07/13/2017', 'mm-dd-yyyy'),to_date('07/13/2017', 'mm-dd-yyyy'),to_date('07/13/2017', 'mm-dd-yyyy'),884.0,8.7E9,22212.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017071103','500003000000','200017071103','1000000003','1000000003',3.0,to_date('07/12/2017', 'mm-dd-yyyy'),to_date('07/12/2017', 'mm-dd-yyyy'),to_date('07/12/2017', 'mm-dd-yyyy'),62.0,8.4E9,22213.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017071004','500004000000','200017071004','1000000004','1000000004',4.0,to_date('07/11/2017', 'mm-dd-yyyy'),to_date('07/11/2017', 'mm-dd-yyyy'),to_date('07/11/2017', 'mm-dd-yyyy'),204.0,8.1E9,22317.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017070905','500005000000','200017070905','1000000005','1000000005',5.0,to_date('07/10/2017', 'mm-dd-yyyy'),to_date('07/10/2017', 'mm-dd-yyyy'),to_date('07/10/2017', 'mm-dd-yyyy'),96.0,7.8E9,22311.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017070806','500006000000','200017070806','1000000006','1000000006',6.0,to_date('07/09/2017', 'mm-dd-yyyy'),to_date('07/09/2017', 'mm-dd-yyyy'),to_date('07/09/2017', 'mm-dd-yyyy'),129.0,7.5E9,22312.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017070707','500007000000','200017070707','1000000007','1000000007',7.0,to_date('07/08/2017', 'mm-dd-yyyy'),to_date('07/08/2017', 'mm-dd-yyyy'),to_date('07/08/2017', 'mm-dd-yyyy'),697.0,7.2E9,22313.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017070608','500008000000','200017070608','1000000008','1000000008',8.0,to_date('07/07/2017', 'mm-dd-yyyy'),to_date('07/07/2017', 'mm-dd-yyyy'),to_date('07/07/2017', 'mm-dd-yyyy'),15.0,6.9E9,22314.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017070509','500009000000','200017070509','1000000009','1000000009',9.0,to_date('07/06/2017', 'mm-dd-yyyy'),to_date('07/06/2017', 'mm-dd-yyyy'),to_date('07/06/2017', 'mm-dd-yyyy'),33.0,6.6E9,22315.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017070410','500010000000','200017070410','1000000010','1000000010',10.0,to_date('07/05/2017', 'mm-dd-yyyy'),to_date('07/05/2017', 'mm-dd-yyyy'),to_date('07/05/2017', 'mm-dd-yyyy'),41.0,6.3E9,22316.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017070311','500011000000','200017070311','1000000011','1000000011',11.0,to_date('07/04/2017', 'mm-dd-yyyy'),to_date('07/04/2017', 'mm-dd-yyyy'),to_date('07/04/2017', 'mm-dd-yyyy'),838.0,6.0E9,22211.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017070212','500012000000','200017070212','1000000012','1000000012',12.0,to_date('07/03/2017', 'mm-dd-yyyy'),to_date('07/03/2017', 'mm-dd-yyyy'),to_date('07/03/2017', 'mm-dd-yyyy'),225.0,5.7E9,22212.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017070113','500013000000','200017070113','1000000013','1000000013',13.0,to_date('07/02/2017', 'mm-dd-yyyy'),to_date('07/02/2017', 'mm-dd-yyyy'),to_date('07/02/2017', 'mm-dd-yyyy'),822.0,5.4E9,22213.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017063014','500014000000','200017063014','1000000014','1000000014',14.0,to_date('07/01/2017', 'mm-dd-yyyy'),to_date('07/01/2017', 'mm-dd-yyyy'),to_date('07/01/2017', 'mm-dd-yyyy'),755.0,5.1E9,22317.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017062915','500015000000','200017062915','1000000015','1000000015',15.0,to_date('06/30/2017', 'mm-dd-yyyy'),to_date('06/30/2017', 'mm-dd-yyyy'),to_date('06/30/2017', 'mm-dd-yyyy'),71.0,4.8E9,22311.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017062816','500016000000','200017062816','1000000016','1000000016',16.0,to_date('06/29/2017', 'mm-dd-yyyy'),to_date('06/29/2017', 'mm-dd-yyyy'),to_date('06/29/2017', 'mm-dd-yyyy'),157.0,4.5E9,22312.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017062717','500017000000','200017062717','1000000017','1000000017',17.0,to_date('06/28/2017', 'mm-dd-yyyy'),to_date('06/28/2017', 'mm-dd-yyyy'),to_date('06/28/2017', 'mm-dd-yyyy'),860.0,4.2E9,22313.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017062618','500018000000','200017062618','1000000018','1000000018',18.0,to_date('06/27/2017', 'mm-dd-yyyy'),to_date('06/27/2017', 'mm-dd-yyyy'),to_date('06/27/2017', 'mm-dd-yyyy'),947.0,3.9E9,22314.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017062519','500019000000','200017062519','1000000019','1000000019',19.0,to_date('06/26/2017', 'mm-dd-yyyy'),to_date('06/26/2017', 'mm-dd-yyyy'),to_date('06/26/2017', 'mm-dd-yyyy'),949.0,3.6E9,22315.0,3.0);
INSERT INTO SALES_ORDER (SALES_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_OUT_DATE, COUNT_SALES, SELLING_PRICE, SALES_STATE, CONDITION_NOTE_RECEIVABLE) VALUES ('211017062420','500020000000','200017062420','1000000020','1000000020',20.0,to_date('06/25/2017', 'mm-dd-yyyy'),to_date('06/25/2017', 'mm-dd-yyyy'),to_date('06/25/2017', 'mm-dd-yyyy'),8.0,3.3E9,22316.0,3.0);
commit;

INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017071301','500001000000','200017071301','1000000001','1000000001',1.0,to_date('07/14/2017', 'mm-dd-yyyy'),to_date('07/14/2017', 'mm-dd-yyyy'),to_date('07/14/2017', 'mm-dd-yyyy'),1100.0,9.0E9,23201.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017071202','500002000000','200017071202','1000000002','1000000002',2.0,to_date('07/13/2017', 'mm-dd-yyyy'),to_date('07/13/2017', 'mm-dd-yyyy'),to_date('07/13/2017', 'mm-dd-yyyy'),1200.0,8.7E9,23202.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017071103','500003000000','200017071103','1000000003','1000000003',3.0,to_date('07/12/2017', 'mm-dd-yyyy'),to_date('07/12/2017', 'mm-dd-yyyy'),to_date('07/12/2017', 'mm-dd-yyyy'),1300.0,8.4E9,23203.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017071004','500004000000','200017071004','1000000004','1000000004',4.0,to_date('07/11/2017', 'mm-dd-yyyy'),to_date('07/11/2017', 'mm-dd-yyyy'),to_date('07/11/2017', 'mm-dd-yyyy'),1400.0,8.1E9,23204.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017070905','500005000000','200017070905','1000000005','1000000005',5.0,to_date('07/10/2017', 'mm-dd-yyyy'),to_date('07/10/2017', 'mm-dd-yyyy'),to_date('07/10/2017', 'mm-dd-yyyy'),1500.0,7.8E9,23311.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017070806','500006000000','200017070806','1000000006','1000000006',6.0,to_date('07/09/2017', 'mm-dd-yyyy'),to_date('07/09/2017', 'mm-dd-yyyy'),to_date('07/09/2017', 'mm-dd-yyyy'),1600.0,7.5E9,23312.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017070707','500007000000','200017070707','1000000007','1000000007',7.0,to_date('07/08/2017', 'mm-dd-yyyy'),to_date('07/08/2017', 'mm-dd-yyyy'),to_date('07/08/2017', 'mm-dd-yyyy'),1700.0,7.2E9,23327.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017070608','500008000000','200017070608','1000000008','1000000008',8.0,to_date('07/07/2017', 'mm-dd-yyyy'),to_date('07/07/2017', 'mm-dd-yyyy'),to_date('07/07/2017', 'mm-dd-yyyy'),1800.0,6.9E9,23352.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017070509','500009000000','200017070509','1000000009','1000000009',9.0,to_date('07/06/2017', 'mm-dd-yyyy'),to_date('07/06/2017', 'mm-dd-yyyy'),to_date('07/06/2017', 'mm-dd-yyyy'),1900.0,6.6E9,23378.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017070410','500010000000','200017070410','1000000010','1000000010',10.0,to_date('07/05/2017', 'mm-dd-yyyy'),to_date('07/05/2017', 'mm-dd-yyyy'),to_date('07/05/2017', 'mm-dd-yyyy'),2000.0,6.3E9,23403.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017070311','500011000000','200017070311','1000000011','1000000011',11.0,to_date('07/04/2017', 'mm-dd-yyyy'),to_date('07/04/2017', 'mm-dd-yyyy'),to_date('07/04/2017', 'mm-dd-yyyy'),2100.0,6.0E9,23428.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017070212','500012000000','200017070212','1000000012','1000000012',12.0,to_date('07/03/2017', 'mm-dd-yyyy'),to_date('07/03/2017', 'mm-dd-yyyy'),to_date('07/03/2017', 'mm-dd-yyyy'),2200.0,5.7E9,23453.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017070113','500013000000','200017070113','1000000013','1000000013',13.0,to_date('07/02/2017', 'mm-dd-yyyy'),to_date('07/02/2017', 'mm-dd-yyyy'),to_date('07/02/2017', 'mm-dd-yyyy'),2300.0,5.4E9,23479.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017063014','500014000000','200017063014','1000000014','1000000014',14.0,to_date('07/01/2017', 'mm-dd-yyyy'),to_date('07/01/2017', 'mm-dd-yyyy'),to_date('07/01/2017', 'mm-dd-yyyy'),2400.0,5.1E9,23504.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017062915','500015000000','200017062915','1000000015','1000000015',15.0,to_date('06/30/2017', 'mm-dd-yyyy'),to_date('06/30/2017', 'mm-dd-yyyy'),to_date('06/30/2017', 'mm-dd-yyyy'),2500.0,4.8E9,23529.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017062816','500016000000','200017062816','1000000016','1000000016',16.0,to_date('06/29/2017', 'mm-dd-yyyy'),to_date('06/29/2017', 'mm-dd-yyyy'),to_date('06/29/2017', 'mm-dd-yyyy'),2600.0,4.5E9,23554.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017062717','500017000000','200017062717','1000000017','1000000017',17.0,to_date('06/28/2017', 'mm-dd-yyyy'),to_date('06/28/2017', 'mm-dd-yyyy'),to_date('06/28/2017', 'mm-dd-yyyy'),2700.0,4.2E9,23579.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017062618','500018000000','200017062618','1000000018','1000000018',18.0,to_date('06/27/2017', 'mm-dd-yyyy'),to_date('06/27/2017', 'mm-dd-yyyy'),to_date('06/27/2017', 'mm-dd-yyyy'),2800.0,3.9E9,23605.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017062519','500019000000','200017062519','1000000019','1000000019',19.0,to_date('06/26/2017', 'mm-dd-yyyy'),to_date('06/26/2017', 'mm-dd-yyyy'),to_date('06/26/2017', 'mm-dd-yyyy'),2900.0,3.6E9,23630.0,3.0);
INSERT INTO PURCHASE_ORDER (PURCHASE_ID, ACCOUNT_ID, ORDER_ID, PRODUCT_ID, COMPANY_ID, EMPLOYEE_ID, REG_DATE, UPDATE_DATE, STORAGE_IN_DATE, COUNT_PURCHASE, SUPPLY_PRICE, PURCHASE_STATE, CONDITION_NOTE_PAYABLE) VALUES ('211017062420','500020000000','200017062420','1000000020','1000000020',20.0,to_date('06/25/2017', 'mm-dd-yyyy'),to_date('06/25/2017', 'mm-dd-yyyy'),to_date('06/25/2017', 'mm-dd-yyyy'),3000.0,3.3E9,23655.0,3.0);
commit;

INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011010000', '0', '현금');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011020000', '0', '매출채권');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011030000', '0', '부가세대급금');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011040000', '0', '재고자산');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011050000', '0', '상품');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500012010000', '0', '매입채무');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500012020000', '0', '부가세예수금');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500013010000', '0', '이익잉여금');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500014010000', '0', '급여');
commit;

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