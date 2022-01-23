#Create a data frame using two variabels ROA and BANKRUPT

ROA.Bkcy<-data.frame(Bankruptcy$ROA,Bankruptcy$BANKRUPT)

# Unstack ROA,Bkcy

Unstack.ROA=unstack(ROA.Bkcy)

t.test(Unstack.ROA[["Yes"]], mu = -0.05, alternative = "less")

t.test(Unstack.ROA[["No"]],Unstack.ROA[["Yes"]],alternative = "greater",var.equal = TRUE)