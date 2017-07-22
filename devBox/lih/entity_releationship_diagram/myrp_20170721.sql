--2번 실행하세요.
DROP TABLE ADJUSTMENT_INVENTORY;
DROP TABLE BANK_ACCOUNT;
DROP TABLE DEFECTIVE_WAREHOUSE;
DROP TABLE EMPLOYEE_INFO;
DROP TABLE MOVEMENT_WAREHOUSE;
DROP TABLE ORDER_STATE;
DROP TABLE PERSONNEL_APPOINTMENT;
DROP TABLE PURCHASE_ORDER;
DROP TABLE PURCHASE_STATEMENT;
DROP TABLE RETIRED_EMPLOYEE;
DROP TABLE SALARY;
DROP TABLE SALARY_REGISTER;
DROP TABLE SALARY_REGISTER_STATEMENT;
DROP TABLE SALES_ORDER;
DROP TABLE SALES_STATEMENT;
DROP TABLE SERVICE_ATTITUDE;
DROP TABLE STATEMENT;
DROP TABLE STOCK_ORDER;
DROP TABLE STORAGE_IN_ORDER;
DROP TABLE STORAGE_OUT_ORDER;
DROP TABLE TAX_STATEMENT;
DROP TABLE WORK_RECORD;
DROP TABLE ACCOUNT;
DROP TABLE COMPANY;
DROP TABLE EMPLOYEE;
DROP TABLE HR_CODE;
DROP TABLE HR_CODE_GROUP;
DROP TABLE STOCK_INFORMATION;
DROP TABLE WAREHOUSE_INFORMATION;
DROP TABLE DEPARTMENT;
DROP TABLE PRODUCT;

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
COMMIT;

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

INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) 
VALUES ('1100000001','회사이름 01','0010100001','이름01','0001010000011','사업자 주소입니다. 01','업테 01','종목 01','Y','S',to_date('07/13/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) 
VALUES ('1100000002','회사이름 02','0020200002','이름02','0002020000022','사업자 주소입니다. 02','업테 02','종목 02','N','C',to_date('07/12/2017', 'mm-dd-yyyy'));
INSERT INTO COMPANY (COMPANY_ID, COMPANY_NAME, BIZ_REG_NO, CEO_NAME, CORP_REG_NO, ADDRESS, BIZ_TYPE, BIZ_ITEM, USE_STATE, COMPANY_TYPE, REG_DATE) 
VALUES ('1100000003','회사이름 03','0030300003','이름03','0003030000033','사업자 주소입니다. 03','업테 03','종목 03','N','S',to_date('07/11/2017', 'mm-dd-yyyy'));
COMMIT;

Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1200000001','상품이름 01',5555555,11111110,'Y',to_date('17/07/13','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1200000002','상품이름 02',5554555,11109110,'N',to_date('17/07/12','RR/MM/DD'));
Insert into PRODUCT (PRODUCT_ID,PRODUCT_NAME,PURCHASE_UNIT_PRICE,SALE_UNIT_PRICE,USE_STATE,REG_DATE) values ('1200000003','상품이름 03',5553555,11107110,'Y',to_date('17/07/11','RR/MM/DD'));
COMMIT;


INSERT INTO WAREHOUSE_INFORMATION(WAREHOUSE_ID,WAREHOUSE_NAME,WAREHOUSE_LOCATION) VALUES(1001,'양품창고','경기도 화성시 팔탄면');
INSERT INTO WAREHOUSE_INFORMATION(WAREHOUSE_ID,WAREHOUSE_NAME,WAREHOUSE_LOCATION) VALUES(2001,'불량품창고','경기도 화성시 팔탄면');
INSERT INTO WAREHOUSE_INFORMATION(WAREHOUSE_ID,WAREHOUSE_NAME,WAREHOUSE_LOCATION) VALUES(3001,'출고대기창고','경기도 화성시 팔탄면');
COMMIT;

INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000001,1001,100);
INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000001,2001,10);
INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000002,1001,100);
INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000002,2001,10);
INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000003,1001,100);
INSERT INTO STOCK_INFORMATION(PRODUCT_ID,WAREHOUSE_ID,STOCK_AMOUNT) VALUES(1200000003,2001,10);
COMMIT;

CREATE SEQUENCE strage_in_order_SEQ
START WITH 1
MAXVALUE 99
INCREMENT BY 1
CYCLE;

CREATE SEQUENCE strage_out_order_SEQ
START WITH 1
MAXVALUE 99
INCREMENT BY 1
CYCLE;
