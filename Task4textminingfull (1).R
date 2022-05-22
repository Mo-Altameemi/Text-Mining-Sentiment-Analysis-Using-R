# Setting our working directory

setwd("C:/Users/Moh/Downloads")


#Read the data file
Reviews <- read.csv("tourist_accommodation_reviews.csv",header = T)

#Inspect the dataset
names(Reviews)
head(Reviews)
tail(Reviews)
summary(Reviews)
str(Reviews)
dim(Reviews)

#Install essential packages
install.packages("tm")
library(tm)
install.packages("wordcloud")
library(wordcloud)

#Filter the products from the main dataset and create 30 separate datasets
hotel1 <-subset(Reviews,Hotel_Restaurant_name =="The Ship Inn")
hotel2 <- subset(Reviews,Hotel_Restaurant_name == "Coyote")
hotel3 <- subset(Reviews,Hotel_Restaurant_name == "Portofino Ristrorante &Pizzeria")
hotel4 <- subset(Reviews,Hotel_Restaurant_name == "Climax on Bangla")
hotel5 <- subset(Reviews,Hotel_Restaurant_name == "The Cove Phuket")
hotel6 <-subset(Reviews,Hotel_Restaurant_name =="Shameena Restaurant and Lounge")
hotel7 <- subset(Reviews,Hotel_Restaurant_name == "Breeze at Cape Yamu")
hotel8 <- subset(Reviews,Hotel_Restaurant_name == "Trattoria Capri da Rico")
hotel9 <- subset(Reviews,Hotel_Restaurant_name == "The Islander")
hotel10 <- subset(Reviews,Hotel_Restaurant_name == "Vista")

hotel11 <-subset(Reviews,Hotel_Restaurant_name =="Nami")
hotel12 <- subset(Reviews,Hotel_Restaurant_name == "La Gritta")
hotel13 <- subset(Reviews,Hotel_Restaurant_name == "OSOT")
hotel14 <- subset(Reviews,Hotel_Restaurant_name == "Pooh and Friends")
hotel15 <- subset(Reviews,Hotel_Restaurant_name == "Don Vito Trattoria")
hotel16 <-subset(Reviews,Hotel_Restaurant_name =="Palm Square")
hotel17 <- subset(Reviews,Hotel_Restaurant_name == "Tatonka")
hotel18 <- subset(Reviews,Hotel_Restaurant_name == "Kampong Kata Hill")
hotel19 <- subset(Reviews,Hotel_Restaurant_name == "Baan Mai")
hotel20 <- subset(Reviews,Hotel_Restaurant_name == "Little Tiger")

hotel21 <-subset(Reviews,Hotel_Restaurant_name == "Modena")
hotel22 <- subset(Reviews,Hotel_Restaurant_name == "Da Mario")
hotel23 <- subset(Reviews,Hotel_Restaurant_name == "Savoy Patong")
hotel24 <- subset(Reviews,Hotel_Restaurant_name == "The Port")
hotel25 <- subset(Reviews,Hotel_Restaurant_name == "Coconut-garden")
hotel26 <-subset(Reviews,Hotel_Restaurant_name == "The Red Tablecloth")
hotel27 <- subset(Reviews,Hotel_Restaurant_name == "Baoli")
hotel28 <- subset(Reviews,Hotel_Restaurant_name == "Le Siam")
hotel29 <- subset(Reviews,Hotel_Restaurant_name == "La Boucherie - Chalong")
hotel30 <- subset(Reviews,Hotel_Restaurant_name == "Jeffer")

#Inspect the review column in the datasets
head(hotel1$Review)
head(hotel2$Review)
head(hotel3$Review)
head(hotel4$Review)
head(hotel5$Review)
head(hotel6$Review)
head(hotel7$Review)
head(hotel8$Review)
head(hotel9$Review)
head(hotel10$Review)

head(hotel11$Review)
head(hotel12$Review)
head(hotel13$Review)
head(hotel14$Review)
head(hotel15$Review)
head(hotel16$Review)
head(hotel17$Review)
head(hotel18$Review)
head(hotel19$Review)
head(hotel20$Review)

head(hotel21$Review)
head(hotel22$Review)
head(hotel23$Review)
head(hotel24$Review)
head(hotel25$Review)
head(hotel26$Review)
head(hotel27$Review)
head(hotel28$Review)
head(hotel29$Review)
head(hotel30$Review)

