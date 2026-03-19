USE ROLE securityadmin;

GRANT ROLE _warner_store__qlikview_datasets__creator TO ROLE warner_batch_dataload;
GRANT ROLE warner_batch_dataload TO ROLE dba;

--Initial setup
--Warner Retail Dashboard
--SOurce retail schema

USE ROLE warner_batch_dataload;
USE SCHEMA warner_store.qlikview_datasets;

--vw_DimEmployees
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_DimEmployees (
		EmployeeId bigint,
		LastName varchar(50),
		FirstName varchar(50),
		MiddleInitial varchar(50),
		FullName varchar(200),
		ESL varchar(50),
		EposUserName varchar(100),
		DefaultRoleId smallint,
		DefaultRoleName varchar(50),
		NINumber varchar(50),
		PayrollNumber varchar(50),
		ImportExportRef varchar(50),
		StartDate timestamp,
		LeaveDate timestamp,
		ReinstatementDate timestamp,
		Terminated smallint,
		TerminationCode smallint,
		TerminationNote varchar(1000),
		ReinstatementCode smallint,
		ReinstatementNote varchar(1000),
		EposUser smallint,
		DOB timestamp,
		AddressLine1 varchar(50),
		AddressLine2 varchar(50),
		AddressLine3 varchar(50),
		Postcode varchar(50),
		Telephone varchar(50),
		Mobile varchar(50),
		Email varchar(50),
		LMDT varchar(50),
		Employee varchar(200)
		);

--vw_FactEPOSPurchaseUnits
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactEPOSPurchaseUnits (
		ProdCode float,
		Unit_Name varchar(10),
		Flavour varchar(10),
		Import_ExportReference varchar(15),
		Barcode varchar(20),
		UnitCost number,
		DefaultFlag char(1),
		LMDT timestamp,
		TableReloadTime timestamp
		);

--vw_FactEPOSSalesTransactions
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactEPOSSalesTransactions (
		ProdCode bigint,
		TerminalID int,
		EmployeeID bigint,
		TransDate timestamp, -- This is the Incremental column for those that should be filtered, for now it's greater than or equal to 2023-01-01 
		BreakType varchar(2),
		GuestWeekByBreak decimal(18,9),
		GuestWeekByDay decimal(18,9),
		HalfHour varchar(5),
		Gross float,
		Tariff float,
		NetSales float,
		Qty float,
		Cost float,
		IncTax float,
		Discount float,
		NetNetSales float,
		TheoProfit float,
		TableReloadTime timestamp
		);
		
--vw_FactEPOSTransactions
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactEPOSTransactions (
		Transactionid bigint,
		TransactionOrder bigint,
		DiscCode smallint,
		SwipeCardNumber varchar(25),
		TerminalID float,
		OrderLine bigint,
		Transtimestamp timestamp,
		TransDate timestamp, -- This is the Incremental column for those that should be filtered, for now it's greater than or equal to 2023-01-01 
		TransTime varchar(5),
		TimeCategory varchar(13),
		HalfHour varchar(5),
		ProdCode float,
		PortCode smallint,
		PromoID smallint,
		Quantity float,
		Gross float,
		Discount float,
		Promotion float,
		LMDT timestamp,
		TransYear int,
		CardType varchar(12),
		HasSwipeCard int,
		TableReloadTime timestamp
		);
		
--vw_MasterCalendar
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_MasterCalendar (
		Date timestamp,
		TransDate timestamp, -- This is the Incremental column for those that should be filtered, for now it's greater than or equal to 2023-01-01 
		Month char(3),
		Year int,
		Period tinyint,
		Month_Year varchar(8),
		WeekNo int,
		Week varchar(7)
		);
		
--vw_Product
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_Product (
		ProductID int,
		Product varchar(20),
		ProdCode bigint,
		Category varchar(50),
		Subcategory varchar(50),
		Division varchar(50),
		DivTypeName varchar(50),
		ExtName varchar(50),
		SubCatID smallint,
		RetName varchar(40),
		PchName varchar(40),
		ProdRef varchar(20),
		ProdType varchar(20),
		StkUnit varchar(10),
		PchUnit varchar(10),
		SuppName varchar(20),
		BudCost number,
		GiftCard boolean,
		Discounted boolean,
		Tax1ID smallint,
		Tax1Name varchar(20),
		Tax1RateId smallint,
		Tax1Rate decimal(7,2),
		CatName varchar(20),
		Discontinued varchar(1),
		BarCode varchar(40),
		Portion varchar(50),
		RRP number
		);
		
