#barplot() - 막대 그래프 그리기
x <- c(1,2,3,4,5)
par(mfrow=c(1,1))
barplot(x)

#가로로 눕힌 bar plot
barplot(x,horiz=T)

#가로로 grouping해서 출력(같은 컬럼끼리 붙어서 출력)
x <- matrix(c(5,4,3,2),2,2)
x
barplot(x,beside=T,names=c(5,3),col=c('green','yellow'))
barplot(x,names=c(5,3),col=c('green','yellow')) #위로 붙는다

#여러 막대 그래프를 그룹으로 묶어서 출력
v1 <- c(100,120,140,160,180)
v2 <- c(120,130,150,140,170)
v3 <- c(140,170,120,110,160)
qty <- data.frame(BANANA=v1,CHERRY=v2,ORANGE=v3)
qty
windows()
barplot(as.matrix(qty),main="Fruit's Sales QTY",
        beside=T,col=rainbow(nrow(qty)),ylim=c(0,300))
legend(15,300,c("MON","TUE","WED","THU","FRI"),cex=0.8,fill=rainbow(nrow(qty)))
savePlot("3.2 graph1.png",type="png")
