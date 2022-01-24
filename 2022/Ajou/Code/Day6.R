gc()
rm(list=ls())
#한글깨짐현상
#한글 인코딩 문제 해결
#맥
Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
#윈도우
options(encoding = "UTF-8")

#경로확인하기

getwd()
setwd("/Users/seongminmun/Desktop/2022/Ajou/Data")
dir()

##JRE 
dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home/jre/lib/server/libjvm.dylib')


library(remotes)
library(rJava)
library(KoNLP)
library(stringr)

message <- "아주대학교에서 겨울 특강으로 진행된 R 데이터(텍스트) 마이닝 및 시각화 분석에서 학생분들이 보여준 학구열로 인해 힘이 납니다."
extractNoun(message)

MorphAnalyzer(message)

SimplePos22(message)

SimplePos09(message)

messagePos09 <- SimplePos09(message)

messageN <- str_extract_all(messagePos09,'([A-Z가-힣]+)/N'); messageN

messageP <- str_extract_all(messagePos09,'([A-Z가-힣]+)/P'); messageP




.libPaths()


rumor <- "요즘 아주대학교 학생들 사이에 아이폰 스그를 사용하는 교수님이 더 지적이라는 소문이 돌고 있다."
extractNoun(rumor)


buildDictionary(user_dic = data.frame(c('스그'),'ncn'))
extractNoun(rumor)


useSejongDic()


studentNames <- "우리 수업에는 이무진 임영웅 그리고 김민석 학생들이 있다."
extractNoun(studentNames)



getwd()
setwd("/Users/seongminmun/Desktop/2022/Ajou/Data")
dir()



buildDictionary(user_dic = data.frame(readLines("studentList.txt"),'ncn'))




# 형태소 분석기를 사용해서 텍스트 정제하기

message <- "아주대학교에서 겨울 특강으로 진행된 R 데이터(텍스트) 마이닝 및 시각화 분석에서 학생분들이 보여준 학구열로 인해 힘이 납니다."

messagePOS22 <- SimplePos22(message)



textPOS <- NULL
for (i in 1:length(messagePOS22)){
  process1 <- messagePOS22[i]
  process2 <- as.character(process1)
  process3 <- gsub("\\+"," ",process2)
  textPOS <- paste(textPOS,process3,sep=" ")
}

gsub("^ ","",textPOS)








getwd()
setwd("/Users/seongminmun/Desktop/2022/Ajou/Data")
dir()

heightweight <- read.csv("heightweight.csv",header = TRUE)
heightweight <- heightweight[,-1]












#생각하기
# heightweight데이터에서 성별이 남자인 집단(group.1)과 성별이 여자인 집단(group.2)을 생성하시오.  
group.1 <- subset(heightweight, sex=="m"); group.1
group.2 <- subset(heightweight, sex=="f"); group.2



#성별이 남자인 집단의 몸무게의 평균
mean(group.1$weightLb)
sum(group.1$weightLb)/length(group.1$weightLb)





#분산 계산하기
var(group.1$weightLb)
sum((group.1$weightLb-102.904)^2)/length(group.1$weightLb)



#표준편차
sd(group.1$weightLb)
sqrt(sum((group.1$weightLb-102.904)^2)/length(group.1$weightLb))



var.test(group.1$weightLb,group.2$weightLb)

var(group.1$weightLb)/var(group.2$weightLb)



t.test(group.1$weightLb,group.2$weightLb,var.equal = TRUE)







#생각하기
# heightweight데이터에서 성별이 남자인 집단(group.1)과 성별이 여자인 집단(group.2)을 생성하시오.  
group.1 <- subset(heightweight, sex=="m"); group.1
group.2 <- subset(heightweight, sex=="f"); group.2



#성별이 남자인 집단의 몸무게의 평균
mean(group.1$heightIn)
sum(group.1$heightIn)/length(group.1$heightIn)





#분산 계산하기
var(group.1$weightLb)
sum((group.1$weightLb-102.904)^2)/length(group.1$weightLb)



#표준편차
sd(group.1$weightLb)
sqrt(sum((group.1$weightLb-102.904)^2)/length(group.1$weightLb))







var.test(group.1$heightIn,group.2$heightIn)

var(group.1$weightLb)/var(group.2$weightLb)



t.test(group.1$heightIn,group.2$heightIn,var.equal = FALSE)









install.packages("ggplot2")
library(ggplot2)


ggplot(heightweight,aes(x=ageYear,y=weightLb)) + geom_point()

summary(heightweight)


ggplot(heightweight,aes(x=ageYear,y=weightLb,colour=sex)) + geom_point()


ggplot(heightweight,aes(x=ageYear,y=heightIn,colour=sex)) + geom_point()


ggplot(heightweight,aes(x=ageYear,y=heightIn,colour=sex,size=weightLb)) + geom_point()

ggplot(heightweight,aes(x=ageYear,y=heightIn,colour=sex,size=weightLb)) + geom_point(alpha=0.5)






