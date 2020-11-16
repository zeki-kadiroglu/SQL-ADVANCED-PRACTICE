/*select convert(varchar,year([EventDate])),count([EventId])
from [dbo].[tblEvent]
group by convert(varchar,year([EventDate]))*/
select 
case
when  convert(int,year([EventDate])) between 1939 and 1949 then 'Decade 1 -forties '
when  convert(int,year([EventDate])) between 1949 and 1959 then 'Decade 2 - fifties'
when  convert(int,year([EventDate])) between  1959 and 1969 then 'Decade 3 - sixties'
when  convert(int,year([EventDate])) between 1969 and  1979 then 'Decade 4 - seventies'
when  convert(int,year([EventDate])) between  1979 and 1989 then 'Decade 5 - eighties'
when  convert(int,year([EventDate])) between 1989 and 1999 then 'Decade 6 - nineties'
when   convert(int,year([EventDate])) between 1999 and 2009 then 'Decade 7 - noughties'
end as 'Decade',

count([EventId]) 'Number of events'
from [dbo].[tblEvent] 
GROUP BY case
when  convert(int,year([EventDate])) between 1939 and 1949 then 'Decade 1 -forties '
when  convert(int,year([EventDate])) between 1949 and 1959 then 'Decade 2 - fifties'
when  convert(int,year([EventDate])) between  1959 and 1969 then 'Decade 3 - sixties'
when  convert(int,year([EventDate])) between 1969 and  1979 then 'Decade 4 - seventies'
when  convert(int,year([EventDate])) between  1979 and 1989 then 'Decade 5 - eighties'
when  convert(int,year([EventDate])) between 1989 and 1999 then 'Decade 6 - nineties'
when   convert(int,year([EventDate])) between 1999 and 2009 then 'Decade 7 - noughties'
end

