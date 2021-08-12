CREATE TABLE "CITIES" 
   (	"CITYID" VARCHAR2(3 BYTE) COLLATE "USING_NLS_COMP", 
	"CITY" VARCHAR2(30 BYTE) COLLATE "USING_NLS_COMP", 
	"COUNTRYID" VARCHAR2(3 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;

CREATE TABLE "COUNTRIES" 
   (	"COUNTRYID" VARCHAR2(3 BYTE) COLLATE "USING_NLS_COMP", 
	"COUNTRY" VARCHAR2(40 BYTE) COLLATE "USING_NLS_COMP", 
	"REGIONID" NUMBER(*,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;

  CREATE TABLE "PARKINGDATA" 
   (	"PARKINGDATAID" NUMBER(18,0), 
	"PARKINGID" VARCHAR2(12 BYTE) COLLATE "USING_NLS_COMP", 
	"CARREGID" VARCHAR2(12 BYTE) COLLATE "USING_NLS_COMP", 
	"INTIME" DATE, 
	"OUTTIME" DATE, 
	"PARKINGRATE" FLOAT(126)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;


  CREATE TABLE "PARKINGS" 
   (	"PARKINGID" VARCHAR2(12 BYTE) COLLATE "USING_NLS_COMP", 
	"PARKINGNAME" VARCHAR2(30 BYTE) COLLATE "USING_NLS_COMP", 
	"AVAILABLESLOT" NUMBER(*,0), 
	"COUNTRYID" VARCHAR2(3 BYTE) COLLATE "USING_NLS_COMP", 
	"CITYID" VARCHAR2(3 BYTE) COLLATE "USING_NLS_COMP", 
	"STREETADDRESS" VARCHAR2(40 BYTE) COLLATE "USING_NLS_COMP", 
	"LONGITUDE" FLOAT(126), 
	"LATITUDE" FLOAT(126)
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;

  CREATE TABLE "PAYMENTDATA" 
   (	"TRANSACTIONID" VARCHAR2(24 BYTE) COLLATE "USING_NLS_COMP", 
	"TransactionAmount" FLOAT(126), 
	"TransactionMethod" VARCHAR2(8 BYTE) COLLATE "USING_NLS_COMP", 
	"PARKINGDATAID" NUMBER(18,0), 
	"PARKINGID" VARCHAR2(12 BYTE) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP" SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DATA" ;
