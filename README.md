# ML-Bao
### Small collection of my wanderings in machine learning
##### Basically all in Scheme (Chicken Scheme). Trying to start from the basic equations, sometimes having a look at other implementations in C.

## Currently working:
* linear regression
* Pearson's correlation index

## TODO:
* linear regression with arbitrary-sized matrices
* time series

### Linear regression:
;; equations from https://www.statisticshowto.datasciencecentral.com/probability-and-statistics/regression-analysis/find-a-linear-regression-equation/
;; x = explanatory variable
;; y = dependent variable
;; y = a + b * x
;; a = y-intercept
;; b = slope
;; a = (SUM(y) * SUM(x * x) - SUM(x) * SUM( x + y)) / (n * SUM(x * x) - SUM(x) * SUM(x))
;; b = n .... blah blah, see code below...