select   plm.* ,pos.TyprPosition 
from  Position  pos left outer join  PlayerCategoryMatch plm
on   plm.IdPosition= Pos.IdPosition 
where [IdPlaCatMat]= 14
