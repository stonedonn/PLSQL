select user
from dual;

SELECT table_name
FROM user_tables;

SHOW tables;

SELECT * from KOR_LOAN_STATUS;



// DML:
// SELECT: ���̺��̳� �信 �ִ� �����͸� ��ȸ
// INSERT: �����͸� �űԷ� ����
// UPDATE: �̹� ������ �����͸� ����
// DELETE: �����͸� ����
// COMMIT: Ʈ����� ó��, ����� �����͸� ���� ����
// ROLLBACK: Ʈ����� ó��, ����� �����͸� �������� �ʰ� �������� �ǵ���

SELECT * FROM
EMPLOYEES;

CREATE TABLE exd2_1 (
    COLUMN1 CHAR(10),
    COLUMN2 VARCHAR2(10),
    COLUMN3 NVARCHAR2(10),
    COLUMN4 NUMBER
    );

// DATA Ÿ��
// CHAR �������� ����
// VARCHAR �������� ����
// NCHAR �������� �����ڵ� ����
// NVARCARCHAR2 �������� �����ڵ� ����
// LONG �ִ� 2GB ũ���� �������� ������ �� ������� ����

INSERT INTO exd2_1 (column1, column2) VALUES ('abc', 'abc');

CREATE TABLE ex2_2(
    COLUMN1 VARCHAR2(3),
    COLUMN2 VARCHAR2(3 byte),
    COLUMN3 VARCHAR(3 char)
    );

INSERT INTO ex2_2 VALUES('abc', 'abc', 'abc');

INSERT INTO ex2_2 (column3) VALUES ('ȫ�浿');

SELECT column3, LENGTH(column3) AS len3,
    LENGTHB(column3) AS bytelen
FROM ex2_2;

// ����Ŭ ������ DATA TYPE
// NUMBER ��������
// FLOAT NUMBER�� ���� Ÿ��

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