create  proc [dbo].[EvalutionTrue12]
(
@idMatch int ,
@idPlaCat int
)
as 
begin 
   declare @sum float 
   Declare @Goals  float= (select Goal from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat)
   Declare @Assist  float = (select Assist from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat)
   Declare @Shoot  float= (select Shoot from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat)
   Declare @YCard  float= (select YCard  from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat)
   Declare @RCard  float= (select RCard  from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat)
   Declare @NumOfMinute  float =(select[NumOfMinute]  from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and [IdPlaCat]=@idPlaCat)
   Declare @Vectory  float =  (select [Vectory]  from [dbo].[Match]  where [IdMatch]=@idMatch  )

		set @sum=@Goals*0.5
        set @sum=@sum+@Assist*0.2
        set @sum=@sum+ @Shoot*0.1
	    set  @sum=@sum+ @YCard*(-0.1) 
	    set  @sum=@sum+@RCard*(-0.2)
	
	                     if (@NumOfMinute =90)
	                              set  @sum=@sum+0.3
		                 else 	  if (@NumOfMinute>=80)
	                                        set   @sum=@sum+0.2
	                 	 else 	   set @sum=@sum+0.1
	                 	 if  (@Vectory=1)
	                       set @sum=@sum+1
	     	         else	 if  (@Vectory  =0)
		                   set @sum=@sum+0.5
	    	         else	 if  (@Vectory= -1)
		                   set @sum=@sum+0
	     set @sum+=5
   select IdPlaCat , @sum as 'Evalution of player' from [dbo].[PlayerCategoryMatch] where [IdMatch]=@idMatch and  [IdPlaCat]=@idPlaCat 


   END