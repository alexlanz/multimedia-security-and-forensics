require("ROCR")

data <- read.table("data/question1.txt", sep=",", header=FALSE)
pred <- prediction(data[,1], data[,2])
perf <- performance(pred, measure = "tpr", x.measure = "fpr")

png(filename="outputs/exercise01.png")
plot(perf, col=rainbow(10))
dev.off()
