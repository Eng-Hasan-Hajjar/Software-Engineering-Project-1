
select  
Player.FirstName,
Category.Name

from           Category left outer JOIN PlayerCategory ON Category.IdCategory = PlayerCategory.IdCategory 
                                   left outer JOIN  Player ON Player.Idplayer =PlayerCategory.Idplayer 
group by  PlayerCategory.IdCategory ,Player.FirstName,
Category.Name