#Create text vectors
r_hotel1<-hotel1$Review
r_hotel2<-hotel2$Review
r_hotel3<-hotel3$Review
r_hotel4<-hotel4$Review
r_hotel5<-hotel5$Review
r_hotel6<-hotel6$Review
r_hotel7<-hotel7$Review
r_hotel8<-hotel8$Review
r_hotel9<-hotel9$Review
r_hotel10<-hotel10$Review

r_hotel11<-hotel11$Review
r_hotel12<-hotel12$Review
r_hotel13<-hotel13$Review
r_hotel14<-hotel14$Review
r_hotel15<-hotel15$Review
r_hotel16<-hotel16$Review
r_hotel17<-hotel17$Review
r_hotel18<-hotel18$Review
r_hotel19<-hotel19$Review
r_hotel20<-hotel20$Review

r_hotel21<-hotel21$Review
r_hotel22<-hotel22$Review
r_hotel23<-hotel23$Review
r_hotel24<-hotel24$Review
r_hotel25<-hotel25$Review
r_hotel26<-hotel26$Review
r_hotel27<-hotel27$Review
r_hotel28<-hotel28$Review
r_hotel29<-hotel29$Review
r_hotel30<-hotel30$Review

#Convert all text to lower case
r_hotel1<-tolower(r_hotel1)
r_hotel2<-tolower(r_hotel2)
r_hotel3<-tolower(r_hotel3)
r_hotel4<-tolower(r_hotel4)
r_hotel5<-tolower(r_hotel5)
r_hotel6<-tolower(r_hotel6)
r_hotel7<-tolower(r_hotel7)
r_hotel8<-tolower(r_hotel8)
r_hotel9<-tolower(r_hotel9)
r_hotel10<-tolower(r_hotel10)

r_hotel11<-tolower(r_hotel11)
r_hotel12<-tolower(r_hotel12)
r_hotel13<-tolower(r_hotel13)
r_hotel14<-tolower(r_hotel14)
r_hotel15<-tolower(r_hotel15)
r_hotel16<-tolower(r_hotel16)
r_hotel17<-tolower(r_hotel17)
r_hotel18<-tolower(r_hotel18)
r_hotel19<-tolower(r_hotel19)
r_hotel20<-tolower(r_hotel20)

r_hotel21<-tolower(r_hotel21)
r_hotel22<-tolower(r_hotel22)
r_hotel23<-tolower(r_hotel23)
r_hotel24<-tolower(r_hotel24)
r_hotel25<-tolower(r_hotel25)
r_hotel26<-tolower(r_hotel26)
r_hotel27<-tolower(r_hotel27)
r_hotel28<-tolower(r_hotel28)
r_hotel29<-tolower(r_hotel29)
r_hotel30<-tolower(r_hotel30)




#Remove links from the reviews
r_hotel1 <- gsub("http\\S+\\s*", "", r_hotel1)
r_hotel2 <- gsub("http\\S+\\s*", "", r_hotel2)
r_hotel3 <- gsub("http\\S+\\s*", "", r_hotel3)
r_hotel4 <- gsub("http\\S+\\s*", "", r_hotel4)
r_hotel5 <- gsub("http\\S+\\s*", "", r_hotel5)
r_hotel6 <- gsub("http\\S+\\s*", "", r_hotel6)
r_hotel7 <- gsub("http\\S+\\s*", "", r_hotel7)
r_hotel8 <- gsub("http\\S+\\s*", "", r_hotel8)
r_hotel9 <- gsub("http\\S+\\s*", "", r_hotel9)
r_hotel10 <- gsub("http\\S+\\s*", "", r_hotel10)

r_hotel11 <- gsub("http\\S+\\s*", "", r_hotel11)
r_hotel12 <- gsub("http\\S+\\s*", "", r_hotel12)
r_hotel13 <- gsub("http\\S+\\s*", "", r_hotel13)
r_hotel14 <- gsub("http\\S+\\s*", "", r_hotel14)
r_hotel15 <- gsub("http\\S+\\s*", "", r_hotel15)
r_hotel16 <- gsub("http\\S+\\s*", "", r_hotel16)
r_hotel17 <- gsub("http\\S+\\s*", "", r_hotel17)
r_hotel18 <- gsub("http\\S+\\s*", "", r_hotel18)
r_hotel19 <- gsub("http\\S+\\s*", "", r_hotel19)
r_hotel20 <- gsub("http\\S+\\s*", "", r_hotel20)

