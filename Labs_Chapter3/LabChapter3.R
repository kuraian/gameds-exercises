
install.packages("compute.es")
install.packages("car")
install.packages("ggplot2")
install.packages("multcomp")
install.packages("pastecs")
install.packages("WRS",repos="https://r-forge.r-project.org/projects/psychor/")

library(WRS2)
#library(WRS)
library(compute.es)
library(car)
library(ggplot2)
library(multcomp)
library(pastecs)
VPALData <- read.table("GamingExpertese&Gender.csv", header=TRUE, sep=",")
library(carData)

#first conduct a test for homegenity, are the variances of the groups significantly different or not
VPALData$Gender = as.factor(VPALData$Gender)
leveneTest(VPALData$Expertise, VPALData$Gender, center=mean)
#as it turns out it is very significantly different. 
#this means that the variance between groups are signficantly different.

#we can explore the descriptive statistics by Gender 
by(VPALData$Expertise, VPALData$Gender, stat.desc)

#In this case, since the variance between groups are different, we can apply Welch's F or use Robust Anova
oneway.test(Expertise~Gender, data = VPALData)

#We can do also robust ANOVA, running various tests

t1way(Expertise ~Gender, data = VPALData, tr =0.1)
t1waybt(Expertise~Gender, data=VPALData, tr=0.05)


