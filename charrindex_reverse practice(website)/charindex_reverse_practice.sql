/*select [WebsiteName],[WebsiteUrl],[DomainName],w.[DomainId]
from [dbo].[tblDomain] d 
inner join [dbo].[tblWebsite] w 
on d.DomainId = w.DomainId*/

create proc suffix 
as 
begin 
with cte as ( select [WebsiteName],[WebsiteUrl],
case
when  charindex('.',REVERSE([WebsiteUrl])) = 0 
then 'Invalid'
when  left(reverse([WebsiteUrl]),charindex('.',reverse([WebsiteUrl]))) <> reverse([DomainName])  -- in order to find domain name such as .com, .au ,.mx.  
then reverse(left(reverse([WebsiteUrl]),charindex('.',reverse([WebsiteUrl]))))                    -- www.google.com.mx is a wrong domain indication which is .com in domain column.
else convert(varchar,charindex('.',REVERSE([WebsiteUrl])))                                            -- so it should be .mx for that reason we have to add this row as well .
end as Domain
,[DomainName]
from [dbo].[tblDomain] d 
inner join [dbo].[tblWebsite] w 
on d.DomainId = w.DomainId)

select * from cte 
where Domain not like '%[1-9]%'
end 

exec suffix
