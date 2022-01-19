install.packages("stringr")
library(stringr)


#.기호 # .는 어떤 문자가 와도 매칭이 되는 기호이다.
texts <- c("kkk","abc","akc")
str_detect(texts, "a.c")


# ?기호 # ?는 앞에 오는 문자열이 존재하거나 존재하지 않는 경우를 의미한다.
texts <- c("ac","abc","akc")
str_detect(texts, "ab?c")



texts <- c("ab","abc","db","abd")
str_detect(texts, "abc?")


# *기호 #바로 앞에 나오는 문자가 0개 이상일때 패턴이 일치 된다.
texts <- c("ab","ac","abc","abbbbbc")
str_detect(texts, "ab*c")


# +기호 #바로 앞에 나오는 문자가 1개 이상일때 패턴이 일치 된다.
texts <- c("ab","ac","abc","abbbbbc")
str_detect(texts, "ab+c")


# ^기호 #문자열의 시작부분을 알려준다.
texts <- c("abcccc","ccccac","abbbb","baaaabbbbc")
str_detect(texts, "^ab")



texts <- c("abcccc","ccccac","abbbb","baaaabbbbc")
str_detect(texts, "^abc+")


texts <- c("abcccc","ccccac","abbbb","baaaabbbbc")
str_detect(texts, "^abc*")

# {}기호 # 앞에 등장하는 문자열이 입력된 숫자만큼 존재해야 한다.
texts <- c("ab","ac","abc","abbbbbc","abbc")
str_detect(texts, "ab{2}c")



texts <- c("ab","ac","abc","abbbbbbbc","abbc")
str_detect(texts, "ab{2,6}c")



texts <- c("ab","ac","abc","abbbbbbbc","abbc")
str_detect(texts, "ab{2,}c")



#[] 기호 # []안에 입력된 문자열중 어느 하나라도 일치하는 경우
texts <- c("ab","akc","abc","kkkk","abbc")
str_detect(texts, "[a-c]+")


texts <- c("ab","akc","abc","kkkk","abbc")
str_detect(texts, "[^a-c]+")
str_detect(texts, "[d-z]+")





#생각하기
# woodchuck
# woodchucks
# Woodchuck
# Woodchucks

texts <- c("woodchuck","woodchucks","Woodchuck","Woodchucks")
str_detect(texts, "")





texts <- c("woodchuck", "woodchucks", "Woodchuck", "Woodchucks")
str_detect(texts, "oodchuck")



texts <- c("woodchuck", "woodchucks", "Woodchuck", "Woodchucks")
str_detect(texts, "[\\w]oodchucks?")




# 정규표현식 함수들

strings <- c("R programming is fun","Text mining by using R","This SL is based on R programming which is a useful computer programming language")

#str_detect

str_detect(strings, "is")

#str_locate # 검색하고자 하는 표현이 어디에 있는지 위치를 알려준다.
str_locate(strings, "is")
str_locate_all(strings, "is")

str_locate_all(strings, " is ")

str_locate_all(strings, "(\\sis\\s)")




#str_extract #매치되는 문자열을 보여준다.
str_extract(strings, "is")
str_extract_all(strings, "is")
str_extract_all(strings, "(\\sis\\s)")


#str_match
str_match(strings, "is")
str_match_all(strings, "is")
str_match_all(strings, "(\\sis\\s)")




grepl("is",strings)

regexpr("-","000-0000-0000")
gregexpr("-","000-0000-0000")





#str_split()
str_split(strings, " ", 3)



#str_length
str_length(strings)
length(strings)

nchar(strings)




#str_count
str_count(strings, " is ")

#str_c

str_c("Ajou","Hello",sep=" ")

paste("Ajou","Hello",sep=" ")

paste("Ajou","Hello")




str_replace()
str_replace_all(strings, "programming", "language")



gsub("programming", "language", strings)





# 생각하기
# 주어진 문장에서 숫자만 제거하기
text <- "이름: 김성빈 전화번호: 010-1234-5678 나이: 25 성별: 남"
str_replace_all(text, "[0-9]", " ")
gsub("[0-9]", "", text)


str_replace_all(text, "[0-9]", " ", 'UTF-8')


str_replace_all(text, "\\d+", "")



#이름: 김성빈 전화번호: -- 나이:  성별: 남

# 주어진 문장에서 한글만 남기고 다 제거하기 

gsub("[0-9]//W", "", text)
gsub("[0-9,:,--, ]", "", text)

a <- str_replace_all(text, "[^가-힣]", " ");a

str_replace_all(a, "\\s+", " ")





a <- 'Ajou Hello'
b <- str_replace_all(a, '([a-zA-Z]+) ([a-zA-Z]+)', '\\2 \\1');b



typing <- readline()

#I need computer
#What would it mean to you if you got computer

answer <- gsub("I need ([a-zA-Z]+)","What would it mean to you if you got \\1",typing)



Chatbot <- function(input){
  answer <- gsub("I need ([a-zA-Z]+)","What would it mean to you if you got \\1",input)
  answer <- paste("Chatbot:", answer)
  return(answer)
}

typing <- readline()

Chatbot(typing)



