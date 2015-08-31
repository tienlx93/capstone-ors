USE [ors]
GO

IF object_id('GetDetailJob') IS NULL
    EXEC ('CREATE PROCEDURE dbo.GetDetailJob as select 1')
GO
ALTER PROCEDURE GetDetailJob
    @StartDate DateTime, 
    @EndDate DateTime, 
    @Staff NVARCHAR(50) 
AS 

(SELECT Id, [Time], 1 as Kind
FROM Appointment 
WHERE assignedStaff = @Staff AND Time >= @StartDate AND Time < @EndDate AND StatusId != 1)
UNION ALL
(SELECT Id, AssignedTime AS Time, 2 as Kind
FROM Rental
WHERE AssignStaff = @Staff AND AssignedTime >= @StartDate AND AssignedTime < @EndDate AND StatusId != 1)
UNION ALL
(SELECT Id, AssignedTime AS Time, 3 as Kind
FROM Repair
WHERE AssignedStaff = @Staff AND AssignedTime >= @StartDate AND AssignedTime < @EndDate AND RepairStatusId != 1)
UNION ALL
(SELECT Id, AssignedTime AS Time, 3 as Kind
FROM Repair
WHERE AssignedStaff = @Staff AND AssignedTime >= @StartDate AND AssignedTime < @EndDate AND RepairStatusId != 1)

GO


EXECUTE GetDetailJob '2015-07-08', '2015-07-09', 'staff1';