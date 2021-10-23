#정규식과 grep()
char <- c('apple','Apple','APPLE','banana','grape')
grep('apple',char) #해당 데이터가 있는 위치값 출력 : 1
grep('apple',char,value=T) #실제 데이터 출력

#여러가지 패턴을 찾고 싶을 경우
char2 <- c('apple','APPLE')
grep(paste(char2,collapse="|"),char,value=T) #"apple" "APPLE"

txt1 <- c('123','a123','abc','abc 123')
grep("\\d",txt1,value=T) #숫자가 있는 데이터만 출력 :  "123" "a123" "abc 123"
grep("\\D",txt1,value=T) #숫자가 없는 데이터만 출력 : "a123" "abc" "abc 123"
grep("\\s",txt1,value=T) #공백이 들어있는 데이터 출력 : "abc 123"
grep("^\\d",txt1,value=T) #숫자로 시작하는 데이터 출력 : "123"
grep("\\d$",txt1,value=T) #숫자로 끝나는 데이터 출력 : "123" "a123" "abc 123"

txt2 <- c("a.txt","ab.txt","ab123.txt","123.txt")
grep(".",txt2,value=T) #모든 데이터 출력 : "a.txt" "ab.txt" "ab123.txt" "123.txt" 

grep("[0-9]",txt1,value=T) #숫자가 들어간 데이터 출력 : "123" "a123" "abc 123"
grep("[^0-9]",txt1,value=T) #숫자가 아닌 데이터 출력 : "a123" "abc" "abc 123"
grep("^[^0-9]",txt1,value=T) #숫자가 아닌 문자로 시작하는 데이터 : "a123" "abc" "abc 123"

txt3 <- c("사과1개","apple","1234")
grep("[:alpha:]",txt3,value=T) #알파벳 출력 : "apple"

nchar(txt1) #글자수 출력 : 3 4 3 7

paste("Seo","jin","su") #여러 글자 연결 : "Seo jin su"
paste("Seo","jin","su",sep="") #글자 연결시 공백 제외 : "Seojinsu"
paste("Seo","jin","su",sep="/")#"Seo/jin/su"

substr('abc123',3,3) #글자수 잘라내기 : c
strsplit('1975/10/23',split="/") #/기준으로 분리

