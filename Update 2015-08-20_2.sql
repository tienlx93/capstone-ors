use ors
go

alter table Office 
drop column [Percent]
go

alter table Office 
add Commission INT
go

update Office
set Commission = 5
