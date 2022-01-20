
# 맥
Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")

#윈도우
options(Encoding = "UTF-8")

install.packages("rvest")
library(rvest)

# https://movie.naver.com/movie/bi/mi/basic.naver?code=208077
# setwd("/Users/seongminmun/Desktop/2022/Ajou/Data")


url <- "https://movie.naver.com/movie/bi/mi/point.naver?code=208077"
moviePage <- read_html(url)
moviePage

scoreInfos <- html_nodes(moviePage, css=".score_result")
head(scoreInfos)


install.packages("dplyr")
library(dplyr)
scoreInfos[1] %>% html_nodes("ul") %>% html_nodes("li") %>% html_nodes("div.score_reple") %>% html_text()






urlReview <- "https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver?code=208077&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page=1"
movieReviewPage <- read_html(urlReview)
movieReviewPage

scoreReviews <- html_nodes(movieReviewPage, css=".score_result")
head(scoreReviews)

a <- scoreReviews[1] %>% html_nodes("ul") %>% html_text()

a <- as.character(a)
library(stringr)

b <- gsub("\t","",a)
b <- gsub("\r","",b)
b <- gsub("\n","",b)
c <- gsub("\\s$","",b);c



d<-str_split(c,'관람객');d
length(d[[1]])-1


library(dplyr)
a<-scoreReviews[1] %>% html_text();a

b <- gsub("\t","",a)
b <- gsub("\r","",b)
b <- gsub("\n","",b)
c <- gsub("\\s$","",b);c








urlReview <- "https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver?code=208077&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page=1"
movieReviewPage <- read_html(urlReview)
movieReviewPage

reviewList <- NULL
for(i in 1:10){
  idTag <- paste("#_filtered_ment_",i,sep="")
  scoreReviews <- html_nodes(movieReviewPage, css=idTag)
  a<-scoreReviews[1] %>% html_text();a
  b <- gsub("\t","",a)
  b <- gsub("\r","",b)
  b <- gsub("\n","",b)
  c <- gsub("\\s$","",b);c
  reviewList <- c(reviewList,c)
}
reviewList










gc()
rm(list=ls())


#Encoding_mac
Sys.setlocale(category = "LC_CTYPE", locale = "ko_KR.UTF-8")
#Window운영체제
options(Encoding = "UTF-8")


install.packages("RSelenium")
library(RSelenium)
library(rvest)

pJS <- wdman::phantomjs(port = 4567L)
remDr <- remoteDriver(remoteServerAddr = 'localhost', 
                      port =4567L, # 포트번호 입력 
                      browserName = "chrome") 
remDr$open()

#페이지 접속
remDr$navigate("http://sillok.history.go.kr/main/main.do")
remDr$screenshot(display = T)
Sys.sleep(1)

webElem <- remDr$findElement(using="xpath", value = '//*[@id="m_cont_list"]/div[1]/ul[1]/li[1]/a')
webElem$clickElement()
remDr$screenshot(display = T)
Sys.sleep(1)


webElem <- remDr$findElement(using="xpath", value = '//*[@id="cont_area"]/div/div[2]/ul[2]/li[1]/ul/li[1]/a')
webElem$clickElement()
remDr$screenshot(display = T)
Sys.sleep(1)

html <- remDr$getPageSource()[[1]]
html <- read_html(html)

library(dplyr)
html %>% html_nodes(".ins_list_main dd ul li a") %>% html_text()

remDr$goBack()
remDr$screenshot(display = T)

remDr$goForward()
remDr$screenshot(display = T)


webElem <- remDr$findElement(using="xpath", value = '//*[@id="cont_area"]/div[1]/div[3]/div/dl/dd/ul/li[1]/a')
webElem$clickElement()
remDr$screenshot(display = T)
Sys.sleep(1)

html <- remDr$getPageSource()[[1]]
html <- read_html(html)
html

library(dplyr)
html %>% html_nodes(".ins_view_pd") %>% html_nodes("p") %>% html_text()

remDr$close()
pJS$stop()























