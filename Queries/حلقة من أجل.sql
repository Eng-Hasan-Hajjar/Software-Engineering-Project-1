create proc loopPlayer
as
begin
DECLARE @LoopCounter INT , 
                    @MaxPlayerId INT, 
                    @PlayerName NVARCHAR(100)
SELECT @LoopCounter = min(PlayerCategoryMatch.IdPlaCat) , 
                @MaxPlayerId = max(PlayerCategoryMatch.IdPlaCat) 
from    Player right outer join PlayerCategory 
 on Player.Idplayer=PlayerCategory.Idplayer
           right outer join PlayerCategoryMatch 
 on PlayerCategoryMatch.IdPlaCat=PlayerCategory.IdPlaCat
while(@LoopCounter is not null
      and @LoopCounter <= @MaxPlayerId)
begin
    select @PlayerName = Player.FirstName
    from    Player left outer join PlayerCategory 
    on Player.Idplayer=PlayerCategory.Idplayer
            left outer join PlayerCategoryMatch 
   on PlayerCategoryMatch.IdPlaCat=PlayerCategory.IdPlaCat
   where  
    PlayerCategoryMatch.IdMatch=1
       
	   set @LoopCounter  = @LoopCounter  + 1    
	   if  (@LoopCounter=null)   
	   continue
end

end