

#더미 데이터
coupang <- sample(c(6000:9000),100,replace = TRUE)
naver <- sample(c(4000:8000),100,replace = TRUE)
kakao <- sample(c(4000:9000),100,replace = TRUE)





companies <- NULL
income <- NULL
employee <- NULL
for (i in 1:3){
  for (j in 1:100){
    companies <- c(companies, i)
    employee <- c(employee, j)
    if (i==1){
      income <- c(income, coupang[j])
    } else if (i==2) {
      income <- c(income, kakao[j])
    } else {
      income <- c(income, naver[j])
    }
  }
}
companies
employee
income

overall <- data.frame(Company = companies, Employee = employee, Income = income)
head(overall)
tail(overall)

str(overall)
summary(overall)


aov.test <- aov(Income~Company, data = overall)
summary(aov.test)



aov.test.2 <- aov(Income~Company*Employee, data = overall)
summary(aov.test.2)




library(ggplot2)
ggplot(overall, aes(x=factor(Company), y=Income)) + geom_boxplot()

# ifelse(조건,해당,해당X)
library(dplyr)
overall_2 <- overall %>% mutate(Companies = ifelse(Company==1, "coupang", ifelse(Company==2, "kakao", "naver")))
summary(overall_2)

ggplot(overall_2, aes(x=Companies, y=Income)) + geom_boxplot()


ggplot(overall_2, aes(x=Companies, y=Income, fill=Companies)) + geom_boxplot()


ggplot(overall_2, aes(x=Companies, y=Income, fill=Companies)) + geom_boxplot() + scale_fill_grey()


ggplot(overall_2, aes(x=Companies, y=Income, fill=Companies)) + geom_boxplot() + scale_fill_manual(values = c("red","yellow","green"))


ggplot(overall_2, aes(x=Companies, y=Income, fill=Companies)) + geom_boxplot() + scale_fill_manual(values = c("red","yellow","green")) + geom_point()


ggplot(overall_2, aes(x=Companies, y=Income, fill=Companies)) + geom_boxplot() + scale_fill_manual(values = c("red","yellow","green")) + theme(legend.position = "none")


ggplot(overall_2, aes(x=Companies, y=Income, fill=Companies)) + geom_boxplot() + scale_fill_manual(values = c("red","yellow","green")) + theme(legend.position = "right") + labs(title = "Income by companies", x="Company names", y="Salary")







mpg

cor(mpg$displ,mpg$cyl)
plot(mpg$displ,mpg$cyl)

cor.test(mpg$displ,mpg$cyl)

sum((mpg$displ-3.471795)*(mpg$cyl-5.888889))/sqrt(sum((mpg$displ-3.471795)^2)*sum((mpg$cyl-5.888889)^2))

#생각하기
#displ, year, cyl, cty, hwy로 구성된 mpgNumeric이라는 변수를 생성하시오.

mpgNumeric <- data.frame(displ = mpg$displ, year = mpg$year, cyl = mpg$cyl, cty = mpg$cty, hwy = mpg$hwy)

mpgNumeric_2 <- mpg[,c("displ","year","cyl","cty","hwy")]

mpgCor <- cor(mpgNumeric_2)






# 시각화 그려보기
install.packages("corrplot")
library(corrplot)

corrplot(mpgCor)
?corrplot

c("circle", "square", "ellipse", "number", "shade", "color", "pie")

corrplot(mpgCor, method = "circle")
corrplot(mpgCor, method = "square")
corrplot(mpgCor, method = "ellipse")
corrplot(mpgCor, method = "number")
corrplot(mpgCor, method = "shade")
corrplot(mpgCor, method = "color")
corrplot(mpgCor, method = "pie")

bw <- c("white","black")
corrplot(mpgCor, method = "ellipse", col = bw)



corrplot(mpgCor, method = "ellipse", tl.col="black", addCoef.col ="black", title="Corrplot mpg")









