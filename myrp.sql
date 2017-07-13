--------------------------------------------------------------------------------
-- �ŷ�ó TABLE ���� (company)
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
-- �ŷ�ó �߰�
INSERT INTO company
VALUES( '1111111120','MyRP10','100-81-11111','������','110211-1234566',
        'aaa','aaa','aaa','Y');
COMMIT;
-- �ŷ�ó ���� �˻� (1~10�� Ʃ��)
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
-- ǰ�� TABLE ���� (product)
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
-- �λ��ڵ�׷� TABLE ���� (hr_code_group)
--------------------------------------------------------------------------------
CREATE TABLE hr_code_group(
    hr_code_group_id    NUMBER(1)       PRIMARY KEY,
    hr_code_group_name  VARCHAR2(255)   NOT NULL,
    use_state           CHAR(1)         DEFAULT 'Y' NOT NULL
                        CHECK(use_state = 'Y' OR use_state = 'N')
);
--------------------------------------------------------------------------------
-- �λ��ڵ� TABLE ���� (hr_code)
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
-- �μ� TABLE ���� (department)
--------------------------------------------------------------------------------
CREATE TABLE department(
    dept_id             NUMBER(4)       PRIMARY KEY,
    dept_name           VARCHAR2(255)   NOT NULL,
    access_role         VARCHAR2(255),
    use_state           CHAR(1)         DEFAULT 'Y' NOT NULL
                        CHECK(use_state = 'Y' OR use_state = 'N')
);
--------------------------------------------------------------------------------
-- �λ�ī�� TABLE ���� (employee)
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
--------------------------------------------------------------------------------
-- �λ����� TABLE ���� (employee_info)
--------------------------------------------------------------------------------
DROP TABLE employee_info;
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
-- �λ�߷� TABLE ���� (personnel_appointment)
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
-- ������ TABLE ���� (retired_employee)
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
-- �ٹ���� TABLE ���� (work_record)
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
-- ���� TABLE ���� (service_attitude)
--------------------------------------------------------------------------------
DROP TABLE service_attitude;
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
-- �޿����� TABLE ���� (salary_register)
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
--  �޿� TABLE ���� (salary)
--------------------------------------------------------------------------------
DROP TABLE salary;
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
INSERT INTO order_state VALUES('123456789000','11111');
--------------------------------------------------------------------------------
-- ���� TABLE ���� (account)
--------------------------------------------------------------------------------
CREATE TABLE account (
    account_id            CHAR(12)     PRIMARY KEY,
    order_id              CHAR(12),
    account_balance       NUMBER(18)   DEFAULT 0,
    account_name          VARCHAR2(40) NOT NULL,
    CONSTRAINT FK_order_id FOREIGN KEY(order_id)
                           REFERENCES order_state(order_id)
);
INSERT INTO account
VALUES ('111111111111','123456789000',0,'�����̸�');
INSERT INTO account VALUES ('111111111112','123456789000',0,'�����̸�');
INSERT INTO account VALUES ('111111111113','123456789000',0,'�����̸�');
INSERT INTO account VALUES ('111111111114','123456789000',0,'�����̸�');
INSERT INTO account VALUES ('111111111115','123456789000',0,'�����̸�');
INSERT INTO account VALUES ('111111111116','123456789000',0,'�����̸�');
INSERT INTO account VALUES ('111111111117','123456789000',0,'�����̸�');
INSERT INTO account VALUES ('111111111118','123456789000',0,'�����̸�');
INSERT INTO account VALUES ('111111111119','123456789000',0,'�����̸�');
INSERT INTO account VALUES ('111111111110','123456789000',0,'�����̸�');
INSERT INTO account VALUES ('111111111121','123456789000',0,'�����̸�');
INSERT INTO account VALUES ('111111111122','123456789000',0,'�����̸�');
--------------------------------------------------------------------------------
-- ���� TABLE ���� (bank_account)
--------------------------------------------------------------------------------
CREATE TABLE bank_account (
    bank_account_id       CHAR(12)     PRIMARY KEY, -- �����ڵ�(�����ڵ�)
    bank_account_name     CHAR(20)     NOT NULL,-- ���¸�
    bank_account_number   VARCHAR2(20) NOT NULL,--���¹�ȣ
    bank_account_balance  NUMBER(18)   DEFAULT 0,--�ܾ�
    bank_account_type     VARCHAR2(12)  NOT NULL,--����Ÿ��
    bank_name             VARCHAR2(12)  NOT NULL,--����� 
    use_state             CHAR(1)      DEFAULT 'Y'--������
                          CHECK (use_state = 'Y' OR use_state ='N'),
    reg_date              DATE         DEFAULT SYSDATE,--�������
    CONSTRAINT FK_bank_account_id FOREIGN KEY(bank_account_id)   
                                  REFERENCES account(account_id)   
);

