**Question 1 (30 points)**

GoodMorning is a new line of probiotic juice products. Since its first product launch in 2015, GoodMorning were now on the shelves of nationwide retailers. GoodMorning had the challenge of raising product awareness, particularly about the benefit of probiotics and the great taste. As a recent stat-up in the fairly new probiotic market, GoodMorning did not have the funding to place nationwide advertisements. It instead allocated much of its small marketing budget to in-store demonstrations. 

During in-store demonstration, GoodMorning representatives handed our product samples. The representative arrived at a specified store, set up a table, distributed samples, informed consumers about the product, and offered coupons to inspire purchase.

Another promotional program involved competitions among the five GoodMorning sales representatives for the most endcap displays. The endcap is the hub at the end of an aisle-one of the store’s most popular locations. Sales representatives competed for the highest number of stores they could convince to place GoodMorning’s products at the endcap. The winning sales representative received a big screen television. There was also a competition for the best-decorated endcap. The winning store received cases of product for the employees and gift cards.

The company’s in-store demo was launched in November of 2016. Due to limited marketing resources, management was pressured to cut any marketing expense that did not directly contribute to GoodMorning’s results. By July of 2017, several concerns were raised within the company about the effectiveness of the in-store demo program. Some questioned whether the demos boosted sales at all, while others were concerned that any boost was only temporary and that sales would revert to normal levels shortly afterward. Some executives questioned whether the increase in sales volume could justify the associated costs.

At the senior manager meeting, GoodMorning management asked Jim Martin, GoodMorning’s Marketing manager to justify the demo and endcap activities. Jim returned to his computer after the meeting and pored over the sales and promotion spreadsheet from the last few months. He recognized that statistics could be used to help his case. He decided to apply regression analysis to the sales and promotion data (GoodMorning.xlsx) to enable a decision on whether or not the company should continue its promotional programs.

**Model A:**

Build a regression model with all variables in the data to explain the relationship between sales and promotional efforts. Let us refer to this model as Model *A*. Create the residual plot and the scatter plot of fit vs. UnitsSold.

a) (10 points) Copy and paste the R code, the regression output, and the plots*.*

*Solution*:

To start with GoodMorning’s question with all variables in the regression model, we tried three models, shown as:

```R
# Model A: Regression models with all variables
ModelA1 <- lm(`Units Sold`~ Region+`Average Retail Price`+`Sales Rep`+Endcap+Demo+`Demo1-3`+`Demo4-5`+Natural+Fitness)
summary(ModelA1)
ModelA2 <- lm(`Units Sold`~ factor(Region)+`Average Retail Price`+`Sales Rep`+Endcap+Demo+`Demo1-3`+`Demo4-5`+Natural+Fitness)
summary(ModelA2)
ModelA3 <- lm(`Units Sold`~ Endcap*(factor(Region)+`Average Retail Price`+`Sales Rep`+Endcap+Demo+`Demo1-3`+`Demo4-5`+Natural+Fitness))
summary(ModelA3)
```

They actually have the same performance, since their Multiple R-squared and Adjusted R-squared are nearly the same. Considering that Region is actually catagorical variables with more than 2 catagories, we included dummy variables for it. Also as the summary of A3 shows, Endcap doesn’t show any extra effect with other variables, so we decide to use **ModelA2**.

