# Paire t-test for Real_Estate data.
t.test(Real_Estate$Value, Real_Estate$Price, alternative="two.sided", paired = TRUE )

#Two-sample t-test for BankTimes data.

##Equal- variance assumption:
t.test(BankTimes$Branch1, BankTimes$Branch2, alternative="less", var.equal = TRUE)

##Unequal-variance assumption:
t.test(BankTimes$Branch1, BankTimes$Branch2, alternative="less", var.equal =FALSE )

## Variance test - run F-ratio test to check if the variances are equal
var.test(BankTimes$Branch1, BankTimes$Branch2)