INSERT INTO bank_account
VALUES ('111111111111','�ڻ����','12345-1234-12',0,'����Ÿ��','��������','Y',sysdate);
INSERT INTO bank_account
VALUES ('111111111112','�ڻ����','12345-1234-12',0,'����Ÿ��','��������','Y',sysdate);
INSERT INTO bank_account
VALUES ('111111111113','�ڻ����','12345-1234-12',0,'����Ÿ��','��������','Y',sysdate);
INSERT INTO bank_account
VALUES ('111111111114','�ڻ����','12345-1234-12',0,'����Ÿ��','��������','Y',sysdate);
INSERT INTO bank_account
VALUES ('111111111115','�ڻ����','12345-1234-12',0,'����Ÿ��','��������','Y',sysdate);
INSERT INTO bank_account
VALUES ('111111111116','�ڻ����','12345-1234-12',0,'����Ÿ��','��������','Y',sysdate);
INSERT INTO bank_account
VALUES ('111111111117','�ڻ����','12345-1234-12',0,'����Ÿ��','��������','Y',sysdate);
INSERT INTO bank_account
VALUES ('111111111118','�ڻ����','12345-1234-12',0,'����Ÿ��','��������','Y',sysdate);
INSERT INTO bank_account
VALUES ('111111111119','�ڻ����','12345-1234-12',0,'����Ÿ��','��������','Y',sysdate);
INSERT INTO bank_account
VALUES ('111111111110','�ڻ����','12345-1234-12',0,'����Ÿ��','��������','Y',sysdate);
INSERT INTO bank_account
VALUES ('111111111122','�ڻ����','12345-1234-12',0,'����Ÿ��','��������','Y',sysdate);
INSERT INTO bank_account
VALUES ('111111111121','�ڻ����','12345-1234-12',0,'����Ÿ��','��������','Y',sysdate);
--------------------------------------------------------------------------------
-- ��ǥ TABLE ���� (statement)
--------------------------------------------------------------------------------
CREATE TABLE statement (
    statement_id          CHAR(12)     PRIMARY KEY, --��ǥ��ȣ
    connected_id          CHAR(12)     , --�ֹ���ȣ
    account_id            CHAR(12)     , --�����ڵ�
    reg_date              DATE         DEFAULT SYSDATE, --�������
    account_value         NUMBER(18)   NOT NULL, --�����ݾ�
    approval_state        NUMBER(5)    DEFAULT 0, --�ֹ�����
    CONSTRAINT statement_FK1 FOREIGN KEY(connected_id,account_id)
                               REFERENCES sales_order(sales_id, account_id),
    CONSTRAINT statement_FK2 FOREIGN KEY(connected_id,account_id)
                               REFERENCES salary_register(salary_register_id, account_id),
    CONSTRAINT statement_FK3 FOREIGN KEY(connected_id,account_id)
                               REFERENCES purchase_order(purchase_id, account_id)
);

--------MyRP �������� Table ���� SQL--------
DROP TABLE warehouse_information;
DROP TABLE stock_information;
DROP TABLE stock_order;
DROP TABLE movement_warehouse;
DROP TABLE defective_warehouse;
DROP TABLE adjustment_inventory;
DROP TABLE storage_out_order;
DROP TABLE storage_in_order;

CREATE TABLE warehouse_information (
warehouse_id        NUMBER(4)	PRIMARY KEY,
warehouse_name      VARCHAR(10)	NOT NULL,
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
CONSTRAINT stock_order_FK2 FOREIGN KEY(warehouse_id) REFERENCES warehouse_information(warehouse_id),
CONSTRAINT stock_order_FK3 FOREIGN KEY(product_id) REFERENCES product(product_id),
CONSTRAINT stock_order_FK4 FOREIGN KEY(stock_order_id) REFERENCES order_state(order_id)
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

DROP TABLE sales_order;
CREATE TABLE sales_order
(
  sales_id          CHAR(12)    NOT NULL, /* �ֹ���ȣ */
  account_id        CHAR(12)    NOT NULL, /* �����ڵ� */
  order_id          CHAR(12),   /* �ֹ���ȣ */
  product_id        CHAR(12),   /* ��ǰ��ȣ */
  company_id        CHAR(10),   /* ȸ���ȣ */
  employee_id       NUMBER(4),  /* �����ȣ */
  reg_date          DATE DEFAULT SYSDATE, /* ������� */
  update_date       DATE DEFAULT SYSDATE, /* ������������*/
  storage_out_date  DATE DEFAULT SYSDATE, /* ����� */
  count_sales       NUMBER(4)    NOT NULL, /* �ǸŰ��� */
  selling_price     NUMBER(10)   NOT NULL, /* �ǸŰ� */
  sales_state       NUMBER(5)    DEFAULT 0, /* �ֹ����� */
  condition_note_receivable      NUMBER(2) DEFAULT 3,  /* �������� */
  
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

DROP TABLE purchase_order;
CREATE TABLE purchase_order (
	purchase_id       CHAR(12)       NOT NULL,  /* �ֹ���ȣ */
	account_id        CHAR(12)       NOT NULL,  /* �����ڵ� */
	order_id          CHAR(12),                 /* �ֹ���ȣ */
	product_id        CHAR(12),                 /* ��ǰ��ȣ */
	company_id        CHAR(12),                 /* ȸ���ȣ */
	employee_id       NUMBER(4),                /* �����ȣ */
	reg_date          DATE DEFAULT    SYSDATE,  /* ������� */
	update_date       DATE DEFAULT    SYSDATE,  /* ������������ */
	storage_in_date   DATE DEFAULT    SYSDATE,  /* �԰��� */
	count_purchase    NUMBER(4),                /* ���Ű��� */
	supply_price      NUMBER(10)      NOT NULL, /* ���ް� */
	purchase_state    NUMBER(5)       DEFAULT 0, /* �ǸŻ��� */
  condition_note_payable NUMBER(2)  DEFAULT 3, /* �������� */
  
  CONSTRAINT purchase_order_pk    PRIMARY KEY(purchase_id, account_id),
  CONSTRAINT purchase_order_fk1   FOREIGN KEY(account_id)   REFERENCES account(account_id),
  CONSTRAINT purchase_order_fk2   FOREIGN KEY(order_id)     REFERENCES order_state(order_id),
  CONSTRAINT purchase_order_fk3   FOREIGN KEY(product_id)   REFERENCES product(product_id),
  CONSTRAINT purchase_order_fk4   FOREIGN KEY(company_id)   REFERENCES company(company_id),
  CONSTRAINT purchase_order_fk5   FOREIGN KEY(employee_id)  REFERENCES employee(employee_id)
	
);

commit;