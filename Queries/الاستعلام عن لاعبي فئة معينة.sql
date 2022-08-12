
declare @IDCategoryy int
set @IDCategoryy=@IDCategory
select  
Player.FirstName,
Category.Name,
PlayerCategory.IdCategory
from           Category left outer JOIN PlayerCategory ON Category.IdCategory = PlayerCategory.IdCategory 
                                   left outer JOIN  Player ON Player.Idplayer =PlayerCategory.Idplayer 
where PlayerCategory.IdCategory=@IDCategoryy