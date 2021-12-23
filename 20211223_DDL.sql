select user
from dual;

SELECT table_name
FROM user_tables;

SHOW tables;

SELECT * from KOR_LOAN_STATUS;



// DML:
// SELECT: 테이블이나 뷰에 있는 데이터를 조회
// INSERT: 데이터를 신규로 생성
// UPDATE: 이미 생성된 데이터를 수정
// DELETE: 데이터를 삭제
// COMMIT: 트랙잭션 처리, 변경된 데이터를 최종 적용
// ROLLBACK: 트랜잭션 처리, 변경된 데이터를 적용하지 않고 이전으로 되돌림

SELECT * FROM
EMPLOYEES;

CREATE TABLE exd2_1 (
    COLUMN1 CHAR(10),
    COLUMN2 VARCHAR2(10),
    COLUMN3 NVARCHAR2(10),
    COLUMN4 NUMBER
    );

// DATA 타입
// CHAR 고정길이 문자
// VARCHAR 가변길이 문자
// NCHAR 고정길이 유니코드 문자
// NVARCARCHAR2 가변길이 유니코드 문자
// LONG 최대 2GB 크기의 가변길이 문자형 잘 사용하지 않음

INSERT INTO exd2_1 (column1, column2) VALUES ('abc', 'abc');

CREATE TABLE ex2_2(
    COLUMN1 VARCHAR2(3),
    COLUMN2 VARCHAR2(3 byte),
    COLUMN3 VARCHAR(3 char)
    );

INSERT INTO ex2_2 VALUES('abc', 'abc', 'abc');

INSERT INTO ex2_2 (column3) VALUES ('홍길동');

SELECT column3, LENGTH(column3) AS len3,
    LENGTHB(column3) AS bytelen
FROM ex2_2;

// 오라클 숫자형 DATA TYPE
// NUMBER 가변숫자
// FLOAT NUMBER의 하위 타입

CREATE TABLE ex2_3(
    COL_INT INTEGER,
    COL_DEC DECIMAL,
    COL_NUM NUMBER
);

SELECT column_id, column_name, data_type, data_length
    FROM user_tab_cols
WHERE table_name = 'EX2_3'
ORDER BY column_id;

CREATE TABLE ex2_5 (
    COL_DATE DATE,
    COL_TIMESTAMP TIMESTAMP
);

INSERT INTO ex2_5 VALUES (SYSDATE, SYSTIMESTAMP);

SELECT *
FROM ex2_5;