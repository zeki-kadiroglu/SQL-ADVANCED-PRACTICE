create proc webs 
@dub varchar(50),
@lin varchar(50)
as 
begin 
 
with cte1 as (

select distinct w.[WebsiteId], [WebsiteName],[Proportion]
from [dbo].[tblCountry] c
inner join [dbo].[tblUsage] u 
on c.CountryId = u.CountryId
inner join [dbo].[tblWebsite] w 
on w.WebsiteId = u.WebsiteId
where [CountryName] = @dub)
,
cte2 as (
select distinct w.[WebsiteId], [WebsiteName],[Proportion]
from [dbo].[tblCountry] c
inner join [dbo].[tblUsage] u 
on c.CountryId = u.CountryId
inner join [dbo].[tblWebsite] w 
on w.WebsiteId = u.WebsiteId
where [CountryName] = @lin)

, cte3 as (
select distinct  c.[WebsiteId],c.[WebsiteName],c.[Proportion] country_1, 
case
when t.[Proportion] is null then 0.00
else t.Proportion
end as country_2

from cte1 c
full outer join cte2 t 
on c.WebsiteId = t.WebsiteId)

select * ,country_1+country_2
from cte3
end
go

exec webs @dub  ='France',@lin ='Greece'
