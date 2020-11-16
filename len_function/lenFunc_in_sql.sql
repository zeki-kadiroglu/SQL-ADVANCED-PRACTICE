

select [CountryName] +' '+'has'+' '+convert(varchar,len([CountryName]))+' '+'letters' 
as 'Country Description'
from [dbo].[tblCountry] c 
order by 1