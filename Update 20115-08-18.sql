use ors
go

alter table RentalItem
add OfficeType INT
Go

Update RentalItem
set OfficeType = 0