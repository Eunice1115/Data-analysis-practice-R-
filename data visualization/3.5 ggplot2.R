#ggplot2()시각화
library(ggplot2)
library(gridExtra)
library(patchwork)

#기본문법 : ggplot(dataframe,aes(x=x축 데이터,y=y축 데이터))+geom 함수...
#다양한 geom함수
apropos("^geom*_")

korean <- read.csv("3.5 학생별국어성적_new.txt")
korean

#geom_point()
windows(1000,500)
a <- ggplot(korean,aes(x=이름,y=점수))+geom_point()
b <- ggplot(korean,aes(x=이름,y=점수))+geom_point(shape=21,aes(size=점수),color="black",fill="cyan")
c <- ggplot(korean,aes(x=이름,y=점수))+geom_point(shape=21,aes(size=점수,fill=factor((이름))),color="black")
a+b+c
savePlot("3.5 graph1(geom_point).png",type="png")

#geom_line() - group을 적어야 함
ggplot(korean,aes(x=이름,y=점수,group=과목))+geom_line()
ggplot(korean,aes(x=이름,y=점수,group=과목))+geom_line(color="red",linetype=2)

#여러개의 선 그래프 한꺼번에 그리기
three <- read.csv("3.5 학생별과목별성적_3기_3명.csv",header=T)
windows(1000,500)
a <- ggplot(three,aes(x=과목,y=점수,color=이름,group=이름))+geom_line()
b <- ggplot(three,aes(x=과목,y=점수,color=이름,group=이름))+geom_line()+geom_point()
c <- ggplot(three,aes(x=과목,y=점수,color=이름,group=이름))+geom_line()+geom_point(size=2,shape=15)
a+b+c
savePlot("3.5 graph2(geom_line).png",type="png")

#geom_abline()
windows()
ggplot(three,aes(x=과목,y=점수,color=이름,group=이름))+
  geom_line()+geom_point(size=2,shape=15)+
  geom_abline(intercept=75,slope=0,color="purple",linetype=2)
savePlot("3.5 graph3(geom_abline).png",type="png")

#geom_bar()
windows()
a <- ggplot(korean,aes(x=이름,y=점수))+geom_bar(stat="identity",fill="cyan",color="red")
b <- ggplot(korean,aes(x=이름,y=점수))+geom_bar(stat="identity",fill="cyan",color="red")+coord_flip()
a+b
savePlot("3.5 graph4(geom_bar).png",type="png")

#geom_boxplot()
score <- read.csv("3.5 상반기사원별월별실적현황_new.csv")
score
s_temp <- read.csv("3.5 서울의기온변화.csv")
s_temp
windows(1000,500)
a <- ggplot(score,aes(x=이름,y=실적금액))+geom_boxplot()+ggtitle("사원별 월별 실적")
b <- ggplot(score,aes(x=이름,y=실적금액))+geom_boxplot()+geom_point()+ggtitle("사원별 월별 실적")
c <- ggplot(s_temp,aes(x=factor(Month),y=MeanTemp))+geom_boxplot(aes(fill=factor(Month)))+
      geom_point()+xlab("월")+ylab("평균기온")+ggtitle("서울의 월별 기온변화")
a+b+c
savePlot("3.5 graph5(geom_boxplot).png",type="png")

#geom_violin()
windows()
ggplot(s_temp,aes(factor(Month),MeanTemp))+geom_violin(aes(fill=factor(Month)))+
  xlab("월")+ylab("평균기온")
savePlot("3.5 graph6(geom_violin).png",type="png")

#geom_density()
windows(500,200)
par(mfrow(1,2))
a <- ggplot(faithful,aes(x=waiting))+geom_density(fill="blue",alpha=.2)+xlim(35,105)
b <- ggplot(faithful,aes(x=waiting,y=..density..))+
    geom_histogram(fill="cyan",colour="black",size=.2)+
    geom_density()
a+b
savePlot("3.5 graph7(geom_density).png",type="png")

#geom_density_2d()
windows()
ggplot(faithful,aes(x=eruptions,y=waiting))+
  geom_point()+xlim(0.5,6)+ylim(40,110)+geom_density_2d()
savePlot("3.5 graph8(geom_density_2d).png",type="png")

#geom_area()
install.packages("gcookbook")
library(gcookbook)
dis <- read.csv("3.5 1군전염병발병현황_년도별.csv")
dis
windows(500,200)
a <- ggplot(dis,aes(x=년도별,y=장티푸스,group=1))+geom_area(color="red",fill="cyan",alpha=0.4)
b <- ggplot(uspopage,aes(x=Year,y=Thousands,fill=AgeGroup))+
    geom_area()+ggtitle("여러가지 데이터 겹쳐서 표현")
a+b
savePlot("3.5 graph9(geom_area).png",type="png")

#geom_text() : 그래프에 글씨 적기
windows()
ggplot(korean,aes(x=이름,y=점수))+
  geom_point(shape=21,aes(size=점수,fill=factor((이름))),color="black")+
  geom_text(aes(label=이름),color="black",size=3,vjust=-1)
savePlot("3.5 graph10(geom_text).png",type="png")
