a <- c(1,2,3,4,5)
a
b <- c(1,2,3,4,5.223)
b
c <- c(a,b)
c


1:10
10:1
-4:10
0.7:8

seq(1,5) # 1:5
seq(1,5,by=0.5)
seq(length=10,from=-1,by=0.2)


rm(list=ls())

#######
a <- c(1:5); a
rep(a, times=3)
rep(a, each=2)




1 + 1
2 - 1
2 * 2
4 / 2


10 / 3
10%/%3
10 %% 3


2^2
2^3



#문자

rm(list=ls())


alphabets <- c("a","b","c"); alphabets

alphabets <- c('a','b','c'); alphabets

mode(alphabets)

numbers <- c(1:5); numbers
mode(numbers)

changed <- as.character(numbers)
mode(changed)

##########



strings <- c("String","Strin","String3")
stringsFiltered <- strings[1:2]




a <- "Hello"
b <- "Ajou"
paste(a,b,sep="")



nchar(b)

strings <- c("String","Strin","String3")
nchar(strings)



a <- "Hello"
b <- "Ajou"
c <- paste(a,b,sep=" ")

csvSet <- "이름,학번,성적"
mode(csvSet)


data <- strsplit("이름,학번,성적",split=",")
data[[1]][2:3]



rm(list=ls())

a <- c(TRUE,FALSE,TRUE); a
mode(a)
b <- c(T,F,T); b

a <- 5
b <- 3

a <= b
a >= b

a == b
a != b






#행렬
a <- c(1:10);a
a <- 1:10;a

b <- matrix(a, nrow = 2, ncol = 5)
b

dim(b)



b
c <- cbind(b,c(1,2)); c
d <- rbind(c,c(1:6)); d

d[1,1]

d[2,1]

d[1,]

d[,2]

d[,c(1,2,4,5,6)]

d[,-3]


d
#1행 2열, 1행 4열, 3행 2열, 3행 4열 -> 2 by 2 matrix

e <- d[c(1,3),c(2,4)];e

# 값 수정하기

e[1,1] <- 20220001;e
e[2,1] <- 20220002;e
e[1,2] <- "강새벽";e
e[2,2] <- "성기훈";e

colnames(e) <- c("학번","이름");e
rownames(e) <- c("배우1","배우2");e



#행렬연산하기
a <- matrix(1:4,nrow=2);a

b <- matrix(100*(1:4),nrow=2);b

a %*% b



apply(a, 1, sum)

apply(a, 2, sum)






#리스트
rm(list = ls())

a <- list(1:10,1:14,2:3);a

b <- list(id = c(1:3), names = c("김땡땡","이땡땡","박땡땡","최땡땡"), passed = c(T, F, T));b

a[[2]][10]

b[[3]][1]

b[["names"]][1]

b$passed[1]


b
b[[1]] <- c(4:6)
b

b[[4]] <- c(1:10)
b

b[["ages"]] <- c("age1","age2")
b


lapply(b, mean)



b

str(b)







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

summary(testScoreNa)