r_hotel21 <- gsub("http\\S+\\s*", "", r_hotel21)
r_hotel22 <- gsub("http\\S+\\s*", "", r_hotel22)
r_hotel23 <- gsub("http\\S+\\s*", "", r_hotel23)
r_hotel24 <- gsub("http\\S+\\s*", "", r_hotel24)
r_hotel25 <- gsub("http\\S+\\s*", "", r_hotel25)
r_hotel26 <- gsub("http\\S+\\s*", "", r_hotel26)
r_hotel27 <- gsub("http\\S+\\s*", "", r_hotel27)
r_hotel28 <- gsub("http\\S+\\s*", "", r_hotel28)
r_hotel29 <- gsub("http\\S+\\s*", "", r_hotel29)
r_hotel30 <- gsub("http\\S+\\s*", "", r_hotel30)

#Remove punctuation from the reviews
r_hotel1 <- gsub("[[:punct:]]", "", r_hotel1)
r_hotel2 <- gsub("[[:punct:]]", "", r_hotel2)
r_hotel3 <- gsub("[[:punct:]]", "", r_hotel3)
r_hotel4 <- gsub("[[:punct:]]", "", r_hotel4)
r_hotel5 <- gsub("[[:punct:]]", "", r_hotel5)
r_hotel6 <- gsub("[[:punct:]]", "", r_hotel6)
r_hotel7 <- gsub("[[:punct:]]", "", r_hotel7)
r_hotel8 <- gsub("[[:punct:]]", "", r_hotel8)
r_hotel9 <- gsub("[[:punct:]]", "", r_hotel9)
r_hotel10 <- gsub("[[:punct:]]", "", r_hotel10)

r_hotel11 <- gsub("[[:punct:]]", "", r_hotel11)
r_hotel12 <- gsub("[[:punct:]]", "", r_hotel12)
r_hotel13 <- gsub("[[:punct:]]", "", r_hotel13)
r_hotel14 <- gsub("[[:punct:]]", "", r_hotel14)
r_hotel15 <- gsub("[[:punct:]]", "", r_hotel15)
r_hotel16 <- gsub("[[:punct:]]", "", r_hotel16)
r_hotel17 <- gsub("[[:punct:]]", "", r_hotel17)
r_hotel18 <- gsub("[[:punct:]]", "", r_hotel18)
r_hotel19 <- gsub("[[:punct:]]", "", r_hotel19)
r_hotel20 <- gsub("[[:punct:]]", "", r_hotel20)

r_hotel21 <- gsub("[[:punct:]]", "", r_hotel21)
r_hotel22 <- gsub("[[:punct:]]", "", r_hotel22)
r_hotel23 <- gsub("[[:punct:]]", "", r_hotel23)
r_hotel24 <- gsub("[[:punct:]]", "", r_hotel24)
r_hotel25 <- gsub("[[:punct:]]", "", r_hotel25)
r_hotel26 <- gsub("[[:punct:]]", "", r_hotel26)
r_hotel27 <- gsub("[[:punct:]]", "", r_hotel27)
r_hotel28 <- gsub("[[:punct:]]", "", r_hotel28)
r_hotel29 <- gsub("[[:punct:]]", "", r_hotel29)
r_hotel30 <- gsub("[[:punct:]]", "", r_hotel30)

#Remove leading blank spaces at the beginning from the reviews
r_hotel1 <- gsub("^ ", "", r_hotel1)
r_hotel2 <- gsub("^ ", "", r_hotel2)
r_hotel3 <- gsub("^ ", "", r_hotel3)
r_hotel4 <- gsub("^ ", "", r_hotel4)
r_hotel5 <- gsub("^ ", "", r_hotel5)
r_hotel6 <- gsub("^ ", "", r_hotel6)
r_hotel7 <- gsub("^ ", "", r_hotel7)
r_hotel8 <- gsub("^ ", "", r_hotel8)
r_hotel9 <- gsub("^ ", "", r_hotel9)
r_hotel10 <- gsub("^ ", "", r_hotel10)

r_hotel11 <- gsub("^ ", "", r_hotel11)
r_hotel12 <- gsub("^ ", "", r_hotel12)
r_hotel13 <- gsub("^ ", "", r_hotel13)
r_hotel14 <- gsub("^ ", "", r_hotel14)
r_hotel15 <- gsub("^ ", "", r_hotel15)
r_hotel16 <- gsub("^ ", "", r_hotel16)
r_hotel17 <- gsub("^ ", "", r_hotel17)
r_hotel18 <- gsub("^ ", "", r_hotel18)
r_hotel19 <- gsub("^ ", "", r_hotel19)
r_hotel20 <- gsub("^ ", "", r_hotel20)

