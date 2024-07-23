# install.packages("tidyverse")

library(readxl)
data<- read_excel("CH0127.xlsx")
if (!require(lmtest)) {
  install.packages("lmtest")
  library(lmtest)
}
# stem(data$X)
setwd("C:/Users/A/Desktop/线性回归/R/")
model <- lm(data$Y ~ data$X)
# 进行Breusch-Pagan检验
test_result <- bptest(model)

# 打印检验结果
print(test_result)
# # print(summary(model))
# # 获取模型的系数
coefficients <- model$coefficients

# # 打印回归方程
# cat("回归方程为: Y =", coefficients[1], "+", coefficients[2], "* X\n")
# # 获取模型的摘要
# model_summary <- summary(model)

# # 获取R^2
# r_squared <- model_summary$r.squared

# # 打印R^2
# cat("R^2 =", r_squared, "\n")
# cat("mean of X:", mean(data$X), "mean of Y:", mean(data$Y), "\n")
# cat("n:", length(data$Y), "\n")
# residuals <- predict(model) - data$Y
# cat("residuals:", sum(model$residuals^2)/58, "\n")
# cat("regression:",sum((predict(model) - mean(data$Y))^2), "\n")
# cat("total:", sum((data$Y - mean(data$Y))^2)/59, "\n")
# cat(qf(0.95,df1=1,df2=58), "\n")
# ss<-(data$Y-mean(data$Y))
#plot(data$X, data$Y)
hatY<-(coefficients[1] + coefficients[2] * data$X)
plot(hatY, model$residuals, col="purple", pch=20)
# 绘制关于残差的箱线图
hist(model$residuals, main="Residuals", ylab="Value")
# 计算残差
residuals <- model$residuals

# 绘制残差的正态概率图
qqnorm(residuals)
qqline(residuals)

# 计算有序残差和它们在正态性假设下的期望值之间的相关系数
expected_values <- qnorm((rank(residuals) - 0.5) / length(residuals))
correlation_coefficient <- cor(residuals, expected_values)

# 打印相关系数
cat("相关系数 =", correlation_coefficient, "\n")

# plot(data$X, ss, col="blue", pch=20)
# abline(model)
# abline(model)

# MSE <- sum((data$Y - (coefficients[1] + coefficients[2] * data$X))^2) / (length(data$Y) - 2)
# cat("MSE:", MSE, "\n")
# s2<-sum(model$residuals^2)/(length(data$Y)-2)
# variance<- sum((data$Y - mean(data$Y))^2) / (length(data$Y) - 1)
# sb<- 1+1/length(data$Y)+ (60-mean(data$X))^2 / sum((data$X - mean(data$X))^2)
# se<- sqrt(s2* sb)
# cat("se:", se, "\n")

# qt1<- qt(0.025, length(data$Y) - 2)
# qt2<- qt(0.975, length(data$Y) - 2)
# cat("t分布的分位数:", qt1, qt2, "\n")



# sp2<-(1/length(data$Y)+((60-mean(data$X))^2)/sum((data$X-mean(data$X))^2))*s2
# wid<-sqrt(2*qf(0.95,df1=2,df2=length(data$Y)-2)*sp2)
# muh<-coefficients[2]*60+coefficients[1]
# CI1 <- muh - wid; CI2 <- muh + wid
# cat("置信区间:", CI1, CI2, "\n")
