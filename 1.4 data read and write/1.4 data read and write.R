setwd("C:\\Users\\Administrator\\git\\R project\\1.4 data read and write")
getwd()

#비정형 텍스트 데이터 불러오기
txt1 <- readLines("비정형데이터예제_구매후기.txt")
txt1

#정형 데이터 불러오기
fruits <- read.table('fruits.txt')
fruits

fruits <- read.table('fruits.txt',header=T) #임의로 붙여진 헤더 삭제
fruits

#주석이나 공백을 자동제거
fruits <- read.table('fruits_2.txt')
fruits

#잘라서 읽어 들이기 - skip/nrow 옵션 활용
input1 <- read.table("인물.txt",header=T,nrow=4) #4줄만 불러오기
input1

input2 <- read.table("인물.txt",skip=5,nrow=3) #5번째 데이터 부터 3줄 불러오기
input2 

txt2 <- read.table("고객.txt",header=T,sep=":") #:로 컬럼을 구분
txt2

#csv 파일 불러오기
fruit3 <- read.csv('fruits_3.csv')
fruit3

#엑셀 파일 불러오기
install.packages("readxl")
library(readxl)
data <- read_excel("fruits_6.xls")
data

#scan()함수로 데이터 입력받기
nol <- scan()
str1 <- scan(what="") #글자를 입력 받을 경우 what추가

#비정형 형태로 저장
txt1 <- readLines("write_test.txt")
txt1
write(txt1,"write_test2.txt")
writeLines(txt1,"write_test3.txt")

#정형 형태로 저장
txt1 <- read.table("table_test.txt",head=T)
txt1
write.table(txt1,"table_test2.txt")

#csv형태로 저장
txt1 <- read.csv("csv_test.csv")
txt1
write.csv(txt1,"csv_test2.csv")

#엑셀 형태로 저장
install.packages("xlsx")
library(xlsx)
write.xlsx(txt1,"fruits.xlsx")

#그림 저장하기
data1 <- c(1,2,3,4,5)
windows()
plot(data1)
savePlot("ex1.png",type="png")