r_hotel21 <- gsub("^ ", "", r_hotel21)
r_hotel22 <- gsub("^ ", "", r_hotel22)
r_hotel23 <- gsub("^ ", "", r_hotel23)
r_hotel24 <- gsub("^ ", "", r_hotel24)
r_hotel25 <- gsub("^ ", "", r_hotel25)
r_hotel26 <- gsub("^ ", "", r_hotel26)
r_hotel27 <- gsub("^ ", "", r_hotel27)
r_hotel28 <- gsub("^ ", "", r_hotel28)
r_hotel29 <- gsub("^ ", "", r_hotel29)
r_hotel30 <- gsub("^ ", "", r_hotel30)

#Remove blank spaces at the end from the reviews
r_hotel1 <- gsub(" $", "", r_hotel1)
r_hotel2 <- gsub(" $", "", r_hotel2)
r_hotel3 <- gsub(" $", "", r_hotel3)
r_hotel4 <- gsub(" $", "", r_hotel4)
r_hotel5 <- gsub(" $", "", r_hotel5)
r_hotel6 <- gsub(" $", "", r_hotel6)
r_hotel7 <- gsub(" $", "", r_hotel7)
r_hotel8 <- gsub(" $", "", r_hotel8)
r_hotel9 <- gsub(" $", "", r_hotel9)
r_hotel10 <- gsub(" $", "", r_hotel10)

r_hotel11 <- gsub(" $", "", r_hotel11)
r_hotel12 <- gsub(" $", "", r_hotel12)
r_hotel13 <- gsub(" $", "", r_hotel13)
r_hotel14 <- gsub(" $", "", r_hotel14)
r_hotel15 <- gsub(" $", "", r_hotel15)
r_hotel16 <- gsub(" $", "", r_hotel16)
r_hotel17 <- gsub(" $", "", r_hotel17)
r_hotel18 <- gsub(" $", "", r_hotel18)
r_hotel19 <- gsub(" $", "", r_hotel19)
r_hotel20 <- gsub(" $", "", r_hotel20)

r_hotel21 <- gsub(" $", "", r_hotel21)
r_hotel22 <- gsub(" $", "", r_hotel22)
r_hotel23 <- gsub(" $", "", r_hotel23)
r_hotel24 <- gsub(" $", "", r_hotel24)
r_hotel25 <- gsub(" $", "", r_hotel25)
r_hotel26 <- gsub(" $", "", r_hotel26)
r_hotel27 <- gsub(" $", "", r_hotel27)
r_hotel28 <- gsub(" $", "", r_hotel28)
r_hotel29 <- gsub(" $", "", r_hotel29)
r_hotel30 <- gsub(" $", "", r_hotel30)

#Remove digits from the reviews
r_hotel1 <- gsub("[[:digit:]]", "", r_hotel1)
r_hotel2 <- gsub("[[:digit:]]", "", r_hotel2)
r_hotel3 <- gsub("[[:digit:]]", "", r_hotel3)
r_hotel4 <- gsub("[[:digit:]]", "", r_hotel4)
r_hotel5 <- gsub("[[:digit:]]", "", r_hotel5)
r_hotel6 <- gsub("[[:digit:]]", "", r_hotel6)
r_hotel7 <- gsub("[[:digit:]]", "", r_hotel7)
r_hotel8 <- gsub("[[:digit:]]", "", r_hotel8)
r_hotel9 <- gsub("[[:digit:]]", "", r_hotel9)
r_hotel10 <- gsub("[[:digit:]]", "", r_hotel10)

r_hotel11 <- gsub("[[:digit:]]", "", r_hotel11)
r_hotel12 <- gsub("[[:digit:]]", "", r_hotel12)
r_hotel13 <- gsub("[[:digit:]]", "", r_hotel13)
r_hotel14 <- gsub("[[:digit:]]", "", r_hotel14)
r_hotel15 <- gsub("[[:digit:]]", "", r_hotel15)
r_hotel16 <- gsub("[[:digit:]]", "", r_hotel16)
r_hotel17 <- gsub("[[:digit:]]", "", r_hotel17)
r_hotel18 <- gsub("[[:digit:]]", "", r_hotel18)
r_hotel19 <- gsub("[[:digit:]]", "", r_hotel19)
r_hotel20 <- gsub("[[:digit:]]", "", r_hotel20)

