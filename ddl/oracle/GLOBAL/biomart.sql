--
-- Type: USER; Name: BIOMART
--
CREATE USER "BIOMART" IDENTIFIED BY VALUES 'S:AC6B55347D02816D681B481FB130C75B6334E91A6B9AC3EE02B5D80AB4B0;EE8EC2CF8301F8AE'
   DEFAULT TABLESPACE "TRANSMART"
   TEMPORARY TABLESPACE "TEMP";
--
-- Type: TABLESPACE_QUOTA; Name: BIOMART
--
  DECLARE 
  TEMP_COUNT NUMBER; 
  SQLSTR VARCHAR2(200); 
BEGIN 
  SQLSTR := 'ALTER USER "BIOMART" QUOTA UNLIMITED ON "TRANSMART"';
  EXECUTE IMMEDIATE SQLSTR;
EXCEPTION 
  WHEN OTHERS THEN
    IF SQLCODE = -30041 THEN 
      SQLSTR := 'SELECT COUNT(*) FROM USER_TABLESPACES 
              WHERE TABLESPACE_NAME = ''TRANSMART'' AND CONTENTS = ''TEMPORARY''';
      EXECUTE IMMEDIATE SQLSTR INTO TEMP_COUNT;
      IF TEMP_COUNT = 1 THEN RETURN; 
      ELSE RAISE; 
      END IF;
    ELSE
      RAISE;
    END IF;
END;
/
 
 
--
-- Type: ROLE_GRANT; Name: BIOMART
--
GRANT "CONNECT" TO "BIOMART";

GRANT "RESOURCE" TO "BIOMART";
GRANT "DBA" TO "BIOMART";

--
-- Type: SYSTEM_GRANT; Name: BIOMART
--
GRANT CREATE TABLE TO "BIOMART";
GRANT UNLIMITED TABLESPACE TO "BIOMART";

