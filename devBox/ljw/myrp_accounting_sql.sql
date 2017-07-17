--------------------------------------------------------------------------------
-- 계정 TABLE 생성 (account)
--------------------------------------------------------------------------------
CREATE TABLE account (
    account_id            CHAR(12)     PRIMARY KEY, --계정코드
    order_id              CHAR(12), --주문번호
    account_balance       NUMBER(18)   DEFAULT 0, --잔액
    account_name          VARCHAR2(255) NOT NULL, --계정명
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
                                  REFERENCES account (account_id)   
);
--------------------------------------------------------------------------------
-- 전표 TABLE 생성 (statement)
--------------------------------------------------------------------------------
CREATE TABLE statement (
    statement_id          CHAR(12)     , --전표번호
    connected_id          CHAR(12)     , --주문번호
    account_id            CHAR(12)     , --계정코드
    reg_date              DATE         DEFAULT SYSDATE, --등록일자
    account_value         NUMBER(18)   NOT NULL, --계정금액
    approval_state        NUMBER(5)    DEFAULT 0, --승인상태
    statement_type		  NUMBER(5)    NOT NULL, --전표타입 
    CONSTRAINT statement_PK PRIMARY KEY(statement_id, connected_id),
    CONSTRAINT statement_FK1 FOREIGN KEY(connected_id,account_id)
                               REFERENCES sales_order(sales_id, account_id),
    CONSTRAINT statement_FK2 FOREIGN KEY(connected_id,account_id)
                               REFERENCES salary_register(salary_register_id, account_id),
    CONSTRAINT statement_FK3 FOREIGN KEY(connected_id,account_id)
                               REFERENCES purchase_order(purchase_id, account_id)
);