r_hotel21 <- gsub("[[:digit:]]", "", r_hotel21)
r_hotel22 <- gsub("[[:digit:]]", "", r_hotel22)
r_hotel23 <- gsub("[[:digit:]]", "", r_hotel23)
r_hotel24 <- gsub("[[:digit:]]", "", r_hotel24)
r_hotel25 <- gsub("[[:digit:]]", "", r_hotel25)
r_hotel26 <- gsub("[[:digit:]]", "", r_hotel26)
r_hotel27 <- gsub("[[:digit:]]", "", r_hotel27)
r_hotel28 <- gsub("[[:digit:]]", "", r_hotel28)
r_hotel29 <- gsub("[[:digit:]]", "", r_hotel29)
r_hotel30 <- gsub("[[:digit:]]", "", r_hotel30)

#Inspect the vectors after cleaning
head(r_hotel1)
head(r_hotel2)
head(r_hotel3)
head(r_hotel4)
head(r_hotel5)
head(r_hotel6)
head(r_hotel7)
head(r_hotel8)
head(r_hotel9)
head(r_hotel10)

head(r_hotel11)
head(r_hotel12)
head(r_hotel13)
head(r_hotel14)
head(r_hotel15)
head(r_hotel16)
head(r_hotel17)
head(r_hotel18)
head(r_hotel19)
head(r_hotel20)

head(r_hotel21)
head(r_hotel22)
head(r_hotel23)
head(r_hotel24)
head(r_hotel25)
head(r_hotel26)
head(r_hotel27)
head(r_hotel28)
head(r_hotel29)
head(r_hotel30)

#Converting the text vectors to corpus
corp_hotel1 <- Corpus(VectorSource(r_hotel1))
corp_hotel2 <- Corpus(VectorSource(r_hotel2))
corp_hotel3 <- Corpus(VectorSource(r_hotel3))
corp_hotel4 <- Corpus(VectorSource(r_hotel4))
corp_hotel5 <- Corpus(VectorSource(r_hotel5))
corp_hotel6 <- Corpus(VectorSource(r_hotel6))
corp_hotel7 <- Corpus(VectorSource(r_hotel7))
corp_hotel8 <- Corpus(VectorSource(r_hotel8))
corp_hotel9 <- Corpus(VectorSource(r_hotel9))
corp_hotel10 <- Corpus(VectorSource(r_hotel10))

corp_hotel11 <- Corpus(VectorSource(r_hotel11))
corp_hotel12 <- Corpus(VectorSource(r_hotel12))
corp_hotel13 <- Corpus(VectorSource(r_hotel13))
corp_hotel14 <- Corpus(VectorSource(r_hotel14))
corp_hotel15 <- Corpus(VectorSource(r_hotel15))
corp_hotel16 <- Corpus(VectorSource(r_hotel16))
corp_hotel17 <- Corpus(VectorSource(r_hotel17))
corp_hotel18 <- Corpus(VectorSource(r_hotel18))
corp_hotel19 <- Corpus(VectorSource(r_hotel19))
corp_hotel20 <- Corpus(VectorSource(r_hotel20))

corp_hotel21 <- Corpus(VectorSource(r_hotel21))
corp_hotel22 <- Corpus(VectorSource(r_hotel22))
corp_hotel23 <- Corpus(VectorSource(r_hotel23))
corp_hotel24 <- Corpus(VectorSource(r_hotel24))
corp_hotel25 <- Corpus(VectorSource(r_hotel25))
corp_hotel26 <- Corpus(VectorSource(r_hotel26))
corp_hotel27 <- Corpus(VectorSource(r_hotel27))
corp_hotel28 <- Corpus(VectorSource(r_hotel28))
corp_hotel29 <- Corpus(VectorSource(r_hotel29))
corp_hotel30 <- Corpus(VectorSource(r_hotel30))

#Inspect the corpus
corp_hotel1
corp_hotel2
corp_hotel3
corp_hotel4
corp_hotel5
corp_hotel6
corp_hotel7
corp_hotel8
corp_hotel9
corp_hotel10

corp_hotel11
corp_hotel12
corp_hotel13
corp_hotel14
corp_hotel15
corp_hotel16
corp_hotel17
corp_hotel18
corp_hotel19
corp_hotel20

corp_hotel21
corp_hotel22
corp_hotel23
corp_hotel24
corp_hotel25
corp_hotel26
corp_hotel27
corp_hotel28
corp_hotel29
corp_hotel30

