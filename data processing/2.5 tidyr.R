#tidyr()패키지
install.packages("tidyr")
library(tidyr)
Fruits

#gather()함수 - reshape2()패키지의 melt()함수와 같은 역할(attribute:컬럼이름,value:값)
Fruits_4 <- gather(Fruits[,c(1:6)],attribute,value,Location:Profit) 
Fruits_4

#특정 컬럼이 맨앞에 나오거나 특정 위치에 오도록
library(dplyr)
Fruits %>%
select(Date,Fruit,Location,Sales,Expenses,Profit) %>%
gather(attribute,value,Location:Profit)

#spread()함수 - reshape2()패키지의 dcast()와 같은 역할
spread(Fruits_4,attribute,value)


