USE [Club]
GO
/****** Object:  StoredProcedure [dbo].[EvalutionPlayer]    Script Date: 05/13/2017 02:12:14 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[EvalutionPlayer] 
@idMatch int ,
@idPlaCat int
as 
begin 
   declare @sum float 
        set @sum=(select Goal*0.5 from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat)
        set @sum=@sum+(select Assist*0.2 from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat)
        set @sum=@sum+(select Shoot*0.1 from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat) 
	    set    @sum=@sum+(select [YCard]*(-0.1) from [dbo].[PlayerCategoryMatch]  where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat)
	    set  @sum=@sum+(select [RCard]*-0.2 from [dbo].[PlayerCategoryMatch]  where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat)
	         if ( (select[NumOfMinute]  from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat) =90)
	                 set  @sum=@sum+0.3
		     else 	  if ((select[NumOfMinute]  from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat)>=80)
	                set   @sum=@sum+0.2
	      	 else 	 set @sum=@sum+0.1
	    	 if  ((select [Vectory]  from [dbo].[Match]  where [IdMatch]=@idMatch  )=1)
	                set @sum=@sum+1
	     	 else	 if  ((select [Vectory]  from [dbo].[Match]  where [IdMatch]=@idMatch  )=0)
		            set @sum=@sum+0.5
	    	 else	 if  ((select [Vectory]  from [dbo].[Match]  where [IdMatch]=@idMatch )= -1)
		            set @sum=@sum+0
					set @sum+=5
   select [IdPlaCat],@sum as 'evalution of player' from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and  [IdPlaCat]=@idPlaCat 

End