#Clean up corpus by removing stop words and White space
corp_hotel1 <- tm_map(corp_hotel1, removeWords,stopwords("english"))
corp_hotel1 <- tm_map(corp_hotel1, stripWhitespace)

corp_hotel2 <- tm_map(corp_hotel2, removeWords,stopwords("english"))
corp_hotel2 <- tm_map(corp_hotel2, stripWhitespace)

corp_hotel3 <- tm_map(corp_hotel3, removeWords,stopwords("english"))
corp_hotel3 <- tm_map(corp_hotel3, stripWhitespace)

corp_hotel4 <- tm_map(corp_hotel4, removeWords,stopwords("english"))
corp_hotel4 <- tm_map(corp_hotel4, stripWhitespace)

corp_hotel5 <- tm_map(corp_hotel5, removeWords,stopwords("english"))
corp_hotel5 <- tm_map(corp_hotel5, stripWhitespace)

corp_hotel6 <- tm_map(corp_hotel6, removeWords,stopwords("english"))
corp_hotel6 <- tm_map(corp_hotel6, stripWhitespace)

corp_hotel7 <- tm_map(corp_hotel7, removeWords,stopwords("english"))
corp_hotel7 <- tm_map(corp_hotel7, stripWhitespace)

corp_hotel8 <- tm_map(corp_hotel8, removeWords,stopwords("english"))
corp_hotel8 <- tm_map(corp_hotel8, stripWhitespace)

corp_hotel9 <- tm_map(corp_hotel9, removeWords,stopwords("english"))
corp_hotel9 <- tm_map(corp_hotel9, stripWhitespace)

corp_hotel10 <- tm_map(corp_hotel10, removeWords,stopwords("english"))
corp_hotel10 <- tm_map(corp_hotel10, stripWhitespace)

corp_hotel11 <- tm_map(corp_hotel11, removeWords,stopwords("english"))
corp_hotel11 <- tm_map(corp_hotel11, stripWhitespace)

corp_hotel12 <- tm_map(corp_hotel12, removeWords,stopwords("english"))
corp_hotel12 <- tm_map(corp_hotel12, stripWhitespace)

corp_hotel13 <- tm_map(corp_hotel13, removeWords,stopwords("english"))
corp_hotel13 <- tm_map(corp_hotel13, stripWhitespace)

corp_hotel14 <- tm_map(corp_hotel14, removeWords,stopwords("english"))
corp_hotel14 <- tm_map(corp_hotel14, stripWhitespace)

corp_hotel15 <- tm_map(corp_hotel15, removeWords,stopwords("english"))
corp_hotel15 <- tm_map(corp_hotel15, stripWhitespace)

corp_hotel16 <- tm_map(corp_hotel16, removeWords,stopwords("english"))
corp_hotel16 <- tm_map(corp_hotel16, stripWhitespace)

corp_hotel17 <- tm_map(corp_hotel17, removeWords,stopwords("english"))
corp_hotel17 <- tm_map(corp_hotel17, stripWhitespace)

corp_hotel18 <- tm_map(corp_hotel18, removeWords,stopwords("english"))
corp_hotel18 <- tm_map(corp_hotel18, stripWhitespace)

corp_hotel19 <- tm_map(corp_hotel19, removeWords,stopwords("english"))
corp_hotel19 <- tm_map(corp_hotel19, stripWhitespace)

corp_hotel20 <- tm_map(corp_hotel20, removeWords,stopwords("english"))
corp_hotel20 <- tm_map(corp_hotel20, stripWhitespace)

corp_hotel21 <- tm_map(corp_hotel21, removeWords,stopwords("english"))
corp_hotel21 <- tm_map(corp_hotel21, stripWhitespace)

corp_hotel22 <- tm_map(corp_hotel22, removeWords,stopwords("english"))
corp_hotel22 <- tm_map(corp_hotel22, stripWhitespace)

corp_hotel23 <- tm_map(corp_hotel23, removeWords,stopwords("english"))
corp_hotel23 <- tm_map(corp_hotel23, stripWhitespace)

corp_hotel24 <- tm_map(corp_hotel24, removeWords,stopwords("english"))
corp_hotel24 <- tm_map(corp_hotel24, stripWhitespace)

corp_hotel25 <- tm_map(corp_hotel25, removeWords,stopwords("english"))
corp_hotel25 <- tm_map(corp_hotel25, stripWhitespace)

