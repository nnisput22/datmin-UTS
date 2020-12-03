datmin <- read.csv("C:/Users/putri/Downloads/tae.csv")
View(datmin)
head(datmin)

install.packages("party")
install.packages("psych")
install.packages("caret")

library(party)
library(psych)
library(caret)

datmin[,1]= as.factor(datmin[,1])
datmin[,2]= as.factor(datmin[,2])
datmin[,3]= as.factor(datmin[,3])
datmin[,4]= as.factor(datmin[,4])
datmin[,6]= as.factor(datmin[,6])
str(datmin)

set.seed(1234)
sampel <- sample(2,nrow(datmin),replace = T, prob = c(0.8,0.2))
trainingdat <- datmin[sampel==1, ]
testingdat <- datmin[sampel==2, ]
print(paste("Jumlah train data :", nrow(trainingdat)))
print(paste("Jumlah test data :", nrow(testingdat)))

tree <- ctree(class_attribute~., data=trainingdat)
plot(tree)

prediksi <- predict(tree, testingdat)
confusionMatrix(table(prediksi,testingdat$class_attribute))


