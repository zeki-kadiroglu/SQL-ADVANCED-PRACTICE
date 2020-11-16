select [EventName],[EventDate],c.[CountryId] 
from [dbo].[tblEvent] e 
inner join [dbo].[tblCountry] c 
on e.CountryId = c.CountryId
where c.[CountryId] <> 17 and  year([EventDate]) = 2001

UNION 

select [EventName],[EventDate],c.[CountryId] 
from [dbo].[tblEvent] e 
inner join [dbo].[tblCountry] c 
on e.CountryId = c.CountryId
where c.[CountryId] in (3,5,7) and e.[EventName] not like '%U%' 
and e.EventName not like '%u%'
order by 2  