--vw_PurchaseUnits
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_PurchaseUnits (
		ProdCode bigint,
		Unit_Name varchar(10),
		Flavour varchar(10),
		Import_ExportReference varchar(15),
		Barcode varchar(20),
		UnitCost number,
		DefaultFlag char(1),
		LMDT varchar(30)
		);

--vw_SalesTransactions
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_SalesTransactions (
		ProdCode bigint,
		TerminalID int,
		EmployeeID bigint,
		TransDate timestamp,
		BreakType varchar(2),
		GuestWeekByBreak decimal(18,9),
		GuestWeekByDay decimal(18,9),
		HalfHour varchar(5),
		Gross float,
		Tariff float,
		NetSales float,
		Qty float,
		Cost float,
		IncTax float,
		Discount float,
		NetNetSales float,
		TheoProfit float,
		TableReloadTime timestamp
		);

DROP FILE FORMAT warner_store.qlikview_datasets.qlikview_datasets_file_format;

CREATE OR REPLACE FILE FORMAT warner_store.qlikview_datasets.qlikview_datasets_file_format
TYPE = CSV
FIELD_DELIMITER = '|'
COMPRESSION = GZIP
RECORD_DELIMITER = '\n'
ESCAPE = '\\'
ESCAPE_UNENCLOSED_FIELD = NONE
FIELD_OPTIONALLY_ENCLOSED_BY = '"'
REPLACE_INVALID_CHARACTERS = TRUE
;

CREATE OR REPLACE STAGE warner_store.qlikview_datasets.qlikview_datasets_stage
FILE_FORMAT = warner_store.qlikview_datasets.qlikview_datasets_file_format;

SHOW stages;
SHOW FILE FORMATS;

SHOW WAREHOUSES;

USE WAREHOUSE bourne_batch_dataload_xsmall;
SELECT count(*) FROM VW_SALESTRANSACTIONS;


COPY INTO warner_store.qlikview_datasets.VW_DIMEMPLOYEES 
FROM @warner_store.qlikview_datasets.QLIKVIEW_DATASETS_STAGE/VW_DIMEMPLOYEES
--VALIDATION_MODE = RETURN_ALL_ERRORS
;

COPY INTO warner_store.qlikview_datasets.VW_PURCHASEUNITS 
FROM @warner_store.qlikview_datasets.QLIKVIEW_DATASETS_STAGE/VW_PURCHASEUNITS
--VALIDATION_MODE = RETURN_ALL_ERRORS
;

COPY INTO warner_store.qlikview_datasets.VW_PRODUCT 
FROM @warner_store.qlikview_datasets.QLIKVIEW_DATASETS_STAGE/VW_PRODUCT
--VALIDATION_MODE = RETURN_ALL_ERRORS
;

COPY INTO warner_store.qlikview_datasets.VW_FACTEPOSPURCHASEUNITS 
FROM @warner_store.qlikview_datasets.QLIKVIEW_DATASETS_STAGE/VW_FACTEPOSPURCHASEUNITS
--VALIDATION_MODE = RETURN_ALL_ERRORS
;

--31/05/2024
--Added new table for Retail dashboard

USE ROLE warner_batch_dataload;
USE SCHEMA warner_store.qlikview_datasets;
USE WAREHOUSE bourne_batch_dataload_xsmall;

CREATE table warner_store.qlikview_datasets.vw_DimEPOSCompany (
		HotelID int,
		TerminalID int,
		SaName varchar(20),
		SiteName varchar(20),
		POSCode int,
		SaCode int,
		SiteCode smallint,
		AreaCode smallint,
		CoCode smallint,
		SiteRef varchar(10),
		PosName varchar(20),
		AreaName varchar(20),
		CoName varchar(20),
		Company_Deleted varchar(1),
		HotelCode varchar(50),
		Hotel varchar(50)
		);
		
--DROP TABLE 	warner_store.qlikview_datasets.vw_DimEPOSCompany;
	
SHOW TABLES;

