--------------------------------------------------------------------------------
-- DB초기화
--------------------------------------------------------------------------------
DROP TRIGGER trigger_sales_insert;
DROP TRIGGER trigger_sales_update;
DROP TRIGGER trigger_purchase_insert;
DROP TRIGGER trigger_purchase_update;
DROP TRIGGER trigger_salary_insert;
DROP TRIGGER trigger_salary_update;
DROP TRIGGER trigger_statement_insert;
DROP TRIGGER trigger_statement_update;
DROP TRIGGER trigger_stock_insert;
DROP TRIGGER trigger_stock_update;
DROP TRIGGER trigger_stock_info_insert;
DROP SEQUENCE purchase_seq;
DROP SEQUENCE sales_seq;
DROP SEQUENCE statement_seq;
DROP SEQUENCE stock_seq;
DROP SEQUENCE strage_in_order_seq;
DROP SEQUENCE strage_out_order_seq;
DROP SEQUENCE salary_seq;
DROP TABLE ADJUSTMENT_INVENTORY;
DROP TABLE DEFECTIVE_WAREHOUSE;
DROP TABLE STORAGE_IN_ORDER;
DROP TABLE STORAGE_OUT_ORDER;
DROP TABLE MOVEMENT_WAREHOUSE;
DROP TABLE STOCK_ORDER;
DROP TABLE STOCK_INFORMATION;
DROP TABLE WAREHOUSE_INFORMATION;
DROP TABLE BANK_ACCOUNT;
DROP TABLE TAX_STATEMENT;
DROP TABLE SALES_STATEMENT;
DROP TABLE PURCHASE_STATEMENT;
DROP TABLE SALARY_REGISTER_STATEMENT;
DROP TABLE STATEMENT;
DROP TABLE PURCHASE_ORDER;
DROP TABLE SALES_ORDER;
DROP TABLE ACCOUNT;
DROP TABLE COMPANY;
DROP TABLE PRODUCT;
DROP TABLE SALARY;
DROP TABLE SALARY_REGISTER;
DROP TABLE PERSONNEL_APPOINTMENT;
DROP TABLE EMPLOYEE_PICTURE;
DROP TABLE EMPLOYEE_INFO;
DROP TABLE WORK_RECORD;
DROP TABLE RETIRED_EMPLOYEE;
DROP TABLE SERVICE_ATTITUDE;
DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;
DROP TABLE HR_CODE;
DROP TABLE HR_CODE_GROUP;
DROP TABLE ORDER_STATE;
DROP TABLE STATE;
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
--------------------------------------------------------------------------------
-- 인사코드그룹 TABLE 생성 (hr_code_group)
--------------------------------------------------------------------------------
CREATE TABLE hr_code_group(
    hr_code_group_id    NUMBER(1)       PRIMARY KEY,
    hr_code_group_name  VARCHAR2(255)   NOT NULL,
    use_state           CHAR(1)         DEFAULT 'Y' NOT NULL
                        CHECK(use_state = 'Y' OR use_state = 'N')
);
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

