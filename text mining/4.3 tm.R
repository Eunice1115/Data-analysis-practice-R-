#tm()패키지 - 영문 텍스트마이닝
#파일 불러오기 -> Corpus 형태로 변환 -> 불용어제거
#-> TermDocumentMatrix로 변환 -> 집계 -> 시각화

install.packages("tm")
library(tm)
library(wordcloud)

#1.데이터 불러오기
data1 <- readLines("tm_test1.txt")
data1

#2.tm패키지가 처리할 수 있는 형태인 Corpus(말뭉치)형태로 변환
corp1 <- VCorpus(VectorSource(data1))  #벡터이므로 VectorSource()함수 사용
corp1
inspect(corp1)

#3.tm패키지가 분석할 수 있는 Term-Document형식의 Matrix로 변환
tdm <- TermDocumentMatrix(corp1)
tdm

m <- as.matrix(tdm)
m

#불용어 제거
corp2 <- tm_map(corp1,stripWhitespace) #여러개의 공백을 하나의 공백으로 변환
corp2 <- tm_map(corp2,tolower) #대문자가 있을 경우 소문자로 변환
corp2 <- tm_map(corp2,removeNumbers) #숫자를 제거
corp2 <- tm_map(corp2,removePunctuation) #마침표,콤마,세미콜론,콜론 등의 문자 제거
corp2 <- tm_map(corp2,PlainTextDocument)
sword2 <- c(stopwords('en'),"and","but","not") #불용어로 쓸 단어 추가
corp2 <- tm_map(corp2,removeWords,sword2) #불용어 제거

#불용어나 공백등이 제거 된 후 다시 Term-Document Matrix 생성
tdm2 <- TermDocumentMatrix(corp2)
tdm2

m2 <- as.matrix(tdm2)
m2

colnames(m2) <- c(1:4)
m2

#집계
freq1 <- sort(rowSums(m2),decreasing=T) #가로로 합계
head(freq1,20)

#Term Document Matrix에서 특정 횟수 이상 언급된 것들만 출력하고 싶을 경우
findFreqTerms(tdm2,2)

#특정 단어와 상관관계를 찾고 싶을 경우
findAssocs(tdm2,"apple",0.5) #apple단어와 상관계수가 0.5이상인 단어어

#워드클라우드
library(RColorBrewer)
windows()
palete <- brewer.pal(8,"Set3")
wordcloud(names(freq1),freq=freq1,scale=c(5,1),min.freq=1,colors=palete,
          random.order=F,random.color=T)
savePlot("4.3 wordcloud.png",type="png")

#그래프
windows()
barplot(freq1,main="tm package test",las=2,ylim=c(0,5))
savePlot("4.3 graph.png",type="png")
