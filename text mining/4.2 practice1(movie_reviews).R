#practice1 - 영화 리뷰 분석하여 키워드를 추출한 후 워드 클라우드와 그래프로 출력

#텍스트 마이닝 일반적인 순서
#문장 -> 단어 -> 키워드(명사/형용사/동사)추출 -> 필터링 -> 집계 -> 시각화
#명사/형용사/동사 추출 후 필터링 하는 과정을 많이 반복

library(KoNLP) #한글 분석시 주로 사용
library(wordcloud)
library(stringr)

#1.분석 파일 불러오기
data1 <- readLines("영화_밀정.txt")
data1

#2.문장을 단어로 분리 한 후 명사를 추출
data2 <- Filter(function(x) {nchar(x)<=200},data1) #200자 이상인 문장 제외
data2

tran1 <- Map(extractNoun,data2)
tran1
tran11 <- unique(tran1) #중복된 줄 삭제
tran11
tran2 <- sapply(tran11,unique) #각 줄에서 중복된 단어 삭제
tran2

#3.추출된 명사 중 불용어를 필터링하여 제거
tran3 <- rapply(tran2, function(x) gsub("리뷰","",x), how = "replace")
tran3 <- rapply(tran3, function(x) gsub("영화","",x), how = "replace")
tran3 <- rapply(tran3, function(x) gsub("평점","",x), how = "replace")
tran3 <- rapply(tran3, function(x) gsub("내용","",x), how = "replace")
tran3 <- rapply(tran3, function(x) gsub("제외","",x), how = "replace")
tran3 <- rapply(tran3, function(x) gsub("ㅋㅋㅋ","",x), how = "replace")
tran3 <- rapply(tran3, function(x) gsub("ㄱㄱㄱ","",x), how = "replace")
tran3

#4.특정 글자수를 지정하여 불용어와 공백을 제거
data3 <- sapply(tran3, function(x) {Filter(function(y) {nchar(y) <= 6 && nchar(y) > 1},x)})
data4 <- unlist(data3)
data4

#5.각 단어별로 집계하여 출현빈도 계산
wordcount <- table(data4)
wordcount
wordcount <- Filter(function(x) {nchar(x) <= 10},wordcount)
head(sort(wordcount,decreasing=T),100)

#6.필요없는 단어를 제거한 후 공백을 제거하고 다시 집계
#  이 과정을 여러 번 반복하여 필요없는 단어들은 모두 제거
txt <- readLines("movie_gsub.txt")
txt
cnt_txt <- length(txt)
cnt_txt
for(i in 1:cnt_txt){
  tran3 <- rapply(tran3,function(x) gsub((txt[i]),"",x),how="replace")
}
tran3

data3 <- sapply(tran3, function(x) {Filter(function(y) {nchar(y) >= 2},x)})
data4 <- unlist(data3)
data4

wordcount <- table(data4)
wordcount
head(sort(wordcount,decreasing=T),100)

#7.워드 클라우드로 그린다.
library(RColorBrewer)
windows()
palete <- brewer.pal(7,"Set2")
wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,
          min.freq=5,random.order=F,random.color=T,colors=palete)
savePlot("4.2 wordcloud.png",type="png")

#8.그래프로 출력
windows(2000,1000)
par(mfrow=c(1,2))
final <- head(sort(wordcount,decreasing=T),15)
bp <- barplot(final,main="영화 밀정 후기 키워드 상위 Top 15-건별 출력",
              col=rainbow(10),cex.names=0.7,las=2,ylim=c(0,350))
text(x=bp,y=final*1.05,labels=paste(final,"건"),col="black",cex=0.7)

bp2 <- barplot(final,main="영화 밀정 후기 키워드 상위 TOP 15-비율별 출력",
               col=rainbow(10),cex.names=0.7,las=2,ylim=c(0,350))
pct <- round(final/sum(final)*100,1)
text(x=bp2,y=final*1.05,labels=paste(pct,"%"),col="black",cex=0.7)
savePlot("4.2 graph.png",type="png")
