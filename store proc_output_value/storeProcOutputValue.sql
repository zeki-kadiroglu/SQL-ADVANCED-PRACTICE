select * from [dbo].[tblResource]

select * from [dbo].[tblSchedule]
---------------------------------------------------
create  proc ResourceCourseCount (@k as varchar
,@l as int output
)
as 
begin

 select [CourseId]
from [dbo].[tblSchedule]
where [ResourceIds] like '%'+','+convert(varchar,(select [ResourceId]
from [dbo].[tblResource]
where [ResourceName] like '%'+@k+'%'))+','+'%';
select @l = @@ROWCOUNT;

end;
go

declare @NumFound int
declare @Returnvalue int
exec @Returnvalue= [dbo].[ResourceCourseCount]  'Flip chart',
 @NumFound output
 
 select @NumFound 'ResourceCourseCount'


