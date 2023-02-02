# Car_Analysis

## Overview of Project
 
### Purpose

The purpose of the project is to analyze vehicle data in R.

## Linear Regression to Predict MPG

The following outputs were obtained when creating a linear regression model using all variables.

`> lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechCar_mpg)

Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = MechCar_mpg)

Coefficients:
     (Intercept)    vehicle_length    vehicle_weight     spoiler_angle  ground_clearance  
      -1.040e+02         6.267e+00         1.245e-03         6.877e-02         3.546e+00  
             AWD  
      -3.411e+00  

> summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = MechCar_mpg))

Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = MechCar_mpg)

Residuals:
     Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11`

The vehicle_length and ground_clearance provide a non-random amount of variance to the mpg values.

The slope of the linear model is not zero because the coefficients of the variables are not close to zero.

With a R-squared value of 0.6825 this linear model is moderately accurate at predicting mpg of MechaCar prototypes.

## Summary Statistics on Suspension Coils

The total_summary dataframe summarizes all of the car data in the MechCar_mpg dataset. The lot_summary dataframe summarizes the car data in the MechCar_mpg dataset by lot.

`> print(total_summary)
  mean(PSI) median(PSI) var(PSI)  sd(PSI)
1   1498.78        1500 62.29356 7.892627

> print(lot_summary)
# A tibble: 3 × 5
  Manufacturing_Lot `mean(PSI)` `median(PSI)` `var(PSI)` `sd(PSI)`
  <chr>                   <dbl>         <dbl>      <dbl>     <dbl>
1 Lot1                    1500          1500       0.980     0.990
2 Lot2                    1500.         1500       7.47      2.73 
3 Lot3                    1496.         1498.    170.       13.0 `

The overall, lot one, and lot 2 datasets all meet the must "not exceed 100 pounds per square inch" as shown above. Lot 3 does not meet these criteria with a var of 170.

## T-Tests on Suspension Coils

In the first t-test the population was compared against the population mean of 1500 resulting in a p-value of 1. Lots 1 and 2 have P value above .05. Lot 3 has a P value below .05. This means the total population, lot 1, and lot 2 are not statistically different from the mean, while lot 3 is statistically different from the mean.

`> t.test(Suspension_Coil$PSI, mu=1500)

	One Sample t-test

data:  Suspension_Coil$PSI
t = -1.8931, df = 149, p-value = 0.06028
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1497.507 1500.053
sample estimates:
mean of x 
  1498.78 

> lot1 <- Suspension_Coil %>% filter(Manufacturing_Lot=="Lot1")
> lot2 <- Suspension_Coil %>% filter(Manufacturing_Lot=="Lot2")
> lot3 <- Suspension_Coil %>% filter(Manufacturing_Lot=="Lot3")
> t.test(lot1$PSI, mu=1500)

	One Sample t-test

data:  lot1$PSI
t = 0, df = 49, p-value = 1
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.719 1500.281
sample estimates:
mean of x 
     1500 

> t.test(lot2$PSI, mu=1500)

	One Sample t-test

data:  lot2$PSI
t = 0.51745, df = 49, p-value = 0.6072
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.423 1500.977
sample estimates:
mean of x 
   1500.2 

> t.test(lot3$PSI, mu=1500)

	One Sample t-test

data:  lot3$PSI
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1492.431 1499.849
sample estimates:
mean of x 
  1496.14 `

## Study Design: MechaCar vs Competition

A study can be created to determine how the quality of MechaCars stack up against the competition. One can test the variance of each lot and the mount of lots rejected against other manufactures. A two-sample t test can be used to ensure lots are comparable. The null hypothesis would be that the lots are significant and can be compared. The alternative hypothesis is that the lots are not significant and should not be compared.
