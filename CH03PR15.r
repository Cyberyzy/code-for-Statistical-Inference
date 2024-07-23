library(MASS)
data<-read.table("CH03PR15.txt", header=TRUE)

X<-data[,2]
Y<-data[,1]
model<- lm(Y~X)
summary(model)
#plot(X,Y)
#abline(model)
#cat("The equation of the line is: Y = ", model$coefficients[1], " + ", model$coefficients[2], "X", sep="")
full_model<- lm(Y~ factor(X), data=data)
reduced_model<- lm(Y~X, data=data)
ana_table<-anova(reduced_model,full_model)
print(ana_table)
bc<-boxcox(Y~X, data=data)

log10Y<-log10(Y)
new_model<-lm(log10Y~X)
cat("The equation of the line is: log10(Y) = ", new_model$coefficients[1], " + ", new_model$coefficients[2], "X", sep="")

#plot(X,log10Y)
#abline(new_model)

residual<- model$residuals
fitted<- model$fitted.values
plot(fitted, residual)
qqnorm(residual)
qqline(residual, col=2, lwd=1.2)  # 设置为红色加粗