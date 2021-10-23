#plot() - 선그래프 그리기
x <- 1:3
y <- 3:1
plot(x,y)
plot(x,y,type='o',col="red")
plot(x,y,type='o',col="red",xlim=c(1,10),ylim=c(1,5)) #최대값 지정
#제목 지정
plot(x,y,type='o',col="red",xlim=c(1,10),ylim=c(1,5),
     xlab='x축 값',ylab='y축 값',main="Plot test") 

#par(mfrow=c(행 개수,열 개수)) : 그래프 여러개
v1 <- c(100,130,120,160,150)
windows()
par(mfrow=c(1,3))
plot(v1,type="o",col="red")
plot(v1,type="s",col="blue")
plot(v1,type="l",col="green")
savePlot("3.1 graph1.png",type="png")

#legend(x축 위치,y축 위치,내용,cex=글자크기,col=색상,pch=크기,lty=선모양) : 범례지정
v1 <- c(100,130,120,160,150)
windows()
par(mfrow=c(1,1))
plot(v1,type='o',col="red")
legend(1,160,"v1",cex=0.9,col="red",lty=1)
savePlot("3.1 graph2.png",type="png")
