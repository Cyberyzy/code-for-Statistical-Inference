setwd("C:/Users/A/Desktop/线性回归/R/")
library(lmtest)
library(asbio)
data<-read.table("CH06PR15.txt")
Y<- data[,1]
X1<-data[,2]
X2<-data[,3]
X3<-data[,4]

scatterplotMatrix(data,smooth=list(lty.smooth=2, spread = F),main="data")
cormat<-cor(data)
cat(cormat)
model0<-lm(Y~X2+X3+X1)
anova(model0)
model1<-lm(Y~X1)
anova(model1)
model4<-lm(Y~X1+X2)
summary(model4)
model22<-lm(Y~X3)
anova(model22)
model23<-lm(Y~X2+X3)
anova(model23)
anova(model4)
model3<-lm(Y~X2)
anova(model3)
# drop1(model0,test="F")

anova(model1,model0)
library(car)
linearHypothesis(model0,c("X1 = -1","X2 = 0"))
