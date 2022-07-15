USE OOVEO_Salon;
GO

-- 1
SELECT 
	MAX(Price) [Maximum Price], 
	MIN(Price) [Minimum Price], 
	CAST(ROUND(AVG(Price), 0) as decimal(18, 2)) [Average Price]
FROM MsTreatment

-- 2
SELECT 
	StaffPosition, 
	LEFT(StaffGender, 1) as [Gender], 
	'Rp. ' + CAST(CAST(AVG(StaffSalary)as decimal(18, 2)) as varchar) as [Average Salary]
FROM MsStaff
GROUP BY StaffPosition, StaffGender

--3
SELECT 
	CONVERT(varchar, TransactionDate, 107) as [TransactionDate],
	COUNT(TransactionId) as [Total Transaction per Day]
FROM HeaderSalonServices
GROUP BY TransactionDate

--4
SELECT 
	CustomerGender,
	COUNT(hss.TransactionId) as [Total Transaction]
FROM MsCustomer as c
JOIN HeaderSalonServices as hss on hss.CustomerId = c.CustomerId
GROUP BY CustomerGender

-- 5
SELECT
	mtt.TreatmentTypeName,
	COUNT(dss.TransactionId) as [Total Transaction]
FROM MsTreatmentType as mtt
JOIN MsTreatment as mt on mt.TreatmentTypeId = mtt.TreatmentTypeId
JOIN DetailSalonServices as dss on mt.TreatmentId = dss.TreatmentId
GROUP BY mtt.TreatmentTypeName
ORDER BY [Total Transaction] DESC

--6
SELECT
	CONVERT(varchar, hss.TransactionDate, 106) [Date],
	'Rp. ' + CAST(SUM(Price) as varchar) [Revenue per Day]
FROM HeaderSalonServices as hss
JOIN DetailSalonServices as dss on dss.TransactionId = hss.TransactionId
JOIN MsTreatment as mt on dss.TreatmentId = mt.TreatmentId
GROUP BY hss.TransactionDate
HAVING SUM(PRICE) BETWEEN 1000000 and 5000000

--7
SELECT
	REPLACE(mtt.TreatmentTypeId, 'TT', 'Treatment Type ') as [ID],
	mtt.TreatmentTypeName,
	CAST(COUNT(mt.TreatmentId) as varchar) + ' Treatment' as [Total Treatment per Type]
FROM MsTreatmentType as mtt
JOIN MsTreatment as mt on mtt.TreatmentTypeId = mt.TreatmentId
GROUP BY mtt.TreatmentTypeId, mtt.TreatmentTypeName
HAVING COUNT(mt.TreatmentId) > 5
ORDER BY [Total Treatment per Type] DESC

-- 8
SELECT 
	LEFT(ms.StaffName, CHARINDEX(' ', ms.StaffName) - 1) [StaffName],
	hss.TransactionId,
	COUNT(dss.TreatmentId) [Total Treatment per Transaction]
FROM MsStaff as ms
JOIN HeaderSalonServices as hss on hss.StaffId = ms.StaffId
JOIN DetailSalonServices as dss on dss.TransactionId = hss.TransactionId
GROUP BY ms.StaffName, hss.TransactionId

--9
SELECT
	hss.TransactionDate,
	mc.CustomerName,
	mt.TreatmentName,
	mt.Price
FROM HeaderSalonServices as hss
JOIN MsCustomer as mc on hss.CustomerId = mc.CustomerId
JOIN MsStaff as ms on hss.StaffId = ms.StaffId
JOIN DetailSalonServices as dss on dss.TransactionId = hss.TransactionId
JOIN MsTreatment as mt on mt.TreatmentId = dss.TreatmentId
WHERE 
	DATENAME(WEEKDAY, TransactionDate) = 'Thursday' AND
	ms.StaffName like '%Ryan%'
ORDER BY TransactionDate, mc.CustomerName

SELECT DATENAME(WEEKDAY, TransactionDate)
FROM HeaderSalonServices

--10
SELECT
	hss.TransactionDate,
	mc.CustomerName,
	SUM(mt.Price)
FROM HeaderSalonServices as hss
JOIN MsCustomer as mc on hss.CustomerId = mc.CustomerId
JOIN DetailSalonServices as dss on hss.TransactionId = dss.TransactionId
JOIN MsTreatment as mt on dss.TreatmentId = mt.TreatmentId
WHERE DAY(hss.TransactionDate) > 20
GROUP BY hss.TransactionDate, mc.CustomerName
ORDER BY hss.TransactionDate