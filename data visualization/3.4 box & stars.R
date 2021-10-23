#boxplot() 
v1 <- c(10,12,15,11,20)
v2 <- c(5,7,15,8,9)
v3 <- c(11,20,15,18,13)
windows()
boxplot(v1,v2,v3)
savePlot("3.4 graph1.png",type="png")

#stars() 함수로 나이팅게일 차트 그리기
total <- read.table("3.4 학생별전체성적_new.txt",header=T,sep=",")
total

row.names(total) <- total$이름
total

total <- total[,2:7]
total

windows()
stars(total,flip.labels=FALSE,draw.segment=TRUE,frame.plot=TRUE,
      main="학생별 과목별 성적분석-나이팅게일 차트")
savePlot("3.4 graph2.png",type="png")

#네트워크 연결 그림그리기
install.packages("d3Network")
library(d3Network)

virus1 <- read.csv("3.4 메르스전염현황.csv",header=T)
virus1
d3SimpleNetwork(virus1,width=800,height=800,file="C:\\Users\\Administrator\\git\\R pro\\data visualization\\3.4 mers.html")
