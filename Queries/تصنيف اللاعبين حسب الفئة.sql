USE [Club]
GO
/****** Object:  StoredProcedure [dbo].[PlayerCat]    Script Date: 05/13/2017 04:38:56 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc  [dbo].[PlayerCat]
(
@IDCategory int 
)
as 
begin 
declare @IDCategoryy int
set @IDCategoryy=@IDCategory
select  
Player.FirstName,
Category.Name,

from           Category left outer JOIN PlayerCategory ON Category.IdCategory = PlayerCategory.IdCategory 
                                   left outer JOIN  Player ON Player.Idplayer =PlayerCategory.Idplayer 
where PlayerCategory.IdCategory=@IDCategoryy

end