```R
> summary(ModelA2)

Call:
lm(formula = `Units Sold` ~ factor(Region) + `Average Retail Price` + 
    `Sales Rep` + Endcap + Demo + `Demo1-3` + `Demo4-5` + Natural + 
    Fitness)

Residuals:
     Min       1Q   Median       3Q      Max 
-149.444  -33.141    0.935   32.879  136.141 

Coefficients:
                         Estimate Std. Error t value Pr(>|t|)    
(Intercept)            273.552956  16.290174  16.793  < 2e-16 ***
factor(Region)2          1.908752   6.765882   0.282  0.77790    
factor(Region)3         22.956056  12.352186   1.858  0.06332 .  
factor(Region)4         -5.489850   6.831400  -0.804  0.42176    
factor(Region)5         21.383721  12.663244   1.689  0.09152 .  
factor(Region)6         14.263860  10.466708   1.363  0.17318    
factor(Region)7         13.215842  12.883601   1.026  0.30518    
factor(Region)8         15.414147  12.830376   1.201  0.22982    
factor(Region)9         -1.630962   7.904392  -0.206  0.83656    
factor(Region)10        22.378384  12.681745   1.765  0.07786 .  
factor(Region)11        -7.098515   7.822518  -0.907  0.36433    
`Average Retail Price` -20.955045   3.708762  -5.650 1.96e-08 ***
`Sales Rep`             39.108758  10.412628   3.756  0.00018 ***
Endcap                 444.378505   9.544281  46.560  < 2e-16 ***
Demo                   107.041373   5.796091  18.468  < 2e-16 ***
`Demo1-3`               73.027768   3.818189  19.126  < 2e-16 ***
`Demo4-5`               69.395514   5.159153  13.451  < 2e-16 ***
Natural                  0.004273   1.406301   0.003  0.99758    
Fitness                 -0.050532   0.884087  -0.057  0.95443    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 48.25 on 1340 degrees of freedom
Multiple R-squared:  0.7886,	Adjusted R-squared:  0.7857 
F-statistic: 277.6 on 18 and 1340 DF,  p-value: < 2.2e-16
```

```R
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
```

![ModelA_r](/Users/lulr/Downloads/ModelA_r1.png)

![ModelA_s](/Users/lulr/Downloads/ModelA_s1.png)

b) (4 points) Discuss the performance and validity of the model, and how to improve and refine the model.

*Solution*: 

From the result we get that Multiple R-squared:  0.7886, Adjusted R-squared:  0.7857 for ModelA. We are able to claim that these two are large enough, and so that our ModelA performs good. Also, from Residual plot, we can see that points are almost randomly distributed around the above and below of the line, and actually they are in clearly two groups, divided with Endcap.

Also, we checked if there is any presence evidence of multicollinearity using corrplot, excluding units sold, and also variance inflation factor (**VIF**): 

```R
# corrplot without units sold
c <- cor(GoodMorning[, c(1, 3:10)])
corrplot(c, type="full")
# variance inflation factor
vif(ModelA2)
```

**![corr](/Users/lulr/Downloads/corr.png)**

```R
>  vif(ModelA2)
                            GVIF Df GVIF^(1/(2*Df))
factor(Region)         32.561023 10        1.190241
`Average Retail Price`  1.728169  1        1.314598
`Sales Rep`            15.640405  1        3.954795
Endcap                  1.147766  1        1.071338
Demo                    1.048021  1        1.023729
`Demo1-3`               1.120301  1        1.058443
`Demo4-5`               1.068758  1        1.033808
Natural                 1.098320  1        1.048007
Fitness                 1.166578  1        1.080082
```

There is no evidence of multicollinearity shows. 

However, we’d notice that the p-value of dummy variables for Region, Natural, Fitness, are quite high that we are going to drop these in Model B.

**Model B:**

Build the best valid regression model to explain the relationship between sales and promotional efforts. You may use any transformation of your variables. Let us refer to this model as Model *B*. Create the residual plot and the scatter plot of fit vs. UnitsSold. 

To improve our Model A to get the best valid regression model. we explored modeling as:

```R
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
```

Briefly speaking, we attempt to:

* Take 5% significance level by default, then p-values should not  be greater than 0.05
* Exclude dummy variables for Region, Natural, Fitness, because their p-values is quite high
* Consider both heteroscedasticity and skewness in Units Sold, and decide to use Units Sold as $Units\ Sold^{1.25}$
* Discover extra effects among Demo stages, e.g., only compare mostly on the latest Demo, or Demos in different time have an extra boost. And we accepted Demo*`Demo1-3.

a) (6 points) Copy and paste the regression output, and the plots*.*

*Solution*:

```R
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
```

```R
Call:
lm(formula = `Units Sold`^(1.25) ~ `Average Retail Price` + `Sales Rep` + 
    Endcap + Demo + `Demo1-3` + `Demo4-5` + Demo * `Demo1-3` * 
    `Demo4-5`)

Residuals:
    Min      1Q  Median      3Q     Max 
-664.00 -165.05   -7.87  158.16  672.14 

Coefficients:
                         Estimate Std. Error t value Pr(>|t|)    
