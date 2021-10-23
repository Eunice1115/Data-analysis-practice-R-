#plyr()패키지

#ddply()함수(ddply함수를 보강하여 만든 것이 dplyr패키지)
#ddply(데이터,'기준컬럼',summarise/transform,작업)
install.packages("plyr")
library(plyr)
library(googleVis)
Fruits

#출력이 데이터 프레임
ddply(Fruits,'Fruit',summarise,Sum_Sales=sum(Sales),Sum_Profit=sum(Profit))
ddply(Fruits,c('Year','Fruit'),summarise,Max_Pro=max(Profit))
#출력이 리스트
dlply(Fruits,'Fruit',summarise,Sum_Sales=sum(Sales),Sum_Profit=sum(Profit))
#기존 컬럼도 다 보여주려면 transform사용
ddply(Fruits,'Fruit',transform,Sum_Sales=sum(Sales),Sum_Profit=sum(Profit))