SELECT transdate, count(*)
FROM VW_FACTEPOSTRANSACTIONS
GROUP BY 1 ORDER BY 1 DESC;

-- 05/06/2024
-- Warner Inventory Dashboard
-- source dbo schema

USE ROLE warner_batch_dataload;
USE SCHEMA warner_store.qlikview_datasets;

--vw_Calendar
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_Calendar (
		DateId float,
		HolidayDate date,
		Day int,
		Week int,
		Month char(3),
		MonthYear varchar(8),
		Year int,
		WeekDay char(3),
		Quarter varchar(31),
		QtrYear varchar(42),
		NumberOfCalDays int,
		WeekedFlag varchar(3),
		IsLeapYear varchar(8)
		);

--vw_FactInventory
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactInventory (
		MasterPriceBandID varchar(154),
		MasterSignatureID varchar(53),
		MasterAttributeID varchar(75),
		HotelCode char(2),
		HotelRoomNo varchar(13),
		Hotel varchar(50),
		Location varchar(50),
		RoomCategory varchar(30),
		RoomGrade varchar(4),
		RoomCategoryGeneric varchar(50),
		RoomNumber varchar(10),
		RoomName varchar(100),
		RoomCapacity tinyint,
		FloorDescription varchar(30),
		IsGroundFloor int,
		BedDescription varchar(50),
		IsSingleRoom int,
		IsDoubleRoom int,
		IsTwinRoom int,
		IsDoubleAndTwinRoom int,
		BathroomDescription varchar(50),
		HasShower int,
		HasBath int,
		HasRollinShower int,
		ViewDescription varchar(50),
		HasGardenView int,
		HasSeaView int,
		HasLakeView int,
		NewRoom varchar(5),
		IsNewRoom int,
		PatioBalcony varchar(10),
		HasPatioBalcony int,
		HasBalconyBalcony int,
		HasNoBalcony int,
		RoomSize varchar(20),
		IsSuite int,
		PriceBand smallint,
		WheelchairAccessible varchar(3),
		HasWheechairAccess int,
		LiftAccessSeaware varchar(5),
		HasLiftAccess int,
		LiftAccess varchar(3),
		StepsToRoom int,
		DistanceFromReception smallint,
		DistFromRecBand varchar(8),
		DistanceFromRestaurant smallint,
		DistFromResBand varchar(8),
		DistanceFromEntertainment smallint,
		DistFromEntBand varchar(8),
		DistanceFromCarPark smallint,
		DistanceFromCarPBand varchar(8),
		DedicatedParking varchar(3),
		HasDedicatedParking int,
		GoOutsideToGetToRoom varchar(3),
		PatioBalconyDirection varchar(20),
		DoorWidth int,
		ShowerStepSize int,
		WARoomsGrabRailsSideLookingTaps varchar(20),
		SeparateStandingBathAndShower varchar(3),
		WheelchairExternalAccess varchar(3),
		QuietLocation varchar(3),
		IsQuietLocation int,
		BedSizeDescription varchar(50),
		BedType varchar(30),
		TVSizeBedroom varchar(50),
		TVSizeLounge varchar(50),
		Telephone varchar(3),
		FreeWiFi varchar(3),
		Safe varchar(3),
		TeaCoffeeMakingFacilities varchar(3),
		CoffeeMachine varchar(3),
		MiniBar varchar(3),
		Hairdryer varchar(3),
		ChairsInroom int,
		FullLengthMirror varchar(3),
		IronAndIroningBoard varchar(3),
		PatioAccessibleScooters varchar(3),
		MainRoomRefurb date,
		BathRoomRefurb date,
		RoomBuilt date,
		ProposedRefurbDate date,
		ProposedRefurbDetail varchar(200),
		ToiletGrabRailSideFromToilet varchar(20),
		EffectiveFrom date,
		EffectiveFrom_Status varchar(7),
		EffectiveTo date,
		HolidayDate date,
		BedCapacity tinyint,
		RoomBlocked tinyint,
		RoomsAvailable tinyint,
		BedAvailable tinyint,
		AttributeValue varchar(11),
		AdditionalViewComments varchar(255),
		AdditionalNotes varchar(255),
		AlarmPullsInBedroom varchar(2),
		AlarmPullsInBathroom varchar(2),
		LowerBath varchar(2),
		Fridge varchar(2),
		Attribute varchar(9)
		);

