					 select    IdPlaCat 
					  from   [dbo].[PlayerCategoryMatch] 
					   where IdMatch=1
					   
DECLARE @LoopCounter INT , @MaxEmployeeId INT, 
        @PlayerName NVARCHAR(100)
SELECT @LoopCounter = min(PlayerCategory) , @MaxEmployeeId = max(Id) 
from    Category left outer join PlayerCategory on Category.IdCategory = PlayerCategory.IdCategory 
                            left outer join  Player on Player.Idplayer =PlayerCategory.Idplayer 
 
WHILE(@LoopCounter IS NOT NULL
      AND @LoopCounter <= @MaxEmployeeId)
BEGIN
   SELECT @EmployeeName = Name
   FROM #Employee WHERE Id = @LoopCounter
    
   PRINT @EmployeeName  
   SET @LoopCounter  = @LoopCounter  + 1        
END


DECLARE @LoopCounter INT , @MaxEmployeeId INT, 
        @EmployeeName NVARCHAR(100)
SELECT @LoopCounter = min(id) , @MaxEmployeeId = max(Id) 
FROM #Employee
WHILE ( @LoopCounter IS NOT NULL
        AND  @LoopCounter <= @MaxEmployeeId)
BEGIN
   SELECT @EmployeeName = Name
   FROM #Employee WHERE Id = @LoopCounter
   --To handle gaps in the looping column value
   IF(@@ROWCOUNT = 0 )
   BEGIN
     SET @LoopCounter  = @LoopCounter  + 1 
     CONTINUE
   END
 
   PRINT @EmployeeName  
   SET @LoopCounter  = @LoopCounter  + 1        
END