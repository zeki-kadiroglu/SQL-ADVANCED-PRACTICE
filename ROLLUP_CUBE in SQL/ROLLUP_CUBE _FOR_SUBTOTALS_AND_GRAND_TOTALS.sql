SELECT YEAR([EventDate]) EventYear,CASE 
when convert(varchar,MONTH([EventDate]))  IS NULL THEN 'subtotals of number of events' 
else convert(varchar,MONTH([EventDate]))
end as EventMonth
,COUNT([EventId]) Number_of_Events
FROM [dbo].[tblEvent]
GROUP BY YEAR([EventDate]),MONTH([EventDate]) WITH ROLLUP
ORDER BY 1 DESC , 2 ASC