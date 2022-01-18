



ID <- c(1:6)
Gender <- c("M","F","M","M","F","F")
test <- data.frame(id=ID,gender=Gender);test


eng <- c(93,94,95,93,92,93)
math <- c(85,86,84,89,85,83)
scores <- cbind(eng,math)

test.score <- data.frame(test,scores)


#요약하기
str(test.score)
summary(test.score)

head(iris)
tail(iris)




a <- data.frame(id=7,gender="M",eng=100,math=NA); a
testScoreNa <- rbind(test.score,a); testScoreNa



# 데이터 필터링하기
testScoreNa[1:2]
testScoreNa[-(1:2)]

testScoreNa[1,]
testScoreNa[1:2,3:4]


testScoreNa[testScoreNa$eng >= 93,c("id","gender")]

testScoreNa[testScoreNa$eng >= 93,]


eng93 <- testScoreNa[testScoreNa$eng >= 93,]; eng93

order(eng93$eng, decreasing = TRUE)

eng93[order(eng93$eng, decreasing = TRUE),]





subset(testScoreNa, Gender=="F", c("id","gender"))


subset(testScoreNa, eng>=95)



#데이터 경로
getwd()
setwd("/Users/seongminmun/Desktop/2022/Ajou/Data")
getwd()

dir()

write.csv(testScoreNa,"testScoreNa.csv",fileEncoding = "UTF-8")

dir()

write.table(testScoreNa,"testScoreNa.txt",fileEncoding = "UTF-8")




#데이터 불러오기

testScoreNaCsv <- read.csv("testScoreNa.csv",header=TRUE,fileEncoding = "UTF-8")
testScoreNaCsv[-1]



testScoreNaTxt <- read.table("testScoreNa.txt",header=TRUE,fileEncoding = "UTF-8")






for(i in 1:3){
  print(i)
}



for(i in 1:3){
  x <- i*3
  print(x)
}




x <- c(10,20,30,40,50,60,70,80)
x[1]
x[2]
length(x)
for (i in 1:length(x)){
  print(x[i])
}


a <- "String"
nchar(a)
length(a)






# 조건문

money <- 2000
card <- FALSE
if (money > 3700) {
  print("택시를 타라.")
} else if (card == TRUE){
  print("택시를 타라.")
} else {
  print("걸어가라.")
}

money <- 4000
card <- FALSE
if (money > 3700 || card == TRUE) {
  print("택시를 타라.")
} else {
  print("걸어가라.")
}





# 조건문, 반복문 같이 사용하기

for(i in 1:10){
  if(i%%2==0){
    cat(i,"는 짝수","\n")
  } else {
    cat(i,"는 홀수","\n")
  }
}



for(i in 1:10){
  if(i%%2==0){
    cat(i,"는 짝수","\n")
  } else if (i%%2!=0){
    cat(i,"는 홀수","\n")
  }
}


for(i in 1:10){
  if(i%%2==0){
    cat(i,"는 짝수","\n")
  } else if (i%%2==1){
    cat(i,"는 홀수","\n")
  }
}





for (i in 1:2){
  for (j in 1:36){
    cat("지구",i,"바퀴 = 달",j,"바퀴","\n")
  }
}


#구구단 
1 x 1 = 1
1 x 2 = 2
...
2 x 1 = 2
...


for(i in 1:9){
  for(n in 1:9){
    cat(i, "*", n, "==", i * n,"\n")
  }
}









ft.1 <- function(i){
  cat("Data : ",i,"\n")
}


a <- c(1,2,3)
ft.1(a)




ft.2 <- function(i,j){
  cat("Data : ",i,"\n")
  cat("Data : ",j,"\n")
}


c <- c(1,2,3)
d <- c(4,5,6)

ft.2(c,d)




a <- sample(c(1:50),1000,replace=TRUE); a

divideBy3 <- function(data){
  varok <- NULL
  for (i in 1:length(data)){
    if(data[i] %% 3 == 0){
      varok = c(varok, 1)
    } else {
      varok = c(varok, 0)
    }
  }
  return(varok)
}

outcome3 <- divideBy3(a); outcome3




divideBy7 <- function(data){
  varok <- NULL
  for (i in 1:length(data)){
    if(data[i] %% 7 == 0){
      varok = c(varok, 1)
    } else {
      varok = c(varok, 0)
    }
  }
  return(varok)
}

outcome7 <- divideBy7(a); outcome7

length(outcome7)
length(outcome3)

compareOutcomes <- function(data1,data2){
  varok <- NULL
  for (i in 1:length(data1)){
    if((data1[i]==1)&&(data2[i]==1)){
      varok <- c(varok,1)
    } else {
      varok <- c(varok,0)
    }
  }
  return(varok)
}

outcomes3_7 <- compareOutcomes(outcome3,outcome7); outcomes3_7










a <- sample(c(1:50),1000,replace=TRUE); a
outcome3 <- divideBy3(a); outcome3
outcome7 <- divideBy7(a); outcome7
outcomes3_7 <- compareOutcomes(outcome3,outcome7); outcomes3_7


outcomes <- data.frame(original = a, outcome3 = outcome3, outcome7 = outcome7, outcomes3_7 = outcomes3_7)
write.csv(outcomes,"outcomes.csv",fileEncoding = "UTF-8")



dir()



for (i in 1:length(a)){
  if(a[i]%%3==0){
    print(1)
  } else {
    print(0)
  }
}























