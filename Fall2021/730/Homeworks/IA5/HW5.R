attach(Oil_usage)

ModelA <- lm(OilUsage~DegreeDays+HomeFactor+NumberPeople)
summary(ModelA)

plot(resid(ModelA)~fitted(ModelA))
abline(h=0, col='blue')inst

plot(OilUsage, fitted(ModelA), xlim=c(-100,600), ylim=c(-100,600))
abline(lm(fitted(ModelA)~OilUsage), col='red')
abline(h=0, col='blue')
abline(v=0, col='blue')

ModelB <- lm(OilUsage~DegreeDays+factor(HomeFactor)+NumberPeople)
summary(ModelB)

plot(resid(ModelB)~fitted(ModelB))
abline(h=0, col='blue')

plot(OilUsage, fitted(ModelB), xlim=c(-100,600), ylim=c(-100,600))
abline(lm(fitted(ModelB)~OilUsage), col='red')
abline(h=0, col='blue')
abline(v=0, col='blue')

ModelC <- lm(OilUsage~DegreeDays+factor(HomeFactor)+factor(HomeFactor)*DegreeDays+NumberPeople)
summary(ModelC)

plot(resid(ModelC)~fitted(ModelC))
abline(h=0, col='blue')

plot(OilUsage, fitted(ModelC), xlim=c(-100,600), ylim=c(-100,600))
abline(lm(fitted(ModelC)~OilUsage), col='red')
abline(h=0, col='blue')
abline(v=0, col='blue')

hist(OilUsage, breaks = 14)
summary(OilUsage)

qqnorm(resid(ModelC))
qqline(resid(ModelC), col = 'red')

ModelD <- lm(log(OilUsage)~DegreeDays+factor(HomeFactor)+factor(HomeFactor)*DegreeDays+NumberPeople)
summary(ModelD)

plot(resid(ModelD)~fitted(ModelD))
abline(h=0, col='blue')

plot(OilUsage, fitted(ModelD), xlim=c(-100,600), ylim=c(2,7))
abline(lm(fitted(ModelD)~OilUsage), col='red')
abline(h=3, col='blue')
abline(v=0, col='blue')

hist(log(OilUsage))
summary(OilUsage)

qqnorm(resid(ModelD))
qqline(resid(ModelD), col = 'red')