(Intercept)               1125.77      59.35  18.968  < 2e-16 ***
`Average Retail Price`    -105.53      14.85  -7.108 1.91e-12 ***
`Sales Rep`                284.88      14.58  19.532  < 2e-16 ***
Endcap                    2611.84      44.60  58.557  < 2e-16 ***
Demo                       539.28      32.07  16.816  < 2e-16 ***
`Demo1-3`                  377.97      19.83  19.057  < 2e-16 ***
`Demo4-5`                  376.71      27.49  13.706  < 2e-16 ***
Demo:`Demo1-3`             126.97      72.99   1.740   0.0821 .  
Demo:`Demo4-5`             -76.09     172.30  -0.442   0.6588    
`Demo1-3`:`Demo4-5`        -99.04      69.18  -1.432   0.1525    
Demo:`Demo1-3`:`Demo4-5`   348.08     256.39   1.358   0.1748    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 236.5 on 1348 degrees of freedom
Multiple R-squared:  0.8259,	Adjusted R-squared:  0.8246 
F-statistic: 639.6 on 10 and 1348 DF,  p-value: < 2.2e-16

> ModelB3 <- lm(`Units Sold`^(1.25) ~ `Average Retail Price` + `Sales Rep`+Endcap+ Demo+`Demo1-3`+`Demo4-5`+ Demo*`Demo1-3`)
> summary(ModelB3)

Call:
lm(formula = `Units Sold`^(1.25) ~ `Average Retail Price` + `Sales Rep` + 
    Endcap + Demo + `Demo1-3` + `Demo4-5` + Demo * `Demo1-3`)

Residuals:
    Min      1Q  Median      3Q     Max 
-738.87 -165.59   -8.06  156.41  671.91 

Coefficients:
                       Estimate Std. Error t value Pr(>|t|)    
(Intercept)             1129.82      59.30  19.052  < 2e-16 ***
`Average Retail Price`  -106.33      14.84  -7.165 1.28e-12 ***
`Sales Rep`              285.27      14.58  19.566  < 2e-16 ***
Endcap                  2612.36      44.57  58.618  < 2e-16 ***
Demo                     536.16      31.52  17.009  < 2e-16 ***
`Demo1-3`                370.23      19.07  19.416  < 2e-16 ***
`Demo4-5`                363.72      24.81  14.658  < 2e-16 ***
Demo:`Demo1-3`           159.95      69.08   2.316   0.0207 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 236.6 on 1351 degrees of freedom
Multiple R-squared:  0.8255,	Adjusted R-squared:  0.8246 
F-statistic:   913 on 7 and 1351 DF,  p-value: < 2.2e-16

> # Decide to use B3
> plot(resid(ModelB3)~fitted(ModelB3), col=(1:2)[Endcap])
> legend(12000,3700 ,legend = paste("Endcap=", 0:1), col=1:2, pch=1)
> # Decide to use B3
> plot(resid(ModelB3)~fitted(ModelB3), col=(1:2)[Endcap])
> legend(12000,3700 ,legend = paste("Endcap=", 0:1), col=1:2, pch=1)
> abline(h=0,col='blue')
> # Decide to use B3
> plot(resid(ModelB3)~fitted(ModelB3), col=(2:3)[Endcap])
> legend(12000,3700 ,legend = paste("Endcap=", 0:1), col=2:3, pch=1)
> abline(h=0,col='blue')
> # Decide to use B3
> plot(resid(ModelB3)~fitted(ModelB3), col=(1:2)[factor(Endcap)])
> legend(12000,3700 ,legend = paste("Endcap=", 0:1), col=1:2, pch=1)
> abline(h=0,col='blue')
> # Decide to use B3
> plot(resid(ModelB3)~fitted(ModelB3), col=(1:2)[factor(Endcap)])
> legend(3000,600 ,legend = paste("Endcap=", 0:1), col=1:2, pch=1)
> abline(h=0,col='blue')
> # Decide to use B3
> summary(ModelB3)

Call:
lm(formula = `Units Sold`^(1.25) ~ `Average Retail Price` + `Sales Rep` + 
    Endcap + Demo + `Demo1-3` + `Demo4-5` + Demo * `Demo1-3`)

Residuals:
    Min      1Q  Median      3Q     Max 
-738.87 -165.59   -8.06  156.41  671.91 

