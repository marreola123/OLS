#
#
# OLS. These lines of code can be used to analyze data using linear regression analysis.
#
# Libraries
library(psych)
library(ggplot2)
library(lme4)
library(lmerTest)
library(perturb)

# Upload the data into the r consul.
mydata <--read.csv("") #reads data. Use $ to read selected columns.  

# Another method of geting the data into r by Defind the variables.
Y<-cbind(Benchmark, data = mydata) #data would get the data from columns of the CSV.
X<-cbind(stock, bond, X3, data - mydata)

# Set Data as OLS
olsreg<-lm(Y ~ X1 + X2, data = ) #defind your x's. X could be a matrix or selected columns. 

# One way of creating the linear regression streight from the csv file. 
x<-lm(y column ~ x1column + x2, data = name of spreadsheet) # Add correct Y and X

# Check the data. This would give statistical data: min, max, mean, mode, goodness of fit.
headTail(olsreg)
str(olsreg)
summary(olsreg)
anova(olsreg)

# Descriptive Stats. 
sum()
mean()
var()
sd()
range()
min()
max()
median()
cor()

# Checking for Error Variance. 
# Heteroskedasticity
plot(resid(olsreg) ~ fitted.values(olsreg))
plot(resid(olsreg) ~ X1)
plot(resid(olsreg) ~ X2) # Can be continue
bptest() # Breush-Pagan test
gqtest() # Goldfeld-Quandt test
hmctest() # Harrison-McCabe test

# Collinearity
colldiag(olsreg) # will give condition index, larger than 30 is a problem.

# Mixed effects model. Test for random effect and fix effect.
mixmodel = lme(Y ~ X + (1|X2),
             data=Data,
             REML=TRUE)

# Check data. x <-anova(model) will save data into x.
anova(model)

# Test for random effect
rand(model) # Would give goodness of fit for the random effect in the model. 

# Visualising the data
hist() # gives a histogram for any given value.
plot(y,x) # Produces a plot of the data
qqplot(olsreg, dist = "norm") # Would give reg.line with stedentized residuals.
density.default(olsreg) # Will give density plot, and skews.
plot(olsreg, which = 1:4) # r shortcut for OLS diagnostics.

# Outliers are unusula observations.
rstudent(olsreg) # if values are larger than 2 = outliers. From here they can be deleted.

# Leverage is the ability to change the slope of the reg.line. mesure of leverage is the hat values.
hatvalues(olsreg)
plot(hatvalues(olsreg)) 

# Influence is how strong leverage is and outlier status.
influence.measures(olsreg) # dfbeta is the influence of an observation on the coefficients. the change in i's coefficient caused by deleting a single observation
cooks.distance(olsreg)

# Other useful comands
glm() # General lm
multinom() # Multinominal Logit
optim() # General Optimizer

# Examples of OLS: 
#         call center: analyze the relationship between wait times of callers and number of complaints.
#         Demand analys. predic the number of times a consumer will probably purchase. 
#         Forecast the number of shoppers passing in front of a billboard and use the data to estimate the bid for advertisemen
#         insurance company: number of claims per customer against age and discover that older customers tend to make more health insurance claims.

