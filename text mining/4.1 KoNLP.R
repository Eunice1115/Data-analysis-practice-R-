#KoNLP패키지 
install.packages("KoNLP")
library(KoNLP)
library(stringr)

txt2 <- "R라뷰 책으로 R 프로그래밍을 시작하세요~!"
txt2
strsplit(txt2," ")

#extractNoun()함수를 이용해 명사만 골라내기
extractNoun(txt2)

txt1 <- readLines("좋아하는과일.txt")
txt1

txt2 <- extractNoun(txt1)
txt2

#품사까지 함께 자세하게 출력
txt3 <- "우리 모두 R라뷰 책으로 정말 재미있게 공부해요"
txt4 <- SimplePos09(txt3)
txt4

#품사 중에 명사(N)만 골라내기
txt_n <- str_match(txt4,'([A-Z가-힣]+)/N')
txt_n

#품사 중에서 용언(동사,형용사,보조용언) - P만 골라내기
txt_p <- str_match(txt4,'([A-Z가-힣]+)/P')
txt_p

#품사 중에서 명사와 용언만 골라내기
txt_np <- str_match(txt4,'([A-Z가-힣]+)/[NP]')
txt_np

#띄어쓰기 잘못하면? -> 띄어쓰기는 지켜야함
txt2 <- ("봄이지나 면여름이고 여름이지나면가을 입니다다")
extractNoun(txt2) #"면여름이고" "여름"

#사전 활용
txt3 <- "우리는 유관순 의사와 안중근 의사가 독립투사임을 반드시 기억합시다"
extractNoun(txt3) # "우리" "유관" "순" "의사" "안중" "근" "의사" "독립투사" "기억" "합" 


mergeUserDic(data.frame(c('유관순','안중근'),c('ncn')))
extractNoun(txt3) # "우리" "유관순" "의사" "안중근" "의사" "독립투사" "기억" "합"

#추가할 단어가 많을 경우 파일에 저장 후 불러온다
mergeUserDic(data.frame(readLines("mergefile.txt"),"ncn"))

#중복되는 값 제거
txt1 <- readLines("좋아하는과일.txt")
txt1

txt2 <- Map(extractNoun,txt1)
txt2

txt3 <- unique(txt2) #동일한 줄이 하나 더 있으면 삭제
txt3

txt4 <- lapply(txt3,unique) #각 줄에서 중복되는 단어 삭제
txt4

#필요없는 단어 제거
#gsub("변경 전 글자","변경 후 글자",data)
txt5 <- rapply(txt4, function(x) gsub("최고","",x), how="replace")
txt5

#지워야 할 글자가 많을 경우
#파일에 목록을 저장한 후 반복문으로 삭제
txt <- readLines("gsub.txt")
cnt_txt <- length(txt)
for(i in 1:cnt_txt){
  txt5 <- rapply(txt4, function(x) gsub((txt[i]),"",x),how="replace")
}

#특정 글자를 다른 글자로 변경시
txt6 <- rapply(txt5,function(x) gsub("포도","청포도",x),how="replace")
txt6

#filter()함수 이용하여 글자수로 제거('나'글자 제거)
txt7 <- sapply(txt6,function(x) {Filter(function(y) {nchar(y) <= 6 && nchar(y) > 1},x)})
txt7

#1글자 이상 3글자 이하만 남겨두고 싶을 경우
txt8 <- sapply(txt7,function(x) {Filter(function(y) {nchar(y) <= 3 && nchar(y) >= 1},x)})
txt8

#wordcloud(words:출력할 단어들, freq:언급된 빈도수, scale:글자크기, min.freq:최소언급횟수지정)
library(wordcloud)
palete <- brewer.pal(9,"Set1")
wordcloud(c(letters,LETTERS,0:9),seq(1,1000,len=62),colors=palete)
