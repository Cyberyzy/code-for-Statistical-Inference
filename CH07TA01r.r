a1 <- read.table("CH07TA01.txt") # 
colnames(a1) = c("skinfold", "thigh","midarm", "fat")
reg1 <- lm(fat ~ skinfold + thigh + midarm,data=a1)

# summary(reg1)
# anova(reg1)
# plot(reg1)
fity <- lm(fat ~ thigh + midarm, data=a1)
fitx <- lm(skinfold ~ thigh + midarm, data=a1)
summary(lm(fity$res ~ fitx$res))
cat(cor(fitx$res, fity$res)^2)
summary(lm(fity$res ~ skinfold,data=a1))
cat(cor(fity$res,a1$skinfold)^2)
summary(lm(fat ~ skinfold,data=a1))
cat(cor(a1$fat,a1$skinfold)^2)
summary(lm(fat ~ fitx$res,data=a1))
cat(cor(a1$fat,fitx$res)^2)
