require("ROCR")

data <- read.table("data/question1.txt", sep=",", header=FALSE)
pred <- prediction(data[,1], data[,2], c("cover", "stego"))
perf <- performance(pred, measure = "tpr", x.measure = "fpr")

png(filename="outputs/exercise01.png")
plot(perf, col="blue")
abline(1, -1, col="red")
dev.off()
