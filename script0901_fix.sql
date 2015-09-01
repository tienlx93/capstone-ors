ALTER TABLE Amenity 
ADD Repairable BIT
GO

UPDATE Amenity SET Repairable = 0