--vw_FactInventoryMasterAttributePricing
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactInventoryMasterAttributePricing (
		MasterAttributeID varchar(205),
		HotelCode varchar(2),
		RoomAttribute varchar(50),
		RoomAttributeValue varchar(50),
		RoomAttributePrice decimal(18,9),
		AttributePriceFrom date,
		AttributePriceTo date,
		Grade varchar(100)
		);

--vw_FactInventoryMasterPriceBands
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactInventoryMasterPriceBands (
		MasterPriceBandID varchar(1104),
		HotelCode varchar(2),
		GenericGrade varchar(1000),
		PriceBand smallint,
		PricePerPersonPerDay decimal(18,9),
		PriceBandDateFrom date,
		riceBandDateTo date
		);

--vw_FactInventoryMasterSignatureExperienceCheckIn
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactInventoryMasterSignatureExperienceCheckIn (
		MasterSignatureID varchar(1003),
		HotelCode varchar(2),
		GenericGrade varchar(1000),
		SignatureExperience varchar(1),
		CheckIn time
		);
	
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactInventoryMasterSignatureExperienceCheckIn_stage (
		MasterSignatureID varchar(1003),
		HotelCode varchar(2),
		GenericGrade varchar(1000),
		SignatureExperience varchar(1),
		CheckIn timestamp_ntz
		);

USE ROLE dba;

DROP table WARNER_STORE.QLIKVIEW_DATASETS.vw_FactInventoryMasterSignatureExperienceCheckIn_stage;

INSERT INTO WARNER_STORE.QLIKVIEW_DATASETS.vw_FactInventoryMasterSignatureExperienceCheckIn_stage
SELECT MasterSignatureID, HotelCode, GenericGrade, SignatureExperience, concat(to_date('1900-01-01'), checkin)::TIMESTAMP FROM WARNER_STORE.QLIKVIEW_DATASETS.vw_FactInventoryMasterSignatureExperienceCheckIn;

--vw_RoomGrade
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_RoomGrade (
		ValidFrom date,
		ValidTo date,
		HotelCode char(2),
		Hotel varchar(50),
		RoomCategoryGeneric varchar(50),
		Location varchar(50),
		RoomCategory varchar(30),
		RoomNumber varchar(10),
		RoomCapacity tinyint,
		FloorDescription varchar(30),
		BedDescription varchar(50),
		BathroomDescription varchar(50),
		RoomSize varchar(20),
		PatioBalcony varchar(10),
		ViewDescription varchar(50),
		LiftAccess varchar(3),
		WheelchairAccessible varchar(3),
		NewRoom varchar(5),
		RoomName varchar(100),
		PriceBand smallint,
		AP_RoomGrade varchar(100)
		);

--vw_SummaryV2
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_SummaryV2 (
		HolidayDate date,
		HotelCode char(2),
		RoomNumber varchar(10),
		RoomBlocked tinyint,
		Key_Features_Values varchar(50),
		Key_Features varchar(128)
		);


-- Frequency is once a day during 12:00pm to 2:00pm for jobs to run.

-- Contact Bagal, Pranay / Japtap, Abhijeet for issues.
	
-- 05/06/2024
-- Warner Customer Care Dashboard
-- source customercare schema

--vw_CareLinkTable
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_CareLinkTable (
		CareTransferID int,
		FerrysID int,
		MailMergeEntsChangeID int,
		QuickResponseID int,
		CustomerCareLetterID int,
		Holiday_Start_Date varchar(4000),
		HotelCode varchar(255)
		);

--vw_CreationCalendar
		CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_CreationCalendar (
		Created_Date varchar(30),
		CreationDateId float,
		CreationDay int,
		CreationWeekStart varchar(30),
		CreationMonth char(3),
		CreationMonthName varchar(8),
		CreationYear int,
		CreationWeekday char(3),
		CreationQuarter varchar(31)
		);

--vw_CustomerCareLetters
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_CustomerCareLetters (
		CustomerCareLetterID int,
		Customer_Care_Guest varchar(255),
		Letter_BookingReference varchar(255),
		TypeOfLetter varchar(255),
		HotelCode varchar(255),
		Date_Letter_Received varchar(30),
		Acknowledgement_Sent date,
		Compensation decimal(12,2),
		Compensation_Description varchar(4000),
		Guest_Satisfaction varchar(4000),
		Letter_Status varchar(255),
		Resolved_By varchar(255),
		Correspondance_Attached varchar(255),
		Date_Letter_Created date,
		Letter_Created_By varchar(100),
		Care_Letter_Threshold varchar(19)
		);

