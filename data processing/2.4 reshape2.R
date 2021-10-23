#reshape2()패키지
install.packages("reshape2")
library(reshape2)
library(googleVis)

#melt() : wide -> long 형태로 변경
#dcast() : long -> wide 형태로 변경
Fruits
t(Fruits) #전치행렬로 변경

Fruits_2 <- Fruits[,c(1:2,4:6)]
Fruits_2

mdata1 <- melt(Fruits_2,id.var="Fruit") #id.var(melt제외할 컬럼)
mdata1

mdata2 <- melt(Fruits_2,id.var=c("Fruit","Year"))
mdata2

dcast(mdata2,Year+Fruit~variable) #melt안했던 컬럼을 적기

#melt할 때 고유한 항목으로 구분 안되고 중복되는 값이 있을 경우
Fruit_3 <- Fruits[,c(1,4:6)]
Fruit_3

mdata2 <- melt(Fruit_3,id='Fruit')
mdata2

#과일별로 집계하여 출력(sum,mean,median사용가능)
dcast(mdata2,Fruit~variable,fun.aggregate=sum)
