-- No 1
CREATE TABLE MsCustomer (
	CustomerId CHAR(5) NOT NULL UNIQUE,
	CustomerName VARCHAR(50),
	CustomerGender VARCHAR(10),
	CustomerPhone VARCHAR(13),
	CustomerAddress VARCHAR(100),

	CONSTRAINT check_customer_id
		CHECK(CustomerId LIKE 'CU[0-9][0-9][0-9]'),
	CONSTRAINT check_customer_gender
		CHECK(CustomerGender in('Male', 'Female')),
	CONSTRAINT MsCustomer_pk
		PRIMARY KEY(CustomerId)
)

SELECT * FROM MsCustomer

INSERT INTO MsCustomer
VALUES ('CU001', 'Test Coba', 'Male', '0812312323', 'Jln Jalan No.23')

DELETE FROM MsCustomer
WHERE CustomerId = 'CU001'

CREATE TABLE MsStaff(
	StaffId CHAR(5) NOT NULL UNIQUE,
	StaffName VARCHAR(50),
	StaffGender VARCHAR(10),
	StaffPhone VARCHAR(13),
	StaffAddress VARCHAR(100),
	StaffSalary NUMERIC(11,2),
	StaffPosition VARCHAR(20),

	CONSTRAINT check_staff_id
		CHECK(StaffId LIKE 'SF[0-9][0-9][0-9]'),
	CONSTRAINT check_staff_gender
		CHECK(StaffGender IN ('Male', 'Female')),
	CONSTRAINT MsStaff_pk
		PRIMARY KEY(StaffId)
)

SELECT * FROM MsStaff

INSERT INTO MsStaff
VALUES ('SF001', 'Test Coba', 'Male', '0812312323', 'Jln Jalan No.23', 2000000.00, 'Staff')

DELETE FROM MsCustomer
WHERE CustomerId = 'SF001'

CREATE TABLE MsTreatmentType(
	TreatmentTypeId CHAR(5)NOT NULL UNIQUE,
	TreatmentTypeName VARCHAR(50),

	CONSTRAINT check_treatment_type_id
		CHECK(TreatmentTypeId LIKE 'TT[0-9][0-9][0-9]'),
	CONSTRAINT MsTreatmentTypeId_pk
		PRIMARY KEY(TreatmentTypeId)
)

SELECT * FROM MsTreatmentType

DROP TABLE MsTreatmentType

INSERT INTO MsTreatmentType
VALUES('TT001', 'Spa')

DELETE FROM MsCustomer
WHERE CustomerId = 'TT001'

CREATE TABLE MsTreatment(
	TreatmentId CHAR(5)NOT NULL UNIQUE,
	TreatmentTypeId CHAR(5),
	TreatmentName VARCHAR(50),
	Price NUMERIC(11,2),

	CONSTRAINT check_Mstreatment_id
		CHECK(TreatmentId LIKE 'TM[0-9][0-9][0-9]'),
	CONSTRAINT TreatmentId_pk
		PRIMARY KEY(TreatmentId),
	CONSTRAINT TreatmentId_fk
		FOREIGN KEY(TreatmentTypeId) REFERENCES MsTreatmentType(TreatmentTypeId)
		ON UPDATE CASCADE 
		ON DELETE SET NULL
)

SELECT * FROM MsTreatment

DROP TABLE MsTreatment

INSERT INTO MsTreatment
VALUES('TM001', 'TT001', 'Coba', 200000.00)

DELETE FROM MsCustomer
WHERE CustomerId = 'TT001'

CREATE TABLE HeaderSalonService(
	TransactionId CHAR(5)NOT NULL UNIQUE,
	CustomerId CHAR(5),
	StaffId CHAR(5),
	TranscationDate DATE,
	PaymentType VARCHAR(20),

	CONSTRAINT check_transaction_id
		CHECK(TransactionId LIKE 'TR[0-9][0-9][0-9]'),
	CONSTRAINT HeaderSalonService_pk
		PRIMARY KEY(TransactionId),
	CONSTRAINT HeaderSalonService_customerId_fk
		FOREIGN KEY(CustomerId) REFERENCES MsCustomer(CustomerId)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
	CONSTRAINT HeaderSalonService_staffId_fk
		FOREIGN KEY(StaffId) REFERENCES MsStaff(StaffId)
		ON UPDATE CASCADE
		ON DELETE SET NULL
)

SELECT * FROM HeaderSalonService

DROP TABLE HeaderSalonService

INSERT INTO HeaderSalonService
VALUES('TR001', 'CU001', 'SF001', GETDATE(), 'Cash')

DELETE FROM HeaderSalonService
WHERE TransactionId = 'TR001'

CREATE TABLE DetailSalonServices(
	TransactionId CHAR(5)NOT NULL,
	TreatmentId CHAR(5)NOT NULL,

	CONSTRAINT DetailSalonServices_TranscationId_TreatmentId_pk
		PRIMARY KEY(TransactionId, TreatmentId),
	CONSTRAINT DetailSalonServices_TransactionId_fk
		FOREIGN KEY(TransactionId) REFERENCES HeaderSalonService(TransactionId)
		ON UPDATE CASCADE,
		--ON DELETE SET NULL
	CONSTRAINT DetailSalonServices_TreatmentId_fk
		FOREIGN KEY(TreatmentId) REFERENCES MsTreatment(TreatmentId)
		ON UPDATE CASCADE,
		--ON DELETE SET NULL
)

SELECT * FROM DetailSalonServices

DROP TABLE DetailSalonServices

INSERT INTO DetailSalonServices
VALUES('TR001', 'TM001')

DELETE FROM HeaderSalonService
WHERE TransactionId = 'TR001'

-- 2. DROP TABLE DetailSalonServices
DROP TABLE DetailSalonServices

-- 3. Create table
CREATE TABLE DetailSalonServices(
	TransactionId CHAR(5)NOT NULL,
	TreatmentId CHAR(5)NOT NULL,

	CONSTRAINT DetailSalonServices_TransactionId_fk
		FOREIGN KEY(TransactionId) REFERENCES HeaderSalonService(TransactionId)
		ON UPDATE CASCADE,
		--ON DELETE SET NULL
	CONSTRAINT DetailSalonServices_TreatmentId_fk
		FOREIGN KEY(TreatmentId) REFERENCES MsTreatment(TreatmentId)
		ON UPDATE CASCADE,
		--ON DELETE SET NULL
)

SELECT * FROM DetailSalonServices

ALTER TABLE DetailSalonServices
ADD PRIMARY KEY(TransactionId, TreatmentId)

-- 4.
SELECT * FROM MsStaff

-- ADD CIBSTRAINT
ALTER TABLE MsStaff
ADD CONSTRAINT staffname_length CHECK(LEN(StaffName) > 5 AND LEN(StaffName) < 20 )

INSERT INTO MsStaff
VALUES ('SF002', 'Test', 'Male', '0812312323', 'Jln Jalan No.23', 2000000.00, 'Staff')

-- DELETE CONSTRAINT
ALTER TABLE MsStaff
DROP CONSTRAINT staffname_length 


-- 5.
SELECT * FROM MsTreatment

-- Add Column Description
ALTER TABLE MsTreatment
ADD Description VARCHAR(100)

-- Delete
ALTER TABLE MsTreatment
DROP COLUMN Description