#Import the cleaned dataset Trainv
library(randomForest) #Using Random Forest to classify the SalePrice

#Introducing the Classifying aspect. (SalesPrice > Meanvalue : High , SalesPrice < Meanvalue : Low). The column Class has been introduced
meanvalue = mean(Trainv[["SalePrice"]])
meanvalue = ceiling(meanvalue)
Trainv$Class <- ifelse(Trainv$SalePrice < meanvalue, 'High', 'Low')
Trainv$Class[Trainv$SalePrice == meanvalue] <- 'normal'
Trainv$Class <- as.factor(Trainv$Class)


#Taking 67% of the code to train and the other 33% of the code to test the dataset.
set.seed(123)
sampling <- sample(nrow(Trainv), 0.67 * nrow(Trainv))
Train <- Trainv[sampling, ]
Test <- Trainv[-sampling, ]


#Training a model using the random forest algorithm in the package. 
trainedmodel <- randomForest(Class ~ . - SalePrice, data = Train)
#This tells us about the number of trees formed and the number of variables predicted randomly at every split. It also talks about the error while training the model
trainedmodel

#Prediciting the values for the Test Data Set.
prediction <- predict(trainedmodel, newdata = Test)

#Confusion matrix gives us the True Positive, False Positive , True Negative , False Negative .
ConfusionMatrix = table(prediction,Test$Class)

#The error rate and accuracy can be derived from the matrix.
#ConfusionMatrix[1] - True Positive - A High Sales Price classified as High.
#ConfusionMatrix[2] - False Negative - A Low Sales Price classified as High.
#ConfusionMatrix[3] - False Positive - A Low Sales Price classified as Low.
#ConfusionMatrix[4] - True Negative - A High Sales Price classified as Low.
#Error = (False Positive + False Negative) / (True Positive + False Negative + False Positive + True Negative)
#Accuracy = (True Positive + True Negative) / (True Positive + False Negative + False Positive + True Negative)

ConfusionMatrix
Accuracy = (ConfusionMatrix[1] + ConfusionMatrix[4]) / nrow(Test)
Error = (ConfusionMatrix[2] + ConfusionMatrix[3]) / nrow(Test)


