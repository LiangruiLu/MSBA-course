attach(HousePrices)

dt = sort(sample(nrow (HousePrices ), nrow (HousePrices )*.7))
train <- HousePrices [dt,]
test <- HousePrices [-dt,]

# Build a linear regression model
# Use all variable s
Model1 <- lm(Price~.,data = train)
summary(Model1)
observed <- test$Price
predicted <- predict(Model1,test)

#Loading required R package
# Metrics, for mae,remes and mape
# install.packages("Metrics")
library(Metrics)
# Compute MAE, RMSE, and MAPE
mae.Model1 <- mae(observed,predicted)
rmse.Model1 <- rmse(observed,predicted)
mape.Model1 <- mape(observed,predicted)*100
print(c(mae.Model1,rmse.Model1 ,mape.Model1))