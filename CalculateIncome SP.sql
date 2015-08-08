USE [ors]
GO

IF object_id('CalculateIncome') IS NULL
    EXEC ('CREATE PROCEDURE dbo.CalculateIncome as select 1')
GO
ALTER PROCEDURE CalculateIncome
    @startDate DATETIME,
    @endDate DATETIME,
    @district NVARCHAR(50)
AS 

IF @district != ''
	SELECT 
	(
	SELECT SUM( PaymentFee / PaymentTime ) 
	FROM [Contract]a, PaymentTerm b
	WHERE a.StartDate < @endDate AND a.EndDate >= @startDate AND a.StatusId != 4
	 AND a.PaymentTerm = b.Id
	 AND a.OfficeId IN (SELECT Id FROM [Office] WHERE District = @district)) +
	COALESCE((
	SELECT SUM (UnitPrice * Quantity) FROM RentalDetail 
	WHERE RentalId IN (
	 SELECT Id FROM Rental WHERE ContractId IN (
	  SELECT id FROM [Contract] 
	  WHERE StartDate < @endDate AND EndDate >= @startDate AND StatusId != 4
	  AND OfficeId IN (SELECT Id FROM [Office] WHERE District = @district) 
	 ) 
	 AND StatusId = 3 )),0) AS Income

ELSE 
	SELECT 
	(
	SELECT SUM( PaymentFee / PaymentTime ) 
	FROM [Contract]a, PaymentTerm b 
	WHERE a.StartDate < @endDate AND a.EndDate >= @startDate AND StatusId != 4
	 AND a.PaymentTerm = b.Id) +
	COALESCE((
	SELECT SUM (UnitPrice * Quantity) FROM RentalDetail 
	WHERE RentalId IN (
	 SELECT Id FROM Rental WHERE ContractId IN (
	  SELECT id FROM [Contract] 
	  WHERE StartDate < @endDate AND EndDate >= @startDate AND StatusId != 4
	 ) 
	 AND StatusId = 3 )),0) AS Income
 
 GO
 
EXECUTE CalculateIncome '2015-04-01', '2015-11-01', '';