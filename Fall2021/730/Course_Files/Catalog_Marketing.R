attach(Catalog_Marketing_Reg)

Mod1<-lm(log(AmountSpent)~Salary+relevel(factor(Gender),ref=1))
summary(Mod1)
Mod1<-lm(log(AmountSpent)~log(Salary)+relevel(factor(Gender),ref=1))
summary(Mod1)
Mod2<-lm(AmountSpent~Salary+Gender+Salary*Gender)
summary(Mod2)
Mod3 <- lm(Log( AmountSpent ) ~ Salary + Gender)
summary(Mod3)

