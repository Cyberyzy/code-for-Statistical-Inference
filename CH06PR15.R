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
model<-lm(Y~X1+X2+X3)
summary(model)
#boxplot(model$residuals)

# opar <- par(no.readonly = TRUE)
# par(mfrow=c(2,2))
# plot(X1,model$residuals)
# plot(X2,model$residuals)
# plot(X3,model$residuals)
# plot(model$fitted.values,model$residuals)
# par(opar)
qqnorm(model$residuals)
qqline(model$residuals, col=2, lwd=1.2)  # 设置为红色加粗
# bptest(model)
# anova(model)
# joint.ci.bonf(model,0.9)
newd<-data.frame(X1=35,X2=45,X3=2.2)
interval=predict(model,newdata=newd,interval='predict',level=0.9)