corp_hotel26 <- tm_map(corp_hotel26, removeWords,stopwords("english"))
corp_hotel26 <- tm_map(corp_hotel26, stripWhitespace)

corp_hotel27 <- tm_map(corp_hotel27, removeWords,stopwords("english"))
corp_hotel27 <- tm_map(corp_hotel27, stripWhitespace)

corp_hotel28 <- tm_map(corp_hotel28, removeWords,stopwords("english"))
corp_hotel28 <- tm_map(corp_hotel28, stripWhitespace)

corp_hotel29 <- tm_map(corp_hotel29, removeWords,stopwords("english"))
corp_hotel29 <- tm_map(corp_hotel29, stripWhitespace)

corp_hotel30 <- tm_map(corp_hotel30, removeWords,stopwords("english"))
corp_hotel30 <- tm_map(corp_hotel30, stripWhitespace)

# Inspect the corpus after cleaning.
inspect(corp_hotel1)
inspect(corp_hotel2)
inspect(corp_hotel3)
inspect(corp_hotel4)
inspect(corp_hotel5)
inspect(corp_hotel6)
inspect(corp_hotel7)
inspect(corp_hotel8)
inspect(corp_hotel9)
inspect(corp_hotel10)


inspect(corp_hotel11)
inspect(corp_hotel12)
inspect(corp_hotel13)
inspect(corp_hotel14)
inspect(corp_hotel15)
inspect(corp_hotel16)
inspect(corp_hotel17)
inspect(corp_hotel18)
inspect(corp_hotel19)
inspect(corp_hotel20)

inspect(corp_hotel21)
inspect(corp_hotel22)
inspect(corp_hotel23)
inspect(corp_hotel24)
inspect(corp_hotel25)
inspect(corp_hotel26)
inspect(corp_hotel27)
inspect(corp_hotel28)
inspect(corp_hotel29)
inspect(corp_hotel30)

#Stem the words to their root of all reviews present in the corpus

stem_corp_hotel1 <- tm_map(corp_hotel1, stemDocument)
stem_corp_hotel2 <- tm_map(corp_hotel2, stemDocument)
stem_corp_hotel3 <- tm_map(corp_hotel3, stemDocument)
stem_corp_hotel4 <- tm_map(corp_hotel4, stemDocument)
stem_corp_hotel5 <- tm_map(corp_hotel5, stemDocument)
stem_corp_hotel6 <- tm_map(corp_hotel6, stemDocument)
stem_corp_hotel7 <- tm_map(corp_hotel7, stemDocument)
stem_corp_hotel8 <- tm_map(corp_hotel8, stemDocument)
stem_corp_hotel9 <- tm_map(corp_hotel9, stemDocument)
stem_corp_hotel10 <- tm_map(corp_hotel10, stemDocument)

stem_corp_hotel11 <- tm_map(corp_hotel11, stemDocument)
stem_corp_hotel12 <- tm_map(corp_hotel12, stemDocument)
stem_corp_hotel13 <- tm_map(corp_hotel13, stemDocument)
stem_corp_hotel14 <- tm_map(corp_hotel14, stemDocument)
stem_corp_hotel15 <- tm_map(corp_hotel15, stemDocument)
stem_corp_hotel16 <- tm_map(corp_hotel16, stemDocument)
stem_corp_hotel17 <- tm_map(corp_hotel17, stemDocument)
stem_corp_hotel18 <- tm_map(corp_hotel18, stemDocument)
stem_corp_hotel19 <- tm_map(corp_hotel19, stemDocument)
stem_corp_hotel20 <- tm_map(corp_hotel20, stemDocument)

stem_corp_hotel21 <- tm_map(corp_hotel21, stemDocument)
stem_corp_hotel22 <- tm_map(corp_hotel22, stemDocument)
stem_corp_hotel23 <- tm_map(corp_hotel23, stemDocument)
stem_corp_hotel24 <- tm_map(corp_hotel24, stemDocument)
stem_corp_hotel25 <- tm_map(corp_hotel25, stemDocument)
stem_corp_hotel26 <- tm_map(corp_hotel26, stemDocument)
stem_corp_hotel27 <- tm_map(corp_hotel27, stemDocument)
stem_corp_hotel28 <- tm_map(corp_hotel28, stemDocument)
stem_corp_hotel29 <- tm_map(corp_hotel29, stemDocument)
stem_corp_hotel30 <- tm_map(corp_hotel30, stemDocument)

