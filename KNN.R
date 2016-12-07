library(class) #This is to build the KNN Function.
library(randomForest) #This is to use the Confusion Matrix. 
Trainv <- as.matrix(Trainv)
XYZ <- sample(2, nrow(Trainv), replace=TRUE, prob=c(0.67, 0.33))
Training <- Trainv[XYZ==1,1:21] 
Test <- Trainv[XYZ==2, 1:21]
trainLabels <- Trainv [XYZ==1, 22] 
testLabels <- Trainv [XYZ==2, 22]
Predicted_HouseValues <- knn(train = Training, test = Test, cl = trainLabels, k=1)
Actual_HouseValues = testLabels
ConfusionMatrix = table(Predicted_HouseValues,Actual_HouseValues)
plot(ConfusionMatrix)