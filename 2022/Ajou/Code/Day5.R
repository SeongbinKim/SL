



install.packages("tidyverse")
library(tidyverse)


library(dplyr)


?mpg
mpg

summary(mpg)
summary(as.factor(mpg$manufacturer))
summary(as.factor(mpg$model))
summary(as.factor(mpg$trans))



# filter()
# 현대차
hyundai <- filter(mpg, manufacturer=="hyundai");hyundai

# 스포츠카 -> 실린더 8개 이상
sportCar <- filter(mpg, cyl >= 8); sportCar

sportCar2000 <- filter(mpg, cyl >= 8, year > 2000); sportCar2000



# 생각하기
# 현대차 중에서 2000년대 이후에 생산되고 변압기의 타입이 자동인 차량
hyundaicar<- filter(mpg, manufacturer=="hyundai", year > 2000, trans == "auto(l4)");hyundaicar

summary(as.factor(mpg$trans))

hyundaicar<-filter(mpg, manufacturer=="hyundai", year > 2000, trans == "auto(m[1-9]+)");hyundaicar

library(stringr)
str_detect("auto(l4)","auto")

hyundaicar<-filter(mpg, manufacturer=="hyundai", year > 2000, str_detect(trans,"auto")==TRUE);hyundaicar



#차량명이 sonata이거나 혹은 생산 연도가 2000 미만인 차량들

sonata<-filter(mpg, model == "sonata" | year<2000);sonata

summary(as.factor(sonata$model))

filter(sonata, model=="sonata")




Sonata20century <- filter(mpg, model=="sonata" | year <2000); Sonata20century 


filter(Sonata20century , model=="sonata")





#arrange()

# 현대차
hyundai <- filter(mpg, manufacturer=="hyundai");hyundai

arrange(hyundai, desc(cyl), year)

arrange(hyundai, desc(cyl), desc(year))






#select()
volkswagen <- filter(mpg, manufacturer=="volkswagen");volkswagen

volkswagenSelected <- select(volkswagen, model, year, cyl, trans); volkswagenSelected

select(volkswagen, -(model:trans))

select(volkswagen, model, year, cylinders=cyl, trans)





#mutate()


audi <- filter(mpg, manufacturer=="audi"); audi
audiSelected <- select(audi, model, year, cty, hwy); audiSelected

audiSelectedSum <- mutate(audiSelected, sum = cty + hwy); audiSelectedSum

#생각하기 
#도시내에서의 연비와 고속도로에서의 연비의 평균을 나타내는 mean변수를 추가하자.

audiSelectedcalculation<- mutate(audiSelected, sum = cty+hwy, mean = (cty+hwy)/2); audiSelectedcalculation


mean(audiSelectedSum$sum)


#summarize()

sum(mpg$cyl)
median(mpg$cyl)
mean(mpg$cyl)


summary(mpg)


summarize(mpg, count=n(), mean = mean(cty), min=min(cty), max=max(cty))



#%>%
hyundai <- filter(mpg, manufacturer=="hyundai");hyundai

# 스포츠카 -> 실린더 8개 이상
sportCar <- filter(mpg, cyl >= 8); sportCar

sportCar2000 <- filter(mpg, cyl >= 8, year > 2000); sportCar2000




mpg %>% filter(manufacturer=="hyundai") %>% filter(cyl >= 6) %>% filter(year > 2000)






#메모리정리하기
gc()
rm(list=ls())
#한글깨짐현상
#한글 인코딩 문제 해결
#맥
Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
#윈도우
options(encoding = "UTF-8")




getwd()
setwd("/Users/seongminmun/Desktop/2022/Ajou/Data")



dyn.load('/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home/jre/lib/server/libjvm.dylib')




install.packages("remotes")
library(remotes)

install.packages("rJava")
library(rJava)

remotes::install_github('haven-jeon/KoNLP', upgrade = "never", INSTALL_opts=c("--no-multiarch"))
library(KoNLP)

library(stringr)


message <- "아주대학교에서 겨울 특강으로 진행된 R 데이터(텍스트) 마이닝 및 시각화 분석에서 학생분들이 보여준 학구열로 인해 힘이 납니다."

extractNoun(message)

#형태소분석하기

MorphAnalyzer(message)



#22가지 POS -> part of speech
SimplePos22(message)


#9가지
messagePOS09 <- SimplePos09(message); messagePOS09

# 명사만 추출하기
library(stringr)
messageN <- str_extract_all(messagePOS09, '([A-Za-z가-힣]+)/N');messageN

#동사 추출 + 형용사 -> 용언
messageP <- str_extract_all(messagePOS09, '([A-Za-z가-힣]+)/P');messageP














