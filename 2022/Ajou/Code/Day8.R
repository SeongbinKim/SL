rm(list=ls())

X <- c(18,20,23,41,60,55,27,58,10,25)
Y <- c(9,12,12,29,31,29,17,37,7,10)

#조건 1 : 두 변수가 선형 관계에 있어야 한다.
plot(X,Y)


lm(Y~X)
anova(lm(Y~X))
Y(혈중수은량) , X(수은섭취량)

Y(혈중수은량) = 0.5771X(수은섭취량)


XY <- NULL
X2 <- NULL
for (i in 1:length(X)){
  out1 <- X[i] * Y[i]
  out2 <- X[i] * X[i]
  XY <- c(XY,out1)
  X2 <- c(X2,out2)
}
ssr <- ((sum(XY)-((sum(X)*sum(Y))/length(X)))^2)/(sum(X2)-((sum(X)^2)/length(X)))



YY <- NULL
for(i in 1:length(Y)){
  out<-Y[i]*Y[i]
  YY<-c(YY,out)
}
YY

sst <- sum(YY)-((sum(Y)^2)/length(Y))


sse = sst - ssr

dfr <- 2-1
dfe <- 10-dfr-1
total <- 10-1

msr <- ssr/dfr; msr
mse <- sse/dfe; mse


fvalue <- msr/mse



summary(lm(Y~X))



#독립성
install.packages("lmtest")
library(lmtest)
dwtest(lm(Y~X))



par(mfrow=c(2,2))
plot(lm(Y~X))




library(ggplot2)
mpg

audi_a4
audi_a4_quattro




#생각하기
#carName변수 생성하기
carName <- paste(mpg$manufacturer,mpg$model,sep="_"); carName

#자동차 이름 안의 공백을 _로 정제하기
carName <- paste(gsub("\\s","_",mpg$manufacturer),gsub("\\s","_",mpg$model),sep="_"); carName

#생각하기
#mpgNumeric -> mpg데이터 안에 존재하는 수치형 데이터들로 구성된 데이터

mpgNumeric <- mpg[,c("displ","year","cyl","cty","hwy")]; mpgNumeric


row.names(mpgNumeric) <- carName

summary(as.factor(carName))

mpgTotal <- data.frame(name = carName, mpgNumeric)

library(dplyr)

byCar <- group_by(mpgTotal, name)

mpgByCar <- summarize(byCar, count=n(), meanDispl = mean(displ), meanYear = mean(year), meanCyl = mean(cyl), meanCty = mean(cty), meanHwy = mean(hwy))

mpgByCarDF <- as.data.frame(mpgByCar)


mpgByCarDFNumeric <- mpgByCarDF[,c("count","meanDispl", "meanYear",  "meanCyl",  "meanCty",  "meanHwy")]


mpgByCarDFNumeric <- round(mpgByCarDFNumeric,2)

row.names(mpgByCarDFNumeric) <- mpgByCarDF$name

str(mpgByCarDFNumeric)




# 군집분석
mpgByCarDist <- dist(mpgByCarDFNumeric, method="euclidean"); mpgByCarDist


mpgByCarDendrogram <- hclust(mpgByCarDist,method="single")

plot(mpgByCarDendrogram)
par(mfrow=c(1,1))

groupK <- cutree(mpgByCarDendrogram, k=4)
rect.hclust(mpgByCarDendrogram, k=4, border = "red")






# MDS
install.packages("MASS")
library(MASS)



mpgByCarMDS <- isoMDS(mpgByCarDist)

mpgByCarMDS <- as.data.frame(mpgByCarMDS)


library(ggplot2)

ggplot(mpgByCarMDS,aes(x=points.1,y=points.2)) + geom_point()


ggplot(mpgByCarMDS,aes(x=points.1,y=points.2)) + geom_point() + geom_text(aes(label = row.names(mpgByCarMDS)))


ggplot(mpgByCarMDS,aes(x=points.1,y=points.2)) + geom_point() + geom_text(aes(label = row.names(mpgByCarMDS)), size=2)






