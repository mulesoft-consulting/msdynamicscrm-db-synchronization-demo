CREATE TABLE Account (
  ID number(10) NOT NULL,
  AccountNumber varchar2(100) DEFAULT NULL,
  AccountSource varchar2(200) DEFAULT NULL,
  AnnualRevenue varchar2(10) DEFAULT NULL,
  AccountCurrency varchar2(200) DEFAULT NULL,
  BillingCity varchar2(200) DEFAULT NULL,
  BillingCountry varchar2(200) DEFAULT NULL,
  BillingPostalCode varchar2(200) DEFAULT NULL,
  BillingState varchar2(200) DEFAULT NULL,
  BillingStreet varchar2(200) DEFAULT NULL,
  Description varchar2(2000) DEFAULT NULL,
  Fax varchar2(200) DEFAULT NULL,
  Industry varchar2(200) DEFAULT NULL,
  LastModifiedDate date DEFAULT SYSTIMESTAMP NOT NULL,
  Name varchar2(200) DEFAULT NULL,
  NumberOfEmployees varchar2(10) DEFAULT NULL,
  OwnerId varchar2(200) DEFAULT NULL,
  Ownership varchar2(200) DEFAULT NULL,
  ParentId varchar2(200) DEFAULT NULL,
  Phone varchar2(200) DEFAULT NULL,
  Rating varchar2(200) DEFAULT NULL,
  ShippingCity varchar2(200) DEFAULT NULL,
  ShippingCountry varchar2(200) DEFAULT NULL,
  ShippingPostalCode varchar2(200) DEFAULT NULL,
  ShippingState varchar2(200) DEFAULT NULL,
  ShippingStreet varchar2(200) DEFAULT NULL,
  Sic varchar2(200) DEFAULT NULL,
  SicDesc varchar2(200) DEFAULT NULL,
  Site varchar2(200) DEFAULT NULL,
  TickerSymbol varchar2(200) DEFAULT NULL,
  Type varchar2(200) DEFAULT NULL,
  Website varchar2(200) DEFAULT NULL,
  SalesforceId varchar2(200) DEFAULT '',
  DynamicsId VARCHAR2(100),
  LastModifiedById varchar2(200) DEFAULT 'mule@localhost' NOT NULL,
  PRIMARY KEY (ID)
);


-- Generate ID using sequence and trigger
CREATE SEQUENCE Account_seq START WITH 448 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER Account_seq_tr
 BEFORE INSERT ON Account FOR EACH ROW
 WHEN (NEW.ID IS NULL)
BEGIN
 SELECT Account_seq.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/
