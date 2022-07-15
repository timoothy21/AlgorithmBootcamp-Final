USE OOVEO_Salon;
GO

-- 1
SELECT *
FROM MsStaff
WHERE StaffGender = 'Female'

-- 2
SELECT 
	StaffName,
	'Rp. ' + CAST(StaffSalary as VARCHAR) AS [StaffSalary]
FROM MsStaff
WHERE StaffName LIKE '%m%' AND StaffSalary >= 10000000

-- 3
SELECT
	TreatmentName,
	Price
FROM MsTreatment
WHERE TreatmentTypeId IN ('TT002', 'TT003')

-- 4
SELECT StaffName,
       StaffPosition,
       CONVERT(VARCHAR, TransactionDate, 107) AS TransactionDate
FROM MsStaff AS ms
JOIN 
    HeaderSalonServices AS hss 
    ON (StaffSalary BETWEEN 7000000 AND 10000000) AND ms.StaffId = hss.StaffId

-- 5
SELECT SUBSTRING(CustomerName, 1, CHARINDEX(' ', CustomerName)) AS 'Name',
       LEFT(CustomerGender,1) AS Gender,
       PaymentType
FROM MsCustomer AS mc
JOIN
    HeaderSalonServices AS hss
    ON PaymentType = 'Debit' AND mc.CustomerId = hss.CustomerId

-- 6
SELECT SUBSTRING(CustomerName, 1, 1) + SUBSTRING(CustomerName, CHARINDEX(' ', CustomerName)+1, 1) as Initial,
	DATENAME(WEEKDAY, hss.TransactionDate) as Day
FROM MsCustomer AS mc
JOIN
	HeaderSalonServices AS hss
	ON mc.CustomerId = hss.CustomerId AND (24 - DATENAME(DAY, TransactionDate) < 3)

--7
SELECT TransactionDate,
	SUBSTRING(CustomerName, CHARINDEX(' ', CustomerName)+1, len(CustomerName)) as CustomerName
FROM MsCustomer as mc
JOIN
	HeaderSalonServices AS hss
	ON mc.CustomerId = hss.CustomerId AND DATENAME(WEEKDAY,TransactionDate) = 'Saturday'

--8
SELECT 
	StaffName,
	CustomerName,
	REPLACE(CustomerPhone, LEFT(CustomerPhone, 1), '+62') as CustomerPhone,
	CustomerAddress
FROM MsCustomer as mc
	JOIN HeaderSalonServices as hss
	ON mc.CustomerId = hss.CustomerId
	JOIN MsStaff as ms
	ON ms.StaffId = hss.StaffId AND StaffName LIKE '% % %'

--9
SELECT StaffName,
	TreatmentName,
	24 - DATENAME(DAY, TransactionDate) as 'Term of Transaction'
FROM DetailSalonServices as ds
	JOIN MsTreatment as mt
	on mt.TreatmentId = ds.TreatmentId AND (LEN(TreatmentName) > 20 OR TreatmentName LIKE '% %')
	JOIN HeaderSalonServices as hss
	on hss.TransactionId = ds.TransactionId
	JOIN MsStaff as ms
	on ms.StaffId = hss.StaffId

--10
SELECT TransactionDate,
	CustomerName,
	TreatmentName,
	CONVERT(INT, Price*20/100) as PRICE,
	PaymentType
FROM DetailSalonServices as dss
	JOIN HeaderSalonServices as hss
	on hss.TransactionId = dss.TransactionId AND (DATENAME(DAY, TransactionDate) = 22)
	JOIN MsCustomer as mc
	on mc.CustomerId = hss.CustomerId
	JOIN MsTreatment as mt
	on mt.TreatmentId = dss.TreatmentId