--vw_FactCustomerCareHoldRequest
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactCustomerCareHoldRequest (
		BookingNumber varchar(8),
		GuestName varchar(255),
		ClientID varchar(8),
		DateCreated timestamp,
		HolidayStartDate timestamp,
		Hotel varchar(255),
		TotalAmountPaid decimal(14,2),
		CancellationCharges decimal(14,2),
		TotalTransferAmount decimal(14,2),
		TransferToFrom varchar(255),
		OldGroupID varchar(8),
		OldReferenceNumber varchar(8),
		OldClientID varchar(8),
		Reason varchar(255),
		ReasonOther varchar(255),
		Location varchar(255),
		RequestAction varchar(255),
		FinanceAction varchar(255),
		FinanceNotes varchar(2000),
		Created timestamp,
		CreatedBy varchar(255),
		Modified timestamp,
		ModifiedBy varchar(255),
		SharepointID int,
		TableReloadTime timestamp
		);

--vw_FactCustomerCareLetters
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactCustomerCareLetters (
		SharepointID int,
		GuestName varchar(255),
		BookingReference varchar(255),
		TypeOfLetter varchar(255),
		SiteName varchar(255),
		DateLetterRecieved date,
		AcknowledgementSent date,
		CompensationValue decimal(12,2),
		CompensationDescription varchar(4000),
		GuestSatisfaction varchar(4000),
		Status varchar(255),
		ResolvedBy varchar(255),
		CorrespondanceAttached varchar(255),
		Created date,
		CreatedBy varchar(100),
		TableReloadTime timestamp
		);

--vw_FactCustomerCareRefundRequest
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactCustomerCareRefundRequest (
		BookingNumber varchar(8),
		GuestName varchar(255),
		ClientID varchar(8),
		DateCreated timestamp,
		HolidayStartDate timestamp,
		Hotel varchar(255),
		TotalAmountPaid decimal(14,2),
		CancellationCharges decimal(14,2),
		RefundAmount decimal(14,2),
		LastFourDigitsOnCard varchar(4),
		Reason varchar(255),
		ReasonOther varchar(255),
		Location varchar(255),
		RequestAction varchar(255),
		FinanceAction varchar(255),
		FinanceNotes varchar(2000),
		Created timestamp,
		CreatedBy varchar(255),
		Modified timestamp,
		ModifiedBy varchar(255),
		SharepointID int,
		TableReloadTime timestamp
		);

--vw_FactCustomerCareTransferRequest
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactCustomerCareTransferRequest (
		BookingNumber varchar(8),
		GuestName varchar(255),
		ClientID varchar(8),
		DateCreated timestamp,
		HolidayStartDate timestamp,
		Hotel varchar(255),
		TotalTransferAmount decimal(14,2),
		TransferToGroupID varchar(8),
		TransferToReferenceNumber varchar(8),
		TransferToClientID varchar(8),
		Reason varchar(255),
		ReasonOther varchar(255),
		AdditionalNotes varchar(2000),
		Location varchar(255),
		RequestAction varchar(255),
		FinanceAction varchar(255),
		FinanceNotes varchar(2000),
		Created timestamp,
		CreatedBy varchar(255),
		Modified timestamp,
		ModifiedBy varchar(255),
		SharepointID int,
		TableReloadTime timestamp
		);

--vw_FactCustomerQuickResponse
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactCustomerQuickResponse (
		SharepointID int,
		Hotel varchar(255),
		BookingReference varchar(255),
		LeadGuest varchar(255),
		DelegateResID varchar(255),
		DelegateGuest varchar(255),
		AgencyID varchar(255),
		Status varchar(255),
		HolidayFrom varchar(255),
		HolidayTo varchar(255),
		ReqGrade varchar(255),
		InvResult varchar(255),
		Allocated varchar(255),
		Room varchar(255),
		PriceGrade varchar(255),
		Occupancy varchar(255),
		AllocationTimestamp varchar(255),
		SpecialRequests varchar(255),
		ContactStatus varchar(255),
		ActionTaken varchar(255),
		BookingNotes varchar(4000),
		Compensation varchar(4000),
		CreatedBy varchar(255),
		Created timestamp,
		TableReloadTime timestamp
		);

