setwd("C:/Users/A/Desktop/线性回归/R/")
library(car)
data<-read.table("CH06PR05.txt")
Y<- data[,1]
X1<-data[,2]
X2<-data[,3]
#X1X2<-X1*X2
#cat("The crossed term is: ", X1X2)
scatterplotMatrix(data,smooth=list(lty.smooth=2, spread = F),main="data")
#cormat<-cor(data)
#cat(cormat)
model<-lm(Y~X1+X2,data=data)
summary(model)$r.squared
summary(model)$adj.r.squared
summary(model)$sigma^2

#cat("The equation of the line is: Y = ", model$coefficients[1], " + 
#   ", model$coefficients[2], "X1+",  model$coefficients[2],"X2+", sep="")
#anova(model)
residual<- model$residuals
plot(model$fitted.values,residual)
