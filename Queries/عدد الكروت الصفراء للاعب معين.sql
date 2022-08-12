select   count(PlaCatMat.YCard)  ,  player.FirstName
from           
 Player left outer join
 PlayerCategory PlaCat on Player.Idplayer = PlaCat.Idplayer left outer join
 PlayerCategoryMatch  PlaCatMat on PlaCat.IdPlaCat = PlaCatMat.IdPlaCat

where PlaCat.IdPlaCat=1 and PlaCatMat .YCard = 'false' 
group by Player.FirstName

  