--vw_FactHotlineCareFerryData
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactHotlineCareFerryData (
		FerryStatus varchar(20),
		ReservationID int,
		GroupID int,
		HotelCode char(2),
		ReservationStatus varchar(5),
		HolidayStartDate date,
		FerryConfirmationNumber varchar(30),
		VehicleRegistration varchar(20),
		Passengers smallint,
		DepartureRoute varchar(100),
		DepartureDate date,
		DepartureTime time,
		ReturnRoute varchar(100),
		ReturnDate date,
		ReturnTime time,
		TableReloadTime timestamp
		);

--vw_FactHotlineCareFerryStatusChangeData
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactHotlineCareFerryStatusChangeData (
		DataDate date,
		NewToConfirmedCount smallint,
		ChangedToConfirmedCount smallint,
		ToCanceltoCancelledCount smallint,
		WeekStart date,
		TableReloadTime timestamp
		);

--vw_FactHotlineCareGuestEscalation
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactHotlineCareGuestEscalation (
		SharepointID int,
		GuestName varchar(255),
		GuestTelephoneNumber varchar(255),
		BookingReference varchar(255),
		BookingAdvisor varchar(255),
		ReasonForSpeakingtoTeamLeader varchar(4000),
		DateCallListenedTo date,
		CallRecordingID varchar(255),
		AdvisorWhoMadeError varchar(255),
		CompensationValue varchar(255),
		CompensationDescription varchar(4000),
		CallAssignedTo varchar(255),
		CallBackMadeBy varchar(255),
		ActionTaken varchar(255),
		GuestSatisfaction varchar(255),
		GeneralComments varchar(4000),
		FollowUpCallToBeMadetoGuest varchar(255),
		Created date,
		CreatedBy varchar(255),
		TableReloadTime timestamp
		);

--vw_FactHotlineCareTransfersAndRefunds
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactHotlineCareTransfersAndRefunds (
		BookingReference int,
		Created date,
		CreatedBy varchar(50),
		GuestName varchar(255),
		Hotel varchar(30),
		HolidayStartDate date,
		SelectType varchar(30),
		BookingChannel varchar(50),
		ApprovedDeclined varchar(50),
		FinanceApprovedDeclined varchar(50),
		RefundAmount decimal(10,2),
		TransferAmount decimal(10,2),
		CancellationCharge decimal(10,2),
		SharepointID int,
		Approved_Declined varchar(12),
		Cancellation varchar(15),
		TableReloadTime timestamp
		);

--vw_FactMailMergeEntsChange
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FactMailMergeEntsChange (
		SharepointID int,
		Site varchar(5),
		JobStatus varchar(100),
		BreakStartDate date,
		DateRequested date,
		OldBreakDescription varchar(2000),
		ContactGuests varchar(10),
		ContactGuestsStatus varchar(100),
		NumberOfNights varchar(50),
		Comments varchar(2000),
		Requestor varchar(100),
		DrinksInclusive varchar(50),
		DateAgreedComGM varchar(100),
		PriceAmended varchar(50),
		GuestExtraCharge varchar(50),
		Created date,
		CreatedBy varchar(100),
		TableReloadTime timestamp
		);

--vw_FerryStatusChange
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_FerryStatusChange (
		DataDate date,
		NewToConfirmedCount smallint,
		ChangedToConfirmedCount smallint,
		ToCanceltoCancelledCount smallint,
		Holiday_Week_Start varchar(30)
		);

--vw_GuestEscalations
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_GuestEscalations (
		GuestEscalationID int,
		Guest_Name varchar(255),
		GuestTelephoneNumber varchar(255),
		EscalationReference varchar(255),
		Booking_Advisor varchar(255),
		Reason_For_Escalation varchar(4000),
		Date_Call_Listened_To varchar(30),
		CallRecordingID varchar(255),
		Advisor_In_Error varchar(255),
		Guest_Escalation_Compensation varchar(255),
		Guest_Escalation_Compensation_Description varchar(4000),
		Call_Assigned_To varchar(255),
		Call_Back_Made_By varchar(255),
		Action_data varchar(255),
		Satisfaction varchar(255),
		Escalation_Comments varchar(4000),
		Follow_Up_To_Me_Made varchar(255),
		EscalationCreatedDate varchar(30),
		EscalatedCreatedMonth int,
		EscalatedCreatedYear int,
		Escalation_Created_By varchar(255),
		Escalation_Threshold varchar(19)
		);