CREATE TABLE employee_picture(
    employee_id         NUMBER(4),
    pic_uid             VARCHAR2(255)
);
--------------------------------------------------------------------------------
-- 인사정보 TABLE 생성 (employee_info)
----------------------------------------------------------------------------------
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
    CONSTRAINT retired_employee_pk PRIMARY KEY(employee_id)
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
CREATE TABLE service_attitude(
    employee_id             NUMBER(4),
    attitude_date           DATE,
    hr_code_group_attitude  NUMBER(1),
    attitude_code           NUMBER(3),
    hr_code_group_leave     NUMBER(1),
    leave_code              NUMBER(3),
    attitude_period         NUMBER(3),
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
CREATE TABLE salary(
    salary_register_id      CHAR(12),
    account_id              CHAR(12),
    employee_id             NUMBER(4),
    base_pay                NUMBER(10),
    bonus                   NUMBER(10),
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
--------------------------------------------------------------------------------
-- 주문상태 TABLE 생성 (order_state)
--------------------------------------------------------------------------------
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
    account_name          VARCHAR2(40) NOT NULL
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
--------------------------------------------------------------------------------
-- 창고정보 TABLE 생성 (warehouse_information)
--------------------------------------------------------------------------------
CREATE TABLE warehouse_information (
warehouse_id        NUMBER(4)	PRIMARY KEY,
warehouse_name      VARCHAR(255)	NOT NULL,
warehouse_location  VARCHAR(255)	NOT NULL
);
--------------------------------------------------------------------------------
-- 재고정보 TABLE 생성 (stock_information)
--------------------------------------------------------------------------------
CREATE TABLE stock_information (
product_id      CHAR(10),
warehouse_id   NUMBER(4),	
stock_amount    NUMBER(4) NOT NULL,
CONSTRAINT stock_information_PK PRIMARY KEY(product_id, warehouse_id),
CONSTRAINT stock_information_FK FOREIGN KEY(product_id) REFERENCES product(product_id),
CONSTRAINT stock_information_FK1 FOREIGN KEY(warehouse_id) REFERENCES warehouse_information(warehouse_id)
);
--------------------------------------------------------------------------------
-- 물류주문 TABLE 생성 (stock_order)
--------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------
-- 창고이동 TABLE 생성 (movement_warehouse)
--------------------------------------------------------------------------------
CREATE TABLE movement_warehouse (
  stock_order_id    CHAR(12),
  arrive_warehouse 	NUMBER(4)	NOT NULL,
  movement_amount 	NUMBER(4)	NOT NULL,
  movement_state    CHAR(1)   DEFAULT 0,
  CONSTRAINT movement_warehouse_PK PRIMARY KEY(stock_order_id),
  CONSTRAINT movement_warehouse_FK FOREIGN KEY(arrive_warehouse) REFERENCES warehouse_information(warehouse_id),
  CONSTRAINT movement_warehouse_FK1 FOREIGN KEY(stock_order_id) REFERENCES stock_order(stock_order_id)
);
--------------------------------------------------------------------------------
-- 불량창고 TABLE 생성 (defective_warehouse)
--------------------------------------------------------------------------------
CREATE TABLE defective_warehouse (
stock_order_id    CHAR(12),
management_plan   CHAR(1)   DEFAULT 0,	
defective_type    CHAR(1)   DEFAULT 0,
CONSTRAINT defective_warehouse_PK PRIMARY KEY(stock_order_id),
CONSTRAINT defective_warehouse_FK FOREIGN KEY(stock_order_id) REFERENCES stock_order(stock_order_id)
);
--------------------------------------------------------------------------------
-- 재고조정 TABLE 생성 (defective_warehouse)
--------------------------------------------------------------------------------
CREATE TABLE adjustment_inventory (
stock_order_id    CHAR(12),
search_date       DATE      DEFAULT SYSDATE,	
taked_stock       NUMBER(4)	NOT NULL,
delete_stock      NUMBER(4) NOT NULL,
CONSTRAINT adjustment_inventory_PK PRIMARY KEY(stock_order_id),
CONSTRAINT adjustment_inventory_FK FOREIGN KEY(stock_order_id) REFERENCES stock_order(stock_order_id)
);
--------------------------------------------------------------------------------
-- 출고주문 TABLE 생성 (storage_out_order)
--------------------------------------------------------------------------------
CREATE TABLE storage_out_order (
stock_order_id    CHAR(12) ,	
count_sales       NUMBER(4)	NOT NULL,
available_stock   NUMBER(4) DEFAULT 0,
lack_stock        NUMBER(4) DEFAULT 0,		
storage_out_date  DATE      DEFAULT SYSDATE,		
CONSTRAINT storage_out_order_PK PRIMARY KEY(stock_order_id),
CONSTRAINT storage_out_order_FK FOREIGN KEY(stock_order_id) REFERENCES stock_order(stock_order_id)
);
--------------------------------------------------------------------------------
-- 입고주문 TABLE 생성 (storage_in_order)
--------------------------------------------------------------------------------
CREATE TABLE storage_in_order (
stock_order_id    CHAR(12) ,	
count_purchase    NUMBER(4)	NOT NULL,
storage_in_date   DATE DEFAULT SYSDATE,		
CONSTRAINT storage_in_order_PK PRIMARY KEY(stock_order_id),
CONSTRAINT storage_in_order_FK FOREIGN KEY(stock_order_id) REFERENCES stock_order(stock_order_id)
);
--------------------------------------------------------------------------------
-- 판매주문 TABLE (SALES_ORDER)
--------------------------------------------------------------------------------
CREATE TABLE sales_order (
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
-- 구매주문 TABLE (PURCHASE_ORDER)
--------------------------------------------------------------------------------
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
--------------------------------------------------------------------------------
-- 세금전표 TABLE (tax_statement)
--------------------------------------------------------------------------------
CREATE TABLE tax_statement (
    statement_id    CHAR(12)    PRIMARY KEY,
    account_id      CHAR(12),
    CONSTRAINT tax_statement_fk1 FOREIGN KEY(statement_id) REFERENCES statement(statement_id),
    CONSTRAINT tax_statement_fk2 FOREIGN KEY(account_id) REFERENCES account(account_id)
);
--------------------------------------------------------------------------------
-- 판매전표 TABLE (sales_statement)
--------------------------------------------------------------------------------
CREATE TABLE sales_statement (
    statement_id    CHAR(12)    PRIMARY KEY,
    sales_id        CHAR(12),
    account_id      CHAR(12),
    CONSTRAINT sales_statement_fk1 FOREIGN KEY(statement_id) REFERENCES statement(statement_id),
    CONSTRAINT sales_statement_fk2 FOREIGN KEY(sales_id,account_id) REFERENCES sales_order(sales_id,account_id)
);
--------------------------------------------------------------------------------
-- 구매전표 TABLE (purchase_statement)
--------------------------------------------------------------------------------
CREATE TABLE purchase_statement (
    statement_id    CHAR(12)    PRIMARY KEY,
    purchase_id     CHAR(12),
    account_id      CHAR(12),
    CONSTRAINT purchase_statement_fk1 FOREIGN KEY(statement_id) REFERENCES statement(statement_id),
    CONSTRAINT purchase_statement_fk2 FOREIGN KEY(purchase_id,account_id) REFERENCES purchase_order(purchase_id,account_id)
);
--------------------------------------------------------------------------------
-- 급여전표 TABLE (salary_register_statement)
--------------------------------------------------------------------------------
CREATE TABLE salary_register_statement (
    statement_id    CHAR(12)    PRIMARY KEY,
    salary_register_id  CHAR(12),
    account_id      CHAR(12),
    CONSTRAINT salary_register_statement_fk1 FOREIGN KEY(statement_id) REFERENCES statement(statement_id),
    CONSTRAINT salary_register_statement_fk2 FOREIGN KEY(salary_register_id,account_id) REFERENCES salary_register(salary_register_id,account_id)
);
--------------------------------------------------------------------------------
-- 상태코드 TABLE (state)
--------------------------------------------------------------------------------
CREATE TABLE STATE(
  CODE        NUMBER(5) PRIMARY KEY,
  KOR_NAME    VARCHAR(30), 
  ENG_NAME    VARCHAR(40)
);
--------------------------------------------------------------------------------
-- SEQUENCE (구매,판매,전표,물류,급여)
--------------------------------------------------------------------------------
CREATE SEQUENCE purchase_seq
START WITH 1 INCREMENT BY 1 MAXVALUE 99 cycle;

CREATE SEQUENCE sales_seq
START WITH 1 INCREMENT BY 1 MAXVALUE 99 cycle;

CREATE SEQUENCE statement_seq
START WITH 1 INCREMENT BY 1 MAXVALUE 99 cycle;

CREATE SEQUENCE stock_seq
START WITH 1 INCREMENT BY 1 MAXVALUE 99 cycle;

CREATE SEQUENCE strage_in_order_seq
START WITH 1 INCREMENT BY 1 MAXVALUE 99 cycle;

CREATE SEQUENCE strage_out_order_seq
START WITH 1 INCREMENT BY 1 MAXVALUE 99 cycle;

CREATE SEQUENCE salary_seq
START WITH 1 INCREMENT BY 1 MAXVALUE 99 cycle;
--------------------------------------------------------------------------------
-- ORDER_STATE TABLE TRIGER 연결
--------------------------------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_sales_insert
    AFTER INSERT
    ON sales_order
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    INSERT INTO order_state
    VALUES(:NEW.sales_id, :NEW.sales_state);
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL'; 
--------------------------------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_sales_update
    AFTER UPDATE
    ON sales_order
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    UPDATE  order_state
    SET     order_state = :NEW.sales_state
    WHERE   order_id = :NEW.sales_id;
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL'; 
--------------------------------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_purchase_insert
    AFTER INSERT
    ON purchase_order
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    INSERT INTO order_state
    VALUES(:NEW.purchase_id, :NEW.purchase_state);
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL'; 
--------------------------------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_purchase_update
    AFTER UPDATE
    ON purchase_order
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    UPDATE  order_state
    SET     order_state = :NEW.purchase_state
    WHERE   order_id = :NEW.purchase_id;
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL';
--------------------------------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_salary_insert
    AFTER INSERT
    ON salary_register
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    INSERT INTO order_state
    VALUES(:NEW.salary_register_id, :NEW.salary_state);
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL';
--------------------------------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_salary_update
    AFTER UPDATE
    ON salary_register
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    UPDATE  order_state
    SET     order_state = :NEW.salary_state
    WHERE   order_id = :NEW.salary_register_id;
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL';
--------------------------------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_statement_insert
    AFTER INSERT
    ON statement
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    INSERT INTO order_state
    VALUES(:NEW.statement_id, :NEW.approval_state);
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL';
--------------------------------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_statement_update
    AFTER UPDATE
    ON statement
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    UPDATE  order_state
    SET     order_state = :NEW.approval_state
    WHERE   order_id = :NEW.statement_id;
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL';
--------------------------------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_stock_insert
    AFTER INSERT
    ON stock_order
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    INSERT INTO order_state
    VALUES(:NEW.stock_order_id, :NEW.stock_state);
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL';
--------------------------------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_stock_update
    AFTER UPDATE
    ON stock_order
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    UPDATE  order_state
    SET     order_state = :NEW.stock_state
    WHERE   order_id = :NEW.stock_order_id;
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL';
--------------------------------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_stock_delete
    AFTER DELETE
    ON stock_order
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    DELETE  FROM order_state
    WHERE   order_id = :OLD.stock_order_id;
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL';
--------------------------------------------------------------------------------
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';
SET SERVEROUTPUT ON
CREATE OR REPLACE TRIGGER trigger_stock_info_insert
    AFTER INSERT
    ON product
    FOR EACH ROW
BEGIN
    dbms_output.put_line('Trigger running');
    INSERT INTO stock_information(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT)
    VALUES(:NEW.product_id, 1001, 0);
    INSERT INTO stock_information(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT)
    VALUES(:NEW.product_id, 2001, 0);
    INSERT INTO stock_information(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT)
    VALUES(:NEW.product_id, 3001, 0);
    dbms_output.put_line('Trigger operation successed');
    EXCEPTION
        WHEN OTHERS THEN
            dbms_output.put_line('ERR CODE'||TO_CHAR(SQLCODE));
            dbms_output.put_line('ERR MESSAGE'||SQLERRM);
END;
/
ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL';
--------------------------------------------------------------------------------
-- 기초 데이터 (2017-07-23)
--------------------------------------------------------------------------------
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (25451,'전표미승인','disapproval_statement');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (25452,'전표승인','approval_statement');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (25453,'전표승인거절','denial_statement');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (26450,'급여확정요청','request_fix_salary');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (26451,'급여지급요청','request_payments_salary');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (26452,'급여지급대기','wait_payments_salary');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (26453,'급여지급완료','complete_payments_salary');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (26454, '급여지급취소','cancle_payments_salary');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (24101,'입고요청접수','receive_request_storage_in_warehouse');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (24102,'입고완료','complete_storage_in_warehouse');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (24201,'출고요청접수','receive_request_storage_out_warehouse');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (24202,'출고대기','wait_storage_out_warehouse');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (24203,'재고준비중','prepare_inventory');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (24752,'출고완료','complete_storage_out_warehouse');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (24753,'구매요청','request_purchase');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (24621,'재고조사완료','complete_inventory');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (22211,'판매견적요청','check_sales_estimate');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (22212,'판매견적승인','approval_sales_estimate');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (22213,'판매전표승인요청','request_approval_sales_statement');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (22214,'판매전표승인완료','complete_approval_sales_statement');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (22215,'마감','deadline');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (22222,'영업출고요청','request_sales_storage_out_warehouse');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (22223,'영업출고완료','complete_sales_storage_out_warehouse');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (22411,'수금대기','wait_colleciton');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (22412,'수금완료','complete_colleciton');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (23201,'주문확인','check_order');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (23202,'구매전표승인요청','request_approval_purchase_statement');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (23203,'구매전표승인완료','complete_approval_purchase_statement');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (23204,'구매입고요청','request_purchase_storage_in_warehouse');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (23205,'구매입고완료','complete_purchase_storage_in_warehouse');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (23206,'상환대기','wait_payments');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (23207,'상환요청','request_payments');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (23208,'상환승인','approval_payments');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (23209,'상환완료','complete_payments');
Insert into STATE (CODE,KOR_NAME,ENG_NAME) values (23299,'상환마감','purchase_deadline');
COMMIT;

INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1100000001','회사이름 01','0010100001','이름01','0001010000011','사업자 주소입니다. 01','업태 01','종목 01','Y','S',to_date('07/13/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1100000002','회사이름 02','0020200002','이름02','0002020000022','사업자 주소입니다. 02','업태 02','종목 02','Y','C',to_date('07/12/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) VALUES ('1100000003','회사이름 03','0030300003','이름03','0003030000033','사업자 주소입니다. 03','업태 03','종목 03','Y','S',to_date('07/11/2017', 'mm-dd-yyyy'));
commit;

INSERT INTO WAREHOUSE_INFORMATION(WAREHOUSE_ID,WAREHOUSE_NAME,WAREHOUSE_LOCATION) VALUES(1001,'양품창고','경기도 화성시 팔탄면');
INSERT INTO WAREHOUSE_INFORMATION(WAREHOUSE_ID,WAREHOUSE_NAME,WAREHOUSE_LOCATION) VALUES(2001,'불량품창고','경기도 화성시 팔탄면');
INSERT INTO WAREHOUSE_INFORMATION(WAREHOUSE_ID,WAREHOUSE_NAME,WAREHOUSE_LOCATION) VALUES(3001,'출고대기창고','경기도 화성시 팔탄면');
commit;

Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1200000001','상품이름 01',10000,12000,'Y',to_date('17/07/13','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1200000002','상품이름 02',15000,18000,'Y',to_date('17/07/12','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1200000003','상품이름 03',20000,23000,'Y',to_date('17/07/11','RR/MM/DD'));
commit;

UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = 100 WHERE PRODUCT_ID = 1200000001 AND WAREHOUSE_ID = 1001;
UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = 100 WHERE PRODUCT_ID = 1200000002 AND WAREHOUSE_ID = 1001;
UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = 100 WHERE PRODUCT_ID = 1200000003 AND WAREHOUSE_ID = 1001;
UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = 10 WHERE PRODUCT_ID = 1200000001 AND WAREHOUSE_ID = 2001;
UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = 10 WHERE PRODUCT_ID = 1200000002 AND WAREHOUSE_ID = 2001;
UPDATE STOCK_INFORMATION SET STOCK_AMOUNT = 10 WHERE PRODUCT_ID = 1200000003 AND WAREHOUSE_ID = 2001;
commit;

INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011010000', '1000000000', '현금');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011020000', '0', '매출채권');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011030000', '0', '부가세대급금');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011040000', '0', '재고자산');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500011050000', '0', '상품매입');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500014030000', '0', '상품매출');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500012010000', '0', '매입채무');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500012020000', '0', '부가세예수금');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500013010000', '0', '이익잉여금');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500014010000', '0', '급여');
INSERT INTO account (account_id, account_balance, account_name) VALUES ('500014020000', '0', '매출원가');
commit;

