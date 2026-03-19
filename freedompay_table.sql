USE ROLE haven_batch_dataload;

USE SCHEMA haven_raw.freedompay;

create table card_transactions (
BusinessDate	Date,
EnterpriseCode	varchar(6),
tier1Value	varchar(50),
tier2Value	varchar(50),
tier3Value	varchar(50),
tier4Value	varchar(50),
storeId	Integer,
terminalId	Integer,
MerchantNumber	varchar(50),
xref	integer,
requestID	varchar(32),
dateUtc	timestamp,
dateLocal	timestamp,
transactionType	varchar (20),
company	varchar (40),
customerID	varchar(50),
title    	varchar (60),
firstName	varchar (60),
middleName	varchar (60),
lastName	varchar (60),
suffix	varchar (60),
street1	varchar (60),
street2	varchar (60),
street3	varchar (60),
street4	varchar (60),
city	varchar (50),
state	varchar (2),
postalCode	varchar (9),
country	varchar (3),
phoneNumber	varchar (15),
faxNumber	varchar (15),
email	varchar (255),
maskedAccountNumber	varchar (256),
cardType	varchar (256),
cardIssuer	varchar(64),
authorizationCode	varchar (10),
authorizationDateTime	varchar (30),
avsCode	varchar (1),
avsCodeRaw	varchar (10),
cvCode	varchar (1),
cvCodeRaw	varchar (10),
processorResponseCode	varchar (10),
processorResponseMessage	varchar (256),
processorTransactionId	varchar (32),
clerkNumber	varchar (16),
clientApplicationVersion	varchar (50),
comments	varchar (255),
decision	varchar(20),
invoiceNumber	varchar (20),
invoiceDate	varchar,
purchaseOrderDate	varchar,
customerPO	varchar (25),
merchantReferenceCode	varchar (50),
orderRequestID	varchar (50),
registerNumber	Integer,
entryMode	varchar(20),
currencyType	varchar(3),
discountAmount	Decimal(19,4),
hstAmount	Decimal(19,4),
gstAmount	Decimal(19,4),
pstAmount	Decimal(19,4),
qstAmount	Decimal(19,4),
taxAmount	Decimal(19,4),
tipAmount	Decimal(19,4),
invoiceFreight	Decimal(19,4),
subtotalAmount	Decimal(19,4),
grandTotalAmount	Decimal(19,4),
approvedAmount	Decimal,
cvIndicator	varchar(1),
folioNumber	varchar(50),
FreewayBatchId	integer,
FreewayBatchOpenDateUTC	varchar (50),
FreewayBatchCloseDateUTC	varchar (50),
FreewayBatchSendDateTimeUTC	varchar (50),
FreewayBatchStatus	varchar(20),
clientDeviceType	varchar(20),
clientDeviceId	varchar(50),
ForeignCurrencyCode	varchar(3),
ForeignTransactionAmount	Decimal,
DCCIndicator	varchar(1),
DCCForeignExchangeRate	Decimal,
CheckInDate    	date,
CheckOutDate	Date,
RoomRate	decimal,
Duration	number,
CurrentCycle	number,
CurrentHash	varchar(40),
clientApplication	varchar (50),
LastCycle	number,
LastHash	varchar(40),
PriorToLastCycle	number,
PriorToLastHash	varchar(40)
);

SHOW TABLES;

USE WAREHOUSE BOURNE_BATCH_DATALOAD_XSMALL; 

LS @%card_transactions;

copy into CARD_TRANSACTIONS from @%CARD_TRANSACTIONS/BourneLeisure
--validation_mode = return_all_errors
on_error = continue
file_format = (type=csv, compression=gzip, skip_header=1, field_delimiter='|');


select * from freedompay.card_transactions;

SELECT businessdate, count(*)
from freedompay.card_transactions
GROUP BY 1 ORDER BY 1
;

USE ROLE dba;