--vw_HolidayCalendar
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_HolidayCalendar (
		Holiday_Start_Date varchar(4000),
		Holiday_Week_Start varchar(30),
		Holiday_Month char(3),
		Holiday_Month_Year varchar(8),
		Holiday_Year int
		);

--vw_Hotel
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_Hotel (
		Hotel varchar(50),
		HotelCode char(2)
		);

--vw_HotlineCareFerryData
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_HotlineCareFerryData (
		Ferry_Status varchar(20),
		FerrysID int,
		ReservationID int,
		GroupID int,
		HotelCode char(2),
		ReservationStatus varchar(5),
		Holiday_Start_Date varchar(30),
		FerryHolidayDate varchar(30),
		Ferry_Confirmation varchar(30),
		Vehicle_Registration varchar(20),
		Passengers smallint,
		Departure_Route varchar(100),
		Departure_Date varchar(30),
		DepartureTime time,
		Return_Route varchar(100),
		Return_Date varchar(30),
		Break_Duration int,
		ReturnTime time,
		BreakWindow varchar(25),
		ReturnBeforeDeparture int,
		IsFerryConfirmed varchar(13),
		FerryRoute varchar(203),
		Grouped int
		);

--vw_HotlineCareTransfersAndRefunds
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_HotlineCareTransfersAndRefunds (
		CareTransferID int,
		BookingReference int,
		Created_Date varchar(30),
		CreatedBy varchar(50),
		GuestName varchar(255),
		HotelCode char(2),
		Holiday_Start_Date varchar(30),
		SelectType varchar(30),
		BookingChannel varchar(50),
		ApprovedDeclined varchar(50),
		FinanceApprovedDeclined varchar(50),
		RefundAmount decimal(10,2),
		TransferAmount decimal(10,2),
		CancellationCharge decimal(10,2),
		SharepointID int,
		Approved_Declined varchar(12),
		Cancellation varchar(15),
		RefundFlag int,
		DaysTime int
		);

--vw_MailMergeEntsChange
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_MailMergeEntsChange (
		MailMergeEntsChangeID int,
		Site varchar(5),
		HotelCode char(2),
		Job_Status varchar(100),
		Holiday_Start_Date varchar(4000),
		BreakStartDate varchar(4000),
		Date_requested varchar(4000),
		Old_Break_Description varchar(2000),
		ContactGuests varchar(10),
		ContactGuestsStatus varchar(100),
		Number_of_Nights varchar(50),
		Comments varchar(2000),
		Requestor varchar(100),
		DrinksInclusive varchar(50),
		DateAgreedComGM varchar(100),
		PriceAmended varchar(50),
		GuestExtraCharge varchar(50),
		Created varchar(30),
		CreateWeekStart date,
		EntsCreatedBy varchar(201),
		Within2Months int
		);

--vw_QuickResponse
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_QuickResponse (
		QuickResponseID int,
		HotelCode varchar(255),
		QuickResponseRef varchar(255),
		LeadGuest varchar(255),
		DelegateResID varchar(255),
		DelegateGuest varchar(255),
		AgencyID varchar(255),
		Status varchar(255),
		Holiday_Start_Date varchar(30),
		HolidayTo varchar(255),
		ReqGrade varchar(255),
		InvResult varchar(255),
		Allocated varchar(255),
		Room varchar(255),
		PriceGrade varchar(255),
		Occupancy varchar(255),
		AllocationTimestamp varchar(255),
		SpecialRequests varchar(255),
		ContactStatus varchar(255),
		ActionTaken varchar(255),
		BookingNotes varchar(4000),
		Quick_Response_Compensation varchar(4000),
		Quick_Response_Created_By varchar(255),
		Quick_Response_Created varchar(30)
		);


-- Frequency is once a day during 12:00pm to 2:00pm for jobs to run.

