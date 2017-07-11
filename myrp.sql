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
