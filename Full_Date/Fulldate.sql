with cte1 as (
select [EventName],convert(varchar,(datename(weekday,[EventDate])+' '+DATENAME(day,[EventDate])
+' '+ DATENAME(MONTH,[EventDate]) +' '+ DATENAME(YEAR,[EventDate]))) as 'Fulldate'
from [dbo].[tblEvent])

select * from cte1 
where Fulldate like '%Thursday 13%'
-------------------------------------------
with cte2 as (
select [EventName],convert(varchar,(datename(weekday,[EventDate])+' '+DATENAME(day,[EventDate])
+' '+ DATENAME(MONTH,[EventDate]) +' '+ DATENAME(YEAR,[EventDate]))) as 'Fulldate'
from [dbo].[tblEvent])

select * from cte2 
where Fulldate like '%Saturday 13%'