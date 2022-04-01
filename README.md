# MechaCar_Statistical_Analysis

## Overview

MechaCars has requested a statistical analysis of their MPG and Suspension Coil datasets.  
  1. What design Metrics (vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance) are statistically siginificant to predict MPG from the test results of 50 prototype MechCars.
  2. Run Summary Statistics on tested Suspension Coil weight capacity\ies (PSI) across production lots to check for consistent quality.
  3. Determine if the manufacturing lots (individually and in total) are statistically different from the population mean of 1,500 psi.
  4. Design statistical test that could be used compare MechCar vehicle performance compared to other manufacturers.
  
## Resources

### Datasets

  * **Resources/MechaCar_mpg.csv** - holds MPG results and individual Metrics for 50 prototype MechaCar Tests
  * **Resources/Suspension_Coil.csv** - Weight capacity (psi) testing across 3 manufacturing lots

### Software

  * All Calculations performed in **RStudio**

## Linear Regression to Predict MPG

Utilizing RStudio, a multiple regression analysis was run to test MechaCar Metrics **(vehicle length, vehicle weight, spoiler angle, drivetrain, and ground clearance)** 
significance to the resulting MPG.  The dataset (**Resources/MechaCar_mpg.csv**) contains results for 50 Prototype MechCars.  Each test changed the 5 metrics and recorded mpg for each prtototype. 

