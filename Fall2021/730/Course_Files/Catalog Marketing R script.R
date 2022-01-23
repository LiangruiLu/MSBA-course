## Simple Linear Regression
## Data: Catalog_Marketing_Reg.xlsx 

# The command to fit a simple linear regression model is lm()
# You can get information about the lm() command by typing
?lm()

# We will fit a simple linear regression model to predict AmountSpent using Salary as the predictor.
slr <- lm(AmountSpent~Salary, data = Catalog_Marketing_Reg)
summary(slr)

# We can create a scatterplot and plot the regression line with the following commands
plot(AmountSpent ~ Salary, main ="AmountSpent ~ Salary", data = Catalog_Marketing_Reg)
abline(slr, col="blue")

#We can plot the residuals in the order given in the data with the following commands:
residslr <-resid(slr)
plot(residslr)

