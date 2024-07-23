data<- read.table("HW6.txt", header=TRUE)
# cat("The data is: \n")
# print(data)
V<-data$Velocity
C<-data$Concentration
V1<-1/V
C1<-1/C
plot(C1,V1)
model<-lm(V1~C1)
fit<- model$fitted.values
residuals<- model$residuals
#plot(fit,residuals)
#cat("The regression model is:",model$coefficients[2],"x +",model$coefficients[1],"\n")

plot(C,V)
lines(C,1/fit,col="red")
