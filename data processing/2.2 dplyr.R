#dplyr()패키지
install.packages("dplyr")
library(dplyr)

data1 <- read.csv("2013년_프로야구선수_성적.csv")
data1

#filter()/slice() 함수 - 특정 조건에 맞는 데이터만 골라내기
data2 <- filter(data1,경기>120) #경기수가 120 초과한 선수
data2

data3 <- filter(data1,경기>120 & 득점>80)
data3

data4 <- filter(data1,포지션 %in% c('1루수','3루수'))
data4

data5 <- slice(data1,3:5) #특정 행수를 지정
data5

#select()함수 - 특정 컬럼만 지정해서 조회
select(data1,순위:타수)
select(data1,-홈런,-타점,-도루) #조회하기 싫은 컬럼 제외
select(data1,starts_with("X")) #시작하는 글자 지정
select(data1,ends_with("율")) #마치는 글자 지정
select(data1,contains("루")) #특정 글자 포함하는 컬럼 모두 출력

label <- c("안타","타점","번트","출루율")
select(data1,one_of(label)) #컬럼명을 정확하게 모를 경우 해당되는 것만 출력

#파이프라인
#1번작업 %>%
#2번작업 %>%
#3번작업
data1 %>%
select (선수명,팀,경기,타수) %>%
filter(타수>400)  

#arrange() - 정렬
data1 %>%
select (선수명,팀,경기,타수) %>%
filter(타수>400)  %>%
arrange(타수)

#mutate():기존 컬럼 보여줌/transmute():새로 만든 컬럼만 보여줌 - 새로운 컬럼 추가
data1 %>%
select(선수명,팀,경기,타수) %>%
mutate(경기x타수 = 경기*타수) %>%
arrange(경기x타수)

data1 %>%
select(선수명,팀,경기,타수) %>%
transmute(경기x타수 = 경기*타수) %>%
arrange(경기x타수)

#rename() - 컬럼명 변경
data2 <- data.frame(name=data1$선수명,team=data1$팀,pos=data1$포지션)
data2

#distinct() - 중복값 제거하고 출력
distinct(data1,팀)
distinct(data1,팀,선수명)

#sample_n()/sample_frac() - 샘플 추출
sample_n(data1[,5:11],5) #5개만 출력
sample_frac(data1[,5:11],0.5) #50%만 출력

#summarise()로 요약정보 보기
summarise(data1,타수평균값 = mean(타수,na.rm=T),
                타수중앙값 = median(타수,na.rm=T),
                타수표준편차 = sd(타수,na.rm=T))
data1 %>%
group_by(팀) %>%
summarise(평균 = mean(경기,na.rm=T)) #팀별 평균

data1 %>%
group_by(팀) %>%
summarise_each(funs(mean),경기,타수) #팀별 경기 타수 평균(각각)

#lead()/lag() - 지정된 수 만큼 내리고 올리기
name <- c("홍길동","일지매","유관순","강감찬","을지문덕")
pos <- c("과장","대리","부장","차장","대리")
member <- data.frame(name=name,pos=pos)
member

member2 <- data.frame(name=name,pos=lead(pos,1)) #위로 한칸씩 올리기
member2

member3 <- data.frame(name=name,pos=lag(pos,1)) #아래로 한칸씩 내리기
member3
