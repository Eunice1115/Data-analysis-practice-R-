#기본 함수
vec1 <- c(1,2,3,4,5)
vec2 <- c('a','b','c','d','e')
max(vec1) #5
max(vec2) #e
mean(vec1) #3
mean(vec2) #Error
median(vec1) #3
median(vec2) #c
min(vec1) #1
sd(vec1) #1.581139
sum(vec1) #15
var(vec1) #2.5

#aggregate 함수(특정 값이나 컬럼을 기준으로 집계)
install.packages("googleVis")
library(googleVis)
Fruits

aggregate(Sales~Year,Fruits,sum) #연도별로 판매된 수량
aggregate(Sales~Fruit,Fruits,sum) #Fruit 별로 판매된 수량
aggregate(Sales~Fruit,Fruits,max) #Fruit 별로 가장 많이 판매된 수량
aggregate(Sales~Fruit+Year,Fruits,max) #Fruit,연도별 가장 많이 판매된 수량

data1 <- read.csv("과일판매현황2.csv")
data1
aggregate(판매수량~이름,data1,sum)

sub1 <- read.csv("subway_1.csv")
sub1
aggregate(승차인원~일자,sub1,sum)
aggregate(하차인원~노선번호,sub1,sum)
aggregate(승차인원~일자+노선번호,sub1,sum)

#apply함수(특정 컬럼을 기준으로 집계 : 가로합계, 세로합계)
mat1 <- matrix(c(1,2,3,4,5,6),nrow=2,byrow=T)
mat1
apply(mat1,1,sum) #행의 합계를 구하기
apply(mat1,2,sum) #열의 합계를 구하기
apply(mat1[,c(2,3)],2,max) #2열과 3열의 최대값 구하기

#apply 변형(lapply,sapply,tapply)
list1 <- list(Fruits$Sales)
list1
list2 <- list(Fruits$Profit)
list2
lapply(c(list1,list2),max) #list1에서 최대값, list2에서 최대값(각각)
sapply(c(list1,list2),max) #값만 보여줌

lapply(Fruits[,c(4,5)],max)
sapply(Fruits[,c(4,5)],max)
Fruits[,c(4,5)]

attach(Fruits) #컬럼 이름을 변수명처럼 처리할 수 있는 기능
tapply(Sales,Fruit,sum) #과일 이름 별로 판매량 합계(aggregate와 달리 가로로 출력)

#사용자 정의 함수
myfunct2 <- function(a){
  b <- a^2
  return(b)
}
myfunct2(3) #9

myfunct3 <- function(a,b){
  c <- a*b
  return(c)
}
myfunct3(2,3) #6



