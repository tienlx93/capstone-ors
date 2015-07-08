USE [ors]
GO

IF object_id('GetJobCount') IS NULL
    EXEC ('CREATE PROCEDURE dbo.GetJobCount as select 1')
GO
ALTER PROCEDURE GetJobCount
    @StartDate DateTime, 
    @EndDate DateTime
AS 
    SELECT a.Staff, COUNT(a.[time]) AS JobCount FROM (
	(SELECT AssignedStaff AS Staff, Time AS [time]
	FROM Appointment
	WHERE StatusId = 2 AND [Time] >= @StartDate AND [Time] < @EndDate)
	UNION ALL
	(SELECT AssignedStaff AS Staff, AssignedTime AS [time]
	FROM Repair
	WHERE RepairStatusId = 2  AND AssignedTime >= @StartDate AND AssignedTime < @EndDate)
	UNION ALL
	(SELECT AssignedStaff AS Staff, AssignedTime AS [time]
	FROM Repair
	WHERE RepairStatusId = 2  AND AssignedTime >= @StartDate AND AssignedTime < @EndDate)
	UNION ALL
	(SELECT AssignStaff AS Staff, AssignedTime AS [time]
	FROM Rental
	WHERE StatusId = 2 AND AssignedTime >= @StartDate AND AssignedTime < @EndDate)
	) a
	GROUP BY Staff
GO


EXECUTE GetJobCount '2015-07-06', '2015-07-13';