#Load the positive and negative lexicon data
positive_lexicon <- read.csv("positive-lexicon.txt")
negative_lexicon <- read.csv("negative-lexicon.txt")

#Inspect positive lexicons
head(positive_lexicon)
tail(positive_lexicon)

#Inspect negative lexicons
head(negative_lexicon)
tail(negative_lexicon)

sentiment <- function(stem_corpus)
  
{
  #generate wordclouds
  wordcloud(stem_corpus,
            min.freq = 3,
            colors=brewer.pal(8, "Dark2"),
            random.color = TRUE,
            max.words = 100)
  
  #Calculating the count of total positive and negative words in each review
  
  #Create variables and vectors
  total_pos_count <- 0
  total_neg_count <- 0
  pos_count_vector <- c()
  neg_count_vector <- c()
  #Calculate the size of the corpus
  size <- length(stem_corpus)
  for(i in 1:size)
  {
    #All the words in current review
    corpus_words<- list(strsplit(stem_corpus[[i]]$content, split = " "))
    #positive words in current review
    
    pos_count <-length(intersect(unlist(corpus_words), unlist(positive_lexicon)))
    #negative words in current review
    neg_count <- length(intersect(unlist(corpus_words), unlist(negative_lexicon)))
    
    total_pos_count <- total_pos_count + pos_count ## overall positive count
    total_neg_count <- total_neg_count + neg_count ## overall negative count
    
  }
  #Calculating overall percentage of positive and negative words of all the reviews
  total_pos_count ## overall positive count
  total_neg_count ## overall negative count
  total_count <- total_pos_count + total_neg_count
  overall_positive_percentage <- (total_pos_count*100)/total_count
  overall_negative_percentage <- (total_neg_count*100)/total_count
  overall_positive_percentage ## overall positive percentage
  #Create a dataframe with all the positive and negative reviews
  df<-data.frame(Review_Type=c("Postive","Negitive"),
                 Count=c(total_pos_count ,total_neg_count ))
  print(df) #Print
  overall_positive_percentage<-paste("Percentage of Positive Reviews:",
                                     round(overall_positive_percentage,2),"%")
  return(overall_positive_percentage)
}

sentiment(stem_corp_hotel1)
sentiment(stem_corp_hotel2)
sentiment(stem_corp_hotel3)
sentiment(stem_corp_hotel4)
sentiment(stem_corp_hotel5)
sentiment(stem_corp_hotel6)
sentiment(stem_corp_hotel7)
sentiment(stem_corp_hotel8)
sentiment(stem_corp_hotel9)
sentiment(stem_corp_hotel10)

sentiment(stem_corp_hotel11)
sentiment(stem_corp_hotel12)
sentiment(stem_corp_hotel13)
sentiment(stem_corp_hotel14)
sentiment(stem_corp_hotel15)
sentiment(stem_corp_hotel16)
sentiment(stem_corp_hotel17)
sentiment(stem_corp_hotel18)
sentiment(stem_corp_hotel19)
sentiment(stem_corp_hotel20)

sentiment(stem_corp_hotel21)
sentiment(stem_corp_hotel22)
sentiment(stem_corp_hotel23)
sentiment(stem_corp_hotel24)
sentiment(stem_corp_hotel25)
sentiment(stem_corp_hotel26)
sentiment(stem_corp_hotel27)
sentiment(stem_corp_hotel28)
sentiment(stem_corp_hotel29)
sentiment(stem_corp_hotel30)

#End

> sentiment(stem_corp_hotel4)
Review_Type Count
1     Postive   237
2    Negitive    23
[1] "Percentage of Positive Reviews: 91.15 %"

> sentiment(stem_corp_hotel11)
Review_Type Count
1     Postive   228
2    Negitive    27
[1] "Percentage of Positive Reviews: 89.41 %"

> sentiment(stem_corp_hotel16)
Review_Type Count
1     Postive   238
2    Negitive    29
[1] "Percentage of Positive Reviews: 89.14 %"


> sentiment(stem_corp_hotel25)
Review_Type Count
1     Postive   195
2    Negitive    85
[1] "Percentage of Positive Reviews: 69.64 %"

> sentiment(stem_corp_hotel30)
Review_Type Count
1     Postive   147
2    Negitive    63
[1] "Percentage of Positive Reviews: 70 %"

> sentiment(stem_corp_hotel27)
Review_Type Count
1     Postive   168
2    Negitive    62
[1] "Percentage of Positive Reviews: 73.04 %"

