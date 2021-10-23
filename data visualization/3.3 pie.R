#pie chart
p1 <- c(10,20,30,40)
pie(p1,radius=1)
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),
    label=c("Week 1","Week 2","Week 3","Week 4"))

#수치값을 함께 출력
pct <- round(p1/sum(p1)*100,1)
lab <- paste(pct,"%")
windows(130,100)
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),label=lab)
legend(1.2,1,c("Week 1","Week 2","Week 3","Week 4"),
       cex=0.8,fill=rainbow(length(p1)))
savePlot("3.3 graph1.png",type="png")

#범례를 생략하고 수치값을 그래프에 함께 출력
pct <- round(p1/sum(p1)*100,1)
lab1 <- c("Week 1","Week 2","Week 3","Week 4")
lab2 <- paste(lab1,"\n",pct,"%")
windows()
pie(p1,radius=1,init.angle=90,col=rainbow(length(p1)),label=lab2)
savePlot("3.3 graph2.png",type="png")
