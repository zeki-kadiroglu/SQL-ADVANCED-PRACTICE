DECLARE @EventName nvarchar(128)
declare @EventDate nvarchar(128)
declare @counter int
declare @maxid int

PRINT 'Great events in history'
PRINT '-----------------------'
PRINT '"EventName"'+' ------------------' + '"EventDate"'
PRINT '---------------------------------------------'
SELECT @counter=min([EventId]),	@maxid = max([EventId])
FROM [dbo].[tblEvent]

WHILE (@counter is not null and @counter <=@maxid)
BEGIN
SELECT @EventName=[EventName],@EventDate = [EventDate]
FROM [dbo].[tblEvent] 
where [EventId] = @counter

PRINT @EventName +' ------------------'+ @EventDate
set @counter = @counter + 1 
END