INSERT INTO bank_account (bank_account_id, bank_account_name, bank_account_number, bank_account_balance, bank_account_type, bank_name, use_state, reg_date) VALUES  ('500011010000', '자산통장' , '123-456-7889111' , 1000000000 , '주 계좌', '국민은행', 'Y', sysdate);
INSERT INTO bank_account (bank_account_id, bank_account_name, bank_account_number, bank_account_balance, bank_account_type, bank_name, use_state, reg_date) VALUES  ('500011020000', '판매통장' , '123-456-7889222' , 0 , '판매', '신한은행', 'Y', sysdate);
INSERT INTO bank_account (bank_account_id, bank_account_name, bank_account_number, bank_account_balance, bank_account_type, bank_name, use_state, reg_date) VALUES  ('500012020000', '세금통장' , '123-456-7889333' , 0 , '세금납부', 'SC은행', 'Y', sysdate);
INSERT INTO bank_account (bank_account_id, bank_account_name, bank_account_number, bank_account_balance, bank_account_type, bank_name, use_state, reg_date) VALUES  ('500012010000', '구매통장' , '123-456-7889444' , 0 , '구매', '농협', 'Y', sysdate);
INSERT INTO bank_account (bank_account_id, bank_account_name, bank_account_number, bank_account_balance, bank_account_type, bank_name, use_state, reg_date) VALUES  ('500014010000', '급여통장' , '123-456-7889555' , 0 , '급여지급', '하나은행', 'Y', sysdate);
COMMIT;

INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(2,'직급','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(3,'휴가','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(4,'급여','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(5,'수당','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(6,'경비','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(7,'공제','Y');
INSERT INTO hr_code_group(hr_code_group_id,hr_code_group_name,use_state) VALUES(8,'휴가사유','Y');
COMMIT;

INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(2,100,'사원','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(2,200,'대리','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(2,300,'과장','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(2,400,'차장','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(2,500,'부장','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(2,600,'이사','Y');
COMMIT;

INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(3,100,'정기휴가','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(3,200,'연차휴가','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(3,300,'경조사휴가','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(3,400,'병가','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(3,500,'출산휴가','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(3,600,'월차','Y');
COMMIT;

INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(4,100,'정기급여','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(4,200,'특별상여금','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(4,300,'성과급','Y');
COMMIT;

INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(5,100,'야근수당','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(5,200,'주말근무수당','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(5,300,'가족수당','N');
COMMIT;

INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(8,100,'개인사정','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(8,200,'여행','Y');
INSERT INTO hr_code(hr_code_group_id,hr_code_id,hr_code_name,use_state) VALUES(8,300,'가족행사','N');
COMMIT;

INSERT INTO department(dept_id,dept_name,access_role,use_state) VALUES(1000,'관리자','ADMIN','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state) VALUES(2000,'영업','SA','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state) VALUES(3000,'구매','PU','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state) VALUES(4000,'물류','DT','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state) VALUES(5000,'회계','FI','Y');
INSERT INTO department(dept_id,dept_name,access_role,use_state) VALUES(6000,'인사','HR','Y');
COMMIT;

INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,employee_name,residence_reg_no,join_date) VALUES(1001,1000,2,500,'관리자','8011161111111',SYSDATE);
INSERT INTO employee_info(employee_id,hourly_wage) VALUES(1001,5000);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,employee_name,residence_reg_no,join_date) VALUES(6001,6000,2,300,'이인홍','7812161111111',SYSDATE);
INSERT INTO employee_info(employee_id,hourly_wage) VALUES(6001,5000);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,employee_name,residence_reg_no,join_date) VALUES(4001,4000,2,200,'최연호','8510121111111',SYSDATE);
INSERT INTO employee_info(employee_id,hourly_wage) VALUES(4001,5000);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,employee_name,residence_reg_no,join_date) VALUES(2001,2000,2,300,'장은철','8707101111111',SYSDATE);
INSERT INTO employee_info(employee_id,hourly_wage) VALUES(2001,5000);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,employee_name,residence_reg_no,join_date) VALUES(3001,3000,2,200,'장재희','8705231111111',SYSDATE);
INSERT INTO employee_info(employee_id,hourly_wage) VALUES(3001,5000);
INSERT INTO employee(employee_id,dept_id,hr_code_group_rank,rank_code,employee_name,residence_reg_no,join_date) VALUES(5001,5000,2,500,'이주원','9501302111111',SYSDATE);
INSERT INTO employee_info(employee_id,hourly_wage) VALUES(5001,5000);
COMMIT;

INSERT INTO statement(statement_id, reg_date, account_value, approval_state, statement_type) VALUES('547017080209', sysdate, 1000000000, '25452', '54104');
INSERT INTO tax_statement(statement_id, account_id) VALUES('547017080209', '500011010000');
COMMIT;