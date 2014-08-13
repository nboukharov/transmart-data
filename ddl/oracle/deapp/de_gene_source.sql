--
-- Type: TABLE; Owner: DEAPP; Name: DE_GENE_SOURCE
--
 CREATE TABLE "DEAPP"."DE_GENE_SOURCE" 
  (	"GENE_SOURCE_ID" NUMBER(5,0), 
"GENE_SOURCE_NAME" VARCHAR2(255 BYTE) NOT NULL ENABLE, 
"VERSION" VARCHAR2(32 BYTE), 
"RELEASE_DATE" DATE, 
"URL" VARCHAR2(255 BYTE), 
 UNIQUE ("GENE_SOURCE_NAME")
 USING INDEX
 TABLESPACE "TRANSMART"  ENABLE, 
 PRIMARY KEY ("GENE_SOURCE_ID")
 USING INDEX
 TABLESPACE "TRANSMART"  ENABLE
  ) SEGMENT CREATION IMMEDIATE
NOCOMPRESS NOLOGGING
 TABLESPACE "TRANSMART" ;

--
-- Type: TRIGGER; Owner: DEAPP; Name: TRG_DE_GENE_SOURCE_ID
--
  CREATE OR REPLACE TRIGGER "DEAPP"."TRG_DE_GENE_SOURCE_ID" 
BEFORE
  INSERT ON DEAPP.DE_GENE_SOURCE FOR EACH ROW
BEGIN
  IF inserting THEN
    IF :NEW.GENE_SOURCE_ID IS NULL THEN
        SELECT DEAPP.SEQ_GENE_SOURCE_ID.nextval INTO :NEW.GENE_SOURCE_ID FROM dual;
    END IF;
  END IF;
END;

/
ALTER TRIGGER "DEAPP"."TRG_DE_GENE_SOURCE_ID" ENABLE;
 
