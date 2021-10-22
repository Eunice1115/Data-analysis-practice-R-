#vector : 여러건의 데이터를 한줄로 처리
#벡터 안에 속성은 반드시 같아야 함

vec1 <- c(1,2,3,4,5)
vec1
class(vec1) #numeric

vec2 <-c(1,2,3,4,'5') 
vec2
class(vec2) #character

vec1[3] #3번째 출력 : 3
vec1[-3] #3번째는 빼고 출력
vec1[-1:-3] #4,5
vec1[2:4] #2,3,4

vec1[2] <- 6 #2번째 값을 6으로 바꿈
vec1 #1,6,3,4,5

vec1 <- c(vec1,7) #7추가
vec1 #1,6,3,4,5,7

vec1[9] <-9
vec1 #1  6  3  4  5  7 NA NA  9

append(vec1,10,after=3) #3?뒤에 10을 추가
append(vec1,c(10,11),after=3) #3뒤에 10,11추가

c(1,2,3)+c(4,5,6) #벡터 ???:5 7 9

vec1 <-c(1,2,3)
vec2 <-c(3,4,5)
union(vec1,vec2) #1 2 3 4 5 (중복된 값을 제거하고 출력)
intersect(vec1,vec2) #3(교집합 조회)
setdiff(vec1,vec2) #차집합 : 1 2

var5 <-seq(1,5)
var5 #1 2 3 4 5

var6 <-seq(2,-2)
var6 #2  1  0 -1 -2

var7 <-seq(1,10,2)
var7 #1 3 5 7 9

var8 <-rep(1:3,2)
var8 #1 2 3 1 2 3

var9 <-rep(1:3,each=2)
var9 #1 1 2 2 3 3

length(var5) #벡터 길이 : 5

3 %in% var7 #var7에 3이 있는지 :True
4 %in% var7 #False

fruit <-c("사과","단감","파인애플","딸기","apple")
"감" %in% fruit #일부 글자 찾는 것은 안됨 :False (영어도 같음)

