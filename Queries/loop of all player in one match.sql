create proc loopPlayer8
(@idMatch int 
)
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
 --------------------------while
while(@LoopCounter is not null   and @LoopCounter <= @MaxPlayerId)
begin
    select @PlayerName = Player.FirstName
    from    Player left outer join PlayerCategory 
    on Player.Idplayer=PlayerCategory.Idplayer
            left outer join PlayerCategoryMatch 
   on PlayerCategoryMatch.IdPlaCat=PlayerCategory.IdPlaCat
   where  PlayerCategoryMatch.IdMatch=1
   ------
                   Declare @idPlaCat int
				   set @idPlaCat=@LoopCounter
						select    IdPlaCat   from   [dbo].[PlayerCategoryMatch]  where IdMatch=1
                                             declare @sum float 
                                             Declare @Goals  float= (select Goal from [dbo].[PlayerCategoryMatch] 
											 where [IdMatch]=@idMatch and [IdPlaCat]=@LoopCounter)
                                             Declare @Assist  float = (select Assist from [dbo].[PlayerCategoryMatch] 
											 where [IdMatch]=@idMatch and [IdPlaCat]=@LoopCounter)
                                             Declare @Shoot  float= (select Shoot from [dbo].[PlayerCategoryMatch] 
											 where [IdMatch]=@idMatch and [IdPlaCat]=@LoopCounter)
                                             Declare @YCard  float= (select YCard  from [dbo].[PlayerCategoryMatch] 
											 where [IdMatch]=@idMatch and [IdPlaCat]=@LoopCounter)
                                             Declare @RCard  float= (select RCard  from [dbo].[PlayerCategoryMatch]
											  where [IdMatch]=@idMatch and [IdPlaCat]=@LoopCounter)
                                             Declare @NumOfMinute  float =(select[NumOfMinute]  from [dbo].[PlayerCategoryMatch]
											 where [IdMatch]=@idMatch and [IdPlaCat]=@LoopCounter)
                                             Declare @Vectory  float =  (select [Vectory]  from [dbo].[Match]  where [IdMatch]=@idMatch  )

	                             	set @sum=@Goals*0.5
                                    set @sum=@sum+@Assist*0.2
                                    set @sum=@sum+ @Shoot*0.1
	                                set  @sum=@sum+ @YCard*(-0.1) 
	                                set  @sum=@sum+@RCard*(-0.2)
	
	                                          if (@NumOfMinute =90)
	                                                    set  @sum=@sum+0.5
		                                      else  if (@NumOfMinute>=80)
	                                                    set   @sum=@sum+0.4
	                                    	 else  if (@NumOfMinute>=70)
	                                                    set   @sum=@sum+0.3
						                     else  if (@NumOfMinute>=60)
	                                                    set   @sum=@sum+0.2
						                      else    set @sum=@sum+0.1
	                                if  (@Vectory=1)
	                                         set @sum=@sum+1
	     	                        else	 if  (@Vectory  =0)
		                                     set @sum=@sum+0.5
	    	                        else	 if  (@Vectory= -1)
		                                    set @sum=@sum+0
	                                                   set @sum+=5
                                                       select PlayerCategoryMatch.IdPlaCat , @sum as 'Evalution of player' 
													      from    Player left outer join PlayerCategory 
    on Player.Idplayer=PlayerCategory.Idplayer
            left outer join PlayerCategoryMatch 
   on PlayerCategoryMatch.IdPlaCat=PlayerCategory.IdPlaCat
								                   	   where PlayerCategoryMatch.[IdMatch]=@idMatch and  PlayerCategoryMatch.[IdPlaCat]=@LoopCounter
										
              
	----------To handle gaps in the looping column value
	   IF(@@ROWCOUNT = 0 )
   BEGIN
     SET @LoopCounter  = @LoopCounter  + 1 
     CONTINUE
   END
       

end

end