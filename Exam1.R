library(GEOquery)
library(limma)
library(affy)

#### 1 ######

setwd ("C:/Users/Natalia/Desktop/")
targetsFile <- "GSE1000_series_matrix.txt"
gse <- getGEO(filename=targetsFile)
gse.log <- log2(exprs(gse))
head(gse.log)
treatment <- rowMeans(gse.log[,1:5])
control <- rowMeans(gse.log[,6:10])

fold <- treatment/control
head(fold)
write.csv(fold, file="Exam1_fold.csv", row.names=FALSE)


#### 2 ######
par(mfrow=c(1,2))
boxplot(treatment, col = "green")
boxplot(control, col = "red")