CREATE VIEW HAVEN_BASE.FREEDOMPAY.CARD_TRANSACTIONS
( BUSINESSDATE, ENTERPRISECODE, TIER1VALUE, TIER2VALUE, TIER3VALUE, TIER4VALUE, STOREID, TERMINALID, MERCHANTNUMBER, XREF, REQUESTID, DATEUTC, DATELOCAL, TRANSACTIONTYPE, COMPANY, CUSTOMERID, TITLE, FIRSTNAME, MIDDLENAME, LASTNAME, SUFFIX, STREET1, STREET2, STREET3, STREET4, CITY, STATE, POSTALCODE, COUNTRY, PHONENUMBER, FAXNUMBER, EMAIL, MASKEDACCOUNTNUMBER, CARDTYPE, CARDISSUER, AUTHORIZATIONCODE, AUTHORIZATIONDATETIME, AVSCODE, AVSCODERAW, CVCODE, CVCODERAW, PROCESSORRESPONSECODE, PROCESSORRESPONSEMESSAGE, PROCESSORTRANSACTIONID, CLERKNUMBER, CLIENTAPPLICATIONVERSION, COMMENTS, DECISION, INVOICENUMBER, INVOICEDATE, PURCHASEORDERDATE, CUSTOMERPO, MERCHANTREFERENCECODE, ORDERREQUESTID, REGISTERNUMBER, ENTRYMODE, CURRENCYTYPE, DISCOUNTAMOUNT, HSTAMOUNT, GSTAMOUNT, PSTAMOUNT, QSTAMOUNT, TAXAMOUNT, TIPAMOUNT, INVOICEFREIGHT, SUBTOTALAMOUNT, GRANDTOTALAMOUNT, APPROVEDAMOUNT, CVINDICATOR, FOLIONUMBER, FREEWAYBATCHID, FREEWAYBATCHOPENDATEUTC, FREEWAYBATCHCLOSEDATEUTC, FREEWAYBATCHSENDDATETIMEUTC, FREEWAYBATCHSTATUS, CLIENTDEVICETYPE, CLIENTDEVICEID, FOREIGNCURRENCYCODE, FOREIGNTRANSACTIONAMOUNT, DCCINDICATOR, DCCFOREIGNEXCHANGERATE, CHECKINDATE, CHECKOUTDATE, ROOMRATE, DURATION, CURRENTCYCLE, CURRENTHASH, CLIENTAPPLICATION, LASTCYCLE, LASTHASH, PRIORTOLASTCYCLE, PRIORTOLASTHASH )
AS SELECT BUSINESSDATE, ENTERPRISECODE, TIER1VALUE, TIER2VALUE, TIER3VALUE, TIER4VALUE, STOREID, TERMINALID, MERCHANTNUMBER, XREF, REQUESTID, DATEUTC, DATELOCAL, TRANSACTIONTYPE, COMPANY, CUSTOMERID, TITLE, FIRSTNAME, MIDDLENAME, LASTNAME, SUFFIX, STREET1, STREET2, STREET3, STREET4, CITY, STATE, POSTALCODE, COUNTRY, PHONENUMBER, FAXNUMBER, EMAIL, MASKEDACCOUNTNUMBER, CARDTYPE, CARDISSUER, AUTHORIZATIONCODE, AUTHORIZATIONDATETIME, AVSCODE, AVSCODERAW, CVCODE, CVCODERAW, PROCESSORRESPONSECODE, PROCESSORRESPONSEMESSAGE, PROCESSORTRANSACTIONID, CLERKNUMBER, CLIENTAPPLICATIONVERSION, COMMENTS, DECISION, INVOICENUMBER, INVOICEDATE, PURCHASEORDERDATE, CUSTOMERPO, MERCHANTREFERENCECODE, ORDERREQUESTID, REGISTERNUMBER, ENTRYMODE, CURRENCYTYPE, DISCOUNTAMOUNT, HSTAMOUNT, GSTAMOUNT, PSTAMOUNT, QSTAMOUNT, TAXAMOUNT, TIPAMOUNT, INVOICEFREIGHT, SUBTOTALAMOUNT, GRANDTOTALAMOUNT, APPROVEDAMOUNT, CVINDICATOR, FOLIONUMBER, FREEWAYBATCHID, FREEWAYBATCHOPENDATEUTC, FREEWAYBATCHCLOSEDATEUTC, FREEWAYBATCHSENDDATETIMEUTC, FREEWAYBATCHSTATUS, CLIENTDEVICETYPE, CLIENTDEVICEID, FOREIGNCURRENCYCODE, FOREIGNTRANSACTIONAMOUNT, DCCINDICATOR, DCCFOREIGNEXCHANGERATE, CHECKINDATE, CHECKOUTDATE, ROOMRATE, DURATION, CURRENTCYCLE, CURRENTHASH, CLIENTAPPLICATION, LASTCYCLE, LASTHASH, PRIORTOLASTCYCLE, PRIORTOLASTHASH
FROM HAVEN_RAW.FREEDOMPAY.CARD_TRANSACTIONS;
