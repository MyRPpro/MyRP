DROP TABLE STATE;
CREATE TABLE STATE(
  CODE        NUMBER(5),
  KOR_NAME    VARCHAR(30), 
  ENG_NAME    VARCHAR(40),
  DEPT_NAME   VARCHAR(9),
  ACCESS_ROLE VARCHAR(3)
);

Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (25451,'전표미승인','disapproval_statement','회계','FI');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (25452,'전표승인','approval_statement','회계','FI');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (25453,'전표승인거절','denial_statement','인사','HR');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (26451,'급여지급요청','request_payments_salary','인사','HR');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (26452,'급여지급대기','wait_payments_salary','인사','HR');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (26453,'급여지급완료','complete_payments_salary','인사','HR');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (24101,'입고요청접수','receive_request_storage_in_warehouse','물류','FI');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (24102,'입고완료','complete_storage_in_warehouse','물류','FI');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (24201,'출고요청접수','receive_request_storage_out_warehouse','물류','FI');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (24202,'출고대기','wait_storage_out_warehouse','물류','FI');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (24203,'재고준비중','prepare_inventory','물류','FI');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (24752,'출고완료','complete_storage_out_warehouse','물류','FI');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (24753,'구매요청','request_purchase','물류','FI');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (24621,'재고조사완료','complete_inventory','물류','FI');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (22211,'판매견적요청','check_sales_estimate','영업','SA');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (22212,'판매견적승인','approval_sales_estimate','영업','SA');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (22213,'판매전표승인요청','request_approval_sales_statement','영업','SA');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (22214,'판매전표승인완료','complete_approval_sales_statement','영업','SA');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (22215,'마감','deadline','영업','SA');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (22222,'영업출고요청','request_sales_storage_out_warehouse','영업','SA');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (22223,'영업출고완료','complete_sales_storage_out_warehouse','영업','SA');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (22411,'수금대기','wait_colleciton','영업','SA');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (22412,'수금완료','complete_colleciton','영업','SA');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (23201,'주문확인','check_order','구매','PU');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (23202,'구매전표승인요청','request_approval_purchase_statement','구매','PU');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (23203,'구매전표승인완료','complete_approval_purchase_statement','구매','PU');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (23204,'구매입고요청','request_purchase_storage_in_warehouse','구매','PU');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (23205,'구매입고완료','complete_purchase_storage_in_warehouse','구매','PU');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (23206,'지급대기','wait_payments_salary','구매','PU');
Insert into STATE (CODE,KOR_NAME,ENG_NAME,DEPT_NAME,ACCESS_ROLE) values (23207,'지급완료','complete_payments_salary','구매','PU');

COMMIT;