Coefficients:
                       Estimate Std. Error t value Pr(>|t|)    
(Intercept)             1129.82      59.30  19.052  < 2e-16 ***
`Average Retail Price`  -106.33      14.84  -7.165 1.28e-12 ***
`Sales Rep`              285.27      14.58  19.566  < 2e-16 ***
Endcap                  2612.36      44.57  58.618  < 2e-16 ***
Demo                     536.16      31.52  17.009  < 2e-16 ***
`Demo1-3`                370.23      19.07  19.416  < 2e-16 ***
`Demo4-5`                363.72      24.81  14.658  < 2e-16 ***
Demo:`Demo1-3`           159.95      69.08   2.316   0.0207 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 236.6 on 1351 degrees of freedom
Multiple R-squared:  0.8255,	Adjusted R-squared:  0.8246 
F-statistic:   913 on 7 and 1351 DF,  p-value: < 2.2e-16
```

![11](/Users/lulr/Downloads/11.png)

![12](/Users/lulr/Downloads/12.png)

![13](/Users/lulr/Downloads/13.png)

b) (2 points) Discuss the validity of the model.

Based on your model answer the following questions. Reference any tables/figures that you need to make your point: 

*Solution*:

Similarly to Model A, here we have Multiple R-squared:  0.8255, Adjusted R-squared:  0.8246, which is also high enough to be a good model. Also, after exluding datas that have Endcap=1, we get that adjusted $Units\ Sold^{1.25}$​ with no clear skewness. What’s more, from Residual plot, we can see that points are almost randomly distributed around the above and below of the line, and actually they are in clearly two groups, divided with Endcap.

Also, we checked if there is any presence evidence of multicollinearity using corrplot, excluding units sold, the same as in Model A, and also variance inflation factor (**VIF**) now as: 

```R
> vif(ModelB3)
`Average Retail Price`            `Sales Rep`                 Endcap                   Demo 
              1.151335               1.275874               1.041238               1.289737 
             `Demo1-3`              `Demo4-5`         Demo:`Demo1-3` 
              1.162604               1.028733               1.348155 
