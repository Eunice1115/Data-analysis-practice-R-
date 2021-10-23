#stringr()패키지
install.packages("stringr")
library(stringr)

fruits <- c('apple','Apple','APPLE','banana','pineapple')

str_detect(fruits,'A') #FALSE  TRUE  TRUE FALSE FALSE
str_detect(fruits,'^a') #TRUE FALSE FALSE FALSE FALSE
str_detect(fruits,'e$') #TRUE  TRUE FALSE FALSE  TRUE
str_detect(fruits,'^[aA]') #TRUE  TRUE  TRUE FALSE FALSE
str_detect(fruits,'[aA]') #TRUE TRUE TRUE TRUE TRUE
str_detect(fruits,regex('a',ignore_case=T)) #대소문자 무시 : TRUE TRUE TRUE TRUE TRUE

str_count(fruits,regex('a',ignore_case=T)) #특정 글자 개수 : 1 1 1 3 1
str_count(fruits,'a') #1 0 0 3 1

str_c("apple","banana") #문자열 합치기 : "applebanana"
str_c("Fruits:",fruits) #리터럴 문자 : "Fruits:apple""Fruits:Apple""Fruits:APPLE""Fruits:banana""Fruits:pineapple"
str_c(fruits,collapse="-") #"apple-Apple-APPLE-banana-pineapple"

str_dup(fruits,3) #3번 반복

str_length('apple') #길이 : 5
str_length(fruits) #5 5 5 6 9

str_locate('apple','a') #특정 문자의 출현 위치값
str_locate(fruits,'a')

str_replace('apple','p','*') #특정 문자를 다른 문자로 치환 : "a*ple"
str_replace('apple','p','**') #"a**ple"
str_replace_all('apple','p','*') #"a**le"

fruits <- str_c('apple','/','orange','/','banana')
fruits
str_split(fruits,"/")

str_sub(fruits,start=1,end=3) #특정 위치부터 글자 잘라내기 : "app"
str_sub(fruits,start=6,end=9) #"/ora"
str_sub(fruits,start=-5) #"anana"
