USE [Club]
GO
/****** Object:  StoredProcedure [dbo].[DataPlayerAndMatch]    Script Date: 05/14/2017 11:54:40 م ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER proc [dbo].[DataPlayerAndMatch]
(@IdMatch int)
as
--this proc give us all data in private match
begin
select player.* , Match.*,Category.Name
from 
Player left outer join PlayerCategory 
                                                                 on Player.Idplayer=PlayerCategory.Idplayer
 right outer join Category                       on PlayerCategory.IdCategory=Category.IdCategory
 left outer join PlayerCategoryMatch    on PlayerCategoryMatch.IdPlaCat =PlayerCategory.IdPlaCat
 right outer join Match 
                                                                 on Match.IdMatch=PlayerCategoryMatch.IdMatch
 where PlayerCategoryMatch.IdMatch=@IdMatch
 end