```

There is no evidence of multicollinearity shows. 

Here in Model B, we now have all p-values < 0.05, meaning that our Model B is a valid model.

c) (2 points) Does the in-store demo program boost the sales? If so, for how long does the sales lift last? Explain your answer.

**Solutions**:

Definitely, the in-store demo program boost the sales, as p-values of three Demos are all small enough. Comparing their coeifficents, we say that Demo has the best boost effect on sales, then goes down a little bit, but effects last at least 4-5 week.

Besides, Demos would have an extra boost on sales, if demo programs are held 1-3 week ago, but then get held again in the corresponding week.

d) (2 points) Does the placement of the product within the store (endcap promotion) affect the sales? Explain your answer.

*Solution*:

The placement of the product within the store (endcap promotion) has a **huge** effect on sales, for improving them nearly 3 times.

The effect of Endcap is clearly show in residual plot, where I divided point into 2 groups, by Endcap.![11](/Users/lulr/Downloads/11.png)

e) (2 points) What other factors affect the sales of GoodMorning product? Explain your answer.

*Solution*:

Average Retail Price and Sales Rep are also considered factors, which affect the sales of GoodMorning product. Their p-values are both low, and their coefficients are large to make a real sense. Therefore, these two factors also affect the sales of GoodMorning product

f) (2 points) Based on the regression output, what are your recommendations to GoodMorning management?

*Solution*: 

Here according to our Model, we recommend that they should pay attention to the average retail price, sales representative, endcap, and demos. Among them, endcap has the most important impact. Also, regarding the extra boost, they might consider holding in-store demos continuously, like weekly.



**Question 2 (30 points)** Use “Q2 data.xlsx” file.

A company is considering whether to market a new product. Assume, for simplicity, that if this product is marketed, there are only two possible outcomes: success or failure. The company assesses that the probabilities of these two outcomes are p and (1-p) respectively. If the product is marketed and it proves to be a failure, the company will have a net loss of \$450,000. If the product is marketed and it proves to be a success, the company will have a net gain of \$750,000. If the company decides not to market the product, there is no gain or loss.

 

The company can first survey prospective buyers of this new product. The results of the consumer survey can be classified as favorable, neutral, or unfavorable. Based on similar survey for previous products, the company assesses these probabilities of favorable, neutral, or unfavorable results to be 0.6, 0.3, and 0.1 for product that will eventually be a success, and it assesses these probabilities to be 0.1, 0.2, and 0.7 for a product that will eventually be a failure. The total cost of administering this survey is C dollars.

 

Let p=0.5 and C= $15,000. 

 

The company wants to construct a decision tree for this problem. The first step is to compute the posterior probabilities that the product will be eventually success and failure using the result from the consumer survey. The probabilities are given in Exhibit A.

The company would like to find the strategy that maximizes the company’s expected net earnings (EMV).

a) (10 pts) Construct a decision tree for this problem (Exhibit A). Generate the optimal decision strategy tree and paste the copy on your word document.

- Does the optimal strategy involve conducting the survey?
- What is the EMV under the optimal strategy?

*Solution*:

First, draw the decision tree as:

![img](file:////Users/lulr/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image001.png)

the optimal decision strategy tree for a) here is:

![img](file:////Users/lulr/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image002.png)

It shows that: the optimal strategy **involves** conducting the survey, with the EMV for optimal strategy: **255000**.

b) (5 pts) Suppose that the total cost of administering this survey is $50,000.

- Does this change the company’s decision?
- What is the maximum amount that the company is willing to pay for the survey?

*Solution*:

![img](file:////Users/lulr/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image004.png)

As the optimal tree shows, company’s decision is still **involving** conducting the survey, with **no change**.

Actually, we may not need the help from the new optimal tree, just calculate the maximum amount that the company is willing to pay for the survey as: 

EVI$=255000+15000-150000=120000$, which is greater than $50000$, we get the current decision.

c) (5 pts) Ignore part b) and let C= $15,000. Conduct a sensitivity analysis on p: between 0.3 and 0.9 with 10 steps. Attached the strategy graph (Exhibit B) and paste the copy on your word document.

- What is the approximate value of p that changes the optimal strategy?
- Explain the results in detail.

*Solution*:

The sensitivity Analysis report is: ![img](file:////Users/lulr/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image005.png)

Approximately, when the p value is greater than 0.77, the company changes their decision from yes to no.

Before p value changes from 0.3 to 0.77, the company always **conducts** the survey and markets the product. When p is greater than 0.77 the decision changes from do the survey to **not do** the survey.

For line <span style="color:red"> *yes*</span>: Approximately, if $0.3\le p<0.82$, the company actually conducts the survey, listen to the survey result and then market the product if the result is **not** unfavorable. While p is high enough like between 0.85 and 0.9, the ‘yes’ line is parallel with ‘no’ line, which means no matter what the company should continue to market the product.

For line <span style="color:blue"> *no*</span> : Approximately, if p lower than 0.37, the company will not market the product. When exceeds this point the company can market the product. 

Now, we would like to find the strategy that maximizes the company’s expected utility with the risk tolerance R= 500,000.

d) (5 pts) Generate the optimal decision strategy tree and paste the copy on your word document. Does this change the company’s decision? 

*Solution*:

The new decision tree considering utility function is:

![img](file:////Users/lulr/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image006.png)And the optimal decision tree is:

![img](file:////Users/lulr/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image007.png)

Therefore, the company’s decision is still to conduct the survey, with **no change at the first stage**. However, their following strategy changes to **only** market the product if the survey result is **favorable**.

e) (5 pts) Conduct a sensitivity analysis on p: between 0.3 and 0.9 with 10 steps. Attached the strategy graph (Exhibit C) and paste the copy on your word document. Explain the results. Particularly, explain how the second stage decision changes as p increases.

*Solution*:

![img](file:////Users/lulr/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image008.png)

Now the new sensitivity plot suggests that the company should always conduct the survey, for $0.3\le q\le 0.9$

For line <span style="color:blue"> *yes*</span>: Approximately, if $0.3\le p<0.57$, the company actually conducts the survey, listen to the survey result and then market the product **only** if the result is favorable. While p is high enough like between 0.57 and 0.9, the company would market the product  if the result is **not** unfavorable.

For line <span style="color:red"> *no*</span> : Approximately, if p lower than 0.65, the company will not market the product. When exceeds this point the company can market the product. 

 