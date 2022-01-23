attach(GoodMorning)

# Model A: Regression models with all variables
ModelA1 <- lm(`Units Sold`~ Region+`Average Retail Price`+`Sales Rep`+Endcap+Demo+`Demo1-3`+`Demo4-5`+Natural+Fitness)
summary(ModelA1)
ModelA2 <- lm(`Units Sold`~ factor(Region)+`Average Retail Price`+`Sales Rep`+Endcap+Demo+`Demo1-3`+`Demo4-5`+Natural+Fitness)
summary(ModelA2)
ModelA3 <- lm(`Units Sold`~ Endcap*(factor(Region)+`Average Retail Price`+`Sales Rep`+Endcap+Demo+`Demo1-3`+`Demo4-5`+Natural+Fitness))
summary(ModelA3)

# Decide to use A2
plot(resid(ModelA2)~fitted(ModelA2))
abline(h=0,col='blue')
plot(`Units Sold`,fitted(ModelA2),xlim = c(-10,1000),ylim = c(-10,1000))
abline(lm(fitted(ModelA2)~`Units Sold`),col = 'red')
abline(h=0,col='blue')
abline(v=0,col='blue')

# corrplot without units sold
c <- cor(GoodMorning[, c(1, 3:10)])
corrplot(c, type="full")
# variance inflation factor
vif(ModelA2)

# Model B: Exploring the best model
ModelB1 <- lm(`Units Sold` ~ `Average Retail Price` + `Sales Rep`+Endcap+ Demo+`Demo1-3`+`Demo4-5`)
summary(ModelB1)
hist(`Units Sold`, xlim = c(0,500), breaks = 100)
hist(`Units Sold`^(1.25), xlim = c(0,2500), breaks = 100)
hist(`Units Sold`^(1.5), xlim = c(0,10000), breaks = 100)
ModelB2 <- lm(`Units Sold`^(1.25) ~ `Average Retail Price` + `Sales Rep`+Endcap+ Demo+`Demo1-3`+`Demo4-5`+ Demo*`Demo1-3`*`Demo4-5`)
summary(ModelB2)
ModelB3 <- lm(`Units Sold`^(1.25) ~ `Average Retail Price` + `Sales Rep`+Endcap+ Demo+`Demo1-3`+`Demo4-5`+ Demo*`Demo1-3`)
summary(ModelB3)

# Decide to use B3
summary(ModelB3)
plot(resid(ModelB3)~fitted(ModelB3), col=(1:2)[factor(Endcap)])
legend(3000,600 ,legend = paste("Endcap=", 0:1), col=1:2, pch=1)
abline(h=0,col='blue')
plot(I(`Units Sold`^(1.25)),fitted(ModelB3),xlim = c(-50,5000),ylim =
       c(-50,5000))
abline(lm(fitted(ModelB3)~I(`Units Sold`^(1.25))),col = 'red')
abline(h=0,col='blue')
abline(v=0,col='blue')

vif(ModelB3)