![image](https://user-images.githubusercontent.com/91850824/160261086-5848ad42-7e15-4d3c-b6b5-2abb23b798f2.png)

The null hypothesis is that the slope of the resulting model will be 0 indicating no relationship between the Metrics and MPG with a significance level of 0.05%.   Assigning the Metrics as predictors of MPG, a multiple linear regression was performed.  The results are:

![image](https://user-images.githubusercontent.com/91850824/160261140-1b6e01c3-efab-400b-90c1-1e49caa1fbb1.png)

Reviewing the results, we can state the following:
1.  **Pr(>|t|)** values represent the probability that the coefficient contributes a random amount of varaince.  Hence, the most significant variables will have the lowest values. Looking at the results, vehicle_length (2.60e-12) and ground_clearance (5.21e-08) indicate a potential significant relation to mpg.  Each value is well below the 0.05% significance level which would be a rejection of our null variable.  The vehicle weight also shows some significance at 0.0776, but it is above 0.05 which would indicate that there is enough randomness to the data to accept the null hypothesis.   The intercept (-5.08e-08) also has a high significance.  The intercepts significance could indicate that Metrics may be missing that could explain MPG, or that the other non-siginifcant data may need some sort of transformation.  It would be worthwhile to explore each metrics relationship to MPG to determine required transformation or categorized randomness.

2. One of the best ways to assess the significance of the model as a whole is the p test.  The result of the p-value for the model is 5.35e-11, well below our significance assumption of 0.05%.  Again, we are testing our null hypothesis that the Metrics are not significantly connected to MPG and the Metric values would be randomly plotted against MPG; hence, creating a slope of 0.  Since our p-value is low enough to reject the null hypothesis our slope cannot be zero.
  
3.  To evaluate the predictive ability of our model, along with the P-Value, we must also consider the R-sqaured value.  R-Squared values close to either 1 or -1 indicate a strong corelation between the modeled value and the actual mpg.  In essence an R-sqaured of 1 would mean that the probability of the model to predict the actual results would be 100%.  Our results show that our linear regression model has a R-squared of 0.715.  This indicates that our model has a 71% probability of predicting mpg using our Metrics.  This is still a strong correlation, but indicates that some factors may be missing, or that these Metrics cannot fully explain MPG.  Regardless, there is enough correlation to explore the effect of vehicle length and ground clearance to try to optimize MPG performance.

## Summary Statistics on Suspension Coils

Using the **Resources/Suspension_Coil.csv** dataset, summary statistics (mean, median, variance, and standard deviation) were performed on test Suspension Coil weight capacity (PSI) for each individual unit and for the company as a whole.  MechaCar specification require that suspension coil weight capacities variances cannot exceed 100 psi or a standard deviation of 10psi.  Looking at the resulting summary statistics for All plants, the variance reported is 62.29 with a standard deviation of 7.89.  This indicates that reported variances for all company coils result in + or - 7.9 PSI from the mean.  This is below the standard of 100 psi variance and overall fits the goals set by MechCar. Looking at the mean and median, the mean is lower than the median and indicates a left skew to the distribution.  Although they are very close together, it appears the error in the 62 variance would be coils with less than the desired strength. 

![image](https://user-images.githubusercontent.com/91850824/160261974-19a07c23-a4d6-429b-ac21-27a87bd78e0a.png)

Analyzing individual units, manufacturing Lot 3 is quit a bit above the required 100 psi variance and reports a variance of 170 psi.  The other plants are within the tolerance.  Looking that mean and median, Lot 3's mean is lower than median indicating that it's variance stems from coils with less than desired capcity and; because it is the only lot with this tendency, it makes up the whole of the majority of negative capcity variances seen in the all plant statistics.

![image](https://user-images.githubusercontent.com/91850824/160261977-05148267-ec90-4288-90f3-19914c5ae6f4.png)

## T-Tests on Suspension Coils
Again assuming a significance factor of 0.05%, t-tests were run on ALL PLANT and by Lot to determine the significance of their PSI distributions to the population mean of 1500 psi.  For the tests,  our null hyptoytheis is that each test(ALL PLant or lot coil strength distribution) is equal to our population distribution and the true mean of each sample distribution is equal to 1500= psi.

**ALL PLant:**

![image](https://user-images.githubusercontent.com/91850824/160261994-f8f4aa70-1dbc-4d6e-a44a-736fba5793a9.png)

The P-Value is 0.0603, greater than 0.05.  THe NUll Hypothesis stands, and in general all plants are close to the desired distribution; however, it is very close to 0.05, and the confidence interval shows what we saw above, some coils are trending more lower (1497.51 versus 1500.053 Upper range) than the 1500 population mean.

**Lot 1:**

![image](https://user-images.githubusercontent.com/91850824/160261995-93a5318b-354c-451d-83e5-56aea7705371.png)

P-Value is equal to 1, this plant appears to be running ideally, and we accept the null hypothesis that the mean is eaqual to the 1500 psi. 

**Lot 2:**

![image](https://user-images.githubusercontent.com/91850824/160261996-ba7306a5-7bde-4e71-8763-cd132c899268.png)

P value for lot 2 eqauls 0.6072.  Again, it is much higher than our 0.05 and we accept the null hypothesis for the plant.  Plant 2 appears to be building coils higher than standard.  Looking at the the confidence interval; the higher range (1500.977) is 0.5 psi higher than the lower range.  This indicates a skew right, higher than the mean.

**Lot 3:**

![image](https://user-images.githubusercontent.com/91850824/160261998-0b7ac6aa-d6ea-42fc-b16f-3c6ddfb89c3f.png)

In contrast Lot 3's p-value = 0.04; below our 0.05 and we must reject the null hypothesis. We can state that the distribution for Lot 3 is different than population mean and is making an out of spec product.  Both Upper and Lower bounds of the confidence interval are below 1500 poulation mean.

## Study Design: MechaCar vs Competition
There are many metrics we could explore: HP, fuel efficiency (city and highway), maintenance costs, etc.  Comparing directly to a competitor, any of the distributions of these metrics could be compared individually across manufacturers with a **one-way ANOVA** test.

Taking **city mpg** as an example.  A one-way ANOVA could be used to test the means of  the dependant variable's (**city mpg**) distributions for each categorical independant variable (**manufacturers**) and compare them to each other.  The Null Hypothesis is **that all groups have the same mean value**, so if the p-value from the ANOVA is less than our significance factor of 0.05% then 1 or more of the manufacturers tested had a different **city mpg** mean.  

ANOVA is appropriate because we are comparing categorical independant variables (manufacturer) to continuous data (**city mpg** data).  This test requires continuous data for each manufacturer for the variable chosen.  Honestly, this could be used for highway mpg, maintenance costs, or any coninuous data metric.  The ANOVA test will first indicate statistical significance between all manufacturers chosen.  There must be at least 2 manufacturers, but the upper end can be as many manufacturers as we want to include.  

The ANOVA will than be ran against each manufacturer pair (MechCar vs manufacturer 1, MechCar vs manufacturer 2,MechCar vs manufacturer N,manufacturer 1 vs manufacturer 2, manufacturer 1 vs manufacturer N, etc.).  This will indicate the significane of the distributions between each manufcaturer.  Like the first ANOVA, the null hypothesis is that each mean is the same between the manufacturers.  P values for each run below a 0.05 significance factor will result in a rejection of the Null Hypotheiss, and we can clarify the significance between each manufacturer. Ultimately this will illuminate if MechaCars city mpg is different from each manufacturer and what is the significance across all manufacturers.  

Again, this can be applied to any continuous dependant Metric (fuel efficiency, braking distances, maintenance costs, etc).
