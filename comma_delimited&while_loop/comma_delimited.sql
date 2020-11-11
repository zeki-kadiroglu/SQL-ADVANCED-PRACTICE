select * from [dbo].[tblTrainer]

alter function comma_delimited ()
returns  @names table (trainerid int,trainer_names varchar(500))
as 
begin
insert into @names
select *
from [dbo].[tblTrainer] ;
return;
end;

select * from [dbo].[comma_delimited]();

alter proc list_output (@list as varchar(max))
as 
begin
declare @count int;
set @count = 0;
while @count < 5
begin
declare @name_list varchar(max);
set @name_list = ''

select @name_list = @name_list + [TrainerName]+', '
from [dbo].[tblTrainer]
where [TrainerId] in  (select *  from STRING_SPLIT(@list,','))
set @count = @count + 1;
end
print @name_list
end;
go
exec list_output '21,93,3993,4085'

select * from STRING_SPLIT('21,93,3993,4085',',')