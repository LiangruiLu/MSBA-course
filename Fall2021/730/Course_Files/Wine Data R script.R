# Wine_Data.xlsx
# Attach the data set
attach(Wine_Data)

# Create a histogram and report the summary statistics of Price
hist(Wine_Data$Price, breaks = 10)
summary(Wine_Data$Price)

# Generate sccater plots and correlation matrix
plot(Wine_Data)
cor(Wine_Data)

# Ceate Models
# Model with all six independent varibles
ModelFull<-lm(Price~Year+WinterRain+AGST+HarvestRain+FrancePop+Age)
summary(ModelFull)

# Alternative wat to create a full model
ModelFull<-lm(Price~., Wine_Data)
summary(ModelFull)


# Model 1: FullModel-WintwrRain
Model1<-lm(Price~Year+AGST+HarvestRain+Age+FrancePop)
summary(Model1)

# Model 2: FullModel-Year
Model2<-lm(Price~WinterRain+AGST+HarvestRain+Age+FrancePop)
summary(Model2)

# Model 3: FullModel - Year - WinterRain
Model3<-lm(Price~AGST+HarvestRain+Age+FrancePop)
summary(Model3)

# The final model
FinalModel<-lm(Price~WinterRain+AGST+HarvestRain+Age)
summary(FinalModel)

#Analyze the residuals
residFM<-resid(FinalModel)
plot(residFM)
hist(residFM)
fittedFM<-fitted(FinalModel,Wine_Data)
plot(fittedFM,Wine_Data$Price)


#Coefficient of the final model
print(coef(FinalModel))


#Using Predict function
newdata<-data.frame(Year=1980,WinterRain = 578, AGST =16, 
                    HarvestRain = 74, Age = 3, FrancePop= 55110.24 )
predict(FinalModel,newdata)

# or select the 27th observatin from the data 
predict(FinalModel,Wine_Data[27,])


