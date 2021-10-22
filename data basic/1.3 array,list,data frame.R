#Array(배열형) 데이터 유형
array1 <- array(c(1:12),dim=c(4,3)) #4행 3열로 만들기
array1
array2 <- array(c(1:12),dim=c(2,2,3)) #2행 2열씩 3층
array2

#List 데이터 유형(vector,matrix,array와 달리 다른 유형의 데이터 관리 가능)
hong <- list(번호=1,일자="2016-12-01",상품이름="새우깡",가격=1500,구매수량=1)
hong
hong$일자 #"2016-12-01"

#data frame 데이터 유형
no <- c(1,2,3,4)
name <-c("Apple","Peach","Banana","Grape")
price <- c(500,200,100,50)
qty <- c(5,2,4,7)
sales <- data.frame(No=no,NAME=name,PRICE=price,QTY=qty)
sales

sales$NAME #"Apple"  "Peach"  "Banana" "Grape" 

