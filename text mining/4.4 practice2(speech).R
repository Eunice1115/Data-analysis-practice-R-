#practice2 - 스티브잡스 연설문 분석

#1.데이터 불러오기
data1 <- readLines("4.4 steve.txt")
data1

#2.Corpus 형태로 만들기
corp1 <- VCorpus(VectorSource(data1))
corp1
inspect(corp1)

#3.불용어 제거(tm_map)
corp2 <- tm_map(corp1,stripWhitespace) #여러 공백을 하나의 공백으로 변환
corp2 <- tm_map(corp2,tolower) #대문자가 있을 경우 소문자로 변환
corp2 <- tm_map(corp2,removeNumbers) #숫자를 제거
corp2 <- tm_map(corp2,removePunctuation) #마침표, 콤마, 세미콜론, 콜론 등 제거
corp2 <- tm_map(corp2,PlainTextDocument)
stopword2 <- c(stopwords('en'),"and","but") #불용어로 쓸 단어 추가
corp2 <- tm_map(corp2,removeWords,stopword2) #불용어 제거

#4.TermDocumentMatrix
#특정 글자수 이상의 단어만 골라와서 사용
corp3 <- TermDocumentMatrix(corp2,control=list(wordLengths=c(1,Inf)))
corp3

findFreqTerms(corp3,10) #10회 이상 언급된 단어
findAssocs(corp3,"apple",0.5) #apple단어와 0.5이상의 상관관계 있는 단어어

corp4 <- as.matrix(corp3)
corp4

freq1 <- sort(rowSums(corp4),decreasing=T)
freq1
head(freq1,20)

colnames(corp4) <- c(1:59)

#5회 이상 언급된 단어들만 모아서 워드클라우드로 표현
library(RColorBrewer)
windows()
palete <- brewer.pal(7,"Set3")
wordcloud(names(freq1),freq=freq1,scale=c(5,1),min.freq=5,colors=palete,
          random.order=F,random.color=T)
savePlot("4.4 wordcloud.png",type="png")