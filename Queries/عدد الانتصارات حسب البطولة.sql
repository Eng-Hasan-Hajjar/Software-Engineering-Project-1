select [IdCompetition], count([Vectory]) as numOfv
from [dbo].[Match] 
where [Vectory] = 'true'
group by [IdCompetition]

