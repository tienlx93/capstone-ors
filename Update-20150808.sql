USE [ors]
ALTER TABLE Office 
DROP COLUMN [OtherDetail]

ALTER TABLE Office
ADD [BasePrice] BIGINT

ALTER TABLE Office
ADD [MinArea] FLOAT

ALTER TABLE Office
ADD [MinTime] INT

UPDATE Office
SET [BasePrice] = [PRICE]

UPDATE Office
SET [MinTime] = 3

ALTER TABLE [Contract]
ADD [Deposit] BIGINT

ALTER TABLE [Contract]
ADD [CancelDate] DATE

ALTER TABLE [Contract]
ADD [ImageUrl] NVARCHAR(150)