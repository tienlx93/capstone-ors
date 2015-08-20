use ors
go

alter table Office 
add [Percent] INT
go

update Office
set [Percent] = 5
