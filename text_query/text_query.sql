/*select [CourseName],[StartDate],[NumberDays] from [dbo].[tblCourse] c
inner join  [dbo].[tblSchedule] s
on c.CourseId  =s.CourseId
where [ScheduleId] = 17*/

declare @info nvarchar(128)
set @info = ''
select @info = 'Start date : '+@info + [CourseName]+CHAR(10)+
'Course name : '+ convert(varchar,[StartDate])+CHAR(10)+
'Course lenght : '
+convert(varchar,[NumberDays]) +' ' + 'day(s)'
 from [dbo].[tblCourse] c
inner join  [dbo].[tblSchedule] s
on c.CourseId  =s.CourseId
where [ScheduleId] = 17

PRINT 'About course number 17 ...'
PRINT '---------------------'
PRINT @info 

