# install.packages("forecast") 
# library(forecast)

#load Metrics to compue RMSE and MAPE
# library(Metrics)

#store the data in a time series object
CocaCola.ts <-ts(Coca_Cola_Data$Sales,start = c(1986,1),frequency=4)
CocaCola.ts
#create a time series plot
plot(CocaCola.ts)

#split data
train.ts <- window(CocaCola.ts,start=c(1986,1),end=c(1995,2))
test.ts<-window(CocaCola.ts,start=c(1995,3))
print(test.ts)

#turn off beta and gamma, alpha is in auto mode
train.simple<-HoltWinters(train.ts,beta=FALSE,gamma=FALSE)
#summary
train.simple

#Forecast for test period +forecast period
simple.pred<-forecast(train.simple,h=8,level=0)
print(simple.pred)

#plot data and fitted values in training period
plot(CocaCola.ts,ylab="Sales",bty='l',xlab="Quaters")
lines(simple.pred)
lines(simple.pred$fitted,col="red")

#compute rmse and mape in test period
print(c(rmse(test.ts,simple.pred$mean),mape(test.ts,simple.pred$mean)))