-- Contact Bagal, Pranay / Japtap, Abhijeet for issues.	
	
-- 14/06/2024

USE ROLE warner_batch_dataload;
USE SCHEMA warner_store.qlikview_datasets;

--vw_HotelListTable
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_HotelListTable (
		HotelCode CHAR(2),
		Total_Rooms INT,
		Booked_Rooms INT
);

--vw_HotelTotalBookRoom
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_HotelTotalBookRoom (
		Booked_Rooms INT
);
--vw_KeyFeatureTable
CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.vw_KeyFeatureTable (
		Key_Features VARCHAR(31),
		Total_Rooms_Availability INT,
		Total_Rooms_Booked INT
);

-- Note : No incremental column in these views.

--14/06/2024

--HotelRoomAttributesAdditional

CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.HotelRoomAttributesAdditional (
		Hotel varchar(50),
		RoomNumber varchar(10),
		LiftAccess varchar(3),
		StepsToRoom smallint,
		DistanceFromReception smallint,
		DistanceFromRestaurant smallint,
		DistanceFromEntertainment smallint,
		DistanceFromCarPark smallint,
		DedicatedParking varchar(3),
		GoOutsideToGetToRoom varchar(3),
		PatioBalconyDirection varchar(20),
		PatioAccessibleScooters varchar(3),
		DoorWidth smallint,
		ShowerStepSize smallint,
		WARoomsGrabRailsSideLookingTaps varchar(20),
		SeparateStandingBathAndShower varchar(3),
		WheelchairExternalAccess varchar(3),
		QuietLocation varchar(3),
		BedSize decimal(7,2),
		BedType varchar(30),
		TVSizeBedroom smallint,
		TVSizeLounge smallint,
		Telephone varchar(3),
		FreeWiFi varchar(3),
		Safe varchar(3),
		TeaCoffeeMakingFacilities varchar(3),
		CoffeeMachine varchar(3),
		MiniBar varchar(3),
		Hairdryer varchar(3),
		ChairsInroom smallint,
		FullLengthMirror varchar(3),
		IronAndIroningBoard varchar(3),
		SignatureExperience varchar(3),
		MainRoomRefurb date,
		BathRoomRefurb date,
		RoomBuilt date,
		ProposedRefurbDate date,
		ProposedRefurbDetail varchar(200),
		ToiletGrabRailSideFromToilet varchar(20),
		AdditionalViewComments varchar(255),
		AdditionalNotes varchar(255),
		AlarmPullsInBedroom varchar(2),
		AlarmPullsInBathroom varchar(2),
		LowerBath varchar(2),
		Fridge varchar(2)
		);


--RoomInventoryByDayHistory

CREATE TABLE WARNER_STORE.QLIKVIEW_DATASETS.RoomInventoryByDayHistory (
		HolidayYear smallint,	--	Incremental Column 
		swHotelCode char(2),
		dwHotelCode char(2),
		HolidayDate date,
		RoomTypeCode varchar(20),
		RoomNo varchar(10),
		BedCapacity tinyint,
		RoomBlocked tinyint,
		Validfrom date,
		Validto date,
		RoomsAvailable tinyint,
		BedAvailable tinyint
		);

show grants OF ROLE _warner_store__qlikview_datasets__reader;


-- 04/12/2024

USE ROLE dba;

USE SCHEMA warner_store.qlikview_datasets;

drop TABLE vw_PurchaseUnits_prechanged_lmdt;

USE ROLE warner_batch_dataload;
USE SCHEMA warner_store.qlikview_datasets;
CREATE TABLE vw_PurchaseUnits_prechanged_lmdt CLONE vw_PurchaseUnits;

CREATE OR REPLACE TABLE vw_PurchaseUnits
	(ProdCode BIGINT,
	 Unit_Name VARCHAR(10),
	 Flavour VARCHAR(10),
	 Import_ExportReference VARCHAR(15),
	 Barcode VARCHAR(20),
	 UnitCost DECIMAL(15,4),
	 DefaultFlag CHAR(1),
	 LMDT timestamp
	 );

SHOW WAREHOUSES;

USE WAREHOUSE bourne_batch_dataload_xsmall;
SELECT * FROM WARNER_STORE.QLIKVIEW_DATASETS.VW_PURCHASEUNITS LIMIT 50;	


